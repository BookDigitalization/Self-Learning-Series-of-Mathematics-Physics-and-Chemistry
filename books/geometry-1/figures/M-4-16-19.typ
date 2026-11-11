// 图 4·16、4·17（原书 p.224）、图 4·18（p.225）、图 4·19（p.226）；页面 200 dpi 坐标。
#import "M-base.typ": *

// 图 4·16 例 2：顶角 120°、腰 2 厘米的等腰三角形的外接圆
#let fig-M-4-16(width: 260 * k) = px-canvas(260, 275, origin: (180, 925), width: width, (p, u) => {
  import cetz.draw: *
  let O = (309, 1062)
  let r = 111
  circ(p, O, r)
  let A = M-pt(O, r, 90)
  let B = M-pt(O, r, 150)
  let C = M-pt(O, r, 30)
  let P = M-pt(O, r, 270)
  let Mm = (O.at(0), B.at(1))
  M-bold(p, A, B)
  M-bold(p, A, C)
  M-bold(p, B, C)
  dseg(p, A, P)
  dseg(p, O, C)
  anglearc(p, A, B, C, 16)
  M-ctr(p, O)
  // “2cm”标在 AC 边内侧，沿边方向
  content(p(354, 990), tsm[2cm], angle: -30deg)
  lbl(p, A, $A$, dir: "n", d: 9)
  lbl(p, B, $B$, dir: "w", d: 10)
  lbl(p, C, $C$, dir: "e", d: 10)
  lbl(p, P, $P$, dir: "s", d: 10)
  lbl(p, O, $O$, dir: "se", d: 10)
  lbl(p, Mm, $M$, dir: "ne", d: 8)
})

// 图 4·17 例 3：过圆内一点 P 的两条相等的弦 AB、CD
#let fig-M-4-17(width: 270 * k) = px-canvas(270, 265, origin: (560, 935), width: width, (p, u) => {
  import cetz.draw: *
  let O = (689, 1064)
  let r = 112
  let P = (641, 1020)
  let (A, B) = M-sec(O, r, P, (1, 0))
  // CD 是 AB 关于直线 OP 的对称线（两弦相等，弦心距相等）
  let l = calc.sqrt(calc.pow(P.at(0) - O.at(0), 2) + calc.pow(P.at(1) - O.at(1), 2))
  let d = ((P.at(0) - O.at(0)) / l, (P.at(1) - O.at(1)) / l)
  let refl = (2 * d.at(0) * d.at(0) - 1, 2 * d.at(0) * d.at(1))
  let (C, D) = M-sec(O, r, P, refl)
  let Mm = M-foot(A, B, O)
  let N = M-foot(C, D, O)
  circ(p, O, r)
  M-bold(p, A, B)
  M-bold(p, C, D)
  dseg(p, O, P)
  dseg(p, O, Mm)
  dseg(p, O, N)
  M-ctr(p, O)
  lbl(p, A, $A$, dir: "w", d: 10)
  lbl(p, B, $B$, dir: "e", d: 10)
  lbl(p, C, $C$, dir: "nw", d: 9)
  lbl(p, D, $D$, dir: "s", d: 10)
  lbl(p, P, $P$, dir: "ne", d: 9)
  lbl(p, Mm, $M$, dir: "n", d: 10)
  lbl(p, N, $N$, dir: "sw", d: 9)
  lbl(p, O, $O$, dir: "e", d: 10)
})

// 图 4·18 例 4：圆内两条不等的平行弦
#let fig-M-4-18(width: 265 * k) = px-canvas(265, 260, origin: (595, 645), width: width, (p, u) => {
  import cetz.draw: *
  let O = (727, 775)
  let r = 113
  circ(p, O, r)
  let (A, B) = M-sec(O, r, (700, 705), (1, 0))
  let (D, C) = M-sec(O, r, (700, 792), (1, 0))
  M-bold(p, A, B)
  M-bold(p, D, C)
  M-bold(p, A, C)
  M-bold(p, B, D)
  M-ctr(p, O)
  lbl(p, A, $A$, dir: "nw", d: 9)
  lbl(p, B, $B$, dir: "ne", d: 9)
  lbl(p, C, $C$, dir: "e", d: 10)
  lbl(p, D, $D$, dir: "w", d: 10)
  lbl(p, O, $O$, dir: "e", d: 10)
})

// 图 4·19 分析 2：等腰梯形 ABCD 的对角线（AD、BC 用虚线）
#let fig-M-4-19(width: 270 * k) = px-canvas(270, 270, origin: (600, 140), width: width, (p, u) => {
  import cetz.draw: *
  let O = (730, 277)
  let r = 115
  circ(p, O, r)
  let (A, B) = M-sec(O, r, (700, 191), (1, 0))
  let (D, C) = M-sec(O, r, (700, 300), (1, 0))
  M-bold(p, A, B)
  M-bold(p, D, C)
  M-bold(p, A, C)
  M-bold(p, B, D)
  dseg(p, A, D)
  dseg(p, B, C)
  lbl(p, A, $A$, dir: "nw", d: 9)
  lbl(p, B, $B$, dir: "ne", d: 9)
  lbl(p, C, $C$, dir: "se", d: 10)
  lbl(p, D, $D$, dir: "sw", d: 10)
})
