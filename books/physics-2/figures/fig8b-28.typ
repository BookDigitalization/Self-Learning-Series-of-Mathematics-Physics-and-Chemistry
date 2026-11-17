// 图 8·28（原书 p.316）：写实图沿用原扫描裁剪的二值化位图（fig8b-28.png，已涂去标号、文字），标号和文字用真文字补回。
// 坐标为 200 dpi 原书页面像素坐标（左上原点），画布原点在页面 (140, 355)。
#import "/common/series.typ": *

#let fig-8-28(width: 12.8cm) = px-canvas(775, 335, origin: (140, 355), width: width, (p, u) => {
  import cetz.draw: *
  content(p(140, 355), anchor: "north-west", image("fig8b-28.png", width: 775 * u))
  let lab(x, y, body, fill: black) = content(p(x, y), anchor: "center", text(size: 8pt, font: fonts.hei, fill: fill, body))
  lab(228, 666, [$(a)$])
  lab(432, 666, [$(b)$])
  lab(636, 666, [$(c)$])
  lab(828, 666, [$(d)$])
})
