// 图 7·29 液态氧的应用（p.268）
// 写实插画沿用原扫描裁剪（fig7b-29.png，二值化）。
// 坐标是 fig7b-29.png 的像素坐标（555×615，y 向下）。
#import "/common/series.typ": *

#let fig-7-29(width: 6.0cm) = px-canvas(555, 615, width: width, (p, u) => {
  import cetz.draw: *
  content(p(0, 0), anchor: "north-west", image("fig7b-29.png", width: 555 * u))
})
