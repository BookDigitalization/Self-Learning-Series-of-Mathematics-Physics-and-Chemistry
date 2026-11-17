// 图 8·42（原书 p.329）：写实图沿用原扫描裁剪的二值化位图（fig8b-42.png，已涂去标号、文字），标号和文字用真文字补回。
// 坐标为 200 dpi 原书页面像素坐标（左上原点），画布原点在页面 (200, 530)。
#import "/common/series.typ": *

#let fig-8-42(width: 2.0cm) = px-canvas(120, 370, origin: (200, 530), width: width, (p, u) => {
  import cetz.draw: *
  content(p(200, 530), anchor: "north-west", image("fig8b-42.png", width: 120 * u))
  let lab(x, y, body, fill: black) = content(p(x, y), anchor: "center", text(size: 8pt, font: fonts.hei, fill: fill, body))
})
