// 图 1·1 摩擦起电（原书 p.2）
// 写实插画沿用原扫描裁剪的 fig1-1.png（1339×786）；原图中没有文字。
#import "/common/series.typ": *

#let fig-1-1(width: 8cm) = px-canvas(1339, 786, width: width, (p, u) => {
  import cetz.draw: *
  content(p(0, 0), anchor: "north-west", image("fig1-1.png", width: 1339 * u))
})
