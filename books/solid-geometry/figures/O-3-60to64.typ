// 图 3·60 (1)(2)、3·61（原书 p.269）、3·62、3·63（p.270）、3·64（p.271）；页面 200 dpi 坐标。
#import "O-base.typ": *

// 图 3·60 (1) 过不是直径端点的两点的大圆
#let fig-O-3-60a(width: 215 * k) = px-canvas(215, 225, origin: (218, 222), width: width, (p, u) => {
  import cetz.draw: *
  let O = (325, 331)
  let r = 101
  circ(p, O, r, stroke: lb)
  O-earc(p, O, 101, 40, 0, 180, rot: 23, st: dsh)
  O-earc(p, O, 101, 40, 180, 360, rot: 23)
  let A = O-ept(O, 101, 40, 248, rot: 23)
  let B = O-ept(O, 101, 40, 295, rot: 23)
  circle(p(..O), radius: 2.6, stroke: lt, fill: white)
  circle(p(..A), radius: 2.6, stroke: lt, fill: white)
  circle(p(..B), radius: 2.6, stroke: lt, fill: white)
  L(p, 337, 330, $O$)
  L(p, 297, 410, $A$)
  L(p, 395, 368, $B$)
})

// 图 3·60 (2) 过直径两端点的大圆
#let fig-O-3-60b(width: 215 * k) = px-canvas(215, 240, origin: (585, 205), width: width, (p, u) => {
  import cetz.draw: *
  let O = (692, 318)
  let r = 100
  circ(p, O, r, stroke: lb)
  for rx in (47, 25) {
    O-earc(p, O, rx, r, 90, 270)
    O-earc(p, O, rx, r, -90, 90, st: dsh)
  }
  dseg(p, (692, 218), (692, 418))
  circle(p(..O), radius: 2.6, stroke: lt, fill: white)
  L(p, 692, 208, $A$)
  L(p, 692, 431, $B$)
  L(p, 705, 316, $O$)
})

// 图 3·61 例 2
#let fig-O-3-61(width: 215 * k) = px-canvas(215, 215, origin: (670, 610), width: width, (p, u) => {
  import cetz.draw: *
  let O = (777, 716)
  let r = 101
  circ(p, O, r, stroke: lb)
  let M = (777, 654)
  O-ell(p, M, 79, 21)
  let A = (856, 654)
  dseg(p, M, A)
  dseg(p, M, O)
  dseg(p, O, A)
  rtmark(p, M, A, O, s: 8)
  L(p, 763, 652, $M$)
  L(p, 868, 643, $A$)
  L(p, 776, 731, $O$)
})

// 图 3·62 例 3
#let fig-O-3-62(width: 300 * k) = px-canvas(300, 300, origin: (542, 200), width: width, (p, u) => {
  import cetz.draw: *
  let O = (690, 350)
  let r = 144
  circ(p, O, r, stroke: lb)
  O-ell(p, O, 144, 30)
  let M = (690, 302)
  O-ell(p, M, 136, 38)
  let A = (826, 302)
  let B = (834, 350)
  dseg(p, M, A)
  seg(p, O, M)
  dseg(p, O, B)
  dseg(p, O, A)
  rtmark(p, M, A, O, s: 9)
  anglearc(p, O, B, A, 22)
  Ls(p, 756, 338, [18°])
  L(p, 685, 290, $M$)
  L(p, 842, 297, $A$)
  L(p, 683, 362, $O$)
  L(p, 846, 348, $B$)
})

// 图 3·63 例 4
#let fig-O-3-63(width: 295 * k) = px-canvas(295, 225, origin: (555, 980), width: width, (p, u) => {
  import cetz.draw: *
  let O = (728, 1075)
  let r = 89
  circ(p, O, r, stroke: lb)
  O-ell(p, O, 88, 32)
  let TL = (627, 1124)
  let TR = (847, 1120)
  let ty(x) = 1124 - 4 * (x - 627) / 220
  let dx = calc.sqrt(r * r - (1123 - 1075) * (1123 - 1075))
  seg(p, TL, (728 - dx, ty(728 - dx)))
  dseg(p, (728 - dx, ty(728 - dx)), (728 + dx, ty(728 + dx)))
  seg(p, (728 + dx, ty(728 + dx)), TR)
  poly(p, (TR, (777, 1194), (559, 1196), TL))
  let T = (728, 1164)
  let A = (697, 1164)
  dseg(p, O, T)
  seg(p, O, A)
  line(p(..A), p(..T), stroke: lb)
  rtmark(p, T, A, O, s: 7)
  L(p, 739, 1063, $O$)
  L(p, 694, 1180, $A$)
  L(p, 730, 1180, $T$)
  L(p, 810, 1133, $M$)
})

// 图 3·64 例 5
#let fig-O-3-64(width: 200 * k) = px-canvas(200, 190, origin: (685, 360), width: width, (p, u) => {
  import cetz.draw: *
  let O = (784, 449)
  let r = 89
  circ(p, O, r, stroke: lb)
  O-ell(p, O, 89, 28)
  let A = O-ept(O, 89, 28, 242)
  let B = O-ept(O, 89, 28, 298)
  dseg(p, O, A)
  dseg(p, O, B)
  anglearc(p, O, A, B, 12)
  Ls(p, 787, 466, [50°])
  L(p, 787, 434, $O$)
  L(p, 735, 490, $A$)
  L(p, 840, 487, $B$)
})
