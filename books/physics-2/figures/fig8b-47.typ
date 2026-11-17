// 图 8·47（原书 p.335）：写实图沿用原扫描裁剪的二值化位图（fig8b-47.png，已涂去标号、文字），标号和文字用真文字补回。
// 坐标为 200 dpi 原书页面像素坐标（左上原点），画布原点在页面 (265, 160)。
#import "/common/series.typ": *

#let fig-8-47(width: 11.0cm) = px-canvas(665, 270, origin: (265, 160), width: width, (p, u) => {
  import cetz.draw: *
  content(p(265, 160), anchor: "north-west", image("fig8b-47.png", width: 665 * u))
  let lab(x, y, body, fill: black) = content(p(x, y), anchor: "center", text(size: 8pt, font: fonts.hei, fill: fill, body))
  lab(501, 173, [燃料])
  lab(564, 221.5, [火花塞])
  lab(315, 311, [空气入口])
  lab(603, 336, [燃烧室])
  lab(897, 317.5, [喷口])
})
