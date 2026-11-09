// 第 2 章习题插图（不编号的小图）：
//   习题 2·1 第 3 题三角形、第 4 题平行四边形、第 5 题圆（原书 p.79）；
//   习题 2·4 第 11 题梯形、第 12 题长方体（原书 p.91）。
// 坐标取自 200 dpi 带网格页面图（y 向下）；各图同一比例（约 0.013 cm / 像素）。
#import "/common/series.typ": *

#let lab(body) = text(font: fonts.song, size: 8.5pt, body)
#let stroke-solid = 0.7pt
#let stroke-dash = (paint: black, thickness: 0.7pt, dash: "dashed")
#let arrow-mark = (start: "stealth", end: "stealth", fill: black, scale: 0.35)

// p.79 第 3 题：三角形，底 b，高 h
#let ex-triangle(width: 5.2cm) = px-canvas(400, 210, origin: (595, 670), width: width, (p, u) => {
  import cetz.draw: *
  line(p(600, 850), p(988, 850), p(727, 677), close: true, stroke: stroke-solid)
  line(p(727, 677), p(727, 850), stroke: stroke-solid)
  content(p(735, 760), anchor: "west", lab[高 $h$])
  content(p(762, 866), lab[底 $b$])
})

// p.79 第 4 题：平行四边形，底 b，高 h
#let ex-parallelogram(width: 5.4cm) = px-canvas(415, 210, origin: (240, 1138), width: width, (p, u) => {
  import cetz.draw: *
  line(p(247, 1311), p(552, 1311), p(645, 1144), p(342, 1144), close: true, stroke: stroke-solid)
  line(p(403, 1144), p(403, 1311), stroke: stroke-solid)
  content(p(407, 1228), anchor: "west", lab[高 $h$])
  content(p(426, 1326), lab[底 $b$])
})

// p.79 第 5 题：圆，半径 r
#let ex-circle(width: 3.4cm) = px-canvas(260, 260, origin: (672, 1093), width: width, (p, u) => {
  import cetz.draw: *
  circle(p(801, 1221), radius: 123, stroke: stroke-solid)
  circle(p(801, 1221), radius: 2.5, fill: black, stroke: none)
  line(p(801, 1221), p(924, 1221), stroke: stroke-solid)
  content(p(852, 1206), lab[半径 $r$])
})

// p.91 第 11 题：梯形，上底 b，下底 a，高 h
#let ex-trapezoid(width: 5.6cm) = px-canvas(435, 235, origin: (190, 460), width: width, (p, u) => {
  import cetz.draw: *
  line(p(197, 660), p(614, 655), p(452, 484), p(275, 485), close: true, stroke: stroke-solid)
  // 上底 b
  line(p(275, 470), p(452, 470), stroke: stroke-solid, mark: arrow-mark)
  line(p(275, 462), p(275, 480), stroke: stroke-solid)
  line(p(452, 462), p(452, 480), stroke: stroke-solid)
  content(p(364, 470), frame: "rect", fill: white, stroke: none, padding: 1.5pt, lab[$b$])
  // 高 h
  line(p(364, 485), p(364, 655), stroke: stroke-solid, mark: arrow-mark)
  content(p(364, 572), frame: "rect", fill: white, stroke: none, padding: 1.5pt, lab[$h$])
  // 下底 a
  line(p(197, 677), p(614, 677), stroke: stroke-solid, mark: arrow-mark)
  line(p(197, 668), p(197, 686), stroke: stroke-solid)
  line(p(614, 668), p(614, 686), stroke: stroke-solid)
  content(p(388, 677), frame: "rect", fill: white, stroke: none, padding: 1.5pt, lab[$a$])
})

// p.91 第 12 题：长方体，长 a，宽 b，高 c
#let ex-cuboid(width: 4.7cm) = px-canvas(365, 285, origin: (620, 408), width: width, (p, u) => {
  import cetz.draw: *
  // 前面
  line(p(630, 655), p(876, 652), p(873, 502), p(630, 503), close: true, stroke: stroke-solid)
  // 上面与右面可见棱
  line(p(630, 503), p(702, 420), p(946, 419), p(873, 502), stroke: stroke-solid)
  line(p(946, 419), p(948, 572), p(876, 652), stroke: stroke-solid)
  // 看不见的棱（虚线）
  line(p(630, 655), p(702, 572), p(948, 572), stroke: stroke-dash)
  line(p(702, 420), p(702, 572), stroke: stroke-dash)
  // 长 a
  line(p(630, 672), p(876, 672), stroke: stroke-solid, mark: arrow-mark)
  line(p(630, 664), p(630, 681), stroke: stroke-solid)
  line(p(876, 664), p(876, 681), stroke: stroke-solid)
  content(p(755, 672), frame: "rect", fill: white, stroke: none, padding: 1.5pt, lab[$a$])
  // 宽 b
  line(p(897, 655), p(970, 575), stroke: stroke-solid, mark: arrow-mark)
  content(p(933, 617), frame: "rect", fill: white, stroke: none, padding: 1.5pt, lab[$b$])
  // 高 c
  line(p(966, 420), p(966, 572), stroke: stroke-solid, mark: arrow-mark)
  content(p(966, 490), frame: "rect", fill: white, stroke: none, padding: 1.5pt, lab[$c$])
})
