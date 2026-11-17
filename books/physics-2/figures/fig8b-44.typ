// 图 8·44（原书 p.329）：写实图沿用原扫描裁剪的二值化位图（fig8b-44.png，已涂去标号、文字），标号和文字用真文字补回。
// 坐标为 200 dpi 原书页面像素坐标（左上原点），画布原点在页面 (680, 595)。
#import "/common/series.typ": *

#let fig-8-44(width: 4.8cm) = px-canvas(290, 300, origin: (680, 595), width: width, (p, u) => {
  import cetz.draw: *
  content(p(680, 595), anchor: "north-west", image("fig8b-44.png", width: 290 * u))
  let lab(x, y, body, fill: black) = content(p(x, y), anchor: "center", text(size: 8pt, font: fonts.hei, fill: fill, body))
  lab(699, 658, [蒸汽\ 入口])
  lab(909.5, 695, [蒸汽对叶片\ 上的压力])
  lab(902.5, 813.5, [蒸汽\ 出口])
})
