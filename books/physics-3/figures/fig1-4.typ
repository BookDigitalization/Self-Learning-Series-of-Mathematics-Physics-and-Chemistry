// 图 1·4 电荷间的相互作用（原书 p.8）
#import "/common/series.typ": *
#import "fig1-lib.typ": *

#let fig-1-4(width: 9cm) = px-canvas(500, 90, origin: (260, 175), width: width, (p, u) => {
  import cetz.draw: *
  let u4 = 3.2 * u  // 小圆半径（量到的是像素，换成排版长度）
  seg(p, (270, 228), (750, 228), dash: "dashed")
  arr(p, (378, 228), (272, 228), th: 1.2pt)
  arr(p, (638, 228), (750, 228), th: 1.2pt)
  seg(p, (378, 187), (378, 228), th: 0.8pt)
  seg(p, (638, 187), (638, 228), th: 0.8pt)
  line(p(380, 201), p(636, 201), stroke: 0.6pt, mark: (start: "stealth", end: "stealth", fill: black, scale: 0.4))
  circle(p(378, 228), radius: 3.5 * u, stroke: 0.7pt, fill: white)
  circle(p(638, 228), radius: 3.5 * u, stroke: 0.7pt, fill: white)
  lab(p, (505, 197), $r$, sz: 8pt)
  lab(p, (283, 212), vec-it($F$), sz: 8pt)
  lab(p, (378, 244), $q_1$, sz: 8pt)
  lab(p, (638, 244), $q_2$, sz: 8pt)
})
