// 图 8·31（原书 p.319）：写实图沿用原扫描裁剪的二值化位图（fig8b-31.png，已涂去标号、文字），标号和文字用真文字补回。
// 坐标为 200 dpi 原书页面像素坐标（左上原点），画布原点在页面 (575, 470)。
#import "/common/series.typ": *

#let fig-8-31(width: 6.2cm) = px-canvas(375, 420, origin: (575, 470), width: width, (p, u) => {
  import cetz.draw: *
  content(p(575, 470), anchor: "north-west", image("fig8b-31.png", width: 375 * u))
  let lab(x, y, body, fill: black) = content(p(x, y), anchor: "center", text(size: 8pt, font: fonts.hei, fill: fill, body))
  lab(656.5, 493.5, [汽油])
  lab(741.5, 873.5, [空气])
  lab(813, 516, [4])
  lab(930, 607, [5])
  lab(727, 589, [7])
  lab(648, 662, [2])
  lab(748, 650, [3])
  lab(764, 768, [6])
  lab(612, 690, [1])
})
