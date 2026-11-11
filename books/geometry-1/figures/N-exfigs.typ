// 习题 4·5（第 2、7、10、11 题）与习题 4·7（第 7、9、11、17 题）的插图（原书 p.242–243、251–252）；页面 200 dpi 坐标。
// 图中字母按原图；原图右图线端的字母印得像“O”，按题意取作“C”（见备忘）。
#import "N-base.typ": *

// 习题 4·5 第 2 题（p.242）：点在角内、点在角外
#let fig-N-q5-2(width: 700 * k) = px-canvas(700, 250, origin: (160, 170), width: width, (p, u) => {
  import cetz.draw: *
  // 左图
  let (A, D, C, P) = ((205, 372), (445, 372), (375, 203), (392, 317))
  let E = (392, 372)
  let F = N-foot(P, A, C)
  seg(p, A, C)
  seg(p, A, D)
  seg(p, P, E)
  seg(p, P, F)
  rtmark(p, E, A, P, s: 7)
  rtmark(p, F, C, P, s: 7)
  ring(p, P, r: 2.5)
  lbl(p, A, $A$, dir: "w", d: 10)
  lbl(p, C, $C$, dir: "ne", d: 9)
  lbl(p, D, $D$, dir: "e", d: 10)
  lbl(p, P, $P$, dir: "ne", d: 9)
  lbl(p, E, $E$, dir: "s", d: 10)
  lbl(p, F, $F$, dir: "nw", d: 9)
  // 右图
  let (A, D, C, P) = ((505, 372), (778, 372), (770, 250), (650, 195))
  let E = (650, 372)
  let F = N-foot(P, A, C)
  seg(p, A, C)
  seg(p, A, D)
  seg(p, P, E)
  seg(p, P, F)
  rtmark(p, E, A, P, s: 7)
  rtmark(p, F, P, C, s: 7)
  ring(p, P, r: 2.5)
  lbl(p, A, $A$, dir: "w", d: 10)
  lbl(p, C, $C$, dir: "e", d: 10)
  lbl(p, D, $D$, dir: "e", d: 10)
  lbl(p, P, $P$, dir: "n", d: 9)
  lbl(p, E, $E$, dir: "s", d: 10)
  lbl(p, F, $F$, dir: "se", d: 9)
})

// 习题 4·5 第 7 题（p.242）
#let fig-N-q5-7(width: 260 * k) = px-canvas(260, 250, origin: (600, 980), width: width, (p, u) => {
  import cetz.draw: *
  let c = (733, 1100)
  let r = 104
  let (A, B, C, D) = (N-cp(c, r, 77), N-cp(c, r, 149), N-cp(c, r, 200), N-cp(c, r, -61))
  circ(p, c, r)
  poly(p, (A, B, C, D), close: true)
  anglearc(p, B, A, C, 13)
  lbl(p, (676, 1066), tsm[$120°$], dir: "c", d: 0)
  lbl(p, A, $A$, dir: "ne", d: 9)
  lbl(p, B, $B$, dir: "nw", d: 9)
  lbl(p, C, $C$, dir: "sw", d: 9)
  lbl(p, D, $D$, dir: "se", d: 9)
})

// 习题 4·5 第 10 题（p.243）
#let fig-N-q5-10(width: 340 * k) = px-canvas(340, 385, origin: (140, 322), width: width, (p, u) => {
  import cetz.draw: *
  let (A, B, C) = ((322, 335), (158, 678), (422, 678))
  let N = ((A.at(0) + B.at(0)) / 2, (A.at(1) + B.at(1)) / 2)
  let M = ((A.at(0) + C.at(0)) / 2, (A.at(1) + C.at(1)) / 2)
  let nAC = (-(C.at(1) - A.at(1)), C.at(0) - A.at(0))
  let nAB = (-(B.at(1) - A.at(1)), B.at(0) - A.at(0))
  let P = N-meet(M, (M.at(0) + nAC.at(0), M.at(1) + nAC.at(1)), A, B)
  let Q = N-meet(N, (N.at(0) + nAB.at(0), N.at(1) + nAB.at(1)), A, C)
  poly(p, (A, B), close: false)
  poly(p, (A, C), close: false)
  seg(p, B, C, stroke: lb)
  seg(p, N, Q)
  seg(p, M, P)
  seg(p, N, M, stroke: dsh)
  seg(p, P, Q, stroke: dsh)
  anglearc(p, N, A, M, 20)
  anglearc(p, B, A, C, 20)
  anglearc(p, Q, A, P, 26)
  rtmark(p, N, Q, B, s: 8)
  rtmark(p, M, P, C, s: 8)
  N-num(p, 272, 489, $1$)
  lbl(p, A, $A$, dir: "n", d: 9)
  lbl(p, B, $B$, dir: "sw", d: 9)
  lbl(p, C, $C$, dir: "se", d: 9)
  lbl(p, N, $N$, dir: "nw", d: 9)
  lbl(p, M, $M$, dir: "ne", d: 9)
  lbl(p, P, $P$, dir: "w", d: 10)
  lbl(p, Q, $Q$, dir: "se", d: 9)
})

