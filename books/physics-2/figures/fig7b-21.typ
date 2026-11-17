// 图 7·21 测定水的汽化热的装置（p.256）
// 写实插画沿用原扫描裁剪（fig7b-21.png，二值化，已涂去标注1、2、3，用真文字补回）。
// 坐标是 fig7b-21.png 的像素坐标（832×832，y 向下）。
#import "/common/series.typ": *

#let fig-7-21(width: 8.5cm) = px-canvas(832, 832, width: width, (p, u) => {
  import cetz.draw: *
  content(p(0, 0), anchor: "north-west", image("fig7b-21.png", width: 832 * u))
  let lab(x, y, body) = content(p(x, y), anchor: "center", text(size: 34 * u, body))
  lab(118, 288, [1])
  lab(379, 229, [2])
  lab(513, 463, [3])
})
