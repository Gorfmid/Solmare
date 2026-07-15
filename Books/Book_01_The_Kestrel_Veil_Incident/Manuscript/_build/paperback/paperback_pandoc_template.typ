// Custom pandoc Typst template for KDP 6x9 paperback
// Uses paperback_conf.typ (via --variable template=...)

#let horizontalrule = line(start: (25%,0%), end: (75%,0%))

#show terms.item: it => block(breakable: false)[
  #text(weight: "bold")[#it.term]
  #block(inset: (left: 1.5em, top: -0.4em))[#it.description]
]

#set table(
  inset: 5pt,
  stroke: 0.4pt + luma(140)
)

#show figure.where(
  kind: table
): set figure.caption(position: top)

#show figure.where(
  kind: image
): set figure.caption(position: bottom)

$if(highlighting-definitions)$
$highlighting-definitions$
$endif$

$if(template)$
#import "$template$": conf
$else$
#error("paperback build requires --variable template=paperback_conf.typ")
$endif$

$if(smart)$
$else$
#set smartquote(enabled: false)
$endif$

$for(header-includes)$
$header-includes$
$endfor$

#show: doc => conf(
$if(title)$
  title: [$title$],
$endif$
$if(subtitle)$
  subtitle: [$subtitle$],
$endif$
$if(author)$
  authors: (
$for(author)$
$if(author.name)$
    ( name: [$author.name$],
      affiliation: [$author.affiliation$],
      email: [$author.email$] ),
$else$
    ( name: [$author$],
      affiliation: "",
      email: "" ),
$endif$
$endfor$
    ),
$endif$
$if(keywords)$
  keywords: ($for(keywords)$$keywords$$sep$,$endfor$),
$endif$
$if(date)$
  date: [$date$],
$endif$
$if(lang)$
  lang: "$lang$",
$endif$
$if(region)$
  region: "$region$",
$endif$
  fontsize: 11pt,
  linestretch: 1.15,
  pagenumbering: "1",
  cols: 1,
  doc,
)

$for(include-before)$
$include-before$
$endfor$

$body$

$for(include-after)$
$include-after$
$endfor$
