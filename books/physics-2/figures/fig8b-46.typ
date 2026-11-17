// 图 8·46（原书 p.332）：写实图沿用原扫描裁剪的二值化位图（fig8b-46.png，已涂去标号、文字），标号和文字用真文字补回。
// 坐标为 200 dpi 原书页面像素坐标（左上原点），画布原点在页面 (250, 160)。
#import "/common/series.typ": *

#let fig-8-46(width: 9.9cm) = px-canvas(600, 345, origin: (250, 160), width: width, (p, u) => {
  import cetz.draw: *
  content(p(250, 160), anchor: "north-west", image("fig8b-46.png", width: 600 * u))
  let lab(x, y, body, fill: black) = content(p(x, y), anchor: "center", text(size: 8pt, font: fonts.hei, fill: fill, body))
  lab(434, 218, [4])
  lab(620, 205, [3])
  lab(720, 209, [2])
  lab(796, 211, [9])
  lab(281, 275, [7])
  lab(581, 258, [6])
  lab(554, 277, [5])
  lab(733, 352, [1])
  lab(261, 386, [8])
})
