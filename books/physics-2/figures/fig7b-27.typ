// 图 7·27 冷冻装置（p.266）
// 写实插画沿用原扫描裁剪（fig7b-27.png，二值化，已涂去标注C、T、V、P，用真文字补回）。
// 坐标是 fig7b-27.png 的像素坐标（809×541，y 向下）。
#import "/common/series.typ": *

#let fig-7-27(width: 9.0cm) = px-canvas(809, 541, width: width, (p, u) => {
  import cetz.draw: *
  content(p(0, 0), anchor: "north-west", image("fig7b-27.png", width: 809 * u))
  let lab(x, y, body) = content(p(x, y), anchor: "center", text(size: 34 * u, body))
  lab(397, 33, [$C$])
  lab(578, 185, [$T$])
  lab(373, 288, [$V$])
  lab(737, 311, [$P$])
})
