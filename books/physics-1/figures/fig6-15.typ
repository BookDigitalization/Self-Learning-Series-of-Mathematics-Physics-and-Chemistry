// 图 6·15 已知两个分力方向求分力大小（原书 p.181）
// 几何图，按原图用 CeTZ 重绘；坐标取自 200 dpi 页面显示图（宽 1568），内部乘 1.0657 换成真实像素。
// 斜面上的物体画成与斜面平行的方块（原图为带斜线的小木块）。
#import "/common/series.typ": *

#let fig-6-15(width: 7.4cm) = px-canvas(520, 450, width: width, origin: (905 * 1.0657, 1240 * 1.0657), (p, u) => {
  import cetz.draw: *
  let q(x, y) = p(x * 1.0657, y * 1.0657)
  let arr(a, b, w: 0.9pt) = line(q(..a), q(..b), stroke: w, mark: (end: "stealth", fill: black, scale: 0.5))
  let dash(a, b) = line(q(..a), q(..b), stroke: (thickness: 0.6pt, dash: "dashed"))
  let lab(x, y, body) = content(q(x, y), anchor: "center", text(size: 8pt, body))
  let A = (958, 1558)
  let B = (1368, 1345)
  let C = (1370, 1558)
  // 斜面板
  line(q(918, 1488), q(1310, 1258), q(..B), stroke: 0.9pt)
  line(q(918, 1488), q(925, 1565), q(1370, 1592), q(..C), stroke: 0.9pt)
  line(q(..A), q(..B), stroke: 1.2pt)
  line(q(..A), q(..C), stroke: 1.2pt)
  line(q(..B), q(..C), stroke: 1.2pt)
  // 物体（方块）
  let O = (1160, 1470)
  let u1 = (0.888, -0.459)
  let n = (-0.459, -0.888)
  let pt(s, t) = (1160 + s * u1.at(0) + t * n.at(0), 1470 + s * u1.at(1) + t * n.at(1))
  line(q(..pt(-50, 0)), q(..pt(50, 0)), q(..pt(50, 85)), q(..pt(-50, 85)), close: true, stroke: 0.8pt, fill: luma(225))
  // 重力 G 及两个分力
  let E = (1160, 1580)
  let D = (1160 - 80 * 0.888, 1470 + 80 * 0.459)
  let F = (1160 + 92 * 0.459, 1470 + 92 * 0.888)
  arr(O, E, w: 1.2pt); arr(O, D); arr(O, F)
  dash(D, E); dash(F, E)
  lab(945, 1568, $A$); lab(1380, 1325, $B$); lab(1385, 1565, $C$)
  lab(1103, 1348, $l$); lab(1405, 1450, $h$); lab(1163, 1625, $b$)
  lab(1145, 1608, $E$); lab(1085, 1470, $D$); lab(1260, 1528, $F$)
  lab(1100, 1442, $G_1$); lab(1222, 1478, $G_2$); lab(1142, 1548, $G$); lab(1158, 1432, $O$)
  lab(1030, 1540, $theta$); lab(1150, 1520, $theta$)
})
