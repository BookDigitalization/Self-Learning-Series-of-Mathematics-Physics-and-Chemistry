// 图 8·43（原书 p.329）：写实图沿用原扫描裁剪的二值化位图（fig8b-43.png，已涂去标号、文字），标号和文字用真文字补回。
// 坐标为 200 dpi 原书页面像素坐标（左上原点），画布原点在页面 (360, 475)。
#import "/common/series.typ": *

#let fig-8-43(width: 5.0cm) = px-canvas(300, 430, origin: (360, 475), width: width, (p, u) => {
  import cetz.draw: *
  content(p(360, 475), anchor: "north-west", image("fig8b-43.png", width: 300 * u))
  let lab(x, y, body, fill: black) = content(p(x, y), anchor: "center", text(size: 8pt, font: fonts.hei, fill: fill, body))
  lab(508, 484, [8])
  lab(590, 511, [5])
  lab(386, 578, [4])
  lab(402, 628, [2])
  lab(643, 649, [1])
  lab(444, 873, [6])
})
