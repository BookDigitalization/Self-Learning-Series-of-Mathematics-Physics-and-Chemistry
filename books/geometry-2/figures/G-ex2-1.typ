// 习题 2·1 第 2、3、4 题的图（原书 p.121）；页面 120 dpi 坐标。
// 第 2 题：∠BAC = 60°，按 60° 算出各点（左图 AC 上的垂足、右图垂足在 AB 延长线上）。第 4 题：圆 O 半径 83 像素，B 取 OA 上一点。
#import "G-base.typ": *

// 第 2 题左图
#let fig-G-ex21-2a(width: 340 * k) = px-canvas(340, 220, origin: (140, 280), width: width, (p, u) => {
  import cetz.draw: *
  let A = (167, 478)
  let C = (443, 478)
  let B = (268, 308)
  let E = G-foot(C, A, B)
  seg(p, A, B)
  seg(p, A, C)
  seg(p, B, C)
  seg(p, E, C)
  rtmark(p, E, B, C, s: 9)
  anglearc(p, A, C, B, 30)
  lbl(p, (219, 459), $60°$, dir: "c", d: 0)
  lbl(p, A, $A$, dir: "sw", d: 9)
  lbl(p, B, $B$, dir: "n", d: 9)
  lbl(p, C, $C$, dir: "se", d: 9)
})

// 第 2 题右图
#let fig-G-ex21-2b(width: 400 * k) = px-canvas(400, 200, origin: (480, 300), width: width, (p, u) => {
  import cetz.draw: *
  let A = (508, 480)
  let C = (850, 480)
  let E = (508 + 171 * 0.5, 480 - 171 * 0.866)
  let B = (508 + 110 * 0.5, 480 - 110 * 0.866)
  seg(p, A, E)
  seg(p, A, C)
  seg(p, B, C)
  seg(p, E, C)
  rtmark(p, E, A, C, s: 9)
  anglearc(p, A, C, E, 30)
  lbl(p, (556, 460), $60°$, dir: "c", d: 0)
  lbl(p, A, $A$, dir: "sw", d: 9)
  lbl(p, B, $B$, dir: "w", d: 9)
  lbl(p, C, $C$, dir: "se", d: 9)
})

// 第 3 题：直角三角形 ABC，BD ⊥ AC
#let fig-G-ex21-3(width: 340 * k) = px-canvas(340, 190, origin: (160, 660), width: width, (p, u) => {
  import cetz.draw: *
  let A = (188, 828)
  let C = (470, 828)
  let B = (287, 690)
  let D = (287, 828)
  seg(p, A, B)
  seg(p, B, C)
  seg(p, A, C)
  seg(p, B, D)
  rtmark(p, D, B, C, s: 9)
  lbl(p, A, $A$, dir: "sw", d: 9)
  lbl(p, B, $B$, dir: "n", d: 9)
  lbl(p, C, $C$, dir: "e", d: 11)
  lbl(p, D, $D$, dir: "s", d: 11)
})

// 第 4 题：圆 O 与以 OA 为直径的小圆
#let fig-G-ex21-4(width: 240 * k) = px-canvas(240, 140, origin: (590, 650), width: width, (p, u) => {
  import cetz.draw: *
  let O = (700, 757)
  let O1 = (658.5, 757)
  let A = (617, 757)
  let A2 = (783, 757)
  let B = (678, 757)
  let C = (678, 757 - calc.sqrt(41.5 * 41.5 - 19.5 * 19.5))
  let D = (678, 757 - calc.sqrt(83 * 83 - 22 * 22))
  circ(p, O, 83)
  circ(p, O1, 41.5)
  G-bold(p, A, O)
  line(p(..O), p(..A2), stroke: dsh)
  G-bold(p, B, D)
  dseg(p, A, C)
  dseg(p, A, D)
  rtmark(p, B, O, D, s: 8)
  ring(p, O1, r: 3)
  ring(p, O, r: 3)
  lbl(p, A, $A$, dir: "w", d: 9)
  lbl(p, A2, $A'$, dir: "e", d: 10)
  lbl(p, D, $D$, dir: "n", d: 9)
  lbl(p, C, $C$, dir: "e", d: 10)
  lbl(p, (656, 776), $O_1$, dir: "c", d: 0)
  lbl(p, (681, 774), $B$, dir: "c", d: 0)
  lbl(p, (704, 774), $O$, dir: "c", d: 0)
})
