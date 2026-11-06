// 图 13·11 斜抛运动（炮弹的轨迹）（原书 p.427）
// 示意图，按原图重绘：坐标轴 Ox、Oy，轨迹 O B A C D，P 点的速度 v 及分速度 v_x、v_y，O 点的初速度 v_0 及分量。
// 坐标是页面显示图（宽 1568）上的像素坐标；轨迹取抛物线，位置为目测。
// 原图里各分速度的下标较模糊：按 v_0x、v_0y、v_x、v_y、v_A = v_0x 录。
#import "/common/series.typ": *

#let fig-13-11(width: 13cm) = px-canvas(1020, 420, origin: (395, 1445), width: width, (p, u) => {
  import cetz.draw: *
  let arr = (end: "stealth", fill: black, scale: 0.5)
  let lab(x, y, body) = content(p(x, y), anchor: "center", text(size: 9pt, body))
  // 坐标轴
  line(p(440, 1797), p(440, 1455), stroke: 1.2pt, mark: arr)
  line(p(440, 1797), p(1410, 1797), stroke: 1.2pt, mark: arr)
  lab(423, 1462, $y$)
  lab(1410, 1782, $x$)
  lab(424, 1808, $O$)
  // 轨迹
  let tr(x) = 1548 + 0.00136 * calc.pow(x - 868, 2)
  line(..range(0, 98).map(k => { let x = 440 + k * 8.9; p(x, tr(x)) }), stroke: 1.2pt)
  // B、C 连线
  line(p(610, 1632), p(1135, 1632), stroke: (thickness: 0.9pt, dash: "dashed"))
  lab(592, 1618, $B$)
  lab(1152, 1618, $C$)
  lab(870, 1528, $A$)
  lab(1297, 1815, $D$)
  // O 点初速度
  line(p(440, 1797), p(515, 1700), stroke: 1.8pt, mark: arr)
  lab(506, 1672, $v_0$)
  line(p(440, 1797), p(510, 1797), stroke: 1.5pt, mark: arr)
  lab(530, 1768, $v_(0 x)$)
  lab(415, 1690, $v_(0 y)$)
  lab(487, 1778, $theta$)
  // P 点
  let px = 727
  let py = tr(px)
  line(p(px, py), p(px, 1860), stroke: (thickness: 0.8pt, dash: "dashed"))
  circle(p(px, py), radius: 3 * u, fill: black, stroke: none)
  lab(705, py - 15, $P$)
  line(p(px, py), p(px, py - 50), stroke: 1.5pt, mark: arr)
  lab(727, py - 62, $v_y$)
  line(p(px, py), p(px + 70, py - 28), stroke: 1.5pt, mark: arr)
  lab(797, py - 45, $v$)
  line(p(px, py), p(px + 70, py + 8), stroke: 1.5pt, mark: arr)
  lab(832, py + 24, $v_x = v_(0 x)$)
  lab(738, 1692, $y$)
  // 最高点速度
  line(p(870, 1548), p(940, 1548), stroke: 1.5pt, mark: arr)
  lab(985, 1520, $v_A = v_(0 x)$)
  // x 的标注
  line(p(727, 1832), p(440, 1832), stroke: 0.8pt, mark: (end: "stealth", fill: black, scale: 0.4))
  line(p(440, 1832), p(727, 1832), stroke: 0.8pt, mark: (end: "stealth", fill: black, scale: 0.4))
  lab(578, 1822, $x$)
})

