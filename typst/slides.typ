#import "theme.typ": *

#show: hkaomua-theme.with(
  title: [TITLE HERE],
  author: [NAME],
  filename: [スライド記入例],
)

#title-slide()

== TITLE

- First Level
  - Second Level

== 日本語のスライド

- 第一階層の箇条書き
  - 第二階層の補足説明
- *太字の強調*と English 123
  - 句読点、括弧（かっこ）、長音を確認

== 画像の挿入

// パスと幅を差し替えます。高さは縦横比に合わせて決まります。
#align(center)[
  #image("../assets/sample-slide.png", width: 400pt, alt: "参考スライドの表紙")
  #v(8pt)
  #text(size: 14pt)[図1：参考スライド（差し替え用）]
]

== 表の挿入

数値は記入例です。

// 列数、配置、セルの内容を変更できます。
#text(size: 16pt)[
  #table(
    columns: 3,
    align: (left, right, right),
    inset: (x: 12pt, y: 5pt),
    stroke: none,
    table.header([*手法*], [*平均時間（ms）*], [*標準偏差（ms）*]),
    table.hline(stroke: 1.4pt + accent),
    [基準], [120], [8],
    table.hline(stroke: .6pt + rule-color),
    [手法A], [95], [6],
    table.hline(stroke: .6pt + rule-color),
    [手法B], [82], [5],
    table.hline(stroke: .6pt + rule-color),
  )
]

== 数式の挿入

測定値を $x_i$、測定回数を $n$ とします。

// 文中は $x_i$、独立した数式は $ の内側に空白を入れます。
$ overline(x) = 1/n sum_(i=1)^n x_i $

記入例：$x_i = 10, 12, 14, 16, 18$、$n = 5$

$ overline(x) = (10 + 12 + 14 + 16 + 18)/5 = 14 $
