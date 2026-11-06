// 图 13·32 向心力与离心力（原书 p.456）
// 示意图，按原图重绘：左，圆周上 A 点受向心力 F_n（指向圆心 O）；右，离心力作用在绳子上（背离圆心）。
// 右图力的符号在扫描里较模糊，按正文“离心力 F_c”录。坐标是页面显示图（宽 1568）上的像素坐标；位置为目测。
#import "/common/series.typ": *

#let fig-13-32(width: 12cm) = px-canvas(600, 340, origin: (340, 805), width: width, (p, u) => {
  import cetz.draw: *
  let arr = (end: "stealth", fill: black, scale: 0.55)
  let lab(x, y, body) = content(p(x, y), anchor: "center", text(size: 9pt, body))
  let dsh = (thickness: 0.9pt, dash: "dashed")
  // 左
  catmull(p(415, 822), p(490, 855), p(555, 895), p(610, 960), p(640, 1075), stroke: 1.2pt)
  line(p(370, 1085), p(555, 895), stroke: dsh)
  line(p(555, 895), p(515, 937), stroke: 1.6pt, mark: arr)
  circle(p(555, 895), radius: 3 * u, fill: black, stroke: none)
  lab(360, 1115, $O$)
  lab(570, 878, $A$)
  lab(522, 965, $F_n$)
  // 右
  line(p(715, 1090), p(868, 915), stroke: dsh)
  line(p(868, 915), p(895, 872), stroke: 1.6pt, mark: arr)
  lab(708, 1108, $O$)
  lab(865, 935, $F_c$)
})
