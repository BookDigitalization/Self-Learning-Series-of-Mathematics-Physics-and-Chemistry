// 图 9·7（原书 p.243）图 9·3 三种平衡的封闭三角形。坐标取自页面显示图，原点 (360,1630)。
#import "/common/series.typ": *

#let fig-9-7(width: 7.5cm) = px-canvas(620, 240, origin: (360, 1630), width: width, (p, u) => {
  import cetz.draw: *
  let arrow(a, b) = line(p(..a), p(..b), stroke: 1.3pt, mark: (end: "stealth", fill: black, scale: 0.5))
  let lab(x, y, body) = content(p(x, y), anchor: "center", text(size: 9pt, body))
  // 左（球）
  arrow((403, 1668), (405, 1792))
  arrow((405, 1792), (507, 1792))
  arrow((507, 1792), (403, 1668))
  lab(385, 1735, $G$); lab(475, 1712, $T$); lab(450, 1812, $N$)
  // 中（电灯）
  arrow((655, 1660), (658, 1820))
  arrow((658, 1820), (737, 1790))
  arrow((737, 1790), (655, 1660))
  lab(640, 1755, $G$); lab(710, 1812, $T_2$); lab(722, 1700, $T_1$)
  // 右（梯子）
  arrow((846, 1650), (848, 1823))
  arrow((848, 1823), (935, 1825))
  arrow((935, 1825), (846, 1650))
  lab(827, 1745, $G$); lab(888, 1845, $N$); lab(913, 1722, $F$)
})
