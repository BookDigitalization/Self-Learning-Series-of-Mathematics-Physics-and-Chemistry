// 图 5·7 薄膜收缩而采取尽可能小的面积（原书 p.162）
// 写实插画沿用原扫描裁剪（fig5-7.png，1110×480），图中无文字。
#import "/common/series.typ": *

#let fig-5-7(width: 8cm) = px-canvas(1110, 480, width: width, (p, u) => {
  import cetz.draw: *
  content(p(0, 0), anchor: "north-west", image("fig5-7.png", width: 1110 * u))
})
