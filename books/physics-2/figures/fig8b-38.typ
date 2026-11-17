// 图 8·38（原书 p.325）：写实图沿用原扫描裁剪的二值化位图（fig8b-38.png，已涂去标号、文字），标号和文字用真文字补回。
// 坐标为 200 dpi 原书页面像素坐标（左上原点），画布原点在页面 (230, 160)。
#import "/common/series.typ": *

#let fig-8-38(width: 10.4cm) = px-canvas(630, 280, origin: (230, 160), width: width, (p, u) => {
  import cetz.draw: *
  content(p(230, 160), anchor: "north-west", image("fig8b-38.png", width: 630 * u))
  let lab(x, y, body, fill: black) = content(p(x, y), anchor: "center", text(size: 8pt, font: fonts.hei, fill: fill, body))
  lab(311, 232, [$A$])
  lab(766.5, 201, [套筒])
  lab(369, 382.5, [机轴])
  lab(606, 351, [$C$])
  lab(695, 413, [$D$])
  lab(480, 428, [$B$])
})
