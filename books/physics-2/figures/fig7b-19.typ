// 图 7·19 压力锅（p.250）
// 写实插画沿用原扫描裁剪（fig7b-19.png，二值化）。
// 坐标是 fig7b-19.png 的像素坐标（521×640，y 向下）。
#import "/common/series.typ": *

#let fig-7-19(width: 5.4cm) = px-canvas(521, 640, width: width, (p, u) => {
  import cetz.draw: *
  content(p(0, 0), anchor: "north-west", image("fig7b-19.png", width: 521 * u))
})
