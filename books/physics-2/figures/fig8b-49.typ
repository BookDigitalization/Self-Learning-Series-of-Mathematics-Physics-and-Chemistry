// 图 8·49（原书 p.337）：写实图沿用原扫描裁剪的二值化位图（fig8b-49.png，已涂去标号、文字），标号和文字用真文字补回。
// 坐标为 200 dpi 原书页面像素坐标（左上原点），画布原点在页面 (160, 145)。
#import "/common/series.typ": *

#let fig-8-49(width: 13.0cm) = px-canvas(785, 295, origin: (160, 145), width: width, (p, u) => {
  import cetz.draw: *
  content(p(160, 145), anchor: "north-west", image("fig8b-49.png", width: 785 * u))
  let lab(x, y, body, fill: black) = content(p(x, y), anchor: "center", text(size: 8pt, font: fonts.hei, fill: fill, body))
  lab(303, 187.5, [进气口])
  lab(592, 188.5, [喷雾器])
  lab(704, 197.5, [燃烧室])
  lab(913, 262.5, [喷管])
  lab(781, 386, [燃气轮机])
  lab(342, 416.5, [压气机])
})
