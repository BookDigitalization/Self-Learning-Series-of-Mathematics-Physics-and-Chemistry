// 图 8·40（原书 p.328）：写实图沿用原扫描裁剪的二值化位图（fig8b-40.png，已涂去标号、文字），标号和文字用真文字补回。
// 坐标为 200 dpi 原书页面像素坐标（左上原点），画布原点在页面 (250, 580)。
#import "/common/series.typ": *

#let fig-8-40(width: 5.1cm) = px-canvas(310, 345, origin: (250, 580), width: width, (p, u) => {
  import cetz.draw: *
  content(p(250, 580), anchor: "north-west", image("fig8b-40.png", width: 310 * u))
  let lab(x, y, body, fill: black) = content(p(x, y), anchor: "center", text(size: 8pt, font: fonts.hei, fill: fill, body))
})
