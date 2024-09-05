#set text(lang: "ja") // 言語を日本語に設定
#set text(font: ("New Computer Modern", "Harano Aji Gothic"), size: 10pt) // フォントを設定
#show figure.where(kind: table): set figure.caption(position: top) // 表におけるキャプションを上部に表示するよう設定

#show heading: set text(font: ("Harano Aji Gothic"), weight: 500)
#set heading(numbering: "1.1.")
#import "@preview/codelst:2.0.1": sourcecode
#import "@preview/showybox:2.0.1": showybox
#show raw: set text(font: ("DejaVu Sans Mono", "Harano Aji Gothic"))

= 基本的な記述

#showybox()[これがshowyboxパッケージの\ 基本的な記述です。]

= パラメーター

== title(タイトル)

#showybox(title: "これはタイトルです")[これは本文です]

== footer(フッター)

#showybox(title: "これはタイトルです", footer: "これはフッターです")[これは本文です]

== frame

=== title-color, body-color, footer-color, border-color(背景色)

#showybox(title: "Green's Theorem", frame: (
  border-color: olive,
  title-color: olive.lighten(10%),
  body-color: olive.lighten(95%),
  footer-color: olive.lighten(80%),
), footer: "証明は省略する。")[
  閉曲線$C$で囲まれた領域$D$において、$C^1$級関数$P(x,y)$と$Q(x,y)$に対して、以下が成り立つ。
  $ integral.cont_C (P dif x + Q dif y ) = integral.double_D ((diff Q)/(diff x)-(diff P)/(diff y)) dif x dif y $
]

=== radius(角丸)

#showybox(title: "これはタイトルです", frame: (radius: 10pt), footer: "これはフッターです")[これは本文です]

=== thickness(線の太さ)

#showybox(title: "これはタイトルです", frame: (thickness: 2pt), footer: "これはフッターです")[これは本文です]

=== dash(破線)

#showybox(title: "これはタイトルです", frame: (dash: "dashed"), footer: "これはフッターです")[これは本文です]


#pagebreak()
=== inset, title-inset, body-inset, footer-inset(余白)

#showybox(title: "これはタイトルです", frame: (inset: 20pt), footer: "これはフッターです")[これは本文です]

== Title Style
#showybox(
  title-style: (weight: 800, color: teal.darken(40%), sep-thickness: 0pt, align: center),
  frame: (title-color: teal.lighten(80%), border-color: teal.darken(40%), thickness: (left: 2pt), radius: 0pt),
  title: "自己情報量",
)[
  事象$E$が起こる確率を$P(E)$とするとき、事象$E$の自己情報量$I(E)$は次のように定義される。
  $ I(E) = log 1/(P(E)) = -log P(E) $
]

== Boxed Title
#showybox(
  title-style: (boxed-style: (anchor: (x: center, y: horizon), radius: (top-left: 10pt, bottom-right: 10pt, rest: 0pt))),
  frame: (
    title-color: green.darken(40%),
    body-color: green.lighten(80%),
    footer-color: green.lighten(60%),
    border-color: green.darken(60%),
    radius: (top-left: 10pt, bottom-right: 10pt, rest: 0pt),
  ),
  title: "ラプラス変換",
)[
  実数$t gt.eq 0$について定義された関数$f(t)$のラプラス変換とは
  $ F(s)=integral_0^oo f(t)e^(-s t) dif t $
  で定義される$s$の関数$F(s)$のことである。
]







