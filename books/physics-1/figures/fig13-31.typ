// 图 13·31 小球在竖直圆槽内运动的受力图（原书 p.452）
// 示意图，按原图重绘：圆槽（心 O，半径 R），最高点 C、右端 B、最低点 E、一般位置 A（半径 OA 与水平线夹角 α）；
// A 处受重力 G = mg、分力 G_2、正压力 N，速度 v；E 处水平速度 v_0。
// 坐标是页面显示图（宽 1568）上的像素坐标；位置为目测。
#import "/common/series.typ": *

#let fig-13-31(width: 7.2cm) = px-canvas(470, 480, origin: (910, 610), width: width, (p, u) => {
  import cetz.draw: *
  let arr = (end: "stealth", fill: black, scale: 0.5)
  let lab(x, y, body) = content(p(x, y), anchor: "center", text(size: 9pt, body))
  let dsh = (thickness: 0.8pt, dash: "dashed")
  let (ox, oy, r) = (1130, 845, 205)
  circle(p(ox, oy), radius: r * u, stroke: 1.6pt)
  line(p(ox, oy - r), p(ox, oy + r), stroke: dsh)
  line(p(ox, oy), p(ox + r, oy), stroke: dsh)
  let ax = ox + r * calc.cos(35deg)
  let ay = oy - r * calc.sin(35deg)
  line(p(ox, oy), p(ax, ay), stroke: 1.2pt)
  for (x, y) in ((ox, oy - r), (ox + r, oy), (ox, oy + r), (ax, ay)) {
    circle(p(x, y), radius: 9 * u, fill: white, stroke: 1pt)
  }
  // A 处的力
  line(p(ax, ay), p(ax - 2, ay + 165), stroke: 1.8pt, mark: arr)
  line(p(ax, ay), p(ax - 70, ay + 50), stroke: 1.4pt, mark: arr)
  line(p(ax, ay), p(ax - 40, ay + 28), stroke: 1.4pt, mark: arr)
  line(p(ax, ay), p(1237, 660), stroke: 1.4pt, mark: arr)
  // E 处速度
  line(p(ox, oy + r), p(1280, 1042), stroke: 1.4pt, mark: arr)
  lab(1128, 625, $C$)
  lab(1352, 838, $B$)
  lab(1133, 1075, $E$)
  lab(ax + 25, ay - 25, $A$)
  lab(1115, 845, $O$)
  lab(1110, 740, $R$)
  lab(1112, 925, $R$)
  lab(1177, 765, $G_2$)
  lab(1228, 730, $N$)
  lab(1228, 640, $v$)
  lab(1182, 826, $alpha$)
  lab(1250, 810, $alpha$)
  lab(1262, 905, $G = m g$)
  lab(1290, 1042, $v_0$)
})
