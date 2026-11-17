// 图 8·37（原书 p.324）：写实图沿用原扫描裁剪的二值化位图（fig8b-37.png，已涂去标号、文字），标号和文字用真文字补回。
// 坐标为 200 dpi 原书页面像素坐标（左上原点），画布原点在页面 (270, 735)。
#import "/common/series.typ": *

#let fig-8-37(width: 8.9cm) = px-canvas(540, 570, origin: (270, 735), width: width, (p, u) => {
  import cetz.draw: *
  content(p(270, 735), anchor: "north-west", image("fig8b-37.png", width: 540 * u))
  let lab(x, y, body, fill: black) = content(p(x, y), anchor: "center", text(size: 8pt, font: fonts.hei, fill: fill, body))
})
