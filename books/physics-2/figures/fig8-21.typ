// 图 8·21（原书 p.301）
// 写实/复杂机器图沿用原扫描裁剪的 fig8-21.png（页坐标 280,170–790,527，200 dpi 网格），图中文字、编号已涂去，用 CeTZ 真文字补回。
#import "/common/series.typ": *

#let fig-8-21(width: 10cm) = px-canvas(510, 357, width: width, origin: (280, 170), (p, u) => {
  import cetz.draw: *
  content(p(280, 170), anchor: "north-west", image("fig8-21.png", width: 510 * u))
  let lab(x, y, body) = content(p(x, y), anchor: "center", text(font: fonts.hei, size: 7.5pt, body))
  lab(543, 190, [蒸汽])
  lab(315, 314, [冷水])
  lab(749, 316, [空气])
  lab(572, 487, [冷凝水])
})
