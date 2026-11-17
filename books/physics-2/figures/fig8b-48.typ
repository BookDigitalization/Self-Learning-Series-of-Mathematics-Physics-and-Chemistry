// 图 8·48（原书 p.336）：写实图沿用原扫描裁剪的二值化位图（fig8b-48.png，已涂去标号、文字），标号和文字用真文字补回。
// 坐标为 200 dpi 原书页面像素坐标（左上原点），画布原点在页面 (110, 155)。
#import "/common/series.typ": *

#let fig-8-48(width: 13.3cm) = px-canvas(805, 230, origin: (110, 155), width: width, (p, u) => {
  import cetz.draw: *
  content(p(110, 155), anchor: "north-west", image("fig8b-48.png", width: 805 * u))
  let lab(x, y, body, fill: black) = content(p(x, y), anchor: "center", text(size: 8pt, font: fonts.hei, fill: fill, body))
  lab(506.5, 172.5, [火花塞])
  lab(592, 220.5, [燃烧室])
  lab(141, 259, [空气\ 入口])
  lab(889, 270, [喷管])
  lab(518.5, 313.5, [喷雾器])
  lab(349.5, 359.5, [压气机])
  lab(690.5, 356, [气轮])
})
