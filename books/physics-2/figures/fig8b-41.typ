// 图 8·41（原书 p.328）：写实图沿用原扫描裁剪的二值化位图（fig8b-41.png，已涂去标号、文字），标号和文字用真文字补回。
// 坐标为 200 dpi 原书页面像素坐标（左上原点），画布原点在页面 (670, 670)。
#import "/common/series.typ": *

#let fig-8-41(width: 4.7cm) = px-canvas(285, 245, origin: (670, 670), width: width, (p, u) => {
  import cetz.draw: *
  content(p(670, 670), anchor: "north-west", image("fig8b-41.png", width: 285 * u))
  let lab(x, y, body, fill: black) = content(p(x, y), anchor: "center", text(size: 8pt, font: fonts.hei, fill: fill, body))
  lab(748, 686.5, [高压空间])
  lab(909.5, 810.5, [喷咀 $B$])
  lab(884.5, 878.5, [低压空间])
})
