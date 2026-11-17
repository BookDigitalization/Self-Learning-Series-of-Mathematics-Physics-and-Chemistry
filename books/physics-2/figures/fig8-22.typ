// 图 8·22（原书 p.301）
// 写实/复杂机器图沿用原扫描裁剪的 fig8-22.png（页坐标 215,976–870,1350，200 dpi 网格），图中文字、编号已涂去，用 CeTZ 真文字补回。
#import "/common/series.typ": *

#let fig-8-22(width: 10cm) = px-canvas(655, 374, width: width, origin: (215, 976), (p, u) => {
  import cetz.draw: *
  content(p(215, 976), anchor: "north-west", image("fig8-22.png", width: 655 * u))
  let lab(x, y, body) = content(p(x, y), anchor: "center", text(font: fonts.hei, size: 7.5pt, body))
  lab(462, 990, [废汽])
  lab(612, 1008, [蒸汽])
  lab(828, 1038, [冷却水])
  lab(830, 1059, [出口])
  lab(257, 1242, [冷却水])
  lab(256, 1265, [进口])
  lab(657, 1278, [冷凝水])
  lab(480, 1331, [冷凝水出口])
})
