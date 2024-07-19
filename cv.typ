// Modified by ice1000 at 2023-08-16

#let chiline() = {
  v(-3pt)
  line(length: 100%, stroke: gray)
  v(-10pt)
}

#import "fontawesome.typ": *;
#let iconlink(
  uri,
  text: [],
  icon: link-icon,
) = {
  if text == [] {
    text = uri
  }
  link(uri)[#fa[#icon] #text]
}

#let githublink(userRepo) = {
  link("https://github.com/" + userRepo)[#fa[#github] #userRepo]
}

#let emaillink(email) = {
  link("mailto:" + email)[#fa[#voicemail] #email]
}

#let cventry(
  tl: "",
  tr: "",
  bl: [],
  br: [],
  content,
) = {
  block(
    inset: (left: 0pt),
    if tl != "" or tr != "" {
      tl + h(1fr) + tr + linebreak()
    } + if bl != [] or br != [] {
      bl + h(1fr) + br + linebreak()
    } + content,
  )
}

#let cv(body) = {
  set par(justify: true)

  show heading.where(level: 1): set text(
    size: 18pt,
    weight: "light",
  )

  let the-font = (
    "Palatino Linotype",
    "Source Han Serif SC",
  )

  show heading.where(level: 2): it => text(
    size: 12pt,
    font: the-font,
    weight: "bold",
    block(chiline() + it),
  )

  show heading.where(level: 3): it => text(
    size: 10pt,
    font: the-font,
    weight: "medium",
    block(it),
  )

  set list(indent: 2pt)
  set text(
    size: 9pt,
    font: the-font,
  )

  show link: it => underline(offset: 2pt, it)
  set page(
    margin: (x: 0.5cm, y: 0.9cm),
    numbering: "1 / 1",
  )
  set par(justify: true)

  body
}