// 图 3·15、3·16、3·17、3·18（原书 p.133、p.134、p.135、p.136）：直线的图像。
// 坐标取自 200 dpi 渲染页面的网格图（--grid 100）。注意：读图时用的是缩小显示的网格图（显示宽 1596，真实宽 1654），
// 下面的数全是“显示图上的像素”（真实像素 = 显示像素 × 1.04）；画布只用相对位置，整体等比缩放，不影响形状。
// 图 3·17、3·18 的扫描有约 1.9°、0.8° 的倾斜，用 rot 绕坐标原点转正后再画。
// 图 3·15、3·16：平行于坐标轴的直线，各端点、标注位置按扫描量取。
// 图 3·17：A、B、C、D、P 各点和两条直线的端点都按扫描量取；扫描上 D 点（−3 处）和交点 P 并不在两个方程的准确位置上
// （按方程 2x+y+1=0，D 应在 x=1，P 应在 (−1, 1)），这里照扫描画，不按方程“纠正”。
// 图 3·18：按两个方程画，点位核对过（(−2,0)、(1,2)、(−1,−1)、(2,1)）。
#import "/common/series.typ": *

#let arr = (end: "stealth", fill: black, scale: 0.5)
#let lab(p, x, y, body, size: 8pt) = cetz.draw.content(p(x, y), text(font: fonts.song, size: size, body))

// 绕 (ox, oy) 转 a 弧度（y 向下），把倾斜的坐标轴转正
#let rot(ox, oy, a) = (x, y) => {
  let (c, s) = (calc.cos(a), calc.sin(a))
  let (dx, dy) = (x - ox, y - oy)
  (ox + c * dx - s * dy, oy + s * dx + c * dy)
}

// 图 3·15：y = −c/b 的三种位置（平行于 x 轴）
#let fig-3-15(width: 5.2cm) = px-canvas(880, 780, origin: (420, 1280), width: width, (p, u) => {
  import cetz.draw: *
  line(p(440, 1660), p(1184, 1656), stroke: 0.6pt, mark: arr)
  line(p(811, 2020), p(811, 1336), stroke: 0.6pt, mark: arr)
  line(p(519, 1512), p(1094, 1512), stroke: 1.5pt)
  line(p(522, 1804), p(1107, 1804), stroke: 1.5pt)
  lab(p, 1199, 1652, $x$)
  lab(p, 811, 1305, $y$)
  lab(p, 801, 1673, $O$, size: 7pt)
  lab(p, 1183, 1512, $y = -c/b > 0$, size: 6.5pt)
  lab(p, 1106, 1636, $y = 0$, size: 6.5pt)
  lab(p, 1196, 1804, $y = -c/b < 0$, size: 6.5pt)
})

// 图 3·16：x = −c/a 的三种位置（平行于 y 轴）
#let fig-3-16(width: 5.0cm) = px-canvas(700, 820, origin: (540, 940), width: width, (p, u) => {
  import cetz.draw: *
  line(p(490, 1387), p(1146, 1385), stroke: 0.6pt, mark: arr)
  line(p(808, 1735), p(808, 985), stroke: 0.6pt, mark: arr)
  line(p(663, 1100), p(663, 1680), stroke: 1.5pt)
  line(p(955, 1100), p(955, 1680), stroke: 1.5pt)
  lab(p, 1164, 1383, $x$)
  lab(p, 806, 967, $y$)
  lab(p, 796, 1402, $O$, size: 7pt)
  lab(p, 651, 1062, $x = -c/a < 0$, size: 6.5pt)
  lab(p, 771, 1100, $x = 0$, size: 6.5pt)
  lab(p, 957, 1062, $x = -c/a > 0$, size: 6.5pt)
})

