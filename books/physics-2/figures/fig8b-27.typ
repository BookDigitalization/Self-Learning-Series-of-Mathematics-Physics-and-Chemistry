// 图 8·27（原书 p.315）：写实图沿用原扫描裁剪的二值化位图（fig8b-27.png，已涂去标号、文字），标号和文字用真文字补回。
// 坐标为 200 dpi 原书页面像素坐标（左上原点），画布原点在页面 (685, 810)。
#import "/common/series.typ": *

#let fig-8-27(width: 3.5cm) = px-canvas(215, 340, origin: (685, 810), width: width, (p, u) => {
  import cetz.draw: *
  content(p(685, 810), anchor: "north-west", image("fig8b-27.png", width: 215 * u))
  let lab(x, y, body, fill: black) = content(p(x, y), anchor: "center", text(size: 8pt, font: fonts.hei, fill: fill, body))
  lab(855, 888.5, [气阀杆])
  lab(847, 941, [空隙])
  lab(861, 984.5, [推块])
  lab(861, 1019, [凸轮])
  lab(867.5, 1133, [齿轮])
})
