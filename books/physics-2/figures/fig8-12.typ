// 图 8·12（原书 p.293）
// 写实/复杂机器图沿用原扫描裁剪的 fig8-12.png（页坐标 190,780–980,1315，200 dpi 网格），图中文字、编号已涂去，用 CeTZ 真文字补回。
#import "/common/series.typ": *

#let fig-8-12(width: 10cm) = px-canvas(790, 535, width: width, origin: (190, 780), (p, u) => {
  import cetz.draw: *
  content(p(190, 780), anchor: "north-west", image("fig8-12.png", width: 790 * u))
  let lab(x, y, body) = content(p(x, y), anchor: "center", text(font: fonts.hei, size: 7.5pt, body))
  lab(513, 800, [11])
  lab(212, 856, [12])
  lab(560, 895, [10])
  lab(194, 1010, [9])
  lab(588, 1014, [5])
  lab(757, 1011, [6])
  lab(203, 1047, [3])
  lab(729, 1080, [4])
  lab(268, 1118, [2])
  lab(860, 1096, [13])
  lab(332, 1229, [1])
  lab(520, 1236, [7,8])
})
