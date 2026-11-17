// 图 6·41 再生式晶体管收音机；来源 原书 p.339，坐标取自 200 dpi 页面像素（1671×2500）。
// 元件符号见 fig6b-parts.typ。耳机旁的电容 C 的下标在扫描里模糊（只剩小黑点，按电路电容编号顺序 C₀C₁C₂C₃ 判为 4）。
#import "/common/series.typ": *
#import "fig6b-parts.typ": *

#let fig-6-41(width: 11.8cm) = px-canvas(900, 600, origin: (400, 1300), width: width, (p, u) => {
  import cetz.draw: *
  let lab(x, y, body, size: 9.5pt) = content(p(x, y), anchor: "center", text(size: size, body))
  // 天线、C1
  antenna(p, 527, 1338, hw: 35, h: 35)
  wire(p, (527, 1373), (527, 1405)); cap-v(p, 527, 1415, len: 46, gap: 12, st: 2.4pt); wire(p, (527, 1421), (527, 1472))
  lab(567, 1415, $C_1$)
  // 上方干线
  wire(p, (483, 1472), (655, 1472))
  node(p, 527, 1472); node(p, 577, 1472)
  cap(p, 669, 1472, len: 36, gap: 18, var: true); lab(664, 1432, $C_3$)
  wire(p, (678, 1472), (755, 1472))
  resistor(p, 755, 1473, w: 90, h: 29)
  wire(p, (845, 1473), (1042, 1473))
  node(p, 965, 1473)
  lab(819, 1417, $R_2$)
  wire(p, (800, 1459), (800, 1432), (965, 1432), (965, 1473))
  line(p(800, 1432), p(800, 1459), stroke: lw, mark: (end: "stealth", fill: black, scale: 0.5))
  // 高扼圈
  coil-h(p, 1042, 1480, 4, r: 12)
  for x in (1048, 1066, 1084, 1102, 1120) { line(p(x, 1442), p(x, 1448), stroke: 0.9pt) }
  wire(p, (1090, 1448), (1090, 1448))
  line(p(1044, 1441), p(1128, 1441), stroke: 0.6pt); line(p(1044, 1448), p(1128, 1448), stroke: 0.6pt)
  wire(p, (1138, 1473), (1200, 1473), (1200, 1566))
  lab(1081, 1413, [高扼圈])
  // 耳机与旁路电容
  node(p, 1200, 1521)
  circle(p(1200, 1578), radius: 12, stroke: lw); circle(p(1200, 1648), radius: 12, stroke: lw)
  bezier(p(1200, 1590), p(1200, 1636), p(1222, 1600), p(1222, 1626), stroke: 1.6pt)
  wire(p, (1200, 1660), (1200, 1799))
  node(p, 1200, 1695); node(p, 1200, 1730)
  wire(p, (1200, 1521), (1115, 1521), (1115, 1588))
  cap-v(p, 1115, 1605, len: 56, gap: 22, st: 2.4pt)
  wire(p, (1115, 1617), (1115, 1695), (1200, 1695))
  // TODO 图 6·41（p.339）耳机旁电容 C 的下标在扫描里只剩一个带尾的小黑点，辨不出数字；电路里已有 C₀–C₃，按序暂作 4，待定
  lab(1073, 1617, $C_#unclear[4]$)
  // 晶体三极管 T
  circle(p(908, 1555), radius: 66, stroke: 3pt)
  line(p(904, 1531), p(904, 1594), stroke: 3.2pt)
  line(p(842, 1559), p(904, 1559), stroke: 1.4pt)
  line(p(904, 1547), p(962, 1520), stroke: 1.3pt)
  line(p(904, 1578), p(952, 1601), stroke: 1.3pt, mark: (end: "stealth", fill: black, scale: 0.7))
  wire(p, (965, 1473), (965, 1520)); wire(p, (952, 1601), (965, 1612), (965, 1802))
  lab(981, 1513, $c$); lab(975, 1613, $e$); lab(828, 1540, $b$); lab(1000, 1563, $T$, size: 10.5pt)
  node(p, 965, 1667); node(p, 965, 1802)
  // 晶体二极管（负极向左）
  line(p(748, 1550), p(727, 1559), p(748, 1568), close: true, fill: black, stroke: none)
  line(p(727, 1548), p(727, 1570), stroke: 2pt)
  wire(p, (748, 1559), (842, 1559))
  lab(712, 1546, [#sym.minus], size: 9pt); lab(773, 1546, [+], size: 9pt)
  // L1、L0
  wire(p, (727, 1559), (640, 1559), (631, 1575))
  circle(p(631, 1590), radius: 13, stroke: lw)
  wire(p, (631, 1603), (631, 1667))
  lab(675, 1599, $L_1$)
  line(p(604, 1521), p(604, 1648), stroke: 0.6pt); line(p(612, 1521), p(612, 1648), stroke: 0.6pt)
  wire(p, (577, 1472), (577, 1505)); coil-v(p, 577, 1505, 6, r: 12, side: "left")
  wire(p, (577, 1649), (577, 1675), (527, 1675))
  lab(542, 1573, $L_0$)
  // C0
  wire(p, (483, 1472), (483, 1553)); cap-v(p, 483, 1561, len: 30, gap: 12, var: true)
  wire(p, (483, 1568), (483, 1675), (527, 1675))
  lab(442, 1563, $C_0$)
  node(p, 527, 1675); node(p, 527, 1802)
  wire(p, (527, 1675), (527, 1848)); ground(p, 527, 1848, hw: 16)
  // C2
  wire(p, (631, 1667), (792, 1667)); cap(p, 804, 1667, len: 40, gap: 12, st: 2.4pt); wire(p, (816, 1667), (965, 1667))
  node(p, 631, 1667)
  lab(804, 1622, $C_2$)
  // R1
  wire(p, (631, 1667), (631, 1730), (755, 1730)); resistor(p, 755, 1730, w: 90, h: 30)
  wire(p, (845, 1730), (1200, 1730))
  lab(804, 1768, $R_1$)
  // 乙电、开关 K
  wire(p, (527, 1802), (1027, 1802))
  battery(p, 1027, 1802, cells: 2, long: 46, short: 26, step: 12)
  wire(p, (1062, 1802), (1123, 1802))
  lab(1010, 1786, [+], size: 10pt); lab(1108, 1782, [#sym.minus], size: 10pt)
  line(p(1123, 1802), p(1165, 1780), stroke: 1.2pt)
  circle(p(1173, 1802), radius: 5, fill: black, stroke: none)
  wire(p, (1173, 1802), (1200, 1802))
  lab(1146, 1828, $K$, size: 10pt); lab(1058, 1855, $4.5 V$, size: 10pt)
  // 机械联动（虚线）
  let dash = (thickness: 1.6pt, dash: (8pt, 4pt))
  line(p(800, 1457), p(1269, 1311), stroke: dash)
  line(p(1269, 1311), p(1269, 1744), stroke: dash)
  line(p(1269, 1744), p(1165, 1782), stroke: dash)
})
