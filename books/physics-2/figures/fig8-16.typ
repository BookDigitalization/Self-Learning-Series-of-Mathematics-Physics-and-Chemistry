// 图 8·16（原书 p.298）
// 写实/复杂机器图沿用原扫描裁剪的 fig8-16.png（页坐标 225,170–520,555，200 dpi 网格），图中文字、编号已涂去，用 CeTZ 真文字补回。
#import "/common/series.typ": *

#let fig-8-16(width: 10cm) = px-canvas(295, 385, width: width, origin: (225, 170), (p, u) => {
  import cetz.draw: *
  content(p(225, 170), anchor: "north-west", image("fig8-16.png", width: 295 * u))
  let lab(x, y, body) = content(p(x, y), anchor: "center", text(font: fonts.hei, size: 7.5pt, body))
  lab(437, 185, [6])
  lab(241, 283, [8])
  lab(488, 273, [3])
  lab(234, 355, [4])
  lab(393, 368, [7])
  lab(493, 357, [5])
  lab(281, 539, [1])
  lab(386, 541, [2])
})
