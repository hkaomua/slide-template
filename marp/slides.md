---
marp: true
theme: line-seed
paginate: true
footer: 'スライド記入例'
title: 'TITLE HERE'
author: 'NAME'
math: katex
---

<!-- _class: title -->
<!-- _paginate: false -->

# TITLE HERE

NAME

---

# TITLE

- First Level
  - Second Level

---

# 日本語のスライド

- 第一階層の箇条書き
  - 第二階層の補足説明
- **太字の強調**と English 123
  - 句読点、括弧（かっこ）、長音を確認

<!-- このページをコピーして本文スライドを増やせます。 -->

---

<!-- _class: image-example -->

# 画像の挿入

<!-- 画像のパスと代替テキストを差し替えます。widthで幅を指定できます。 -->
![width:533px 参考スライドの表紙](../assets/sample-slide.png)

図1：参考スライド（差し替え用）

---

# 表の挿入

数値は記入例です。

<!-- 右寄せする列には ---: を指定します。 -->
| 手法 | 平均時間（ms） | 標準偏差（ms） |
| :--- | ---: | ---: |
| 基準 | 120 | 8 |
| 手法A | 95 | 6 |
| 手法B | 82 | 5 |

---

# 数式の挿入

測定値を $x_i$、測定回数を $n$ とします。

<!-- 文中の数式は $...$、独立した数式は $$...$$ で囲みます。 -->
$$
\bar{x} = \frac{1}{n}\sum_{i=1}^{n} x_i
$$

記入例：$x_i = 10, 12, 14, 16, 18$、$n = 5$

$$
\bar{x} = \frac{10 + 12 + 14 + 16 + 18}{5} = 14
$$
