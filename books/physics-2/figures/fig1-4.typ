// 图 1·4 分子间相互作用的模型
// 坐标是 fig1-4.png 的像素坐标（760×140，400 dpi 裁剪）；来源页 原书 p.12。
#import "/common/series.typ": *

#let fig-1-4(width: 5.3cm) = px-canvas(760, 140, width: width, (p, u) => {
  import cetz.draw: *
  content(p(0, 0), anchor: "north-west", image("fig1-4.png", width: 760 * u))

})
