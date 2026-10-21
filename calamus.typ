// Calamus — a Typst template for Stredoškolská odborná činnosť (SOČ).
// Designed for Typst 0.15.1.
// School: Gymnázium Karola Štúra, Námestie slobody 5, Modra.
// Methodology: https://archiv.siov.sk/wp-content/uploads/2019/06/Metodika_SOC_2019_B5.pdf

#let first-use(full, short) = [#full (#short)]

#let calamus-graph(body, caption: none) = figure(
  body,
  kind: "calamus-graph",
  caption: caption,
)

#let calamus = (
  school: none,
  school-founder: none,
  title: none,
  category-number: none,
  category-name: none,
  authors: none,
  study-year: none,
  supervisor: none,
  consultant: none,
  city: none,
  year: none,
  declaration-date: none,
  declaration: none,
  acknowledgements: none,
  abbreviations: (),
  list-of-figures: false,
  list-of-tables: false,
  list-of-graphs: false,
  introduction: none,
  bibliography-file: none,
  citation-style: "nlm-citation-sequence-superscript",
  appendices: (),
  resume: none,
  body,
) => {
  assert(school != none, message: "Calamus: doplňte 'school'.")
  assert(school-founder != none, message: "Calamus: doplňte 'school-founder'.")
  assert(title != none, message: "Calamus: doplňte 'title'.")
  assert(category-number != none, message: "Calamus: doplňte 'category-number'.")
  assert(category-name != none, message: "Calamus: doplňte 'category-name'.")
  assert(authors != none, message: "Calamus: doplňte 'authors'.")
  assert(authors.len() > 0, message: "Calamus: zadajte aspoň jedného autora.")
  assert(study-year != none, message: "Calamus: doplňte 'study-year'.")
  assert(supervisor != none, message: "Calamus: doplňte 'supervisor'.")
  assert(city != none, message: "Calamus: doplňte 'city'.")
  assert(year != none, message: "Calamus: doplňte 'year'.")
  assert(declaration-date != none, message: "Calamus: doplňte 'declaration-date'.")
  assert(declaration != none, message: "Calamus: 'declaration' je povinné.")
  assert(introduction != none, message: "Calamus: 'introduction' je povinný.")
  assert(bibliography-file != none, message: "Calamus: doplňte 'bibliography-file'.")

  set page(
    paper: "a4",
    margin: (left: 3.5cm, right: 2.5cm, top: 2.5cm, bottom: 2.5cm),
    numbering: none,
  )
  set text(
    font: "Times New Roman",
    size: 12pt,
    lang: "sk",
    top-edge: 0.8em,
    bottom-edge: -0.2em,
  )
  set par(
    justify: true,
    leading: 0.5em,
    spacing: 0.62em,
    first-line-indent: (amount: 1cm, all: true),
  )
  set list(indent: 1cm, body-indent: 0.35cm)
  set enum(indent: 1cm, body-indent: 0.35cm)

  set heading(numbering: "1.1.1")
  let render-heading(it) = {
    if it.numbering != none {
      context counter(heading).display(it.numbering)
      h(0.65em)
    }
    it.body
  }
  show heading.where(level: 1): it => {
    pagebreak(weak: true)
    block(below: 0.62cm, sticky: true)[
      #set par(first-line-indent: 0pt, justify: false, spacing: 0pt)
      #text(size: 16pt, weight: "bold")[#render-heading(it)]
    ]
  }
  show heading.where(level: 2): it => {
    block(above: 0.55cm, below: 0.27cm, sticky: true)[
      #set par(first-line-indent: 0pt, justify: false, spacing: 0pt)
      #text(size: 14pt, weight: "bold")[#render-heading(it)]
    ]
  }
  show heading.where(level: 3): it => {
    block(above: 0.44cm, below: 0.2cm, sticky: true)[
      #set par(first-line-indent: 0pt, justify: false, spacing: 0pt)
      #text(size: 12pt, weight: "bold")[#render-heading(it)]
    ]
  }
  show heading.where(level: 4): it => {
    block(above: 0.38cm, below: 0.17cm, sticky: true)[
      #set par(first-line-indent: 0pt, justify: false, spacing: 0pt)
      #text(size: 12pt, weight: "bold", style: "italic")[#render-heading(it)]
    ]
  }

  show figure.where(kind: image): set figure(supplement: [Obr.], numbering: "1")
  show figure.where(kind: table): set figure(supplement: [Tabuľka], numbering: "1")
  show figure.where(kind: "calamus-graph"): set figure(supplement: [Graf], numbering: "1")
  show figure.where(kind: image): set figure.caption(position: bottom)
  show figure.where(kind: table): set figure.caption(position: top)
  show figure.where(kind: "calamus-graph"): set figure.caption(position: bottom)

  let author-lines = {
    for (i, author) in authors.enumerate() {
      if i > 0 { linebreak() }
      author
    }
  }

  let title-page(detailed: false) = {
    {
      set par(first-line-indent: 0pt, justify: false, spacing: 0pt)
      align(center)[#text(weight: "bold")[#school]]
      v(0.55cm)
      line(length: 100%, stroke: 0.6pt)
      v(1fr)
      align(center)[
        #text(weight: "bold", tracking: 0.4pt)[STREDOŠKOLSKÁ ODBORNÁ ČINNOSŤ]
        #v(0.85cm)
        #text(size: 17pt, weight: "bold")[#title]
        #v(0.62cm)
        Č. odboru: #category-number #category-name
      ]
      v(1fr)
      grid(
        columns: (1fr, 1fr),
        gutter: 1cm,
        [
          #text(weight: "bold")[#city]
          #v(0.16cm)
          #year
        ],
        [
          Autori
          #v(0.16cm)
          #text(weight: "bold")[#author-lines]
          #v(0.38cm)
          Ročník štúdia: #study-year
        ],
      )
      if detailed {
        v(0.65cm)
        line(length: 100%, stroke: 0.45pt)
        v(0.52cm)
        grid(
          columns: (1fr, 1fr),
          gutter: 1cm,
          [Zriaďovateľ: #school-founder],
          [
            Školiteľ: #supervisor
            #if consultant != none {
              v(0.24cm)
              [Konzultant: #consultant]
            }
          ],
        )
      }
      v(0.35cm)
    }
    pagebreak()
  }

  title-page()
  title-page(detailed: true)

  {
    set par(first-line-indent: 0pt, spacing: 0pt)
    v(1fr)
    block(below: 0.75cm)[#text(size: 14pt, weight: "bold")[Čestné vyhlásenie]]
    declaration(title)
    v(1cm)
    grid(
      columns: (1fr,) + authors.map(_ => 1fr),
      column-gutter: 0.75cm,
      row-gutter: 0.15cm,
      [#city, #declaration-date],
      ..authors.map(_ => [
        #move(dy: 0.2cm)[
          #line(length: 100%, stroke: (thickness: 0.5pt, dash: "dotted"))
        ]
      ]),
      [],
      ..authors.map(author => align(center)[#author]),
    )
    v(0.5cm)
  }
  pagebreak()

  // --- Voliteľné poďakovanie ---
  if acknowledgements != none {
    {
      set par(first-line-indent: 0pt)
      v(1fr)
      block(below: 0.5cm)[#text(size: 14pt, weight: "bold")[Poďakovanie]]
      acknowledgements
      v(0.75cm)
    }
    pagebreak()
  }

  {
    set par(first-line-indent: 0pt, justify: false, spacing: 0pt)
    block(below: 0.7cm)[#text(size: 14pt, weight: "bold")[Obsah]]
    outline(title: none, depth: 3, indent: 1em)
  }
  pagebreak()

  if abbreviations.len() > 0 {
    {
      set par(first-line-indent: 0pt)
      block(below: 0.65cm)[
        #text(size: 14pt, weight: "bold")[Zoznam skratiek, značiek a symbolov]
      ]
      terms(
        tight: false,
        hanging-indent: 2.4cm,
        ..abbreviations.sorted(key: item => item.short).map(item => terms.item(
          strong(item.short),
          [
            #item.full
            #if item.at("details", default: none) != none {
              linebreak()
              item.details
            }
          ],
        )),
      )
    }
    pagebreak()
  }

  if list-of-figures or list-of-tables or list-of-graphs {
    {
      set par(first-line-indent: 0pt, justify: false)
      block(below: 0.65cm)[
        #text(size: 14pt, weight: "bold")[Zoznam tabuliek, grafov a ilustrácií]
      ]
      if list-of-tables {
        block(above: 0.3cm, below: 0.15cm)[#text(weight: "bold")[Tabuľky]]
        outline(title: none, target: figure.where(kind: table))
      }
      if list-of-graphs {
        block(above: 0.3cm, below: 0.15cm)[#text(weight: "bold")[Grafy]]
        outline(title: none, target: figure.where(kind: "calamus-graph"))
      }
      if list-of-figures {
        block(above: 0.3cm, below: 0.15cm)[#text(weight: "bold")[Ilustrácie]]
        outline(title: none, target: figure.where(kind: image))
      }
    }
    pagebreak()
  }

  set page(numbering: "1", number-align: right + bottom)
  counter(page).update(n => n - 1)

  heading(level: 1, numbering: none)[0 Úvod]
  introduction
  counter(heading).update(0)

  body

  if resume != none {
    heading(level: 1, numbering: none)[Resume]
    resume
  }

  {
    pagebreak(weak: true)
    set page(footer: none)
    bibliography(
      bibliography-file,
      title: [Zoznam použitej literatúry],
      style: citation-style,
    )
  }

  if appendices.len() > 0 {
    {
      pagebreak(weak: true)
      set page(footer: none)
      heading(level: 1, numbering: none, outlined: false)[Zoznam príloh]
      for (index, appendix) in appendices.enumerate() {
        let letter = numbering("A", index + 1)
        block(below: 0.25cm)[Príloha #letter — #appendix.title]
      }
      for (index, appendix) in appendices.enumerate() {
        let letter = numbering("A", index + 1)
        pagebreak(weak: true)
        heading(level: 1, numbering: none)[Príloha #letter — #appendix.title]
        appendix.body
      }
    }
  }
}
