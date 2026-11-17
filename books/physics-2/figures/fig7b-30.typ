// 图 7·30 干湿泡湿度计（p.274）
// 写实插画沿用原扫描裁剪（fig7b-30.png，二值化，已涂去标注A、B、C，用真文字补回）。
// 坐标是 fig7b-30.png 的像素坐标（359×820，y 向下）。
#import "/common/series.typ": *

#let fig-7-30(width: 3.6cm) = px-canvas(359, 820, width: width, (p, u) => {
  import cetz.draw: *
  content(p(0, 0), anchor: "north-west", image("fig7b-30.png", width: 359 * u))
  let lab(x, y, body) = content(p(x, y), anchor: "center", text(size: 34 * u, body))
  lab(166, 630, [$A$])
  lab(266, 641, [$B$])
  lab(186, 708, [$C$])
})
