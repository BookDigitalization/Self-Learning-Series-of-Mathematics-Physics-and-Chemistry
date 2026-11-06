// 图 13·7 力的独立作用原理（原书 p.422）
// 示意图，按原图重绘：左为 F1、F2 分别单独作用于质量 m 的物体；右为 F1、F2 同时作用，合力 F，合加速度 a。
// 坐标是页面显示图（宽 1568）上的像素坐标；位置为目测。
#import "/common/series.typ": *

#let fig-13-7(width: 12cm) = px-canvas(720, 340, origin: (460, 150), width: width, (p, u) => {
  import cetz.draw: *
  let arr = (end: "stealth", fill: black, scale: 0.5)
  let lab(x, y, body) = content(p(x, y), anchor: "center", text(size: 9pt, body))
  let vec(a, b, w: 1pt) = line(p(..a), p(..b), stroke: w, mark: arr)
  let dsh = (thickness: 0.8pt, dash: "dashed")
  // 左上：F1 单独作用
  vec((478, 315), (610, 232))
  vec((630, 220), (705, 175))
  circle(p(620, 228), radius: 5 * u, fill: black, stroke: none)
  lab(516, 260, $F_1$)
  lab(617, 206, $m$)
  lab(685, 168, $a_1$)
  // 左下：F2 单独作用
  vec((535, 367), (645, 430))
  vec((665, 440), (722, 470))
  circle(p(655, 432), radius: 5 * u, fill: black, stroke: none)
  lab(562, 408, $F_2$)
  lab(660, 412, $m$)
  lab(672, 468, $a_2$)
  // 右：同时作用
  let o = (884, 328)
  circle(p(..o), radius: 4 * u, stroke: 0.8pt)
  lab(858, 328, $m$)
  vec(o, (1030, 258))
  vec(o, (988, 398))
  line(p(1030, 258), p(1142, 328), stroke: dsh, mark: arr)
  line(p(988, 398), p(1142, 328), stroke: dsh, mark: arr)
  vec(o, (1142, 328), w: 1.8pt)
  vec(o, (955, 290))
  vec(o, (938, 372))
  line(p(955, 290), p(1015, 328), stroke: dsh)
  line(p(938, 372), p(1015, 328), stroke: dsh)
  vec(o, (1015, 328), w: 1.4pt)
  lab(1035, 238, $F_1$)
  lab(990, 420, $F_2$)
  lab(1156, 312, $F$)
  lab(1012, 345, $a$)
  lab(940, 270, $a_1$)
  lab(908, 378, $a_2$)
})
