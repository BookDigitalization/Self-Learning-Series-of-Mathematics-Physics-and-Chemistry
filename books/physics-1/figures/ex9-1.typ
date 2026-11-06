// 习题 9·1 附图（原书 p.251–252）。CeTZ 重绘，坐标取自页面显示图。
// 第 3 题的图是写实插图，用位图 ex9-1-3.png。
#import "/common/series.typ": *

#let _arrow(p, a, b, th: 1.4pt) = cetz.draw.line(p(..a), p(..b), stroke: th, mark: (end: "stealth", fill: black, scale: 0.5))
#let _lab(p, x, y, body) = cetz.draw.content(p(x, y), anchor: "center", text(size: 8.5pt, body))

// 第 3 题：位图（ex9-1-3.png，已涂去“45°”），文字用 CeTZ 补回；坐标是该 png 的像素坐标（1355×1237）。
#let fig-ex-9-1-3(width: 7cm) = px-canvas(1355, 1237, width: width, (p, u) => {
  import cetz.draw: *
  content(p(0, 0), anchor: "north-west", image("ex9-1-3.png", width: 1355 * u))
  content(p(294, 432), anchor: "center", text(size: 9pt, [45°]))
})

// 第 2 题：两只弹簧与两个物体
#let spring(p, x, y0, y1, w: 14, n: 6) = {
  import cetz.draw: *
  let pts = ((x, y0),)
  let dy = (y1 - y0) / (n * 2)
  for i in range(0, n * 2) {
    pts.push((x + if calc.rem(i, 2) == 0 { w } else { -w }, y0 + dy * (i + 0.5)))
  }
  pts.push((x, y1))
  line(..pts.map(q => p(..q)), stroke: 1pt)
}
#let fig-ex-9-1-2(width: 3cm) = px-canvas(160, 430, origin: (480, 1140), width: width, (p, u) => {
  import cetz.draw: *
  line(p(498, 1160), p(590, 1160), stroke: 1pt)
  for x in range(500, 590, step: 14) { line(p(x, 1160), p(x - 8, 1148), stroke: 0.6pt) }
  line(p(547, 1160), p(547, 1170), stroke: 1pt)
  spring(p, 547, 1170, 1318)
  rect(p(527, 1318), p(582, 1358), stroke: 1pt)
  _lab(p, 554, 1338, $m$)
  line(p(555, 1358), p(555, 1368), stroke: 1pt)
  spring(p, 555, 1368, 1500)
  rect(p(530, 1500), p(585, 1548), stroke: 1pt)
  _lab(p, 558, 1524, $m$)
  _lab(p, 588, 1240, $K$); _lab(p, 588, 1428, $K$)
})

// 第 4 题：墙上的支架，A B 为拉杆，C B 为横梁，B 点悬挂 300 公斤的球
#let fig-ex-9-1-4(width: 6cm) = px-canvas(420, 650, origin: (420, 380), width: width, (p, u) => {
  import cetz.draw: *
  line(p(435, 380), p(425, 1030), stroke: 1pt)
  line(p(470, 395), p(470, 1030), stroke: 1pt)
  line(p(458, 570), p(458, 1030), stroke: 0.6pt)
  line(p(472, 405), p(750, 575), stroke: 2pt)
  line(p(470, 575), p(775, 585), stroke: 2.5pt)
  line(p(470, 595), p(745, 595), stroke: 1pt)
  line(p(745, 595), p(742, 835), stroke: 1.2pt)
  circle(p(740, 895), radius: 60 * u, stroke: 1pt, fill: luma(235))
  arc(p(750, 575), start: 150deg, stop: 180deg, radius: 100 * u, stroke: 0.6pt, anchor: "origin")
  _lab(p, 640, 553, $30°$)
  _lab(p, 497, 397, $A$); _lab(p, 755, 552, $B$); _lab(p, 490, 607, $C$)
  _lab(p, 745, 975, [300 公斤])
})

// 第 5 题：铁球用细线悬挂在光滑墙上
#let fig-ex-9-1-5(width: 3.6cm) = px-canvas(230, 440, origin: (1020, 570), width: width, (p, u) => {
  import cetz.draw: *
  line(p(1058, 590), p(1050, 990), stroke: 1pt)
  for y in range(600, 990, step: 28) { line(p(1058, y + 14), p(1045, y + 28), stroke: 0.6pt) }
  circle(p(1149, 890), radius: 92 * u, stroke: 1pt)
  circle(p(1065, 585), radius: 3 * u, fill: black)
  line(p(1065, 585), p(1149, 890), stroke: 1pt)
  line(p(1058, 890), p(1149, 890), stroke: (thickness: 0.6pt, dash: "dashed"))
  _lab(p, 1038, 617, $A$); _lab(p, 1107, 685, $L$); _lab(p, 1153, 832, $R$)
  _lab(p, 1100, 912, $R$); _lab(p, 1167, 893, $O$)
})

// 第 6 题：两段悬线悬挂 G1、G2
#let fig-ex-9-1-6(width: 6.4cm) = px-canvas(500, 360, origin: (390, 1490), width: width, (p, u) => {
  import cetz.draw: *
  line(p(395, 1512), p(880, 1512), stroke: 1pt)
  for x in range(410, 880, step: 28) { line(p(x, 1512), p(x - 12, 1500), stroke: 0.6pt) }
  line(p(410, 1512), p(545, 1655), stroke: 2pt)
  line(p(795, 1515), p(712, 1655), stroke: 2pt)
  line(p(545, 1655), p(712, 1655), stroke: 2pt)
  line(p(430, 1655), p(830, 1655), stroke: (thickness: 0.6pt, dash: "dashed"))
  line(p(545, 1655), p(543, 1755), stroke: 2pt)
  line(p(712, 1655), p(712, 1757), stroke: 2pt)
  rect(p(510, 1755), p(572, 1830), stroke: 1.2pt)
  rect(p(682, 1757), p(742, 1832), stroke: 1.2pt)
  _lab(p, 402, 1530, $A$); _lab(p, 805, 1533, $B$); _lab(p, 560, 1680, $C$); _lab(p, 733, 1680, $D$)
  _lab(p, 470, 1630, $45°$); _lab(p, 785, 1630, $60°$)
  _lab(p, 541, 1792, $G_1$); _lab(p, 711, 1794, $G_2$)
})

// 第 7 题：两个圆球放在竖直的槽里
#let fig-ex-9-1-7(width: 5cm) = px-canvas(380, 520, origin: (950, 1340), width: width, (p, u) => {
  import cetz.draw: *
  line(p(987, 1355), p(987, 1858), stroke: 1.2pt)
  line(p(1280, 1347), p(1280, 1830), stroke: 1.2pt)
  line(p(987, 1803), p(1280, 1803), stroke: 1.2pt)
  circle(p(1070, 1705), radius: 85 * u, stroke: 0.8pt)
  circle(p(1197, 1575), radius: 85 * u, stroke: 0.8pt)
  line(p(990, 1830), p(1278, 1830), stroke: 0.8pt, mark: (start: "stealth", end: "stealth", fill: black, scale: 0.4))
  rect(p(1100, 1820), p(1160, 1840), stroke: none, fill: white)
  _lab(p, 1130, 1830, $3.5 R$)
  _lab(p, 967, 1698, $A$); _lab(p, 1075, 1790, $B$); _lab(p, 1303, 1580, $C$)
})
