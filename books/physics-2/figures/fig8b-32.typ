// 图 8·32（原书 p.320）：写实图沿用原扫描裁剪的二值化位图（fig8b-32.png，已涂去标号、文字），标号和文字用真文字补回。
// 坐标为 200 dpi 原书页面像素坐标（左上原点），画布原点在页面 (270, 150)。
#import "/common/series.typ": *

#let fig-8-32(width: 9.3cm) = px-canvas(565, 455, origin: (270, 150), width: width, (p, u) => {
  import cetz.draw: *
  content(p(270, 150), anchor: "north-west", image("fig8b-32.png", width: 565 * u))
  let lab(x, y, body, fill: black) = content(p(x, y), anchor: "center", text(size: 8pt, font: fonts.hei, fill: fill, body))
  lab(418, 185, [4])
  lab(507, 340, [2])
  lab(296, 390, [3])
  lab(334, 567, [1])
  lab(630, 354, [火花塞])
})
