// 图 8·50（原书 p.338）：写实图沿用原扫描裁剪的二值化位图（fig8b-50.png，已涂去标号、文字），标号和文字用真文字补回。
// 坐标为 200 dpi 原书页面像素坐标（左上原点），画布原点在页面 (240, 160)。
#import "/common/series.typ": *

#let fig-8-50(width: 10.1cm) = px-canvas(610, 415, origin: (240, 160), width: width, (p, u) => {
  import cetz.draw: *
  content(p(240, 160), anchor: "north-west", image("fig8b-50.png", width: 610 * u))
  let lab(x, y, body, fill: black) = content(p(x, y), anchor: "center", text(size: 8pt, font: fonts.hei, fill: fill, body))
  lab(568.5, 287.5, [火药管])
  lab(784, 270.5, [喷管])
  lab(687.5, 300.5, [排气隔板])
  lab(385.5, 366.5, [引火剂])
  lab(552.5, 367.5, [火药管])
  lab(768, 453.5, [喷管])
  lab(459.5, 546.5, [燃烧室])
  lab(631, 546, [带孔的隔板])
})
