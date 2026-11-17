// 图 6·27 再生式电子管收音机（电路图）；来源 原书 p.328，坐标取自 200 dpi 页面像素（1671×2500）。
#import "/common/series.typ": *
#import "fig6b-parts.typ": *

#let fig-6-27(width: 10.5cm) = px-canvas(800, 510, origin: (400, 1290), width: width, (p, u) => {
  import cetz.draw: *
  let lab(x, y, body) = content(p(x, y), anchor: "center", text(size: 8.5pt, body))
  // 天线、L1
  antenna(p, 500, 1323)
  wire(p, (500, 1347), (500, 1550))
  coil-v(p, 503, 1550, 3, r: 8, side: "left")
  wire(p, (500, 1598), (500, 1775))
  ground(p, 500, 1775)
  lab(468, 1577, $L_1$)
  // L2
  coil-v(p, 524, 1550, 3, r: 8, side: "right")
  lab(572, 1580, $L_2$)
  wire(p, (524, 1550), (524, 1535), (820, 1535))
  wire(p, (524, 1598), (537, 1598), (537, 1707), (1003, 1707))
  // C1
  wire(p, (615, 1535), (615, 1625))
  cap-v(p, 615, 1633, var: true)
  wire(p, (615, 1642), (615, 1775))
  ground(p, 615, 1775)
  node(p, 615, 1535); node(p, 615, 1707)
  lab(660, 1630, $C_1$)
  // C2 与 R1
  wire(p, (675, 1535), (720, 1535)); cap(p, 728, 1535)
  wire(p, (737, 1535), (775, 1535))
  wire(p, (675, 1535), (675, 1602), (698, 1602)); resistor(p, 698, 1602, w: 62, h: 20)
  wire(p, (760, 1602), (775, 1602), (775, 1535))
  node(p, 675, 1535); node(p, 775, 1535)
  lab(727, 1496, $C_2$); lab(727, 1632, $R_1$)
  // 电子管
  tube(p, 821, 1448, 112, 179, plate-y: 0.22, grid-y: 0.49, cat-y: 0.77)
  wire(p, (877, 1407), (877, 1470))
  node(p, 877, 1407)
  // 阴极引线与甲电
  wire(p, (843, 1612), (843, 1665), (868, 1665))
  wire(p, (904, 1612), (904, 1665), (891, 1665))
  battery(p, 870, 1665, cells: 1, long: 20, short: 11, step: 10)
  wire(p, (843, 1665), (843, 1707))
  node(p, 843, 1665); node(p, 843, 1707)
  lab(870, 1692, text(size: 8pt)[#sym.minus]); lab(906, 1692, text(size: 8pt)[+])
  // 屏极电路
  wire(p, (677, 1407), (1027, 1407))
  coil-h(p, 1027, 1407, 3, r: 8)
  wire(p, (1075, 1407), (1117, 1407), (1117, 1500))
  lab(1053, 1377, [高扼圈])
  // L3 与 C3
  wire(p, (540, 1363), (606, 1363)); cap(p, 618, 1363, var: true, gap: 9, len: 26)
  wire(p, (627, 1363), (688, 1363)); ground-h(p, 688, 1363)
  wire(p, (540, 1363), (540, 1431))
  circle(p(540, 1440), radius: 9, stroke: lw)
  wire(p, (540, 1449), (540, 1463), (677, 1463), (677, 1407))
  lab(573, 1440, $L_3$); lab(620, 1323, $C_3$)
  // 听筒 T
  circle(p(1117, 1515), radius: 12, stroke: lw)
  circle(p(1117, 1635), radius: 12, stroke: lw)
  bezier(p(1117, 1527), p(1117, 1623), p(1147, 1545), p(1147, 1605), stroke: 1.6pt)
  wire(p, (1117, 1647), (1117, 1707), (1100, 1707))
  lab(1160, 1572, text(size: 9pt)[$T$])
  // 乙电
  wire(p, (1003, 1707), (1003, 1707))
  battery(p, 1003, 1707, cells: 2, long: 22, short: 12, step: 12)
  wire(p, (1050, 1707), (1117, 1707))
  lab(985, 1736, text(size: 8pt)[#sym.minus]); lab(1113, 1736, text(size: 8pt)[+])
})
