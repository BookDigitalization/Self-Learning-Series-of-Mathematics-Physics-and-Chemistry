// 图 13·25 锥摆（原书 p.447）
// 示意图，按原图重绘：悬点 O′，小球受张力 T、重力 mg，合力 F_n 水平指向圆心 O，锥角 θ，圆周半径 R。
// 坐标是页面显示图（宽 1568）上的像素坐标；位置为目测。
#import "/common/series.typ": *

#let fig-13-25(width: 6.2cm) = px-canvas(420, 560, origin: (965, 520), width: width, (p, u) => {
  import cetz.draw: *
  let arr = (end: "stealth", fill: black, scale: 0.55)
  let lab(x, y, body) = content(p(x, y), anchor: "center", text(size: 9pt, body))
  let dsh = (thickness: 0.8pt, dash: "dashed")
  let top = (1192, 545)
  let bob = (1000, 857)
  // 圆周（虚线椭圆）
  circle(p(1190, 860), radius: (190 * u, 70 * u), stroke: dsh)
  line(p(..top), p(1190, 848), stroke: dsh)
  line(p(..top), p(..bob), stroke: 1pt)
  line(p(..bob), p(1085, 705), stroke: 1.8pt, mark: arr)
  line(p(1085, 705), p(1085, 857), stroke: dsh)
  line(p(..bob), p(1085, 857), stroke: 1.8pt, mark: arr)
  line(p(1085, 857), p(995, 1025), stroke: dsh)
  line(p(..bob), p(995, 1025), stroke: 1.8pt, mark: arr)
  line(p(1190, 848), p(1310, 900), stroke: 1.2pt, mark: arr)
  circle(p(..bob), radius: 8 * u, fill: black)
  lab(1213, 537, $O'$)
  lab(1075, 685, $T$)
  lab(1105, 860, $F_n$)
  lab(990, 1032, $m g$)
  lab(1205, 842, $O$)
  lab(1250, 868, $R$)
  lab(1165, 612, $theta$)
  lab(1015, 945, $theta$)
})
