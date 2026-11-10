#import "/common/series.typ": *
// 第 4 章 B 段（§4·5）的几何示意图：图 4·15（p.164，靠墙的篱笆）、图 4·16（p.164，窗）、图 4·17（p.165，快艇和轮船）、
// 习题 4·5(2) 第 1 题的无编号图（p.166，正方形 ABCD 与内接正方形 PQRS）、第 2 题的无编号图（p.167，圆内接矩形）。
// 坐标取自 200 dpi 页面的真实像素（y 向下），用放大裁图加网格读出（真实坐标）。
// 图 4·15–4·17 的顶点、端点按扫描量取；习题 4·5(2) 第 1 题的正方形原图是手画、略有倾斜，这里画成边与坐标轴平行的正方形，
// 并取 AP = BQ = CR = DS = 155 px（扫描上约 152–159 px）；第 2 题的矩形原图 AB、CD 略有倾斜，这里画成水平。

#let k = 0.0100cm
#let ar = (end: "stealth", fill: black, scale: 0.5)
#let ar2 = (start: "stealth", end: "stealth", fill: black, scale: 0.5)
#let tt(body) = text(font: fonts.song, size: 8pt, body)
#let ti(body) = text(font: fonts.song, size: 8pt, style: "italic", body)
#let wbox(body) = box(fill: white, inset: (x: 1.5pt, y: 0pt), tt(body))
#let thick = 1.3pt

// ───────── 图 4·15：靠墙围篱笆（p.164）─────────
#let fig-4-15(width: 480 * k) = px-canvas(480, 620, origin: (200, 445), width: width, (p, u) => {
  import cetz.draw: *
  // 墙：右边缘线与斜线填充
  for y0 in range(459, 1020, step: 26) { line(p(241, y0), p(288, y0 + 30), stroke: 0.7pt) }
  line(p(288, 459), p(288, 1040), stroke: 1.8pt)
  // 篱笆 ABCD
  line(p(288, 549), p(585, 553), p(585, 955), p(288, 954), stroke: 1.6pt)
  // 宽 x（水平尺寸线）
  line(p(290, 601), p(583, 601), stroke: 0.6pt, mark: ar2)
  content(p(445, 601), wbox($x$))
  // 长 36 − 2x（竖直尺寸线）
  line(p(641.5, 554), p(641.5, 957), stroke: 0.6pt)
  line(p(633, 554), p(650, 554), stroke: 0.6pt)
  line(p(633, 957), p(650, 957), stroke: 0.6pt)
  content(p(643, 759), wbox($36 - 2x$))
  content(p(428, 754), tt($y$))
  content(p(307, 528), tt($A$))
  content(p(578, 532), tt($B$))
  content(p(303, 978), tt($D$))
  content(p(572, 982), tt($C$))
  content(p(215, 721), tt[墙])
})

// ───────── 图 4·16：窗的形状（p.164）─────────
#let fig-4-16(width: 390 * k) = px-canvas(390, 600, origin: (1040, 1395), width: width, (p, u) => {
  import cetz.draw: *
  let (cx, cy, r) = (1229.5, 1565, 153)
  line(p(1077, 1565), p(1077, 1972), p(1382, 1972), p(1382, 1565), stroke: 1.6pt)
  line(..range(61).map(i => {
    let a = 180deg * i / 60
    p(cx + r * calc.cos(a), cy - r * calc.sin(a))
  }), stroke: 1.6pt)
  // 直径 AD 与半径
  line(p(1077, 1565), p(1382, 1565), stroke: 1.3pt)
  line(p(cx, cy), p(cx + r * calc.cos(51deg), cy - r * calc.sin(51deg)), stroke: 0.9pt, mark: ar)
  content(p(1260, 1501), wbox($x$))
  // 底边 BC = 2x 的尺寸线
  line(p(1080, 1922), p(1379, 1922), stroke: 0.6pt, mark: ar2)
  content(p(1218, 1922), wbox($2x$))
  content(p(1058, 1574), tt($A$))
  content(p(1398, 1574), tt($D$))
  content(p(1231, 1581), tt($O$))
  content(p(1055, 1957), tt($B$))
  content(p(1398, 1958), tt($C$))
})

