// 图 1·3 金箔验电器（原书 p.4）
// 写实插画沿用原扫描裁剪的 fig1-3.png（970×924）；原图中没有文字。
#import "/common/series.typ": *

#let fig-1-3(width: 8cm) = px-canvas(970, 924, width: width, (p, u) => {
  import cetz.draw: *
  content(p(0, 0), anchor: "north-west", image("fig1-3.png", width: 970 * u))
})
