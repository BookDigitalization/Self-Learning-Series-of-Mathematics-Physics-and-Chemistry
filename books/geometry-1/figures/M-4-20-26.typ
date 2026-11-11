// 图 4·20、4·21（原书 p.228）、图 4·22、4·23、4·24（p.229）、图 4·25、4·26（p.230）；页面 200 dpi 坐标。
// 图 4·22 里 ∠AOB 的记号原图印的是 d（可能是 α 印得像 d），照录为 d，见备忘。
#import "M-base.typ": *

// 图 4·20 圆心角和它所对的弧（箭头表示旋转方向）
#let fig-M-4-20(width: 250 * k) = px-canvas(250, 255, origin: (170, 300), width: width, (p, u) => {
  import cetz.draw: *
  let O = (288, 426)
  let r = 111
  circ(p, O, r)
  let A = M-pt(O, r, 21)
  let B = M-pt(O, r, 67.5)
  let A2 = M-pt(O, r, -90)
  let B2 = M-pt(O, r, -43)
  M-bold(p, O, A)
  M-bold(p, O, B)
  M-bold(p, O, A2)
  M-bold(p, O, B2)
  anglearc(p, O, A, B, 20)
  anglearc(p, O, A2, B2, 22)
  arc(p(..O), start: -34deg, delta: 36deg, radius: 43, anchor: "origin", stroke: lt, mark: (end: "stealth", fill: black, scale: 0.45))
  M-ctr(p, O)
  lbl(p, B, $B$, dir: "n", d: 9)
  lbl(p, A, $A$, dir: "ne", d: 9)
  lbl(p, B2, $B'$, dir: "se", d: 10)
  lbl(p, A2, $A'$, dir: "s", d: 10)
  lbl(p, O, $O$, dir: "w", d: 10)
})

// 图 4·21 n° 的圆心角所对的弧是 n° 的弧
#let fig-M-4-21(width: 330 * k) = px-canvas(330, 240, origin: (535, 330), width: width, (p, u) => {
  import cetz.draw: *
  let O = (656, 436)
  let r = 113
  circ(p, O, r)
  let E = M-pt(O, r, 35)
  let F = M-pt(O, r, -26)
  M-arc(p, O, r, -26, 35, stroke: lb)
  M-bold(p, O, E)
  M-bold(p, O, F)
  anglearc(p, O, E, F, 24)
  M-ctr(p, O)
  lbl(p, (694, 436), $n°$, dir: "c", d: 0)
  lbl(p, E, $E$, dir: "ne", d: 9)
  lbl(p, F, $F$, dir: "se", d: 9)
  lbl(p, O, $O$, dir: "w", d: 10)
  content(p(812, 433), tt[$n°$的弧])
})

// 图 4·22 同心圆：∠AOB = d（原图与正文印的都是 d），弧 AB 和 A′B′ 度数相同、长度不等
#let fig-M-4-22(width: 260 * k) = px-canvas(260, 250, origin: (150, 315), width: width, (p, u) => {
  import cetz.draw: *
  let O = (276, 440)
  let r1 = 117
  let r2 = 87
  circ(p, O, r1)
  circ(p, O, r2)
  let A = M-pt(O, r1, -45.5)
  let B = M-pt(O, r1, 45.5)
  let A2 = M-pt(O, r2, -45.5)
  let B2 = M-pt(O, r2, 45.5)
  M-bold(p, O, A)
  M-bold(p, O, B)
  anglearc(p, O, A, B, 14)
  M-ctr(p, O)
  lbl(p, (299, 440), $d$, dir: "c", d: 0)
  lbl(p, O, $O$, dir: "w", d: 10)
  lbl(p, B, $B$, dir: "ne", d: 9)
  lbl(p, B2, $B'$, dir: "nw", d: 9)
  lbl(p, A2, $A'$, dir: "ne", d: 9)
  lbl(p, A, $A$, dir: "se", d: 9)
})

// 图 4·23 圆周角 ∠P
#let fig-M-4-23(width: 250 * k) = px-canvas(250, 250, origin: (535, 315), width: width, (p, u) => {
  import cetz.draw: *
  let O = (658, 440)
  let r = 112
  circ(p, O, r)
  let P = M-pt(O, r, 90)
  let A = M-pt(O, r, 189)
  let B = M-pt(O, r, -28)
  M-bold(p, P, A)
  M-bold(p, P, B)
  M-ctr(p, O)
  lbl(p, P, $P$, dir: "n", d: 9)
  lbl(p, A, $A$, dir: "sw", d: 9)
  lbl(p, B, $B$, dir: "se", d: 9)
  lbl(p, O, $O$, dir: "s", d: 11)
})

