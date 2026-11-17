// 图 8·7（原书 p.289）
// 写实/复杂机器图沿用原扫描裁剪的 fig8-7.png（页坐标 610,565–860,985，200 dpi 网格），图中文字、编号已涂去，用 CeTZ 真文字补回。
#import "/common/series.typ": *

#let fig-8-7(width: 10cm) = px-canvas(250, 420, width: width, origin: (610, 565), (p, u) => {
  import cetz.draw: *
  content(p(610, 565), anchor: "north-west", image("fig8-7.png", width: 250 * u))
  let lab(x, y, body) = content(p(x, y), anchor: "center", text(font: fonts.hei, size: 7.5pt, body))

})