// 习题 4·5 第 11 题（p.243）
#let fig-N-q5-11(width: 350 * k) = px-canvas(350, 285, origin: (490, 415), width: width, (p, u) => {
  import cetz.draw: *
  let (A, B, C) = ((528, 678), (815, 678), (716, 423))
  let D = N-foot(A, B, C)
  let E = N-foot(B, A, C)
  poly(p, (A, C, B), close: false)
  seg(p, A, B, stroke: lb)
  seg(p, A, D)
  seg(p, B, E)
  seg(p, E, D)
  rtmark(p, D, A, B, s: 8)
  rtmark(p, E, B, A, s: 8)
  lbl(p, A, $A$, dir: "w", d: 10)
  lbl(p, B, $B$, dir: "e", d: 10)
  lbl(p, C, $C$, dir: "n", d: 9)
  lbl(p, D, $D$, dir: "e", d: 10)
  lbl(p, E, $E$, dir: "nw", d: 9)
})

// 习题 4·7 第 7 题（p.251）
#let fig-N-q7-7(width: 230 * k) = px-canvas(230, 255, origin: (160, 830), width: width, (p, u) => {
  import cetz.draw: *
  let O = (272, 997)
  let B = (194, 997)
  let A = (350, 997)
  let D = (272, 919)
  let C = (194, 841)
  circ(p, O, 78)
  seg(p, B, C)
  seg(p, C, A)
  seg(p, B, D)
  seg(p, B, A)
  ring(p, O, r: 2.5)
  lbl(p, O, $O$, dir: "s", d: 11)
  lbl(p, A, $A$, dir: "e", d: 10)
  lbl(p, B, $B$, dir: "w", d: 10)
  lbl(p, C, $C$, dir: "nw", d: 9)
  lbl(p, D, $D$, dir: "ne", d: 9)
})

// 习题 4·7 第 9 题（p.251）
#let fig-N-q7-9(width: 400 * k) = px-canvas(400, 335, origin: (470, 770), width: width, (p, u) => {
  import cetz.draw: *
  let O = (646, 939)
  let r = 111
  let th = 9.5deg
  let T = (646 + r * calc.cos(th), 939 - r * calc.sin(th))
  let dx = calc.sin(th)
  let dy = calc.cos(th)
  let at(y) = (T.at(0) + (y - T.at(1)) / dy * dx, y)
  let K = at(828)
  let L = at(1050)
  circ(p, O, r)
  seg(p, (497, 828), (812, 828))
  seg(p, (487, 1050), (812, 1050))
  seg(p, at(783), at(1097))
  seg(p, O, K)
  seg(p, O, L)
  ring(p, O, r: 2.5)
  lbl(p, O, $O$, dir: "sw", d: 10)
  lbl(p, (497, 828), $A$, dir: "w", d: 11)
  lbl(p, (812, 828), $B$, dir: "e", d: 12)
  lbl(p, (487, 1050), $C$, dir: "w", d: 11)
  lbl(p, (812, 1050), $D$, dir: "e", d: 12)
  lbl(p, K, $K$, dir: "ne", d: 10)
  lbl(p, L, $L$, dir: "ne", d: 10)
})

// 习题 4·7 第 11 题（p.252）
#let fig-N-q7-11(width: 270 * k) = px-canvas(270, 195, origin: (590, 295), width: width, (p, u) => {
  import cetz.draw: *
  let O = (689, 396)
  let M = (689, 318)
  let h = calc.sqrt(78 * 78 - 50 * 50)
  let A = (689 - h, 346)
  let B = (689 + h, 346)
  circ(p, O, 78)
  seg(p, (607, 318), (838, 318))
  seg(p, A, B)
  seg(p, M, O, stroke: dsh)
  ring(p, O, r: 2.5)
  lbl(p, O, $O$, dir: "s", d: 11)
  lbl(p, M, $M$, dir: "n", d: 10)
  lbl(p, A, $A$, dir: "w", d: 10)
  lbl(p, B, $B$, dir: "e", d: 10)
  lbl(p, (838, 318), $P$, dir: "e", d: 10)
})

// 习题 4·7 第 17 题（p.252）定心仪
#let fig-N-q7-17(width: 330 * k) = px-canvas(330, 305, origin: (540, 905), width: width, (p, u) => {
  import cetz.draw: *
  let O = (696, 1061)
  let r = 112.5
  // 定心仪的两条薄板和角平分板
  line(p(555, 919), p(852, 919), p(852, 947), p(585, 947), p(585, 1196), stroke: lw)
  line(p(555, 919), p(555, 1194), stroke: lw)
  line(p(555, 1194), p(580, 1197), p(620, 1192), p(670, 1198), p(720, 1192), p(770, 1197), p(819, 1190), stroke: lw)
  line(p(555, 919), p(819, 1190), stroke: lw)
  // 圆件：右上部分实线，被定心仪遮住的部分虚线
  arc(p(..O), start: -50deg, stop: 105deg, radius: r, anchor: "origin", stroke: lw)
  arc(p(..O), start: 105deg, stop: 310deg, radius: r, anchor: "origin", stroke: dsh)
  seg(p, O, N-cp(O, r, 52))
  seg(p, O, N-cp(O, r, 232), stroke: dsh)
  ring(p, O, r: 2.5)
  lbl(p, (632, 1180), text(font: fonts.kai, size: 8pt)[定心仪], dir: "c", d: 0)
})
