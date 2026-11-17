// 图 6·33 舌簧扬声器的工作原理图；来源 原书 p.332，坐标取自 200 dpi 页面像素（1671×2500）。
#import "/common/series.typ": *
#import "fig6b-parts.typ": *

#let fig-6-33(width: 6.6cm) = px-canvas(560, 700, origin: (880, 1420), width: width, (p, u) => {
  import cetz.draw: *
  let hatch = tiling(size: (4.5pt, 4.5pt))[#place(std.line(start: (0%, 100%), end: (100%, 0%), stroke: 0.5pt))]
  let dots = tiling(size: (2.6pt, 2.6pt))[#place(center + horizon, std.circle(radius: 0.35pt, fill: black, stroke: none))]
  let lab(x, y, body, size: 8.5pt) = content(p(x, y), anchor: "center", text(font: fonts.hei, size: size, weight: "medium", body))
  // 永久磁铁
  rect(p(906, 1436), p(1353, 1498), stroke: 1.5pt, fill: dots)
  rect(p(1040, 1446), p(1220, 1488), stroke: none, fill: white)
  lab(1130, 1467, [永久磁铁])
  rect(p(1318, 1446), p(1346, 1488), stroke: none, fill: white); lab(1332, 1467, [北])
  rect(p(903, 2026), p(1349, 2082), stroke: 1.5pt, fill: dots)
  rect(p(1040, 2034), p(1220, 2074), stroke: none, fill: white)
  lab(1130, 2054, [永久磁铁])
  rect(p(1318, 2034), p(1346, 2074), stroke: none, fill: white); lab(1332, 2054, [南])
  // 上、下极靴（铁轭）
  line(p(1014, 1734), p(1014, 1526), p(1352, 1526), p(1352, 1741), p(1289, 1741), p(1289, 1584),
    p(1074, 1584), p(1074, 1734), close: true, stroke: 1.5pt, fill: hatch)
  rect(p(1014, 1680), p(1074, 1734), stroke: 1.2pt, fill: white); lab(1044, 1707, [北])
  rect(p(1289, 1700), p(1352, 1741), stroke: 1.2pt, fill: white); lab(1320, 1720, [北])
  line(p(1010, 1823), p(1010, 2030), p(1346, 2030), p(1346, 1823), p(1289, 1823), p(1289, 1973),
    p(1074, 1973), p(1074, 1823), close: true, stroke: 1.5pt, fill: hatch)
  rect(p(1010, 1823), p(1073, 1880), stroke: 1.2pt, fill: white); lab(1042, 1851, [南])
  rect(p(1289, 1823), p(1346, 1880), stroke: 1.2pt, fill: white); lab(1318, 1851, [南])
  // 舌簧
  rect(p(906, 1748), p(1346, 1801), stroke: 1.5pt, fill: white)
  for y in (1757, 1765, 1790, 1795) { line(p(912, y), p(1340, y), stroke: 0.4pt) }
  lab(1042, 1774, [北]); lab(1313, 1774, [南])
  // 线圈
  for i in range(8) {
    line(p(1123 + 14 * i, 1752), p(1131 + 14 * i, 1805), stroke: 0.9pt)
  }
  lab(1164, 1716, [线圈])
  // 电流引线
  line(p(957, 1673), p(1242, 1673), p(1242, 1751), stroke: 0.9pt)
  line(p(950, 1673), p(985, 1673), stroke: 0.9pt, mark: (end: "stealth", fill: black, scale: 0.5))
  line(p(949, 1874), p(1114, 1874), p(1114, 1805), stroke: 0.9pt)
  line(p(949, 1874), p(985, 1874), stroke: 0.9pt, mark: (end: "stealth", fill: black, scale: 0.5))
  lab(914, 1662, [电流])
  // 支点
  line(p(1177, 1822), p(1185, 1806), p(1193, 1822), close: true, fill: black, stroke: none)
  lab(1185, 1851, [支点])
  // 动作方向的箭头与标注
  line(p(1363, 1737), p(1363, 1690), stroke: 0.9pt, mark: (end: "stealth", fill: black, scale: 0.5))
  line(p(911, 1814), p(911, 1860), stroke: 0.9pt, mark: (end: "stealth", fill: black, scale: 0.5))
  lab(1400, 1786, [极靴])
  line(p(1371, 1757), p(1349, 1730), stroke: 0.7pt); line(p(1371, 1805), p(1353, 1826), stroke: 0.7pt)
  lab(906, 1712, [舌簧])
  line(p(926, 1728), p(944, 1750), stroke: 0.7pt)
})
