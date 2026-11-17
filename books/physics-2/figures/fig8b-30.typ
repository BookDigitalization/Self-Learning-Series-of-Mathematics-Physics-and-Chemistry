// 图 8·30（原书 p.318）：写实图沿用原扫描裁剪的二值化位图（fig8b-30.png，已涂去标号、文字），标号和文字用真文字补回。
// 坐标为 200 dpi 原书页面像素坐标（左上原点），画布原点在页面 (240, 680)。
#import "/common/series.typ": *

#let fig-8-30(width: 9.2cm) = px-canvas(560, 280, origin: (240, 680), width: width, (p, u) => {
  import cetz.draw: *
  content(p(240, 680), anchor: "north-west", image("fig8b-30.png", width: 560 * u))
  let lab(x, y, body, fill: black) = content(p(x, y), anchor: "center", text(size: 8pt, font: fonts.hei, fill: fill, body))
})
