// 习题 4·3 第 6、8、10 题插图（原书 p.226–227）、习题 4·4 第 8、10 和 11 题插图（p.235）；页面 200 dpi 坐标。
#import "M-base.typ": *

// 习题 4·3 第 6 题（四边形 ABDC 的六条线段全画出，∠1、∠2 在 A、D 处）
#let fig-M-ex43-q6(width: 265 * k) = px-canvas(265, 250, origin: (595, 795), width: width, (p, u) => {
  import cetz.draw: *
  let O = (731, 921)
  let r = 112
  circ(p, O, r)
  let A = M-pt(O, r, 184)
  let B = M-pt(O, r, 294)
  let C = M-pt(O, r, 241)
  let D = M-pt(O, r, 351)
  M-bold(p, A, D)
  M-bold(p, A, B)
  M-bold(p, A, C)
  M-bold(p, D, B)
  M-bold(p, D, C)
  M-bold(p, C, B)
  M-ctr(p, O)
  lbl(p, O, $O$, dir: "e", d: 11)
  lbl(p, A, $A$, dir: "w", d: 10)
  lbl(p, D, $D$, dir: "e", d: 10)
  lbl(p, C, $C$, dir: "sw", d: 9)
  lbl(p, B, $B$, dir: "se", d: 9)
  lbl(p, (666, 942), $1$, dir: "c", d: 0)
  lbl(p, (792, 947), $2$, dir: "c", d: 0)
})

// 习题 4·3 第 8 题（割线 MBA、MDC，∠OMA = ∠OMC）
#let fig-M-ex43-q8(width: 430 * k) = px-canvas(430, 250, origin: (125, 250), width: width, (p, u) => {
  import cetz.draw: *
  let O = (252, 371)
  let r = 113
  let Mm = (524, 371)
  circ(p, O, r)
  let (B, A) = M-sec(O, r, Mm, (-0.95, -0.312))
  let (D, C) = M-sec(O, r, Mm, (-0.95, 0.312))
  M-bold(p, Mm, A)
  M-bold(p, Mm, C)
  M-bold(p, O, Mm)
  M-ctr(p, O)
  lbl(p, A, $A$, dir: "nw", d: 9)
  lbl(p, B, $B$, dir: "ne", d: 9)
  lbl(p, D, $D$, dir: "se", d: 9)
  lbl(p, C, $C$, dir: "sw", d: 9)
  lbl(p, O, $O$, dir: "s", d: 11)
  lbl(p, Mm, $M$, dir: "e", d: 11)
})

// 习题 4·3 第 10 题（AB 是直径）
#let fig-M-ex43-q10(width: 270 * k) = px-canvas(270, 250, origin: (570, 250), width: width, (p, u) => {
  import cetz.draw: *
  let O = (710, 371)
  let r = 112
  circ(p, O, r)
  let A = M-pt(O, r, 180)
  let B = M-pt(O, r, 0)
  let C = M-pt(O, r, -66)
  M-bold(p, A, B)
  M-bold(p, A, C)
  M-bold(p, C, B)
  M-ctr(p, O)
  lbl(p, O, $O$, dir: "n", d: 10)
  lbl(p, A, $A$, dir: "w", d: 10)
  lbl(p, B, $B$, dir: "e", d: 10)
  lbl(p, C, $C$, dir: "se", d: 9)
})

// 习题 4·4 第 8 题（割线 MN、PN，N 在圆外）
#let fig-M-ex44-q8(width: 420 * k) = px-canvas(420, 210, origin: (130, 195), width: width, (p, u) => {
  import cetz.draw: *
  let O = (260, 288)
  let r = 75
  let N = (531, 258)
  let P = (148, 220)
  let Mm = (178, 383)
  circ(p, O, r)
  let (C, D) = M-sec(O, r, N, (P.at(0) - N.at(0), P.at(1) - N.at(1)))
  let (B, A) = M-sec(O, r, N, (Mm.at(0) - N.at(0), Mm.at(1) - N.at(1)))
  M-bold(p, P, N)
  M-bold(p, Mm, N)
  lbl(p, P, $P$, dir: "w", d: 9)
  lbl(p, D, $D$, dir: "nw", d: 8)
  lbl(p, C, $C$, dir: "ne", d: 8)
  lbl(p, N, $N$, dir: "e", d: 10)
  lbl(p, Mm, $M$, dir: "w", d: 9)
  lbl(p, A, $A$, dir: "s", d: 9)
  lbl(p, B, $B$, dir: "se", d: 9)
})

// 习题 4·4 第 10、11 题（AB 是直径，∠1、∠2 在 A 处）
#let fig-M-ex44-q10(width: 270 * k) = px-canvas(270, 255, origin: (585, 170), width: width, (p, u) => {
  import cetz.draw: *
  let O = (722, 298)
  let r = 116
  circ(p, O, r)
  let A = M-pt(O, r, 180)
  let B = M-pt(O, r, 0)
  let C = M-pt(O, r, 110)
  let D = M-pt(O, r, -44)
  M-bold(p, A, B)
  M-bold(p, A, C)
  M-bold(p, A, D)
  M-ctr(p, O)
  lbl(p, O, $O$, dir: "n", d: 10)
  lbl(p, A, $A$, dir: "w", d: 10)
  lbl(p, B, $B$, dir: "e", d: 10)
  lbl(p, C, $C$, dir: "n", d: 9)
  lbl(p, D, $D$, dir: "se", d: 9)
  lbl(p, (634, 285), $1$, dir: "c", d: 0)
  lbl(p, (666, 313), $2$, dir: "c", d: 0)
})
