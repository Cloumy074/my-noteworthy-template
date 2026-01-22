#import "../lib.typ": *

#show: noteworthy.with(
  paper-size: "us-letter",
  font: "IBM Plex Mono",
  language: "EN",
  title: "Title of The Document",
  header-title: "Header Title", // Optional: The document title will be used instead of it if it is absent
  date: none, //Optional: Current system date will be used if this is absent
  author: "Your Name",
  contact-link: "https://example.com", // Optional: Maybe a link to your website, or phone number
  contact-show: "Show Text", // What you want to show as link text
  toc-title: "Table of Contents",
  watermark: "DRAFT", // Optional: Watermark for the document
  page-break: false,  // Optional: Add a page break after the table of contents
)

// Write here
= Customized Theoretic 0.3.0 Components

#theorem(title: "THM Title")[
  Test Theorem
]

#proof(title: "THM 1.1")[
  Test Proof
]

#exercise(title: "Exercise Title")[
  Test Content
]

#solution(title: "Exercise 1.2")[
  Test Solution
]

#definition(title: "Def. Title")[
  Test Definition
]

#lemma(title: "Lemma Title")[
  Test Lemma
]

#remark(title: "Remark Title")[
  Test Remark
]

#example(title: "E.g. Title")[
  Test Example
]

#note(title: "Note Title")[
  Test Note
]
#pagebreak()

#lorem(30)
