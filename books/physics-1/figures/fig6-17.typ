// 图 6·17 拉电灯（原书 p.183）
// 线条图，按原图用 CeTZ 重绘（灯罩画成简化的钟形）；坐标取自 200 dpi 页面显示图（宽 1568），内部乘 1.0657 换成真实像素。
#import "/common/series.typ": *

#let fig-6-17(width: 7cm) = px-canvas(490, 470, width: width, origin: (395 * 1.0657, 1425 * 1.0657), (p, u) => {
  import cetz.draw: *
  let q(x, y) = p(x * 1.0657, y * 1.0657)
  let arr(a, b, w: 0.9pt) = line(q(..a), q(..b), stroke: w, mark: (end: "stealth", fill: black, scale: 0.5))
  let dash(a, b) = line(q(..a), q(..b), stroke: (thickness: 0.6pt, dash: "dashed"))
  let lab(x, y, body) = content(q(x, y), anchor: "center", text(size: 8pt, body))
  let O = (585, 1570)
  let A = (445, 1440)
  let C = (455, 1570)
  let D = (585, 1700)
  let E = (715, 1700)
  // 天花板
  line(q(400, 1440), q(485, 1440), stroke: 1pt)
  for x in range(0, 5) { line(q(405 + x * 18, 1440), q(420 + x * 18, 1425), stroke: 0.5pt) }
  // 墙
  line(q(822, 1520), q(822, 1610), stroke: 1pt)
  for y in range(0, 6) { line(q(822, 1525 + y * 16), q(838, 1510 + y * 16), stroke: 0.5pt) }
  // 电线、水平绳、竖直电线
  line(q(..A), q(..O), stroke: 1.4pt)
  line(q(..O), q(822, 1570), stroke: 1.4pt)
  // 原图：A 点下方有一条竖直虚线（与电线 AO 夹 45°），下端到 C 的高度
  dash((447, 1485), (447, 1595))
  // 灯
  line(q(..D), q(585, 1770), stroke: 0.9pt)
  line(q(520, 1805), q(530, 1790), q(585, 1770), q(640, 1790), q(650, 1805), q(630, 1810), q(610, 1822), q(585, 1815), q(560, 1822), q(540, 1810), close: true, stroke: 0.9pt)
  // 分力
  arr(O, E); arr(O, C); arr(O, D, w: 1.2pt)
  dash(C, D); dash(D, E)
  lab(430, 1455, $A$); lab(598, 1548, $O$); lab(475, 1545, $C$); lab(815, 1555, $B$)
  lab(568, 1722, $D$); lab(703, 1738, $E$)
  lab(545, 1550, $G_2$); lab(665, 1620, $G_1$); lab(570, 1612, $G$)
  lab(472, 1466, text(size: 7pt)[$45°$]); lab(607, 1620, text(size: 7pt)[$45°$])
})
