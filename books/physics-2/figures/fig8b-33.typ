// 图 8·33（原书 p.320）：写实图沿用原扫描裁剪的二值化位图（fig8b-33.png，已涂去标号、文字），标号和文字用真文字补回。
// 坐标为 200 dpi 原书页面像素坐标（左上原点），画布原点在页面 (290, 790)。
#import "/common/series.typ": *

#let fig-8-33(width: 8.4cm) = px-canvas(510, 455, origin: (290, 790), width: width, (p, u) => {
  import cetz.draw: *
  content(p(290, 790), anchor: "north-west", image("fig8b-33.png", width: 510 * u))
  let lab(x, y, body, fill: black) = content(p(x, y), anchor: "center", text(size: 8pt, font: fonts.hei, fill: fill, body))
  lab(477, 886, [3])
  lab(301, 951, [2])
  lab(668, 946, [4])
  lab(443, 1195, [1])
})
