// 图 8·18（原书 p.298）
// 写实/复杂机器图沿用原扫描裁剪的 fig8-18.png（页坐标 200,1035–960,1305，200 dpi 网格），图中文字、编号已涂去，用 CeTZ 真文字补回。
#import "/common/series.typ": *

#let fig-8-18(width: 10cm) = px-canvas(760, 270, width: width, origin: (200, 1035), (p, u) => {
  import cetz.draw: *
  content(p(200, 1035), anchor: "north-west", image("fig8-18.png", width: 760 * u))
  let lab(x, y, body) = content(p(x, y), anchor: "center", text(font: fonts.hei, size: 7.5pt, body))
  lab(783, 1094, [5])
  lab(642, 1172, [4])
  lab(556, 1182, [3])
  lab(407, 1207, [2])
  lab(310, 1225, [1])
  lab(914, 1175, [6])
})
