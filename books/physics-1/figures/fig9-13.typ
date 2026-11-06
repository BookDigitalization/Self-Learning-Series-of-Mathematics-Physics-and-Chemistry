// 图 9·13（原书 p.247）例 3：铁球静止在两个光滑斜面上。坐标取自页面显示图，原点 (490,340)。
#import "/common/series.typ": *

#let fig-9-13(width: 12cm) = px-canvas(780, 460, origin: (490, 340), width: width, (p, u) => {
  import cetz.draw: *
  let arrow(a, b, th: 1.4pt) = line(p(..a), p(..b), stroke: th, mark: (end: "stealth", fill: black, scale: 0.5))
  let lab(x, y, body) = content(p(x, y), anchor: "center", text(size: 9pt, body))
  let dash(a, b) = line(p(..a), p(..b), stroke: (thickness: 0.6pt, dash: "dashed"))
  // （a）
  let o = (728, 478)
  circle(p(..o), radius: 130 * u, stroke: 1pt)
  line(p(505, 362), p(690, 658), stroke: 1.2pt)
  line(p(690, 658), p(1003, 460), stroke: 1.2pt)
  line(p(510, 658), p(930, 652), stroke: 1pt)
  for x in range(520, 930, step: 28) {
    line(p(x, 660), p(x - 14, 678), stroke: 0.6pt)
  }
  arrow((612, 545), (692, 500))
  arrow((800, 588), (668, 392))
  arrow(o, (728, 730))
  dash(o, (800, 432))
  line(p(..o), p(800, 588), stroke: 0.7pt)
  arc(p(690, 658), start: 33deg, stop: 123deg, radius: 40 * u, stroke: 0.6pt, anchor: "origin")
  lab(518, 365, $B$); lab(1012, 457, $C$); lab(598, 562, $D$); lab(810, 606, $E$); lab(682, 684, $A$)
  lab(740, 452, $O$); lab(668, 480, $N_1$); lab(708, 394, $N_2$); lab(757, 708, $G$)
  lab(638, 632, $alpha_1$); lab(776, 666, $alpha_2$)
  lab(788, 785, $(a)$)
  // （b）
  arrow((1125, 368), (1128, 652))
  arrow((1128, 652), (1245, 580))
  arrow((1245, 580), (1125, 368))
  dash((1148, 580), (1245, 580))
  lab(1140, 440, $alpha_1$); lab(1200, 550, $alpha_1$); lab(1182, 597, $alpha_2$); lab(1150, 617, $alpha_1$)
  lab(1212, 467, $N_2$); lab(1105, 515, $G$); lab(1208, 632, $N_1$)
  lab(1150, 722, $(b)$)
})
