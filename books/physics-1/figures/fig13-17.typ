// 图 13·17 例 7 的轨迹（原书 p.435）
// 示意图，按原图重绘：抛物线，y = 4.2 米的两个位置 1、2，对称轴 MN 过最高点 C，射程 x_m = 34.65 米。
// 坐标是页面显示图（宽 1568）上的像素坐标；原图不按比例，位置为目测。
// 原图两处速度标作“17.72”（正文算得 17.78），照扫描录作 17.72，见待核对记录。
#import "/common/series.typ": *

#let fig-13-17(width: 13cm) = px-canvas(1000, 400, origin: (380, 1480), width: width, (p, u) => {
  import cetz.draw: *
  let arr = (end: "stealth", fill: black, scale: 0.5)
  let lab(x, y, body) = content(p(x, y), anchor: "center", text(size: 9pt, body))
  let dsh = (thickness: 0.8pt, dash: "dashed")
  let (ox, oy, xm, h) = (467, 1783, 1162, 143)
  let L = xm - ox
  let par(x) = oy - 4 * h * (x - ox) * (xm - x) / (L * L)
  line(p(ox, oy), p(ox, 1550), stroke: 1.4pt, mark: arr)
  line(p(ox, oy), p(1355, oy), stroke: 1.2pt, mark: arr)
  lab(502, 1560, [$y$（米）])
  lab(1375, 1785, [$x$（米）])
  lab(452, 1800, $O$)
  line(..range(0, 62).map(k => { let x = ox + k * L / 61; p(x, par(x)) }), stroke: 1.5pt)
  // y = 4.2
  line(p(ox, 1668), p(1130, 1668), stroke: dsh)
  lab(420, 1670, $y = 4.2$)
  // 对称轴 MN
  line(p(820, 1495), p(820, 1865), stroke: (thickness: 1.2pt, dash: "dashed"))
  lab(838, 1495, $M$)
  lab(836, 1855, $N$)
  lab(800, 1805, $B$)
  lab(870, 1770, [17.325])
  lab(832, 1633, $C$)
  // 点 1、2
  for x in (675, 975) {
    line(p(x, 1668), p(x, oy), stroke: dsh)
    circle(p(x, 1668), radius: 3 * u, fill: black, stroke: none)
  }
  lab(675, 1625, [1])
  lab(978, 1620, [2])
  lab(673, 1825, $x_1 = 10.4$)
  lab(985, 1825, $x_2 = 24.25$)
  lab(1185, 1822, $x_m = 34.65$)
  // 速度
  line(p(ox, oy), p(585, 1695), stroke: 1.6pt, mark: arr)
  lab(555, 1672, $v_0 = 20$)
  lab(532, 1768, $theta$)
  line(p(675, 1668), p(790, 1622), stroke: 1.6pt, mark: arr)
  lab(790, 1585, $v_1 = 17.72$)
  lab(762, 1650, $alpha_1$)
  line(p(975, 1668), p(1120, 1722), stroke: 1.6pt, mark: arr)
  lab(1188, 1713, $v_2 = 17.72$)
  lab(1052, 1680, $alpha_2$)
})