// 图 4·24 圆周角定理的三种情况（(1)(2)(3)）
#let fig-M-4-24(width: 740 * k) = px-canvas(740, 280, origin: (105, 895), width: width, (p, u) => {
  import cetz.draw: *
  // (1) 一边通过圆心
  let O = (220, 1012)
  let r = 102
  circ(p, O, r)
  let P = M-pt(O, r, 45.5)
  let A = M-pt(O, r, 225.5)
  let B = M-pt(O, r, -22)
  M-bold(p, P, A)
  M-bold(p, P, B)
  dseg(p, O, B)
  anglearc(p, P, A, B, 14)
  anglearc(p, B, O, P, 14)
  anglearc(p, O, A, B, 13)
  anglearc(p, O, A, B, 18)
  M-ctr(p, O)
  lbl(p, P, $P$, dir: "ne", d: 9)
  lbl(p, A, $A$, dir: "sw", d: 9)
  lbl(p, B, $B$, dir: "se", d: 9)
  lbl(p, O, $O$, dir: "nw", d: 9)
  lbl(p, (225, 1161), $(1)$, dir: "c", d: 0)
  // (2) 圆心在角内，作直径 PS
  let O2 = (475, 1016)
  let r2 = 101
  circ(p, O2, r2)
  let P2 = M-pt(O2, r2, 90)
  let S2 = M-pt(O2, r2, 270)
  let A2 = M-pt(O2, r2, 196)
  let B2 = M-pt(O2, r2, -40)
  M-bold(p, P2, A2)
  M-bold(p, P2, B2)
  dseg(p, P2, S2)
  dseg(p, O2, A2)
  dseg(p, O2, B2)
  M-ctr(p, O2)
  lbl(p, P2, $P$, dir: "n", d: 9)
  lbl(p, A2, $A$, dir: "sw", d: 9)
  lbl(p, B2, $B$, dir: "se", d: 9)
  lbl(p, S2, $S$, dir: "s", d: 10)
  lbl(p, O2, $O$, dir: "nw", d: 9)
  lbl(p, (475, 1158), $(2)$, dir: "c", d: 0)
  // (3) 圆心在角外，作直径 PS
  let O3 = (725, 1020)
  let r3 = 98
  circ(p, O3, r3)
  let P3 = M-pt(O3, r3, 98)
  let S3 = M-pt(O3, r3, 278)
  let A3 = M-pt(O3, r3, 186)
  let B3 = M-pt(O3, r3, 223)
  M-bold(p, P3, A3)
  M-bold(p, P3, B3)
  M-bold(p, P3, S3)
  dseg(p, O3, A3)
  dseg(p, O3, B3)
  M-ctr(p, O3)
  lbl(p, P3, $P$, dir: "n", d: 9)
  lbl(p, A3, $A$, dir: "w", d: 10)
  lbl(p, B3, $B$, dir: "sw", d: 9)
  lbl(p, S3, $S$, dir: "se", d: 9)
  lbl(p, O3, $O$, dir: "e", d: 10)
  lbl(p, (737, 1157), $(3)$, dir: "c", d: 0)
})

// 图 4·25 半圆上的圆周角是直角
#let fig-M-4-25(width: 260 * k) = px-canvas(260, 265, origin: (190, 935), width: width, (p, u) => {
  import cetz.draw: *
  let O = (318, 1063)
  let r = 111
  circ(p, O, r)
  let A = M-pt(O, r, 180)
  let B = M-pt(O, r, 0)
  let P = M-pt(O, r, 72.5)
  let Q = M-pt(O, r, 270)
  M-bold(p, P, A)
  M-bold(p, P, B)
  dseg(p, A, B)
  rtmark(p, P, A, B, s: 9)
  M-ctr(p, O)
  lbl(p, P, $P$, dir: "ne", d: 9)
  lbl(p, A, $A$, dir: "w", d: 10)
  lbl(p, B, $B$, dir: "e", d: 10)
  lbl(p, O, $O$, dir: "s", d: 11)
  lbl(p, Q, $Q$, dir: "s", d: 10)
})

// 图 4·26 同一条弧上的圆周角都相等
#let fig-M-4-26(width: 250 * k) = px-canvas(250, 265, origin: (570, 935), width: width, (p, u) => {
  import cetz.draw: *
  let O = (689, 1063)
  let r = 113
  circ(p, O, r)
  let P = M-pt(O, r, 165)
  let Q = M-pt(O, r, 86)
  let R = M-pt(O, r, 57.5)
  let A = M-pt(O, r, 217.5)
  let B = M-pt(O, r, -31.5)
  for t in (P, Q, R) {
    M-bold(p, t, A)
    M-bold(p, t, B)
    anglearc(p, t, A, B, 15)
  }
  dseg(p, O, A)
  dseg(p, O, B)
  anglearc(p, O, A, B, 13)
  anglearc(p, O, A, B, 18)
  M-ctr(p, O)
  lbl(p, P, $P$, dir: "nw", d: 9)
  lbl(p, Q, $Q$, dir: "n", d: 9)
  lbl(p, R, $R$, dir: "ne", d: 9)
  lbl(p, A, $A$, dir: "sw", d: 9)
  lbl(p, B, $B$, dir: "se", d: 9)
  lbl(p, O, $O$, dir: "n", d: 9)
})
