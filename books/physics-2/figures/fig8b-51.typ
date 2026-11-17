// 图 8·51（原书 p.338）：写实图沿用原扫描裁剪的二值化位图（fig8b-51.png，已涂去标号、文字），标号和文字用真文字补回。
// 坐标为 200 dpi 原书页面像素坐标（左上原点），画布原点在页面 (270, 920)。
#import "/common/series.typ": *

#let fig-8-51(width: 9.6cm) = px-canvas(580, 395, origin: (270, 920), width: width, (p, u) => {
  import cetz.draw: *
  content(p(270, 920), anchor: "north-west", image("fig8b-51.png", width: 580 * u))
  let lab(x, y, body, fill: black) = content(p(x, y), anchor: "center", text(size: 8pt, font: fonts.hei, fill: fill, body))
  lab(744, 935.5, [燃烧室])
  lab(301.5, 998.5, [载重])
  lab(451.5, 981.5, [氧化剂箱])
  lab(568.5, 981.5, [燃料箱])
  lab(576.5, 1078.5, [输送燃料装置])
  lab(415, 1130.5, [液体燃料])
  lab(492.5, 1214, [输送泵])
  lab(590, 1247.5, [燃烧室])
  lab(667.5, 1245.5, [喷管])
  lab(417.5, 1302, [氧化剂])
})
