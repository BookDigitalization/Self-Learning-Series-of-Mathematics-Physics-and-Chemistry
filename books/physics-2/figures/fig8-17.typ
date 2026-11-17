// 图 8·17（原书 p.298）
// 写实/复杂机器图沿用原扫描裁剪的 fig8-17.png（页坐标 610,140–935,560，200 dpi 网格），图中文字、编号已涂去，用 CeTZ 真文字补回。
#import "/common/series.typ": *

#let fig-8-17(width: 10cm) = px-canvas(325, 420, width: width, origin: (610, 140), (p, u) => {
  import cetz.draw: *
  content(p(610, 140), anchor: "north-west", image("fig8-17.png", width: 325 * u))
  let lab(x, y, body) = content(p(x, y), anchor: "center", text(font: fonts.hei, size: 7.5pt, body))

})
