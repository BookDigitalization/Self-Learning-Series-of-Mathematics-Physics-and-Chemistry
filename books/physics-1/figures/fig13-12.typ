// 图 13·12 离地面 y_0 高处斜抛（原书 p.428）
// 示意图，按原图重绘：抛出点 O′，坐标原点 O 在地面，水平射程 x，P 点的速度，最高点 A 的速度 v_A = v_0 cos θ。
// 坐标是页面显示图（宽 1568）上的像素坐标；轨迹为过原图几个点的光滑曲线，位置为目测。
#import "/common/series.typ": *

#let fig-13-12(width: 11cm) = px-canvas(780, 470, origin: (470, 1405), width: width, (p, u) => {
  import cetz.draw: *
  let arr = (end: "stealth", fill: black, scale: 0.5)
  let lab(x, y, body) = content(p(x, y), anchor: "center", text(size: 9pt, body))
  let dsh = (thickness: 0.8pt, dash: "dashed")
  // 坐标轴
  line(p(512, 1522), p(512, 1420), stroke: 1.2pt, mark: arr)
  line(p(512, 1812), p(1215, 1812), stroke: (thickness: 0.8pt, dash: "dash-dotted"), mark: arr)
  line(p(512, 1522), p(1115, 1522), stroke: dsh, mark: arr)
  line(p(512, 1522), p(512, 1845), stroke: dsh)
  line(p(935, 1522), p(935, 1845), stroke: dsh)
  lab(503, 1418, $y$)
  lab(1112, 1510, $x$)
  lab(1222, 1806, $x$)
  lab(492, 1522, $O'$)
  lab(492, 1835, $O$)
  // 轨迹
  catmull(p(512, 1522), p(600, 1468), p(735, 1445), p(850, 1470), p(935, 1522), p(1000, 1580), p(1060, 1690), p(1090, 1770), p(1108, 1805),
    tension: 0.5, stroke: 1.2pt)
  // O′ 的初速度
  line(p(512, 1522), p(600, 1462), stroke: 1.8pt, mark: arr)
  lab(597, 1440, $v_0$)
  lab(558, 1508, $theta$)
  // 最高点速度
  line(p(735, 1445), p(815, 1445), stroke: 1.5pt, mark: arr)
  lab(735, 1428, $A$)
  lab(890, 1420, $v_A = v_0 cos theta$)
  lab(940, 1500, $P$)
  // P 点速度
  line(p(935, 1522), p(1022, 1585), stroke: 1.8pt, mark: arr)
  // y_0
  line(p(583, 1522), p(583, 1812), stroke: 0.8pt, mark: (start: "stealth", end: "stealth", fill: black, scale: 0.4))
  lab(597, 1660, $y_0$)
  // y
  line(p(935, 1812), p(935, 1528), stroke: 1.4pt, mark: arr)
  lab(947, 1680, $y$)
  // x
  line(p(512, 1840), p(935, 1840), stroke: 0.8pt, mark: (start: "stealth", end: "stealth", fill: black, scale: 0.4))
  lab(720, 1830, $x$)
})
