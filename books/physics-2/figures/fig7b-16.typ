// 图 7·16 沸腾过程示意图（p.247）
// 写实插画沿用原扫描裁剪（fig7b-16.png，二值化，已涂去标注（a）（b）（c）（d），用真文字补回）。
// 坐标是 fig7b-16.png 的像素坐标（640×864，y 向下）。
#import "/common/series.typ": *

#let fig-7-16(width: 7.0cm) = px-canvas(640, 864, width: width, (p, u) => {
  import cetz.draw: *
  content(p(0, 0), anchor: "north-west", image("fig7b-16.png", width: 640 * u))
  let lab(x, y, body) = content(p(x, y), anchor: "center", text(size: 36 * u, body))
  lab(155, 300, [($a$)])
  lab(472, 300, [($b$)])
  lab(160, 822, [($c$)])
  lab(462, 822, [($d$)])
})
