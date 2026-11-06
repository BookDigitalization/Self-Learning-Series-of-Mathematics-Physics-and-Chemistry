// 图 9·34（原书 p.272）例 11：半开的门及铰链处受力。坐标取自页面显示图，原点 (330,190)。
#import "/common/series.typ": *

#let fig-9-34(width: 5.6cm) = px-canvas(400, 480, origin: (330, 190), width: width, (p, u) => {
  import cetz.draw: *
  let arrow(a, b, th: 1.3pt) = line(p(..a), p(..b), stroke: th, mark: (end: "stealth", fill: black, scale: 0.5))
  let lab(x, y, body, size: 9pt) = content(p(x, y), anchor: "center", text(size: size, body))
  line(p(430, 280), p(430, 650), stroke: 2.4pt)
  line(p(430, 280), p(700, 280), stroke: 1pt)
  line(p(665, 280), p(665, 605), stroke: 1pt)
  line(p(440, 605), p(700, 605), stroke: 1pt)
  // 尺寸
  line(p(430, 255), p(665, 255), stroke: 0.6pt, mark: (start: "stealth", end: "stealth", fill: black, scale: 0.35))
  line(p(688, 280), p(688, 605), stroke: 0.6pt, mark: (start: "stealth", end: "stealth", fill: black, scale: 0.35))
  rect(p(515, 245), p(565, 265), stroke: none, fill: white)
  lab(540, 255, $L_1$)
  rect(p(675, 435), p(701, 462), stroke: none, fill: white)
  lab(688, 448, $L_2$)
  // A 处
  arrow((430, 280), (360, 280))
  arrow((430, 280), (372, 213))
  arrow((430, 280), (430, 215))
  lab(343, 283, $F_1$); lab(345, 205, $R_1$); lab(443, 208, $N_1$); lab(385, 262, $alpha$); lab(410, 303, $A$)
  // B 处
  arrow((430, 605), (430, 520))
  arrow((435, 603), (495, 555))
  arrow((435, 605), (500, 605))
  lab(455, 505, $N_2$); lab(508, 522, $R_2$); lab(522, 587, $F_2$); lab(488, 577, $alpha_1$); lab(413, 615, $B$)
  // 重力
  arrow((557, 455), (557, 592), th: 1.8pt)
  circle(p(557, 452), radius: 3 * u, fill: black)
  lab(578, 545, $G$); lab(572, 440, $O$)
})
