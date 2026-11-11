// 图 2·25–2·33（p.141–148）；页面渲染 dpi 120。
#import "H-base.typ": *

// 图 2·25：割线定理，PAB、PCD 为圆的两条割线
#let fig-H-2-25(width: 430 * k) = px-canvas(430, 225, origin: (320, 795), width: width, (p, u) => {
  import cetz.draw: *
  let O = (616, 913)
  let r = 100
  let P = (341, 942)
  let B = cpt(O, r, 63)
  let D = cpt(O, r, -13)
  let A = lc2(P, B, O, r)
  let C = lc2(P, D, O, r)
  circ(p, O, r)
  seg(p, P, B)
  seg(p, P, D)
  dseg(p, A, D)
  dseg(p, C, B)
  anglearc(p, P, A, C, 32)
  amk(p, B, A, C, 20, n: 2)
  amk(p, D, A, C, 20, n: 2)
  lbl(p, P, $P$, dir: "w", d: 11)
  lbl(p, A, $A$, dir: "nw", d: 11)
  lbl(p, B, $B$, dir: "ne", d: 10)
  lbl(p, C, $C$, dir: "sw", d: 11)
  lbl(p, D, $D$, dir: "e", d: 11)
})

// 图 2·26：切线割线定理，PT 切圆于 T，PAB 为割线
#let fig-H-2-26(width: 400 * k) = px-canvas(400, 225, origin: (285, 555), width: width, (p, u) => {
  import cetz.draw: *
  let O = (561, 663)
  let r = 100
  let T = cpt(O, r, 126.87)
  let A = cpt(O, r, 219.6)
  let B = (2 * O.at(0) - A.at(0), A.at(1))
  let tn = (T.at(0) + (T.at(1) - O.at(1)) * -1, T.at(1) + (T.at(0) - O.at(0)))   // T 点切线上的另一点
  let P = isect(T, tn, A, B)
  circ(p, O, r)
  seg(p, P, T)
  seg(p, P, B)
  dseg(p, A, T)
  dseg(p, T, B)
  anglearc(p, T, P, A, 28)
  anglearc(p, B, T, A, 30)
  lbl(p, P, $P$, dir: "w", d: 11)
  lbl(p, T, $T$, dir: "nw", d: 10)
  lbl(p, A, $A$, dir: "sw", d: 11)
  lbl(p, B, $B$, dir: "se", d: 11)
})

// 图 2·27：例 1，圆 O 的割线 PAB，PO 交圆于 C、D
#let fig-H-2-27(width: 340 * k) = px-canvas(340, 270, origin: (535, 195), width: width, (p, u) => {
  import cetz.draw: *
  let O = (721, 326)
  let r = 125
  let P = (548, 326)
  let C = (596, 326)
  let D = (846, 326)
  let B = cpt(O, r, 49.4)
  let A = lc2(P, B, O, r)
  circ(p, O, r)
  seg(p, P, B)
  seg(p, P, D)
  ring(p, O)
  lbl(p, P, $P$, dir: "w", d: 11)
  lbl(p, A, $A$, dir: "nw", d: 11)
  lbl(p, B, $B$, dir: "ne", d: 10)
  lbl(p, C, $C$, dir: "sw", d: 11)
  lbl(p, D, $D$, dir: "e", d: 11)
  lbl(p, O, $O$, dir: "s", d: 11)
})

// 图 2·28：例 2，两个相交圆的公共弦 AB 的延长线上一点 P，PT₁、PT₂ 为切线
#let fig-H-2-28(width: 320 * k) = px-canvas(320, 340, origin: (585, 770), width: width, (p, u) => {
  import cetz.draw: *
  let c1 = (768, 850)
  let r1 = 75.5
  let c2 = (772, 975)
  let r2 = 102.5
  let A = cc2(c1, r1, c2, r2, 1)
  let B = cc2(c1, r1, c2, r2, -1)
  let (A, B) = if A.at(0) < B.at(0) { (A, B) } else { (B, A) }
  let P = (600, A.at(1) + (B.at(1) - A.at(1)) / (B.at(0) - A.at(0)) * (600 - A.at(0)))
  let ta = tanp(P, c1, r1, 1)
  let tb = tanp(P, c1, r1, -1)
  let T1 = if ta.at(1) < tb.at(1) { ta } else { tb }
  let ua = tanp(P, c2, r2, 1)
  let ub = tanp(P, c2, r2, -1)
  let T2 = if ua.at(1) > ub.at(1) { ua } else { ub }
  circ(p, c1, r1)
  circ(p, c2, r2)
  seg(p, P, B)
  seg(p, P, T1)
  seg(p, P, T2)
  lbl(p, P, $P$, dir: "w", d: 11)
  lbl(p, T1, $T_1$, dir: "nw", d: 11)
  lbl(p, T2, $T_2$, dir: "sw", d: 11)
  lbl(p, A, $A$, dir: "s", d: 11)
  lbl(p, B, $B$, dir: "se", d: 11)
})

