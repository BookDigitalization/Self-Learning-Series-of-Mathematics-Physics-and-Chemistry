// 图 7·23 法拉第液化氯的实验（p.261）
// 写实插画沿用原扫描裁剪（fig7b-23.png，二值化，已涂去标注A、B，用真文字补回）。
// 坐标是 fig7b-23.png 的像素坐标（670×435，y 向下）。
#import "/common/series.typ": *

#let fig-7-23(width: 7.0cm) = px-canvas(670, 435, width: width, (p, u) => {
  import cetz.draw: *
  content(p(0, 0), anchor: "north-west", image("fig7b-23.png", width: 670 * u))
  let lab(x, y, body) = content(p(x, y), anchor: "center", text(size: 34 * u, body))
  lab(92, 183, [$A$])
  lab(487, 222, [$B$])
})
