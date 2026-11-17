// 图 1·9 金属笼实验（原书 p.19）
// 写实插画沿用原扫描裁剪的 fig1-9.png（1386×1016）；原图中没有文字。
#import "/common/series.typ": *

#let fig-1-9(width: 8cm) = px-canvas(1386, 1016, width: width, (p, u) => {
  import cetz.draw: *
  content(p(0, 0), anchor: "north-west", image("fig1-9.png", width: 1386 * u))
})
