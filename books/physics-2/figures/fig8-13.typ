// 图 8·13（原书 p.295）
// 写实/复杂机器图沿用原扫描裁剪的 fig8-13.png（页坐标 185,990–935,1320，200 dpi 网格），图中文字、编号已涂去，用 CeTZ 真文字补回。
#import "/common/series.typ": *

#let fig-8-13(width: 10cm) = px-canvas(750, 330, width: width, origin: (185, 990), (p, u) => {
  import cetz.draw: *
  content(p(185, 990), anchor: "north-west", image("fig8-13.png", width: 750 * u))
  let lab(x, y, body) = content(p(x, y), anchor: "center", text(font: fonts.hei, size: 7.5pt, body))
  lab(572, 1033, [4])
  lab(612, 1042, [5])
  lab(658, 1056, [1])
  lab(681, 1055, [2])
  lab(706, 1063, [3])
  lab(213, 1190, [6])
  lab(199, 1243, [7])
})
