// 图 9·23、9·24（原书 p.258）力矩。坐标取自页面显示图。
#import "/common/series.typ": *

#let _arrow(p, a, b, th: 1.4pt) = cetz.draw.line(p(..a), p(..b), stroke: th, mark: (end: "stealth", fill: black, scale: 0.5))
#let _lab(p, x, y, body) = cetz.draw.content(p(x, y), anchor: "center", text(size: 9pt, body))
#let _dash(p, a, b) = cetz.draw.line(p(..a), p(..b), stroke: (thickness: 0.7pt, dash: "dashed"))
#let _dim(p, a, b) = cetz.draw.line(p(..a), p(..b), stroke: 0.7pt, mark: (start: "stealth", end: "stealth", fill: black, scale: 0.35))

#let fig-9-23(width: 6.5cm) = px-canvas(400, 380, origin: (330, 950), width: width, (p, u) => {
  import cetz.draw: *
  rect(p(385, 1111), p(675, 1126), stroke: 1pt, fill: luma(200))
  circle(p(385, 1118), radius: 18 * u, stroke: 1.4pt, fill: white)
  circle(p(385, 1118), radius: 6 * u, stroke: 1pt)
  arc(p(385, 1118), start: 70deg, delta: -150deg, radius: 38 * u, stroke: 1pt,
    anchor: "origin", mark: (end: "stealth", fill: black, scale: 0.4))
  _dash(p, (380, 960), (380, 1105))
  line(p(675, 972), p(675, 1015), stroke: 0.7pt)
  _dim(p, (380, 972), (675, 972))
  _dim(p, (380, 1022), (495, 1022))
  line(p(495, 1015), p(495, 1105), stroke: 0.7pt)
  _dash(p, (495, 1126), (495, 1280))
  _arrow(p, (495, 1270), (495, 1292), th: 1.4pt)
  _arrow(p, (675, 1126), (675, 1290), th: 2pt)
  _lab(p, 345, 1118, $C$); _lab(p, 698, 1108, $A$); _lab(p, 493, 1090, $A'$)
  _lab(p, 525, 972, $L$); _lab(p, 440, 1022, $L'$); _lab(p, 518, 1272, $F'$); _lab(p, 700, 1270, $F$)
})

#let fig-9-24(width: 8cm) = px-canvas(560, 470, origin: (790, 880), width: width, (p, u) => {
  import cetz.draw: *
  rect(p(845, 1131), p(1127, 1145), stroke: 1pt, fill: luma(210))
  circle(p(845, 1138), radius: 16 * u, stroke: 1.4pt, fill: white)
  circle(p(845, 1138), radius: 5 * u, stroke: 1pt)
  arc(p(845, 1138), start: 40deg, delta: -120deg, radius: 40 * u, stroke: 1pt,
    anchor: "origin", mark: (end: "stealth", fill: black, scale: 0.4))
  line(p(845, 1138), p(972, 992), stroke: 1pt)
  _dash(p, (885, 908), (1127, 1135))
  _arrow(p, (1127, 1135), (1275, 1135), th: 1.4pt)
  _arrow(p, (1127, 1135), (1127, 1285), th: 2pt)
  _arrow(p, (1127, 1135), (1265, 1280), th: 1.6pt)
  arc(p(1127, 1135), start: 180deg, delta: -43deg, radius: 60 * u, stroke: 0.6pt, anchor: "origin")
  arc(p(1127, 1135), start: 0deg, delta: -43deg, radius: 60 * u, stroke: 0.6pt, anchor: "origin")
  _lab(p, 810, 1138, $C$); _lab(p, 1138, 1118, $A$); _lab(p, 990, 975, $B$); _lab(p, 920, 1030, $L$)
  _lab(p, 1060, 1105, $theta$); _lab(p, 1195, 1162, $theta$)
  _lab(p, 1292, 1138, $F_2$); _lab(p, 1135, 1303, $F_1$); _lab(p, 1268, 1298, $F$)
})
