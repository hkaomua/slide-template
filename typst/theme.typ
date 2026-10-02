// MIT License. Shared visual design with marp/ and beamer/.
#import "@preview/touying:0.7.4": *

#let accent = rgb("#1793D1")
#let rule-color = rgb("#AAAAAA")
#let footer-color = rgb("#333333")

// Absolute positions use the same 720 x 405pt canvas as the reference.
#let decoration(self, title: none, cover: false) = {
  place(top + left, dy: 384.59448pt,
    rect(width: 720pt, height: 20.40552pt, fill: footer-color, stroke: none))
  place(top + left, dy: 382.32678pt,
    rect(width: 720pt, height: 2.2677pt, fill: accent, stroke: none))
  place(top + left, dx: 10.098425pt, dy: 389.65508pt,
    text(size: 8pt, fill: white, self.store.filename))
  if not cover {
    place(top + right, dx: -13.159607pt, dy: 390.2228pt,
      text(size: 8pt, fill: white, context counter(page).display()))
    place(top + left, dx: 35.084645pt, dy: 23.833416pt,
      text(size: 24pt, weight: 700, title))
    place(top + left, dx: 36pt, dy: 64.66732pt,
      rect(width: 648pt, height: 1.70079pt, radius: .850395pt, fill: rule-color, stroke: none))
    place(top + left, dx: 36pt, dy: 64.66732pt,
      rect(width: 51.02362pt, height: 1.70079pt, radius: .850395pt, fill: accent, stroke: none))
  }
}

#let slide(title: auto, ..args) = touying-slide-wrapper(self => {
  let slide-title = if title == auto { utils.display-current-heading(level: 2) } else { title }
  self = utils.merge-dicts(self, config-page(
    background: decoration(self, title: slide-title),
  ))
  touying-slide(self: self, ..args)
})

#let title-slide(title-size: 52pt) = touying-slide-wrapper(self => {
  self = utils.merge-dicts(self, config-page(
    margin: 0pt,
    background: decoration(self, cover: true),
  ))
  touying-slide(self: self, {
    place(top + left, dx: 24.54396pt, dy: 201.01999pt - .932 * title-size,
      block(width: 656.38511pt, align(center,
        text(size: title-size, weight: 800, self.info.title))))
    place(top + left, dx: 24.5433pt, dy: 230.46945pt,
      block(width: 670.9134pt, align(center,
        text(size: 20pt, self.info.author))))
  })
})

#let hkaomua-theme(title: [TITLE HERE], author: [NAME], filename: [スライド記入例], body) = {
  set document(title: title)
  set text(font: "LINE Seed JP_OTF", size: 18pt, lang: "ja",
    top-edge: .932em, bottom-edge: .168em, kerning: false, ligatures: false)
  set par(leading: .4em, spacing: 12pt)
  set list(indent: 8.9pt, body-indent: 19.7pt, spacing: 8pt,
    marker: (
      box(width: 7.4pt, circle(radius: 3.7pt, fill: black)),
      box(width: 7.4pt, align(right, circle(radius: 2.425pt, stroke: .55pt))),
    ))
  show list: it => {
    show list: set text(size: 14pt)
    it
  }
  show: touying-slides.with(
    config-page(width: 720pt, height: 405pt, fill: white,
      margin: (top: 92.12014pt, bottom: 42pt, left: 35.084645pt, right: 35.084645pt)),
    config-common(slide-fn: slide, show-strong-with-alert: false, reset-page-counter-to-slide-counter: false),
    config-info(title: title, author: author),
    config-store(filename: filename),
  )
  body
}
