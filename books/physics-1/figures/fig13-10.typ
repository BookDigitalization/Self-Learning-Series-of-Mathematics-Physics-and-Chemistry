// 图 13·10 平抛物体落地时的速度（原书 p.425）
// 示意图，按原图重绘：O 点水平抛出，h 为塔高，E 为塔底，E1 为落地点，速度 v、v_x、v_y，夹角 β。
// 坐标是页面显示图（宽 1568）上的像素坐标；轨迹取抛物线，位置为目测。
#import "/common/series.typ": *

#let fig-13-10(width: 8.6cm) = px-canvas(600, 500, origin: (610, 590), width: width, (p, u) => {
  import cetz.draw: *
  let arr = (end: "stealth", fill: black, scale: 0.55)
  let lab(x, y, body) = content(p(x, y), anchor: "center", text(size: 9pt, body))
  // 竖线 OE 与地面
  line(p(663, 618), p(665, 947), stroke: 1.6pt)
  line(p(665, 947), p(1185, 947), stroke: 1.6pt, mark: arr)
  // 轨迹
  let tr(x) = 618 + 329 * calc.pow((x - 663) / 405, 2)
  line(..range(0, 42).map(k => { let x = 663 + k * 10; p(x, tr(x)) }), stroke: 1.6pt)
  line(p(663, 618), p(740, 618), stroke: 1.2pt, mark: arr)
  // 落地点速度
  line(p(1068, 947), p(1068, 1070), stroke: 1.2pt, mark: arr)
  line(p(1068, 947), p(1115, 1068), stroke: 1.8pt, mark: arr)
  line(p(1068, 947), p(1118, 947), stroke: 1.2pt, mark: arr)
  lab(663, 600, $O$)
  lab(748, 603, $v_0$)
  lab(682, 778, $h$)
  lab(640, 947, $E$)
  lab(1072, 926, $E_1$)
  lab(1112, 926, $v_x$)
  lab(1078, 1013, $beta$)
  lab(1047, 1067, $v_y$)
  lab(1131, 1068, $v$)
})
