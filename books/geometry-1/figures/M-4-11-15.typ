// 图 4·11（原书 p.221）、图 4·12、4·13（p.222）、图 4·14、4·15（p.223）；页面 200 dpi 坐标。
// 原图是手绘，圆心 O 有的偏离圆的几何中心（图 4·13 等），这里按题设（O 为圆心、弦心距垂直）重建。
#import "M-base.typ": *

// 图 4·11 相等的弧所对的弦、弦心距相等；箭头表示旋转方向
#let fig-M-4-11(width: 260 * k) = px-canvas(260, 260, origin: (570, 455), width: width, (p, u) => {
  import cetz.draw: *
  let O = (702, 587)
  let r = 113
  circ(p, O, r)
  let C = M-pt(O, r, 98)
  let D = M-pt(O, r, 180)
  let A = M-pt(O, r, 229)
  let B = M-pt(O, r, 311)
  let Mm = (O.at(0), A.at(1))
  let N = M-mid(C, D)
  M-bold(p, A, B)
  M-bold(p, C, D)
  M-bold(p, O, Mm)
  M-bold(p, O, N)
  for t in (A, B, C, D) { dseg(p, O, t) }
  // 旋转方向的箭头（圆外，沿 A 向上）
  arc(p(..O), start: 248deg, delta: -29deg, radius: 133, anchor: "origin", stroke: lt, mark: (end: "stealth", fill: black, scale: 0.45))
  M-ctr(p, O)
  lbl(p, C, $C$, dir: "n")
  lbl(p, D, $D$, dir: "w")
  lbl(p, N, $N$, dir: "nw", d: 8)
  lbl(p, O, $O$, dir: "e", d: 11)
  lbl(p, A, $A$, dir: "sw", d: 10)
  lbl(p, B, $B$, dir: "se", d: 10)
  lbl(p, Mm, $M$, dir: "s", d: 10)
})

// 图 4·12 两个等圆
#let fig-M-4-12(width: 585 * k) = px-canvas(585, 255, origin: (215, 180), width: width, (p, u) => {
  import cetz.draw: *
  let r = 111
  // 左圆 O
  let O = (340, 306)
  circ(p, O, r)
  let C = M-pt(O, r, 72)
  let D = M-pt(O, r, 153)
  let A = M-pt(O, r, 229.5)
  let B = M-pt(O, r, 310.5)
  let Mm = (O.at(0), A.at(1))
  let N = M-mid(C, D)
  M-bold(p, A, B)
  M-bold(p, C, D)
  M-bold(p, O, Mm)
  M-bold(p, O, N)
  for t in (A, B, C, D) { dseg(p, O, t) }
  M-ctr(p, O)
  lbl(p, C, $C$, dir: "ne", d: 8)
  lbl(p, D, $D$, dir: "w", d: 10)
  lbl(p, N, $N$, dir: "nw", d: 8)
  lbl(p, O, $O$, dir: "e", d: 10)
  lbl(p, A, $A$, dir: "sw", d: 9)
  lbl(p, B, $B$, dir: "se", d: 9)
  lbl(p, Mm, $M$, dir: "s", d: 10)
  // 右圆 O′
  let O2 = (685, 306)
  circ(p, O2, r)
  let C2 = M-pt(O2, r, 229.5)
  let D2 = M-pt(O2, r, 310.5)
  let N2 = (O2.at(0), C2.at(1))
  M-bold(p, C2, D2)
  M-bold(p, O2, N2)
  dseg(p, O2, C2)
  dseg(p, O2, D2)
  M-ctr(p, O2)
  lbl(p, O2, $O'$, dir: "ne", d: 10)
  lbl(p, C2, $C$, dir: "sw", d: 9)
  lbl(p, D2, $D$, dir: "se", d: 9)
  lbl(p, N2, $N$, dir: "s", d: 10)
})

// 图 4·13 弦 AB 大于弦 CD（取 AE = CD）
#let fig-M-4-13(width: 280 * k) = px-canvas(280, 255, origin: (600, 905), width: width, (p, u) => {
  import cetz.draw: *
  let O = (742, 1024)
  let r = 112
  circ(p, O, r)
  let B = M-pt(O, r, 60.6)
  let A = M-pt(O, r, -60.6)
  let E = M-pt(O, r, 15)
  let C = M-pt(O, r, 183.7)
  let D = M-pt(O, r, 259.3)
  let Mm = (B.at(0), O.at(1))
  let K = M-mid(A, E)
  let S = M-isect(O, K, A, B)
  let N = M-mid(C, D)
  M-bold(p, A, B)
  M-bold(p, A, E)
  M-bold(p, C, D)
  M-bold(p, O, Mm)
  M-bold(p, O, N)
  dseg(p, O, K)
  M-ctr(p, O)
  lbl(p, B, $B$, dir: "n", d: 9)
  lbl(p, E, $E$, dir: "ne", d: 9)
  lbl(p, A, $A$, dir: "s", d: 10)
  lbl(p, K, $K$, dir: "se", d: 9)
  lbl(p, S, $S$, dir: "w", d: 9)
  lbl(p, Mm, $M$, dir: "e", d: 10)
  lbl(p, O, $O$, dir: "n", d: 9)
  lbl(p, N, $N$, dir: "sw", d: 9)
  lbl(p, C, $C$, dir: "w", d: 10)
  lbl(p, D, $D$, dir: "s", d: 10)
})

// 图 4·14 弦心距较小的弦较大
#let fig-M-4-14(width: 260 * k) = px-canvas(260, 250, origin: (170, 410), width: width, (p, u) => {
  import cetz.draw: *
  let O = (300, 540)
  let r = 111
  circ(p, O, r)
  let D = M-pt(O, r, 96)
  let C = M-pt(O, r, 18)
  let B = M-pt(O, r, -34)
  let A = M-pt(O, r, 214)
  let Mm = (O.at(0), A.at(1))
  let N = M-mid(C, D)
  M-bold(p, A, B)
  M-bold(p, C, D)
  M-bold(p, O, Mm)
  M-bold(p, O, N)
  M-ctr(p, O)
  lbl(p, D, $D$, dir: "n", d: 9)
  lbl(p, N, $N$, dir: "nw", d: 8)
  lbl(p, C, $C$, dir: "e", d: 10)
  lbl(p, O, $O$, dir: "w", d: 10)
  lbl(p, A, $A$, dir: "sw", d: 9)
  lbl(p, B, $B$, dir: "se", d: 9)
  lbl(p, Mm, $M$, dir: "s", d: 10)
})

// 图 4·15 直径是最大的弦
#let fig-M-4-15(width: 280 * k) = px-canvas(280, 260, origin: (530, 410), width: width, (p, u) => {
  import cetz.draw: *
  let O = (665, 540)
  let r = 111
  circ(p, O, r)
  let A = M-pt(O, r, 180)
  let B = M-pt(O, r, 0)
  let C = M-pt(O, r, 151)
  let D = M-pt(O, r, 49)
  M-bold(p, A, B)
  M-bold(p, C, D)
  dseg(p, O, C)
  dseg(p, O, D)
  M-ctr(p, O)
  lbl(p, A, $A$, dir: "w", d: 10)
  lbl(p, B, $B$, dir: "e", d: 10)
  lbl(p, C, $C$, dir: "nw", d: 9)
  lbl(p, D, $D$, dir: "ne", d: 9)
  lbl(p, O, $O$, dir: "s", d: 10)
})
