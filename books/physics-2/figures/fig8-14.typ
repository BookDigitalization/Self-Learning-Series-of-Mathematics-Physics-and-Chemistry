// 图 8·14（原书 p.297）
// 写实/复杂机器图沿用原扫描裁剪的 fig8-14.png（页坐标 205,160–900,500，200 dpi 网格），图中文字、编号已涂去，用 CeTZ 真文字补回。
#import "/common/series.typ": *

#let fig-8-14(width: 10cm) = px-canvas(695, 340, width: width, origin: (205, 160), (p, u) => {
  import cetz.draw: *
  content(p(205, 160), anchor: "north-west", image("fig8-14.png", width: 695 * u))
  let lab(x, y, body) = content(p(x, y), anchor: "center", text(font: fonts.hei, size: 7.5pt, body))
  lab(306, 173, [8])
  lab(352, 228, [3])
  lab(498, 187, [6])
  lab(781, 180, [5])
  lab(740, 309, [4])
  lab(789, 370, [9])
  lab(252, 378, [1])
  lab(367, 417, [2])
  lab(302, 468, [7])
})
