# Prepare master markdown for 6×9 Typst paperback rendering.
# Does not alter chapter prose sources — only the build intermediate.

param(
    [Parameter(Mandatory = $true)][string]$InputMarkdown,
    [Parameter(Mandatory = $true)][string]$OutputMarkdown
)

$ErrorActionPreference = "Stop"
$text = [System.IO.File]::ReadAllText($InputMarkdown, [System.Text.UTF8Encoding]::new($true))

# Normalize newlines
$text = $text -replace "`r`n", "`n"

# Collapse redundant consecutive page breaks
$text = [regex]::Replace($text, '(\\newpage\s*){2,}', "\newpage`n`n")

$bt = [char]96
$fenceOpen = ($bt.ToString() * 3) + '{=typst}'
$fenceClose = ($bt.ToString() * 3)

# Convert HTML centered images to Typst raw blocks (HTML imgs are dropped by pandoc→typst)
# Text block usable width ≈ 4.75in; keep logos small; appendix art maxed to text width
$imgEvaluator = {
    param($m)
    $src = $m.Groups['src'].Value -replace '\\', '/'
    $alt = $m.Groups['alt'].Value
    $wpx = 0
    if ($m.Groups['w'].Success) { [void][int]::TryParse($m.Groups['w'].Value, [ref]$wpx) }

    $width = if ($src -match 'chapter_logo') {
        '1.35in'
    } elseif ($wpx -ge 500 -or $src -match 'schematic|navigation_chart|reference_plate') {
        '4.5in'
    } elseif ($wpx -gt 0) {
        $inches = [math]::Min(4.5, [math]::Max(0.8, $wpx / 100.0))
        ('{0:0.##}in' -f $inches)
    } else {
        '4.5in'
    }

    $altEsc = ($alt -replace '\\', '\\' -replace '"', '\"')

    # Keep figures with their appendix/chapter headings — do not force standalone pages.
    return @"

$fenceOpen
#align(center)[
  #block(breakable: false)[
    #image("$src", width: $width, alt: "$altEsc")
  ]
]
$fenceClose

"@
}

$text = [regex]::Replace(
    $text,
    '<p\s+align="center">\s*<img\s+src="(?<src>[^"]+)"\s+alt="(?<alt>[^"]*)"(?:\s+width="(?<w>\d+)")?\s*/?\s*>\s*</p>',
    $imgEvaluator,
    [System.Text.RegularExpressions.RegexOptions]::IgnoreCase
)

# HTML scene breaks (from manuscript build) → visible Typst ornaments
# Use Unicode escape so ornament survives encoding on the Pandoc/Typst path.
$sceneTypst = @"

$fenceOpen
#align(center)[#block(above: 1.1em, below: 1.1em, breakable: false)[#text(size: 13pt, tracking: 0.28em)[\u{2766}]]]
$fenceClose

"@
$text = [regex]::Replace(
    $text,
    '<p\s+align="center"\s+class="scene-break"[^>]*>[\s\S]*?</p>',
    $sceneTypst,
    [System.Text.RegularExpressions.RegexOptions]::IgnoreCase
)
$text = [regex]::Replace($text, '(?m)^(?:❦|&#10086;)\s*$', $sceneTypst)

# Location sluglines must include a dash separator (KESTREL VEIL — COMMAND DECK),
# so archive **ARCHIVE** / **FSA-…** headers are not rewritten.
# Use \u escapes so the pattern is encoding-safe in the .ps1 file.
$locClass = '[A-Z0-9][^*]*[\u2014\u2013\-][^*]*[A-Z0-9\.]'
$subClass = '[A-Z][A-Z0-9 \u2014\u2013\-,\.]{1,80}'
$pairPat = "(?m)^\*{2,3}(?<loc>$locClass)\*{2,3}[ \t]*(?:\r?\n)+[ \t]*(?<sub>\*?$subClass\*?)\s*$"
$soloPat = "(?m)^\*{2,3}(?<loc>$locClass)\*{2,3}[ \t]*\s*$"