// 图 3·17：直线 x−y+2=0（AB）与 2x+y+1=0（CD）及交点 P
#let fig-3-17(width: 5.5cm) = px-canvas(930, 950, origin: (330, 1140), width: width, (p, u) => {
  import cetz.draw: *
  let r = rot(775, 1620, 0.0335)
  let q(x, y) = { let (a, b) = r(x, y); p(a, b) }
  // 坐标轴
  line(q(352, 1634), q(1222, 1604), stroke: 0.6pt, mark: arr)
  line(q(792, 2065), q(760, 1176), stroke: 0.6pt, mark: arr)
  // 刻度（x 方向单位 84.5，y 方向单位 86，原点 (775, 1620)）
  for k in range(-4, 6) {
    if k != 0 { line(q(775 + k * 84.5, 1613), q(775 + k * 84.5, 1627), stroke: 0.5pt) }
  }
  for k in range(-5, 5) {
    if k != 0 { line(q(768, 1620 - k * 86), q(782, 1620 - k * 86), stroke: 0.5pt) }
  }
  // P 的两条虚线
  line(q(721, 1503), q(721, 1623), stroke: (thickness: 0.4pt, dash: "dashed"))
  line(q(721, 1503), q(771, 1503), stroke: (thickness: 0.4pt, dash: "dashed"))
  // 两条直线
  line(q(452, 1795), q(932, 1277), stroke: 1.5pt)
  line(q(653, 1274), q(866, 2013), stroke: 1.5pt)
  // 点 A、B、C、D
  for (x, y) in ((769, 1449), (607, 1623), (779, 1705), (826, 1876)) {
    circle(q(x, y), radius: 5 * u, fill: black, stroke: none)
  }
  lab(q, 1232, 1606, $x$)
  lab(q, 762, 1160, $y$)
  lab(q, 788, 1635, $O$, size: 7pt)
  lab(q, 697, 1500, $P$)
  lab(q, 790, 1452, $A$)
  lab(q, 613, 1648, $B$)
  lab(q, 797, 1707, $C$)
  lab(q, 848, 1876, $D$)
  lab(q, 645, 1249, $2x + y + 1 = 0$, size: 6.5pt)
  lab(q, 941, 1258, $x - y + 2 = 0$, size: 6.5pt)
})

// 图 3·18：2x−3y+4=0（与 4x−6y+8=0 重合）和 4x−6y−2=0（平行）
#let fig-3-18(width: 4.9cm) = px-canvas(830, 780, origin: (380, 1330), width: width, (p, u) => {
  import cetz.draw: *
  let r = rot(790, 1760, 0.014)
  let q(x, y) = { let (a, b) = r(x, y); p(a, b) }
  // 坐标轴；刻度每 0.5 个单位一个（单位 97 像素）
  line(q(390, 1763), q(1180, 1752), stroke: 0.6pt, mark: arr)
  line(q(795, 2085), q(785, 1377), stroke: 0.6pt, mark: arr)
  for k in range(-5, 8) {
    if k != 0 { line(q(790 + k * 48.5, 1754), q(790 + k * 48.5, 1766), stroke: 0.5pt) }
  }
  for k in range(-6, 6) {
    if k != 0 { line(q(784, 1760 - k * 48.5), q(796, 1760 - k * 48.5), stroke: 0.5pt) }
  }
  // 两条直线（2x−3y+4=0 与 4x−6y+8=0 重合）
  line(q(460, 1857), q(1010, 1485), stroke: 1.5pt)
  line(q(533, 1973), q(1088, 1593), stroke: 1.5pt)
  // 描出的点：(−2, 0)、(1, 2)、(−1, −1)、(2, 1)
  for (x, y) in ((597, 1762), (888, 1565), (693, 1860), (985, 1662)) {
    circle(q(x, y), radius: 5 * u, fill: black, stroke: none)
  }
  lab(q, 1193, 1756, $x$)
  lab(q, 786, 1348, $y$)
  lab(q, 779, 1773, $O$, size: 7pt)
  lab(q, 1057, 1459, $2x - 3y + 4 = 0$, size: 6.5pt)
  lab(q, 1092, 1531, $4x - 6y + 8 = 0$, size: 6.5pt)
  lab(q, 1107, 1688, $4x - 6y - 2 = 0$, size: 6.5pt)
})

