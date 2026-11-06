// 习题 9·5 附图（原书 p.274–275）。CeTZ 重绘，坐标取自页面显示图。第 6 题的起重机是写实插画，用位图 ex9-5-6.png。
#import "/common/series.typ": *

#let _arrow(p, a, b, th: 1.3pt) = cetz.draw.line(p(..a), p(..b), stroke: th, mark: (end: "stealth", fill: black, scale: 0.5))
#let _lab(p, x, y, body, size: 9pt) = cetz.draw.content(p(x, y), anchor: "center", text(size: size, body))
#let _dim(p, a, b) = cetz.draw.line(p(..a), p(..b), stroke: 0.6pt, mark: (start: "stealth", end: "stealth", fill: black, scale: 0.35))
#let _dash(p, a, b) = cetz.draw.line(p(..a), p(..b), stroke: (thickness: 0.6pt, dash: "dashed"))

// 第 3 题：两根横梁
#let fig-ex-9-5-3(width: 8.4cm) = px-canvas(660, 350, origin: (520, 700), width: width, (p, u) => {
  import cetz.draw: *
  rect(p(752, 820), p(1125, 830), stroke: 0.8pt, fill: luma(225))
  rect(p(562, 853), p(895, 865), stroke: 0.8pt, fill: luma(225))
  circle(p(765, 842), radius: 9 * u, stroke: 1pt, fill: white)
  line(p(1105, 852), p(1092, 872), p(1118, 872), close: true, stroke: 0.8pt, fill: white)
  line(p(1080, 875), p(1140, 875), stroke: 0.8pt)
  line(p(570, 868), p(557, 888), p(583, 888), close: true, stroke: 0.8pt, fill: white)
  line(p(543, 892), p(598, 892), stroke: 0.8pt)
  line(p(885, 868), p(872, 888), p(898, 888), close: true, stroke: 0.8pt, fill: white)
  line(p(858, 892), p(913, 892), stroke: 0.8pt)
  _dash(p, (765, 740), (765, 850)); _dash(p, (1112, 740), (1112, 825))
  _dash(p, (570, 890), (570, 965)); _dash(p, (765, 850), (765, 965)); _dash(p, (890, 890), (890, 965))
  _arrow(p, (843, 750), (843, 820), th: 1.6pt)
  _dim(p, (765, 750), (843, 750)); _dim(p, (843, 750), (1112, 750))
  _dim(p, (570, 955), (765, 955)); _dim(p, (765, 955), (890, 955))
  _lab(p, 843, 718, $G$)
  for (x, y, s) in ((805, 750, "30"), (975, 750, "90"), (667, 955, "60"), (828, 955, "40")) {
    cetz.draw.rect(p(x - 14, y + 9), p(x + 14, y - 9), stroke: none, fill: white)
    _lab(p, x, y, s, size: 8pt)
  }
  _lab(p, 735, 822, $B$); _lab(p, 1148, 822, $A$); _lab(p, 545, 853, $C$); _lab(p, 922, 853, $D$)
})

// 第 4 题：水平构件 A B 与绳 B C
#let fig-ex-9-5-4(width: 7cm) = px-canvas(600, 650, origin: (780, 1140), width: width, (p, u) => {
  import cetz.draw: *
  line(p(825, 1215), p(825, 1655), stroke: 1.6pt)
  for y in range(1160, 1655, step: 22) { line(p(825, y + 14), p(800, y - 8), stroke: 0.5pt) }
  rect(p(825, 1212), p(852, 1250), stroke: 1pt, fill: white)
  line(p(850, 1246), p(1325, 1548), stroke: 1.2pt)
  rect(p(838, 1540), p(1332, 1565), stroke: 1.4pt, fill: white)
  circle(p(845, 1552), radius: 3 * u, fill: black)
  circle(p(1325, 1552), radius: 3 * u, fill: black)
  arc(p(1325, 1552), start: 180deg, delta: 33deg, radius: 90 * u, stroke: 0.6pt, anchor: "origin")
  _arrow(p, (975, 1565), (975, 1657), th: 1.6pt)
  _arrow(p, (1238, 1565), (1238, 1737), th: 1.6pt)
  _dash(p, (1325, 1565), (1325, 1655))
  _dim(p, (840, 1617), (975, 1617)); _dim(p, (975, 1617), (1238, 1617)); _dim(p, (1238, 1617), (1325, 1617))
  for (x, s) in ((905, "40"), (1105, "60"), (1285, "20")) {
    rect(p(x - 14, 1626), p(x + 14, 1608), stroke: none, fill: white)
    _lab(p, x, 1617, s, size: 8pt)
  }
  _lab(p, 868, 1218, $C$); _lab(p, 850, 1523, $A$); _lab(p, 1322, 1523, $B$); _lab(p, 1232, 1523, $30°$, size: 8pt)
  _lab(p, 997, 1657, $G_1$); _lab(p, 1262, 1727, $G_2$)
})

// 第 5 题：斜杆 A D 靠在光滑垂直柱 B C 上
#let fig-ex-9-5-5(width: 8cm) = px-canvas(640, 400, origin: (570, 100), width: width, (p, u) => {
  import cetz.draw: *
  line(p(575, 466), p(1195, 470), stroke: 1pt)
  for x in range(590, 1190, step: 22) { line(p(x, 470), p(x - 12, 484), stroke: 0.5pt) }
  // 斜杆
  line(p(640, 445), p(1165, 130), stroke: 1.2pt)
  line(p(655, 462), p(1178, 148), stroke: 1.2pt)
  circle(p(648, 453), radius: 13 * u, stroke: 1pt, fill: white)
  circle(p(1170, 140), radius: 11 * u, stroke: 1pt, fill: white)
  // 垂直柱 B C
  line(p(1068, 215), p(1066, 460), stroke: 1.2pt)
  line(p(1076, 215), p(1075, 460), stroke: 1.2pt)
  // 软绳 A C
  line(p(655, 452), p(1066, 457), stroke: 1.2pt)
  // 重物
  line(p(1172, 150), p(1172, 238), stroke: 1pt)
  rect(p(1157, 238), p(1192, 268), stroke: 1pt, fill: luma(225))
  arc(p(655, 452), start: 0deg, delta: 28deg, radius: 80 * u, stroke: 0.6pt, anchor: "origin")
  _lab(p, 1190, 115, $D$); _lab(p, 1092, 222, $B$); _lab(p, 1087, 455, $C$); _lab(p, 615, 448, $A$)
  _lab(p, 1170, 285, $G$); _lab(p, 735, 432, $alpha$)
})
