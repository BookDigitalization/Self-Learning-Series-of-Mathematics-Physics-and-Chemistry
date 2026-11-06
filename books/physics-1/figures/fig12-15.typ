// 图 12·15 爆竹与火箭的反冲（原书 p.403）
// 写实插画：保留原扫描裁剪的二值化 PNG（fig12-15.png，已涂去 M、Mv′、mv 字样），文字用 CeTZ 补回。
// 坐标是裁剪图的像素坐标（宽 1834、高 737）。
#import "/common/series.typ": *

#let fig-12-15(width: 13cm) = px-canvas(1834, 737, width: width, (p, u) => {
  import cetz.draw: *
  content(p(0, 0), anchor: "north-west", image("fig12-15.png", width: 1834 * u))
  let txt(x, y, body) = content(p(x, y), anchor: "center", text(size: 8pt, body))
  // 爆竹
  txt(540, 115, $M v'$)
  txt(555, 368, $M$)
  txt(430, 680, $m v$)
  // 火箭（竖直）
  txt(1108, 43, $M v'$)
  txt(1091, 369, $M$)
  txt(1076, 682, $m v$)
  // 火箭（水平）
  txt(1488, 324, $M$)
  txt(1300, 430, $m v$)
  txt(1739, 384, $M v'$)
})