$slugPairEval = [System.Text.RegularExpressions.MatchEvaluator]{
    param($m)
    $loc = $m.Groups['loc'].Value.Trim()
    $sub = $m.Groups['sub'].Value.Trim().Trim('*').Trim()
    $loc = $loc -replace '\\', '\\' -replace '"', '\"'
    $sub = $sub -replace '\\', '\\' -replace '"', '\"'
    return @"

$fenceOpen
#align(center)[
  #block(above: 1.15em, below: 1.0em, breakable: false)[
    #set par(first-line-indent: 0pt, justify: false, leading: 0.45em)
    #text(size: 10pt, weight: "bold", tracking: 0.03em)[$loc]
    #v(0.25em)
    #text(size: 10pt, style: "italic", tracking: 0.02em)[$sub]
  ]
]
$fenceClose

"@
}

$slugSoloEval = [System.Text.RegularExpressions.MatchEvaluator]{
    param($m)
    $loc = $m.Groups['loc'].Value.Trim()
    $loc = $loc -replace '\\', '\\' -replace '"', '\"'
    return @"

$fenceOpen
#align(center)[
  #block(above: 1.15em, below: 1.0em, breakable: false)[
    #set par(first-line-indent: 0pt, justify: false)
    #text(size: 10pt, weight: "bold", tracking: 0.03em)[$loc]
  ]
]
$fenceClose

"@
}

Write-Host ("Slugline pair matches: {0}" -f ([regex]::Matches($text, $pairPat)).Count)
$text = [regex]::Replace($text, $pairPat, $slugPairEval)
Write-Host ("Slugline solo matches: {0}" -f ([regex]::Matches($text, $soloPat)).Count)
$text = [regex]::Replace($text, $soloPat, $slugSoloEval)

# Convert bare pagebreak markers to Typst
$pb = @"

$fenceOpen
#pagebreak()
$fenceClose

"@
$text = [regex]::Replace($text, '(?m)^\\newpage\s*$', $pb)

# Enable running headers + arabic numbers at Chapter 1 (after front matter)
$chapterStart = @"

$fenceOpen
#pagebreak()
#set page(
  numbering: "1",
  header: context {
    let p = here().page()
    let chapterHeads = query(heading.where(level: 1)).filter(h => h.location().page() == p)
    if chapterHeads.len() > 0 { none }
    else if calc.even(p) {
      align(left)[#text(size: 9pt, style: "italic")[K.W. Abbott]]
    } else {
      align(right)[#text(size: 9pt, style: "italic")[The Kestrel Veil Incident]]
    }
  },
  footer: context {
    let p = here().page()
    let chapterHeads = query(heading.where(level: 1)).filter(h => h.location().page() == p)
    if chapterHeads.len() > 0 { none }
    else {
      align(center)[#text(size: 9pt)[#counter(page).display()]]
    }
  },
)
#counter(page).update(1)
$fenceClose

"@

if ($text -match '(?m)^#\s+Chapter 1\b') {
    $text = [regex]::Replace($text, '(?m)^#\s+Chapter 1\b', ($chapterStart + "`n# Chapter 1"), 1)
} else {
    Write-Warning "Could not locate Chapter 1 heading for page-numbering marker."
}

# Collapse consecutive Typst pagebreaks
$bt = [char]96
$collapseReplacement = ($bt.ToString() * 3) + '{=typst}' + "`n#pagebreak()`n" + ($bt.ToString() * 3) + "`n`n"
$text = [regex]::Replace(
    $text,
    '(```\{=typst\}\s*#pagebreak\(\)\s*```\s*){2,}',
    $collapseReplacement
)

# Soft-trim excessive blank lines
$text = [regex]::Replace($text, '\n{5,}', "`n`n`n`n")

[System.IO.File]::WriteAllText($OutputMarkdown, $text, [System.Text.UTF8Encoding]::new($true))
Write-Host "Prepared paperback markdown: $OutputMarkdown"