// ───────── 图 4·17：快艇和轮船（p.165）─────────
#let fig-4-17(width: 780 * k) = px-canvas(780, 300, origin: (500, 1535), width: width, (p, u) => {
  import cetz.draw: *
  // 航线 C—B—A、C—D 与 B—D
  line(p(553, 1618), p(1249, 1616), stroke: 1.5pt)
  line(p(553, 1618), p(553, 1777), stroke: 1.5pt)
  line(p(845, 1619), p(553, 1777), stroke: 1.5pt)
  // 航行方向的箭头
  line(p(935, 1617), p(905, 1617.5), stroke: 1pt, mark: (end: "stealth", fill: black, scale: 0.6))
  line(p(553, 1660), p(553, 1700), stroke: 1pt, mark: (end: "stealth", fill: black, scale: 0.6))
  // 145 公里
  line(p(549, 1559), p(1249, 1559), stroke: 0.6pt)
  line(p(549, 1551), p(549, 1567), stroke: 0.6pt)
  line(p(1249, 1551), p(1249, 1567), stroke: 0.6pt)
  content(p(905, 1559), wbox([145 公里]))
  // 40t
  line(p(849, 1661), p(1249, 1661), stroke: 0.6pt, mark: (end: "stealth", fill: black, scale: 0.5))
  line(p(849, 1653), p(849, 1669), stroke: 0.6pt)
  line(p(1249, 1653), p(1249, 1669), stroke: 0.6pt)
  content(p(1040, 1661), wbox($40 t$))
  // 16t
  line(p(511, 1618), p(511, 1782), stroke: 0.6pt)
  line(p(503, 1618), p(519, 1618), stroke: 0.6pt)
  line(p(503, 1782), p(519, 1782), stroke: 0.6pt)
  content(p(511, 1702), wbox($16 t$))
  content(p(553, 1600), tt($C$))
  content(p(845, 1600), tt($B$))
  content(p(1245, 1587), tt($A$))
  content(p(553, 1809), tt($D$))
})

// ───────── 习题 4·5(2) 第 1 题：正方形 ABCD 与内接正方形 PQRS（p.166）─────────
#let fig-ex45-1(width: 580 * k) = px-canvas(580, 600, origin: (540, 1600), width: width, (p, u) => {
  import cetz.draw: *
  let (x0, y0, x1, y1, d) = (570, 1642, 1075, 2147, 155)
  line(p(x0, y0), p(x1, y0), p(x1, y1), p(x0, y1), close: true, stroke: 1.4pt)
  let P = p(x0, y0 + d)
  let Q = p(x0 + d, y1)
  let R = p(x1, y1 - d)
  let S = p(x1 - d, y0)
  line(P, Q, R, S, close: true, stroke: 1.4pt)
  content(p(560, 1634), tt($A$))
  content(p(1086, 1630), tt($D$))
  content(p(1087, 2158), tt($C$))
  content(p(560, 2162), tt($B$))
  content(p(908, 1618), tt($S$))
  content(p(548, 1801), tt($P$))
  content(p(1097, 1988), tt($R$))
  content(p(726, 2174), tt($Q$))
})

// ───────── 习题 4·5(2) 第 2 题：圆内接矩形（p.167）─────────
#let fig-ex45-2(width: 450 * k) = px-canvas(450, 430, origin: (1030, 380), width: width, (p, u) => {
  import cetz.draw: *
  let (cx, cy, r) = (1248, 589, 198)
  circle(p(cx, cy), radius: r, stroke: 1.4pt)
  line(p(1072, 499), p(1424, 499), p(1424, 681), p(1072, 681), close: true, stroke: 1.4pt)
  line(p(cx, cy), p(1424, 499), stroke: 0.9pt)
  circle(p(cx, cy), radius: 6, fill: white, stroke: 0.6pt)
  content(p(1352, 585), wbox([20 厘米]))
  content(p(1050, 497), tt($B$))
  content(p(1439, 487), tt($A$))
  content(p(1053, 693), tt($C$))
  content(p(1447, 687), tt($D$))
  content(p(1250, 611), tt($O$))
})
