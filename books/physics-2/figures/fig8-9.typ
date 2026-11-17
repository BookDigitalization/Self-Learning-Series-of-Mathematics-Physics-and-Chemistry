// 图 8·9（原书 p.290）
// 写实/复杂机器图沿用原扫描裁剪的 fig8-9.png（页坐标 620,440–910,860，200 dpi 网格），图中文字、编号已涂去，用 CeTZ 真文字补回。
#import "/common/series.typ": *

#let fig-8-9(width: 10cm) = px-canvas(290, 420, width: width, origin: (620, 440), (p, u) => {
  import cetz.draw: *
  content(p(620, 440), anchor: "north-west", image("fig8-9.png", width: 290 * u))
  let lab(x, y, body) = content(p(x, y), anchor: "center", text(font: fonts.hei, size: 7.5pt, body))
  lab(670, 487, [接抽气机])
})
