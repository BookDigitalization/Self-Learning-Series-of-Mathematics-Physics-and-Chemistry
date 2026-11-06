// 图 14·4（原书 p.483）重力加速度随高度变化：地球、半径 R₀、地面上方 h 处的点 P。
// 线条图，按原图重绘。坐标取 200 dpi 页面图的“显示图”像素（宽 1568）。
#import "/common/series.typ": *

#let fig-14-4(width: 5cm) = px-canvas(360, 520, origin: (1010, 390), width: width, (p, u) => {
  import cetz.draw: *
  let lab(x, y, body) = content(p(x, y), anchor: "center", text(size: 9.5pt, body))
  let O = (1187, 708)
  circle(p(..O), radius: 168, stroke: 1.1pt)
  // 竖直线 O 到 P
  line(p(..O), p(1187, 435), stroke: 0.9pt)
  // R₀
  line(p(..O), p(1340, 775), stroke: 1.2pt, mark: (end: "stealth", fill: black, scale: 0.5))
  // g_h、g₀ 箭头（向下）
  line(p(1197, 432), p(1197, 470), stroke: 0.9pt, mark: (end: "stealth", fill: black, scale: 0.4))
  line(p(1197, 540), p(1197, 565), stroke: 0.9pt, mark: (end: "stealth", fill: black, scale: 0.4))
  // h 的标注线
  line(p(1175, 435), p(1175, 540), stroke: 0.7pt, mark: (start: "stealth", end: "stealth", fill: black, scale: 0.35))
  lab(1185, 410, $P$)
  lab(1220, 437, $g_h$)
  lab(1158, 488, $h$)
  lab(1216, 518, $g_0$)
  lab(1170, 713, $O$)
  lab(1243, 762, $R_0$)
})
