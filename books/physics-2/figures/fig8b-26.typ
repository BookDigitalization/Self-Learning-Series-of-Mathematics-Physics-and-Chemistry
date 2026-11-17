// 图 8·26（原书 p.315）：写实图沿用原扫描裁剪的二值化位图（fig8b-26.png，已涂去标号、文字），标号和文字用真文字补回。
// 坐标为 200 dpi 原书页面像素坐标（左上原点），画布原点在页面 (270, 735)。
#import "/common/series.typ": *

#let fig-8-26(width: 3.5cm) = px-canvas(210, 415, origin: (270, 735), width: width, (p, u) => {
  import cetz.draw: *
  content(p(270, 735), anchor: "north-west", image("fig8b-26.png", width: 210 * u))
  let lab(x, y, body, fill: black) = content(p(x, y), anchor: "center", text(size: 8pt, font: fonts.hei, fill: fill, body))
  lab(320, 850, [活塞环])
})
