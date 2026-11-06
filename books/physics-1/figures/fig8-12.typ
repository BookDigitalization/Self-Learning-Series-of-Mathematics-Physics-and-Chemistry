// 图 8·12 定滑轮两边各挂一个物体（原书 p.224）
// 线条图，用 CeTZ 按原图重绘：（a）滑轮、悬线和甲、乙两物体及加速度 a；（b）两物体的受力图。
// 坐标是原页显示图坐标（x-340, y-195），y 向下。
#import "/common/series.typ": *

#let fig-8-12(width: 7.5cm) = px-canvas(440, 900, width: width, origin: (340, 195), (p, u) => {
  import cetz.draw: *
  let arr = (end: "stealth", fill: black, scale: 0.45)
  let m(x, y, body) = content(p(x, y), anchor: "center", text(size: 8pt, body))
  let lab(x, y, body) = content(p(x, y), anchor: "center",
    text(font: fonts.hei, size: 7.5pt, weight: "medium", body))
  // （a）
  line(p(462, 200), p(603, 200), stroke: 0.9pt)
  for k in range(0, 12) {
    let x = 464 + k * 12
    line(p(x + 8, 200), p(x, 211), stroke: 0.6pt)
  }
  rect(p(532, 213), p(550, 345), stroke: 0.9pt, radius: 8 * u)
  circle(p(545, 337), radius: 92 * u, stroke: 0.9pt)
  line(p(453, 337), p(453, 553), stroke: 1.2pt)
  line(p(637, 337), p(637, 595), stroke: 1.2pt)
  rect(p(425, 553), p(497, 617), stroke: (thickness: 0.8pt, dash: "dashed"))
  rect(p(598, 595), p(663, 655), stroke: 0.9pt)
  m(461, 585, $m_2$)
  m(630, 625, $m_1$)
  lab(483, 527, [乙])
  lab(655, 568, [甲])
  line(p(388, 620), p(388, 545), stroke: 1pt, mark: arr)
  m(366, 598, $a$)
  line(p(703, 605), p(703, 655), stroke: 1pt, mark: arr)
  m(722, 617, $a$)
  m(733, 448, $(a)$)
  // （b）
  rect(p(422, 830), p(490, 897), stroke: 0.9pt)
  circle(p(455, 862), radius: 2.5 * u, fill: black, stroke: none)
  line(p(455, 862), p(455, 765), stroke: 1pt, mark: arr)
  line(p(455, 862), p(455, 962), stroke: 1pt, mark: arr)
  m(473, 772, $T_2$)
  m(396, 870, $m_2$)
  m(488, 950, $m_2 g$)
  rect(p(600, 827), p(662, 893), stroke: 1.3pt)
  circle(p(633, 860), radius: 2.5 * u, fill: black, stroke: none)
  line(p(633, 860), p(633, 760), stroke: 1pt, mark: arr)
  line(p(633, 860), p(633, 1040), stroke: 1pt, mark: arr)
  m(660, 770, $T_1$)
  m(688, 862, $m_1$)
  m(660, 1018, $m_1 g$)
  m(760, 865, $(b)$)
})
