// 图 7·22 图 7·22（p.258）
// 写实插画沿用原扫描裁剪（fig7b-22.png，二值化）。
// 坐标是 fig7b-22.png 的像素坐标（244×596，y 向下）。
#import "/common/series.typ": *

#let fig-7-22(width: 2.6cm) = px-canvas(244, 596, width: width, (p, u) => {
  import cetz.draw: *
  content(p(0, 0), anchor: "north-west", image("fig7b-22.png", width: 244 * u))
})