// 图 2·29：例 3，AD 为 AB 和 AC 的比例中项，证明 AD 切 B、C、D 三点所决定的圆于 D
#let fig-H-2-29(width: 350 * k) = px-canvas(350, 235, origin: (495, 175), width: width, (p, u) => {
  import cetz.draw: *
  let O = (723, 278)
  let r = 102
  let dx = calc.sqrt(r * r - 56 * 56)
  let B = (O.at(0) - dx, 334)
  let C = (O.at(0) + dx, 334)
  let A = (520, 334)
  let A1 = (550, 334)
  let ta = tanp(A1, O, r, 1)
  let tb = tanp(A1, O, r, -1)
  let D = if ta.at(1) < tb.at(1) { ta } else { tb }
  circ(p, O, r)
  seg(p, A, C)
  seg(p, A, D)
  dseg(p, A1, D)
  dseg(p, B, D)
  dseg(p, D, C)
  amk(p, A, D, C, 20, n: 2)
  anglearc(p, C, D, A, 24)
  anglearc(p, D, A1, B, 30)
  lbl(p, A, $A$, dir: "w", d: 11)
  lbl(p, A1, $A'$, dir: "s", d: 11)
  lbl(p, B, $B$, dir: "s", d: 11)
  lbl(p, C, $C$, dir: "se", d: 11)
  lbl(p, D, $D$, dir: "nw", d: 10)
})

// 图 2·30：相交弦定理，圆内一点 P 的两弦 AB、CD
#let fig-H-2-30(width: 280 * k) = px-canvas(280, 290, origin: (565, 975), width: width, (p, u) => {
  import cetz.draw: *
  let O = (695, 1118)
  let r = 125
  let D = cpt(O, r, 98.9)
  let A = cpt(O, r, 256.5)
  let B = cpt(O, r, 54.2)
  let C = cpt(O, r, -25.6)
  let P = isect(A, B, C, D)
  circ(p, O, r)
  seg(p, A, B)
  seg(p, D, C)
  dseg(p, D, B)
  dseg(p, A, C)
  anglearc(p, P, D, B, 20)
  anglearc(p, P, A, C, 20)
  amk(p, B, P, D, 20, n: 2)
  amk(p, C, P, A, 20, n: 2)
  lbl(p, P, $P$, dir: "sw", d: 11)
  lbl(p, A, $A$, dir: "sw", d: 11)
  lbl(p, B, $B$, dir: "ne", d: 10)
  lbl(p, C, $C$, dir: "se", d: 11)
  lbl(p, D, $D$, dir: "nw", d: 10)
})

// 图 2·31：例 1，圆 O 内过 P 的两弦 APB、CPD
#let fig-H-2-31(width: 235 * k) = px-canvas(235, 235, origin: (665, 488), width: width, (p, u) => {
  import cetz.draw: *
  let O = (779, 600)
  let r = 101
  let A = cpt(O, r, 163.4)
  let B = cpt(O, r, 63.2)
  let C = cpt(O, r, 119.5)
  let D = cpt(O, r, -37.4)
  let P = isect(A, B, C, D)
  circ(p, O, r)
  seg(p, A, B)
  seg(p, C, D)
  ring(p, O)
  lbl(p, A, $A$, dir: "w", d: 11)
  lbl(p, B, $B$, dir: "ne", d: 10)
  lbl(p, C, $C$, dir: "nw", d: 10)
  lbl(p, D, $D$, dir: "se", d: 11)
  lbl(p, P, $P$, dir: "sw", d: 11)
  lbl(p, O, $O$, dir: "s", d: 11)
})

// 图 2·32：例 2，线段 AB、CD 交于 P，PA·PB = PC·PD，证 A、B、C、D 共圆
#let fig-H-2-32(width: 330 * k) = px-canvas(330, 300, origin: (590, 975), width: width, (p, u) => {
  import cetz.draw: *
  let O = (741, 1115)
  let r = 140
  let C = cpt(O, r, 164.7)
  let D = cpt(O, r, 18.2)
  let B = cpt(O, r, 50)
  let A = cpt(O, r, 206.8)
  let P = isect(A, B, C, D)
  circ(p, O, r)
  seg(p, A, B)
  seg(p, C, D)
  dseg(p, B, D)
  dseg(p, A, C)
  anglearc(p, P, D, B, 24)
  anglearc(p, P, C, A, 24)
  amk(p, B, A, D, 20, n: 2)
  amk(p, C, D, A, 20, n: 2)
  lbl(p, P, $P$, dir: "s", d: 12)
  lbl(p, A, $A$, dir: "sw", d: 11)
  lbl(p, B, $B$, dir: "ne", d: 10)
  lbl(p, C, $C$, dir: "w", d: 11)
  lbl(p, D, $D$, dir: "e", d: 11)
})

// 图 2·33：例 3，P 为弦 AB 上的任意点，PC ⊥ OP，PC 交圆于 C
#let fig-H-2-33(width: 290 * k) = px-canvas(290, 270, origin: (555, 588), width: width, (p, u) => {
  import cetz.draw: *
  let O = (687, 721)
  let r = 125
  let P = (687, 658)
  let dx = calc.sqrt(r * r - 63 * 63)
  let C = (O.at(0) + dx, 658)
  let C1 = (O.at(0) - dx, 658)
  let A = cpt(O, r, 204)
  let B = lc2(P, A, O, r)
  circ(p, O, r)
  seg(p, A, B)
  line(p(..P), p(..C), stroke: lb)
  dseg(p, C1, P)
  line(p(..P), p(..O), stroke: lb)
  rtmark(p, P, C, O, s: 7)
  ring(p, O)
  lbl(p, P, $P$, dir: "nw", d: 11)
  lbl(p, A, $A$, dir: "sw", d: 11)
  lbl(p, B, $B$, dir: "ne", d: 10)
  lbl(p, C, $C$, dir: "e", d: 11)
  lbl(p, C1, $C'$, dir: "w", d: 13)
  lbl(p, O, $O$, dir: "s", d: 11)
})
