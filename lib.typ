// All imports
#import "@preview/theoretic:0.3.0"
#import theoretic.presets.bar: * 
#show ref: theoretic.show-ref

#import "@preview/showybox:2.0.4": showybox
#import "@preview/fontawesome:0.6.0": *

// Main noteworthy function
#let noteworthy(
  paper-size: "us-letter",
  font: "IBM Plex Mono",
  language: "EN",
  title: none,
  header-title: none,
  date: none,
  author: none,
  contact-link: none,
  contact-show: none,
  toc-title: "Table of Contents",
  watermark: none,
  content,
  pagebreak: false,
) = {
  // Document metadata
  set document(
    title: [#title - #author],
    author: author,
    date: auto,
  )

  // Page settings
  set page(
    paper: paper-size,
    background: if watermark != none {
      rotate(-40deg, text(30pt, fill: rgb("#f8905862"))[*#watermark*])
    },
    header: context {
      if (counter(page).get().at(0) > 1) [
        #grid(
          columns: (1fr, 1fr),
          align: (left, right),
          smallcaps(if header-title != none {
            header-title
          } else {
            title
          }),
          if date != none {
            date
          } else {
            datetime.today().display("[day]/[month]/[year]")
          },
        )
        #line(length: 100%)
      ]
    },
    footer: context [
      #line(length: 100%)
      #grid(
        columns: (1fr, auto, 1fr),
        align: (left, center, right),
        author,
        if contact-link != none {
          [#fa-icon("box-archive") #link(contact-link)[#contact-show] #fa-icon("box-archive")]
        },
        counter(page).display(
          "(1/1)",
          both: true,
        ),
      )
    ],
  )

  // Text settings
  set text(
    font: font,
    size: 12pt,
    lang: language,
  )

  // TOC settings
  show outline.entry.where(level: 1): it => {
    v(12pt, weak: true)
    strong(it)
  }

  // Heading settings
  set heading(numbering: "1.")

  // Paragraph settings
  set par(justify: true)

  // Title
  showybox(
    frame: (
      border-color: blue.darken(50%),
      body-color: blue.lighten(80%),
    ),
    shadow: (
      offset: 3pt,
    ),
    body-style: (
      align: center,
    ),
    text(weight: "black", size: 15pt, title),
  )

  // Table of contents
  showybox(
    outline(
      indent: auto,
      title: toc-title,
      depth: 2,
    ),
  )

  if pagebreak == true [ pagebreak() ]

  // Main content
  content
}

// Custom environments using theoretic

// 1. Note
#let note = remark.with(
  kind: "note",
  supplement: "Note",
  options: (color: rgb("#f88f58")),
)

// 2. Exercise
#let exercise = theorem.with(
  kind: "exercise",
  supplement: "Exercise",
  options: (color: rgb("#56727b")),
)

// 3. Solution
#let solution = proof.with(
  kind: "solution",
  supplement: "Solution",
  suffix: $#fa-icon("terminal")$
)

#let proof = proof.with(
  suffix: $#fa-icon("square", solid: true)$
)
