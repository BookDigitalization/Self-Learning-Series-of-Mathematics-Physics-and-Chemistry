// 图 7·25 临界状态实验装置（p.263）
// 写实插画沿用原扫描裁剪（fig7b-25.png，二值化）。
// 坐标是 fig7b-25.png 的像素坐标（497×673，y 向下）。
#import "/common/series.typ": *

#let fig-7-25(width: 5.4cm) = px-canvas(497, 673, width: width, (p, u) => {
  import cetz.draw: *
  content(p(0, 0), anchor: "north-west", image("fig7b-25.png", width: 497 * u))
})
