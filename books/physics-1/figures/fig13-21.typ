// 图 13·21 一弧度的圆心角（原书 p.439）
// 示意图，按原图重绘：圆，半径 OA = R，弧 AB 等于半径，圆心角为 1 弧度。
// 坐标是页面显示图（宽 1568）上的像素坐标；位置为目测。
#import "/common/series.typ": *

#let fig-13-21(width: 5.6cm) = px-canvas(390, 380, origin: (375, 940), width: width, (p, u) => {
  import cetz.draw: *
  let lab(x, y, body) = content(p(x, y), anchor: "center", text(size: 9pt, body))
  let (cx, cy, r) = (555, 1122, 168)
  circle(p(cx, cy), radius: r * u, stroke: 1.8pt)
  line(p(cx, cy), p(cx + r, cy), stroke: 1.4pt)
  line(p(cx, cy), p(cx + r * calc.cos(57.3deg), cy - r * calc.sin(57.3deg)), stroke: 1.4pt)
  arc(p(cx + 40, cy), start: 0deg, stop: 57.3deg, radius: 40 * u, stroke: 0.8pt)
  lab(540, 1137, $O$)
  lab(742, 1122, $A$)
  lab(657, 960, $B$)
  lab(635, 1145, $R$)
  lab(632, 1090, text(font: fonts.hei, size: 8pt, [1 弧度]))
})
