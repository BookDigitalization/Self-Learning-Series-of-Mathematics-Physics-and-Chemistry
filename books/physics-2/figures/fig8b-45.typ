// 图 8·45（原书 p.330）：写实图沿用原扫描裁剪的二值化位图（fig8b-45.png，已涂去标号、文字），标号和文字用真文字补回。
// 坐标为 200 dpi 原书页面像素坐标（左上原点），画布原点在页面 (245, 160)。
#import "/common/series.typ": *

#let fig-8-45(width: 9.5cm) = px-canvas(575, 685, origin: (245, 160), width: width, (p, u) => {
  import cetz.draw: *
  content(p(245, 160), anchor: "north-west", image("fig8b-45.png", width: 575 * u))
  let lab(x, y, body, fill: black) = content(p(x, y), anchor: "center", text(size: 8pt, font: fonts.hei, fill: fill, body))
  lab(605, 174, [5])
  lab(625, 180, [6])
  lab(641, 190, [7])
  lab(663, 208, [4])
  lab(696, 215, [8])
  lab(710, 246, [1])
  lab(324, 196, [3])
  lab(286, 224, [2])
  lab(779, 604, [9])
  lab(362, 736, [2])
})
