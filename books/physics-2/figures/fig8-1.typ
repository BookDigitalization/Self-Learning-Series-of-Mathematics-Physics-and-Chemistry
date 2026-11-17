// 图 8·1（原书 p.285）
// 写实/复杂机器图沿用原扫描裁剪的 fig8-1.png（页坐标 270,980–860,1320，200 dpi 网格），图中文字、编号已涂去，用 CeTZ 真文字补回。
#import "/common/series.typ": *

#let fig-8-1(width: 10cm) = px-canvas(590, 340, width: width, origin: (270, 980), (p, u) => {
  import cetz.draw: *
  content(p(270, 980), anchor: "north-west", image("fig8-1.png", width: 590 * u))
  let lab(x, y, body) = content(p(x, y), anchor: "center", text(font: fonts.hei, size: 7.5pt, body))
  lab(541, 1044, [橡皮管])
  lab(329, 1069, [水])
  lab(742, 1193, [重物])
  lab(810, 1269, [球囊])
})
