// 图 8·15（原书 p.297）
// 写实/复杂机器图沿用原扫描裁剪的 fig8-15.png（页坐标 620,940–920,1315，200 dpi 网格），图中文字、编号已涂去，用 CeTZ 真文字补回。
#import "/common/series.typ": *

#let fig-8-15(width: 10cm) = px-canvas(300, 375, width: width, origin: (620, 940), (p, u) => {
  import cetz.draw: *
  content(p(620, 940), anchor: "north-west", image("fig8-15.png", width: 300 * u))
  let lab(x, y, body) = content(p(x, y), anchor: "center", text(font: fonts.hei, size: 7.5pt, body))
  lab(732, 953, [6])
  lab(886, 1026, [3])
  lab(638, 1051, [8])
  lab(636, 1110, [4])
  lab(879, 1113, [5])
  lab(786, 1124, [7])
  lab(688, 1297, [1])
  lab(744, 1298, [2])
})
