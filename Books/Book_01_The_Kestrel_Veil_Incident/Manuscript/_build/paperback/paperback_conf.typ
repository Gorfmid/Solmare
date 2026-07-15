// KDP paperback 6×9 — Typst configuration module for pandoc
// Import via pandoc variable: template=paperback_conf.typ

#let conf(
  title: none,
  subtitle: none,
  authors: (),
  keywords: (),
  date: none,
  abstract: none,
  abstract-title: none,
  thanks: none,
  cols: 1,
  margin: (
    inside: 0.75in,
    outside: 0.5in,
    top: 0.6in,
    bottom: 0.7in,
  ),
  paper: "custom",
  lang: "en",
  region: "US",
  font: ("Times New Roman", "Libertinus Serif", "Georgia"),
  fontsize: 11pt,
  mathfont: (),
  codefont: (),
  main-color: black,
  linkcolor: black,
  citecolor: black,
  filecolor: black,
  linestretch: 1.15,
  sectionnumbering: none,
  pagenumbering: "1",
  doc,
) = {
  let author-name = if authors != () {
    authors.first().name
  } else {
    [K.W. Abbott]
  }
  let book-title = if title != none { title } else { [The Kestrel Veil Incident] }

  // --- Page geometry: native 6 × 9 in, mirrored margins ---
  set page(
    width: 6in,
    height: 9in,
    margin: margin,
    numbering: none,
    header: none,
    footer: none,
  )

  set text(
    font: font,
    size: fontsize,
    lang: lang,
    region: region,
    fill: black,
    hyphenate: true,
  )

  set par(
    justify: true,
    leading: 0.55em,
    spacing: 0.55em,
    first-line-indent: (amount: 0.22in, all: false),
  )

  set heading(numbering: none)

  // Tables stay inside text block
  set table(inset: 5pt, stroke: 0.4pt + luma(120))
  show table: set text(size: 9pt)
  show table: set par(justify: false, first-line-indent: 0pt)

  // Images: never exceed text-block width (~4.75in)
  set image(width: auto)

  // Block quotes
  show quote.where(block: true): it => {
    set par(first-line-indent: 0pt, justify: false)
    set text(style: "italic", size: 10.5pt)
    pad(left: 0.35in, right: 0.2in, top: 0.3em, bottom: 0.3em, it)
  }

  // Horizontal rules → scene-break style
  show line: it => {
    if it.length == 100% or it.start != none {
      align(center)[
        #block(above: 1.1em, below: 1.1em)[
          #text(size: 14pt, tracking: 0.25em)[❦]
        ]
      ]
    } else {
      it
    }
  }

  // Chapter / section headings
  show heading.where(level: 1): it => {
    pagebreak(weak: true)
    set par(first-line-indent: 0pt, justify: false)
    set text(hyphenate: false)

    // Detect appendix / front-matter vs chapter openers for top spacing
    let label-str = if it.has("label") and it.label != none { str(it.label) } else { "" }
    let body-repr = repr(it.body)
    let is-appendix = label-str.starts-with("appendix") or body-repr.contains("APPENDIX")
    let is-front = ("copyright", "prologue", "epilogue", "about-the-author").any(s => label-str.starts-with(s)) or body-repr.contains("Copyright") or body-repr.contains("Prologue") or body-repr.contains("Epilogue") or body-repr.contains("About the Author")

    if is-appendix {
      v(0.45in, weak: true)
    } else if is-front {
      v(0.9in, weak: true)
    } else {
      v(1.35in, weak: true)
    }

    align(center)[
      #block(below: 0.7em, breakable: false)[
        #text(size: if is-appendix { 14pt } else { 16pt }, weight: "bold")[#it.body]
      ]
    ]
    v(0.55em)
  }

  // Keep appendix heading + following logo/figure from splitting across pages when possible
  show heading.where(level: 2): it => {
    set par(first-line-indent: 0pt, justify: false)
    align(center)[
      #block(above: 0.85em, below: 0.55em, breakable: false)[
        #text(size: 12pt, weight: "regular")[#it.body]
      ]
    ]
  }

  show heading.where(level: 3): it => {
    set par(first-line-indent: 0pt, justify: false)
    block(above: 0.9em, below: 0.45em)[
      #text(size: 11pt, weight: "bold")[#it.body]
    ]
  }

  // Strong orphan/widow preference via keep properties on headings
  show heading: set block(breakable: false)

  // --- Title page ---
  {
    set align(center)
    set par(first-line-indent: 0pt, justify: false)
    v(2.2in)
    text(size: 22pt, weight: "bold")[#book-title]
    v(0.55em)
    if subtitle != none {
      text(size: 12pt)[#subtitle]
      v(0.35em)
    }
    v(1.6em)
    text(size: 13pt)[#author-name]
    v(1fr)
    text(size: 10pt)[The Solmare Cycle · Book One]
    v(0.8in)
  }

  pagebreak()

  // Front matter continues without running heads/numbers until marker in body
  doc
}
