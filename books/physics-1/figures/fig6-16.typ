// 图 6·16 已知一个分力的大小和方向，求另一个分力的大小和方向（原书 p.182）
// 线条图，按原图用 CeTZ 重绘；坐标取自 200 dpi 页面显示图（宽 1568），内部乘 1.0657 换成真实像素。
// 左：电线杆、水平天线与铁索；右：力的平行四边形 A B C D（A B 向右，A C 向下，A D 向左下）。
#import "/common/series.typ": *

#let fig-6-16(width: 12cm) = px-canvas(730, 300, width: width, origin: (480 * 1.0657, 1560 * 1.0657), (p, u) => {
  import cetz.draw: *
  let q(x, y) = p(x * 1.0657, y * 1.0657)
  let arr(a, b, w: 0.9pt) = line(q(..a), q(..b), stroke: w, mark: (end: "stealth", fill: black, scale: 0.5))
  let dash(a, b) = line(q(..a), q(..b), stroke: (thickness: 0.6pt, dash: "dashed"))
  let lab(x, y, body) = content(q(x, y), anchor: "center", text(size: 8pt, body))
  // 左图
  line(q(490, 1822), q(770, 1822), stroke: 1pt)
  for x in range(0, 14) { line(q(495 + x * 20, 1835), q(510 + x * 20, 1822), stroke: 0.5pt) }
  rect(q(668, 1822), q(678, 1590), stroke: 0.9pt)
  line(q(668, 1597), q(520, 1818), stroke: 1.6pt)
  line(q(678, 1603), q(845, 1605), stroke: 1pt)
  arr((735, 1584), (790, 1584))
  arr((612, 1700), (586, 1740), w: 1.2pt)
  arr((690, 1695), (690, 1765), w: 1.2pt)
  lab(648, 1583, $A$)
  // 右图
  arr((1010, 1657), (1120, 1657), w: 1.1pt)
  arr((1010, 1657), (1010, 1815), w: 1.1pt)
  arr((1010, 1657), (900, 1812), w: 1.1pt)
  dash((1120, 1657), (1010, 1815)); dash((1010, 1812), (900, 1812))
  line(q(1010, 1672), q(1025, 1672), q(1025, 1657), stroke: 0.5pt)
  lab(1013, 1637, $A$); lab(1143, 1645, $B$); lab(1013, 1832, $C$); lab(880, 1828, $D$)
  lab(940, 1795, $theta$)
})
