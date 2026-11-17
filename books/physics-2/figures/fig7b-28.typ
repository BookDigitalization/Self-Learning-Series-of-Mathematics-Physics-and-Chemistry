// 图 7·28 空气液化装置的示意图（p.267）
// 写实插画沿用原扫描裁剪（fig7b-28.png，二值化，已涂去标注C、P、T、水，用真文字补回）。
// 坐标是 fig7b-28.png 的像素坐标（624×389，y 向下）。
#import "/common/series.typ": *

#let fig-7-28(width: 7.0cm) = px-canvas(624, 389, width: width, (p, u) => {
  import cetz.draw: *
  content(p(0, 0), anchor: "north-west", image("fig7b-28.png", width: 624 * u))
  let lab(x, y, body) = content(p(x, y), anchor: "center", text(size: 34 * u, body))
  lab(108, 180, [$C$])
  lab(390, 163, [$P$])
  lab(597, 170, [$T$])
  lab(167, 339, [水])
})
