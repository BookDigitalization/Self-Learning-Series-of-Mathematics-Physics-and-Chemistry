// 图 9·17（c）（d）与图 9·18（b）的线条图（原书 p.254）。（a）（b）是写实插画，用位图 fig9-17a/b.png、fig9-18a.png（字母已涂去，用 CeTZ 补回）。
// 坐标取自页面显示图。
#import "/common/series.typ": *

#let _arrow(p, a, b, th: 1.4pt) = cetz.draw.line(p(..a), p(..b), stroke: th, mark: (end: "stealth", fill: black, scale: 0.5))
#let _lab(p, x, y, body) = cetz.draw.content(p(x, y), anchor: "center", text(size: 9pt, body))
#let _dash(p, a, b) = cetz.draw.line(p(..a), p(..b), stroke: (thickness: 0.7pt, dash: "dashed"))

// （c）水平的推力 F 与转轴平行
#let fig-9-17c(width: 5.6cm) = px-canvas(360, 340, origin: (300, 630), width: width, (p, u) => {
  import cetz.draw: *
  circle(p(462, 800), radius: (148 * u, 48 * u), stroke: 1.6pt)
  _dash(p, (462, 650), (462, 800))
  line(p(462, 848), p(462, 940), stroke: 1pt)
  line(p(462, 800), p(607, 800), stroke: 1.6pt)
  _arrow(p, (557, 665), (557, 800))
  _lab(p, 576, 690, $F$); _lab(p, 445, 802, $C$); _lab(p, 626, 800, $A$)
  _lab(p, 458, 642, $O'$); _lab(p, 460, 950, $O$)
})

// （d）水平的推力 F 与转轴相交
#let fig-9-17d(width: 5.6cm) = px-canvas(360, 340, origin: (990, 630), width: width, (p, u) => {
  import cetz.draw: *
  circle(p(1157, 800), radius: (150 * u, 50 * u), stroke: 1.6pt)
  _dash(p, (1155, 650), (1155, 800))
  line(p(1155, 850), p(1155, 940), stroke: 1pt)
  _arrow(p, (1305, 798), (1160, 798), th: 1.8pt)
  _lab(p, 1214, 778, $F$); _lab(p, 1137, 803, $C$); _lab(p, 1318, 795, $A$)
  _lab(p, 1153, 640, $O'$); _lab(p, 1153, 945, $O$)
})

// （a）（b）与图 9·18（a）：写实插画，位图已涂去字母 O'、O、F，用 CeTZ 补回。
// 坐标是各 png 的像素坐标。
#let _bmp-lab(p, x, y, body) = cetz.draw.content(p(x, y), anchor: "center", text(size: 9pt, body))
#let fig-9-17a(width: 4.3cm) = px-canvas(704, 924, width: width, (p, u) => {
  import cetz.draw: *
  content(p(0, 0), anchor: "north-west", image("fig9-17a.png", width: 704 * u))
  _bmp-lab(p, 225, 92, $O'$); _bmp-lab(p, 185, 853, $O$); _bmp-lab(p, 635, 522, $F$)
})
#let fig-9-17b(width: 6.4cm) = px-canvas(1131, 860, width: width, (p, u) => {
  import cetz.draw: *
  content(p(0, 0), anchor: "north-west", image("fig9-17b.png", width: 1131 * u))
  _bmp-lab(p, 212, 45, $O'$); _bmp-lab(p, 178, 787, $O$); _bmp-lab(p, 402, 322, $F$)
})
#let fig-9-18a(width: 4.3cm) = px-canvas(725, 828, width: width, (p, u) => {
  import cetz.draw: *
  content(p(0, 0), anchor: "north-west", image("fig9-18a.png", width: 725 * u))
  _bmp-lab(p, 207, 40, $O'$); _bmp-lab(p, 175, 790, $O$); _bmp-lab(p, 688, 327, $F$)
})

// 图 9·18（b）
#let fig-9-18b(width: 7cm) = px-canvas(500, 340, origin: (800, 1180), width: width, (p, u) => {
  import cetz.draw: *
  line(p(820, 1250), p(1185, 1253), p(1270, 1415), p(915, 1415), close: true,
    stroke: (thickness: 1.2pt, dash: "dashed"))
  circle(p(1037, 1338), radius: (132 * u, 53 * u), stroke: 1.6pt)
  line(p(1035, 1200), p(1035, 1285), stroke: 1pt)
  line(p(1035, 1392), p(1033, 1485), stroke: 1pt)
  line(p(1035, 1335), p(1165, 1335), stroke: 1.6pt)
  line(p(1165, 1215), p(1165, 1335), stroke: 1.6pt)
  _arrow(p, (1165, 1335), (1225, 1445), th: 1.4pt)
  _lab(p, 1020, 1337, $C$); _lab(p, 1185, 1322, $A$); _lab(p, 1222, 1398, $F$)
  _lab(p, 1040, 1190, $O'$); _lab(p, 1035, 1493, $O$)
})
