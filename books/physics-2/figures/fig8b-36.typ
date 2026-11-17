// 图 8·36（原书 p.323）：写实图沿用原扫描裁剪的二值化位图（fig8b-36.png，已涂去标号、文字），标号和文字用真文字补回。
// 坐标为 200 dpi 原书页面像素坐标（左上原点），画布原点在页面 (585, 155)。
#import "/common/series.typ": *

#let fig-8-36(width: 5.9cm) = px-canvas(355, 355, origin: (585, 155), width: width, (p, u) => {
  import cetz.draw: *
  content(p(585, 155), anchor: "north-west", image("fig8b-36.png", width: 355 * u))
  let lab(x, y, body, fill: black) = content(p(x, y), anchor: "center", text(size: 8pt, font: fonts.hei, fill: fill, body))
  lab(660.5, 243.5, [I])
  lab(867, 198.5, [II])
  lab(662, 484, [$O$])
  lab(863, 448, [$O$])
})
