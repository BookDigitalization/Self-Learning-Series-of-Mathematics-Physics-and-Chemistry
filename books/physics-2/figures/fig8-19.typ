// 图 8·19（原书 p.299）
// 写实/复杂机器图沿用原扫描裁剪的 fig8-19.png（页坐标 590,710–940,1330，200 dpi 网格），图中文字、编号已涂去，用 CeTZ 真文字补回。
#import "/common/series.typ": *

#let fig-8-19(width: 10cm) = px-canvas(350, 620, width: width, origin: (590, 710), (p, u) => {
  import cetz.draw: *
  content(p(590, 710), anchor: "north-west", image("fig8-19.png", width: 350 * u))
  let lab(x, y, body) = content(p(x, y), anchor: "center", text(font: fonts.hei, size: 7.5pt, body))
  lab(621, 757, [1])
  lab(718, 783, [2])
  lab(810, 824, [3])
  lab(842, 839, [4])
})
