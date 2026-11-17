// 图 7·18 复沸腾现象（p.249）
// 写实插画沿用原扫描裁剪（fig7b-18.png，二值化）。
// 坐标是 fig7b-18.png 的像素坐标（393×658，y 向下）。
#import "/common/series.typ": *

#let fig-7-18(width: 4.6cm) = px-canvas(393, 658, width: width, (p, u) => {
  import cetz.draw: *
  content(p(0, 0), anchor: "north-west", image("fig7b-18.png", width: 393 * u))
})
