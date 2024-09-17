# はじめに
今回は、Typstで式やテキストを装飾する**showybox**パッケージを紹介します。[Typst Universe](https://typst.app/universe)上のページは[こちら](https://typst.app/universe/package/showybox/)、GitHub上のリポジトリは[こちら](https://github.com/Pablo-Gonzalez-Calderon/showybox-package)で、2024年8月17日現在、最新バージョンとして**2.0.1**がリリースされています。

この記事では基本的に公式リポジトリの[Showybox's Manual.pdf](https://github.com/Pablo-Gonzalez-Calderon/showybox-package/blob/main/Showybox's%20Manual.pdf)を参考にしながら、showyboxパッケージの使い方を解説します。誤訳などが含まれている場合はコメント等でご指摘頂けると非常にありがたいです。

# 環境
2024年8月22日の時点での最新バージョンを利用しています。
- Typst: 0.11.1
- showybox: 2.0.1

# 導入
パッケージの導入は、Typst Universeのページに存在する他のパッケージと同様に行えます。

```typ
#import "@preview/showybox:2.0.1"
```

# 基本的な記述

showyboxパッケージを利用する際は、基本的に次のように記述します。
    
```typ
showybox()[これがshowyboxパッケージの\ 基本的な記述です。]
```

このように記述すると、次のように表示されます。見やすさのために改行を行っています。


![basic_useage.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/3748073/be3e6a66-91a2-1227-8ffb-086420e4ec99.png)


記法としては、`#showybox()[]`で`showybox`関数を呼び出し、丸括弧`()`に各種パラメーター、角括弧`[]`に装飾したいテキスト等を記述する、という形になります。
デフォルトでは上記のような、
- No title (タイトルなし)
- No shadow (影なし)
- Not breakable (ページおよびコンテナの終端での改行なし)
- Black borders (黒い枠線)
- White background (白い背景)
- 5pt of border radius (角丸の半径5pt)
- 1pt of border thickness (枠線の太さ1pt)

というパラメーターが設定されています。

# パラメーター
バージョン`2.0.1`では、次のパラメーターが利用可能です。
- title
- footer
- frame
- title-style
- body-style
- footer-style
- sep
- shadow
- width
- align
- breakable
- spacing
- above
- below

## title(タイトル)
`title`パラメーターを利用することで、showyboxのタイトルを設定することができます。

```typ
#showybox(title:"これはタイトルです")[これは本文です]
```


![title.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/3748073/d9e8723c-14ca-cbea-83a7-b287df98b8e7.png)


タイトルに設定できるのは[str(文字列)](https://typst.app/docs/reference/foundations/str/)と[content(コンテンツ)](https://typst.app/docs/reference/foundations/content/)です。何も設定しなかった場合(デフォルト)は`""`(空文字列)が設定されます。

## footer(フッター)
`footer`パラメーターを利用することで、showyboxのフッターを設定することができます。

```typ
#showybox(title:"これはタイトルです",footer:"これはフッターです")[これは本文です]
```


![footer.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/3748073/764c9d13-c12b-bef6-dc25-1c629de516ae.png)


こちらもタイトルと同様、設定できるのは`str`と`content`です。何も設定しなかった場合(デフォルト)は`""`(空文字列)が設定されます。


## frame
このパラメーターには、showyboxのフレームの外観を指定するためのすべてのプロパティが含まれています。その内容を以下に示します。

- title-color
- body-color
- footer-color
- border-color
- radius
- thickness
- dash
- inset
- title-inset
- body-inset
- footer-inset

### title-color, body-color, footer-color, border-color(背景色)
それぞれの名称の通り、タイトルの背景、本文の背景、フッターの背景、枠線の色を指定します。指定できる色の種類や指定方法は[color](https://typst.app/docs/reference/visualize/color/)を参照してください。

一例は以下の通りです。

```typ
#showybox(title: "Green's Theorem", frame: (
  border-color: olive,
  title-color: olive.lighten(10%),
  body-color: olive.lighten(95%),
  footer-color: olive.lighten(80%),
), footer: "証明は省略する。")[
  閉曲線$C$で囲まれた領域$D$において、$C^1$級関数$P(x,y)$と$Q(x,y)$に対して、以下が成り立つ。
  $ integral.cont_C (P dif x + Q dif y ) = integral.double_D ((diff Q)/(diff x)-(diff P)/(diff y)) dif x dif y $
]
```


![frame_color.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/3748073/3675f49e-4036-fd35-89b6-b0888d94c4b7.png)

それぞれのプロパティは独立して指定できますが、ここでは見た目の統一感を出すためにあえて`olive`を基調としています。それに対して`lighten`メソッドを利用することで、それぞれの色を明るくしています。このような色の指定方法も、先程紹介した[color](https://typst.app/docs/reference/visualize/color/)のページが参考になると思います。

### radius(角丸)
`radius`プロパティは、角丸の半径を指定します。デフォルトは`5pt`です。

```typ
#showybox(title: "これはタイトルです", frame: (radius: 10pt), footer: "これはフッターです")[これは本文です]
```


![frame_radius.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/3748073/a7e10f75-de46-568a-9aaa-128dc1f3576e.png)


値は`relative-length`や`dictionary`の形式で指定できます。

### thickness(枠線の太さ)
`thickness`プロパティは、枠線の太さを指定します。デフォルトは`1pt`です。

```typ
#showybox(title: "これはタイトルです", frame: (thickness: 2pt), footer: "これはフッターです")[これは本文です]
```


![frame_thickness.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/3748073/cff31aed-3988-4f79-7c60-fe863d3da2a1.png)


こちらも`relative-length`や`dictionary`の形式で指定できます。`dictionary`の場合は、`top`, `bottom`, `left`, `right`, `x`, `y`, `rest`のプロパティを指定できます。
ちなみに`box`内を分割している線(`separeaor`)の太さは、`thickness`プロパティではなく後述する`sep`プロパティで指定します。

### dash(破線)
`dash`プロパティは、枠線の破線の形状を`str`で指定します。デフォルトの値は `"solid"`(実線)です。

```typ
#showybox(title: "これはタイトルです", frame: (dash: "dashed"), footer: "これはフッターです")[これは本文です]
```


![frame_dash.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/3748073/f6f23d53-0cb0-f004-6a94-392c880b5411.png)


指定できる値は
- **solid**: 実線
- **dotted**: 点線
- **densely-dotted**: 密な点線
- **loosely-dotted**: 疎な点線
- **dashed**: 破線
- **densely-dashed**: 密な破線
- **loosely-dashed**: 疎な破線
- **dash-dotted**: 破線と点線の組み合わせ
- **densely-dash-dotted**: 密な破線と点線の組み合わせ
- **loosely-dash-dotted**: 疎な破線と点線の組み合わせ

です。

### inset, title-inset, body-inset, footer-inset(余白)
`inset`プロパティは、枠線の内側の余白を指定します。`title-inset`, `body-inset`, `footer-inset`は、それぞれタイトル、本文、フッターの内側の余白を指定します。

```typ
#showybox(title: "これはタイトルです", frame: (inset: 20pt, ), footer: "これはフッターです")[これは本文です]
```


![frame_inset.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/3748073/1279d330-721c-f9ee-820d-425f19784627.png)


値は`relative-length`や`dictionary`の形式で指定できます。`dictionary`の場合は、`top`, `bottom`, `left`, `right`, `x`, `y`, `rest`のプロパティを指定できます。デフォルトの値は`(x: 1em, y: 0.65em)`です。

`title-inset`, `body-inset`, `footer-inset`の値を指定した場合は、これらのプロパティはそれぞれタイトル、本文、フッターの余白を個別に設定します。このとき、`inset` プロパティは無視され、個別のインセットが優先されます。

## Title style
`title-style`パラメーターは、タイトルのスタイルを指定します。指定できるプロパティは次の通りです。

- color
- weight
- align
- sep-thickness
- boxed-style

### color
タイトルに用いるテキストの色を指定します。デフォルトは`white`です。

### weight
タイトルに用いるテキストの太さを指定します。指定できる値は`100`から`900`までの100刻み、または事前に定義されたキーワード("thin"、"extralight"、"light"、"regular"、"medium"、"semibold"、"bold"、
"extrabold"、"black")です。デフォルトは`regular`です。 

### align
タイトルのテキストの配置を指定します。指定できる値は`"left"`(左寄せ)、`"center"`（中央寄せ）、`"right"`（右寄せ）です。デフォルトは`"left"`です。

### sep-thickness
タイトルと本文を分割する線の太さを指定します。デフォルトは`1pt`です。

```typ
#showybox(
  title-style: (weight: 800, color: teal.darken(40%), sep-thickness: 0pt, align: center),
  frame: (title-color: teal.lighten(80%), border-color: teal.darken(40%), thickness: (left: 2pt), radius: 0pt),
  title: "自己情報量",
)[
  事象$E$が起こる確率を$P(E)$とするとき、事象$E$の自己情報量$I(E)$は次のように定義される。
  $ I(E) = log 1/(P(E)) = -log P(E) $
]
```


![title_style.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/3748073/ce2f29f1-bd0f-7c4f-6484-c6a9b3090a65.png)

### boxed-style
このプロパティが`None`でない場合(すなわち辞書型の場合)、タイトルはfloating boxとして、本文の上部に表示されます。詳細は後述します。

## Boxed style
`boxed-style`で指定できるのは次のプロパティです。

- anchor
- offset
- radius

### anchor
`anchor`は、boxedtitle のアンカーをどこに配置するかを示す、キー`x`と`y`を持つ辞書型の値です。各方向の値の一覧は以下の通りです：

x方向のアンカー:

`left`: boxed-title の左側にアンカーを設定する。
`center`: boxed-title の水平中央にアンカーを設定する。
`right`: boxed-title の右側にアンカーを設定する。
y方向のアンカー:

`top`: boxed-title の上部にアンカーを設定する。
`horizon`: boxed-title の垂直中央にアンカーを設定する。
`bottom`: boxed-title の下部にアンカーを設定する。
デフォルトは `(x: left, y: horizon)` です。

### offset
`offset`はキー `x` と `y` を持つ辞書型の値で、boxed-title の x方向およびy方向へのオフセット量を指定します。 デフォルトは` (x: 0pt, y: 0pt)` です。

### radius
`radius`は、boxed-title の角丸の半径を指定します。デフォルトは `5pt` です。辞書型として設定した場合、`top-left`, `top-right`, `bottom-left`, `bottom-right` の各角に異なる半径を設定することができます。

```typ
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
```


![boxed_style.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/3748073/f70eec77-cd92-194d-ec96-455958329842.png)

## Body style
このパラメータには、`showybox` の本文に対して一般的なスタイルのプロパティを設定するのに役立つすべてのオプションが含まれています。

- color
- align

### color
本文のテキストの色を指定します。デフォルトは`black`です。

### align
本文のテキストの配置を指定します。デフォルトは`"left"`です。

## Footer style
このパラメータには、`showybox` のフッターのプロパティを設定するのに役立つすべてのオプションが含まれています。これらのプロパティの一部は `footer` パラメータを設定する際に指定することもできますが、似たスタイルの複数の `showybox` を作成する際に特に便利です。

- color
- weight
- align
- sep-thickness

### color
フッターのテキストの色を指定します。デフォルトは`luma(85)`です。詳しくは[luma](https://typst.app/docs/reference/visualize/color/#definitions-luma)を参照してください。

### weight
フッターのテキストの太さを指定します。デフォルトは`regular`です。

### align
フッターのテキストの配置を指定します。デフォルトは`"left"`です。

### sep-thickness
フッターと本文を分割する線の太さを指定します。デフォルトは`1pt`です。

```typ
#showybox(
  footer-style: (sep-thickness: 0pt, align: right, color: black),
  title: "シグモイド関数",
  footer: [
    シグモイド関数はニューラルネットワークにおける活性化関数として広く用いられる。
  ],
)[
  比較的単純な非線形関数であるシグモイド関数は、以下のように定義される。
  $ phi(x) =sigma.alt_1(x) =1/(1+e^(-x)) =(tanh(x/2)+1)/2 $
]
```


![footer_style.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/3748073/4cbc93a5-74ab-3bc8-8fc6-e1da29f2c2c0.png)


## Separator properties (sep) 
セパレータに関するプロパティを指定します。スパレーターの使い方は後述します。

- thickness
- dash
- gutter

### thickness
`thickness`プロパティは、セパレーターの太さを指定します。デフォルトは`1pt`です。

### dash
`dash`プロパティは、セパレーターの破線の形状を指定します。デフォルトの値は `"solid"`(実線)です。

### gutter
セパレーターの上下の余白を指定します。デフォルトは`0.65em`です。

## Shadow properties
`shadow`プロパティは、showyboxに影を付けるためのプロパティを指定します。このプロパティを指定しないか、あるいは`none`を指定した場合、影は設定されません。

- color
- offset

### color
影の色を指定します。デフォルトは`luma(128)`です。

### offset
影の位置のオフセットを相対的な長さ、あるいは`x`と`y`をキーとする辞書型で指定します。デフォルトは`4pt`です。

```typ
#showybox(
  shadow: (color: aqua.lighten(55%), offset: 3pt),
  frame: (title-color: blue.darken(30%), border-color: blue.darken(30%), body-color: aqua.lighten(80%)),
  title: "ガウスの発散定理",
  title-style: (weight: 600)
)[
  ガウスの発散定理は次のように表される。
  $ integral_S bold(A) dot bold(n) dif S = integral_V nabla dot bold(A) dif V $
]
```


![shadow.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/3748073/206c7d8e-1977-e093-f8fb-348de46d5522.png)


## Width
showyboxの幅を指定します。デフォルトは`100%`です。

## Align　
showyboxの配置を指定します。デフォルトは`left`です。

## Breakable
このパラメーターは、showyboxがページまたはコンテナの終端で改行するかどうかを指定します。デフォルトは`false`です。

## Spacing, above, and below
spacing は、`above` または `below` が指定されていない場合に、showyboxの上下にどれだけのスペースを挿入するかを設定します。デフォルトでは、ドキュメント内のブロックのデフォルトのスペースが適用されます。

# Separators
同じshowybox内において、コンテンツを2つ以上に分割したい場合、`showybox()`関数の括弧内にコンテンツをコンマで区切って記述するか、閉じ括弧の直後にコンテンツを並べることで実現できます。

# Encapsulation
showyboxの中に別のshowyboxを入れ子にすることもできます。

```typ
= Encapsulation
#showybox(title: "Parent container", lorem(10), columns(2)[
  #showybox(title-style: (boxed-style: (:)), title: "Child 1", lorem(10))
  #colbreak()
  #showybox(title-style: (boxed-style: (:)), title: "Child 2", lorem(10))
])
```


![encapsulation.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/3748073/877caffb-cf0c-4e2c-5617-035043a0ed23.png)

# まとめ
今回はshowyboxパッケージの使い方について解説しました。showyboxパッケージを利用することで、式やテキストを装飾することができ、見やすくなるだけでなく、情報を整理しやすくなります。ぜひ、Typstでの執筆時に活用してみてください。
また、誤訳などが含まれている場合はコメント等でご指摘頂けると非常にありがたいです。ここまで読んでいただき、ありがとうございました。

# 参考文献
- [showybox 2.0.1](https://typst.app/universe/package/showybox/)
- [Pablo-Gonzalez-Calderon/showybox-package](https://github.com/Pablo-Gonzalez-Calderon/showybox-package)
- [Showybox's Manual.pdf](https://github.com/Pablo-Gonzalez-Calderon/showybox-package/blob/main/Showybox's%20Manual.pdf)