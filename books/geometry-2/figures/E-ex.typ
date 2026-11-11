// 习题里无编号的小图：习题 1·9 第 8、9 题（原书 p.80）、习题 1·10 第 5 题（p.84）、习题 1·12 第 4、6 题（p.92）；页面 120 dpi 坐标。
#import "E-base.typ": *

// 习题 1·9 第 8 题：军用桥架，高 3m，板宽 AB = 1.5m，横木 DE 高出 AB 0.5m
#let fig-E-ex9-8(width: 330 * k) = px-canvas(330, 335, origin: (130, 255), width: width, (p, u) => {
  import cetz.draw: *
  let C = (300, 271)
  let (A, B) = ((230, 540), (377.5, 540))
  let D = lerp(C, A, 0.813)
  let E = lerp(C, B, 0.813)
  seg(p, C, A)
  seg(p, C, B)
  seg(p, D, E)
  seg(p, C, (300, 540))
  line(p(300, 271), p(421, 271), stroke: lt)
  // 地面
  line(p(142, 541), p(450, 541), stroke: lb)
  for i in range(0, 26) {
    let x = 146 + i * 12
    line(p(x, 542), p(x - 6, 553), stroke: lt)
  }
  // 3m 尺寸线
  line(p(405, 272), p(405, 390), stroke: lt, mark: (start: "stealth", fill: black, scale: 0.45))
  line(p(405, 416), p(405, 539), stroke: lt, mark: (end: "stealth", fill: black, scale: 0.45))
  lbl(p, (407, 403), $3 "m"$, dir: "c", d: 0)
  // 0.5m
  line(p(332, 510), p(332, 491), stroke: lt, mark: (end: "stealth", fill: black, scale: 0.45))
  line(p(332, 524), p(332, 539), stroke: lt, mark: (end: "stealth", fill: black, scale: 0.45))
  lbl(p, (352, 517), $0.5 "m"$, dir: "c", d: 0)
  // 1.5m
  line(p(228, 541), p(228, 568), stroke: lt)
  line(p(377, 541), p(377, 568), stroke: lt)
  dimh(p, 228, 377, 562, lab: $1.5 "m"$, gapw: 56)
  lbl(p, C, $C$, dir: "nw", d: 10)
  lbl(p, A, $A$, dir: "nw", d: 10)
  lbl(p, B, $B$, dir: "ne", d: 10)
  lbl(p, D, $D$, dir: "w", d: 10)
  lbl(p, E, $E$, dir: "e", d: 10)
})

// 习题 1·9 第 9 题：△ABC 的内接半圆，直径 DE ∥ BC，切 BC 于 F，O 为 DE 中点
#let fig-E-ex9-9(width: 380 * k) = px-canvas(380, 165, origin: (470, 395), width: width, (p, u) => {
  import cetz.draw: *
  let (A, B, C) = ((685, 415), (482.5, 538), (832.5, 538))
  let D = lerp(B, A, (538 - 466) / 123)
  let E = lerp(C, A, (538 - 466) / 123)
  let O = ((D.at(0) + E.at(0)) / 2, 466)
  let r = (E.at(0) - D.at(0)) / 2
  let F = (O.at(0), 538)
  let H = (685, 538)
  tri(p, A, B, C)
  seg(p, D, E)
  arc(p(..O), start: 180deg, stop: 360deg, radius: r, anchor: "origin", stroke: lw)
  line(p(..A), p(..H), stroke: lb)
  dseg(p, O, F)
  ring(p, O, r: 2.5)
  lbl(p, A, $A$, dir: "n", d: 10)
  lbl(p, B, $B$, dir: "w", d: 11)
  lbl(p, C, $C$, dir: "e", d: 11)
  lbl(p, D, $D$, dir: "nw", d: 11)
  lbl(p, E, $E$, dir: "ne", d: 11)
  lbl(p, O, $O$, dir: "nw", d: 10)
  lbl(p, F, $F$, dir: "s", d: 11)
  lbl(p, H, $H$, dir: "se", d: 10)
})

// 习题 1·10 第 5 题：NM ∥ AC，BD ⊥ AC，BD 交 NM 于 E
#let fig-E-ex10-5(width: 320 * k) = px-canvas(320, 230, origin: (300, 175), width: width, (p, u) => {
  import cetz.draw: *
  let (B, A, C) = ((465, 192), (367.5, 357), (562.5, 357))
  let D = (465, 357)
  let E = (465, 309)
  let N = lerp(B, A, (309 - 192) / (357 - 192))
  let M = lerp(B, C, (309 - 192) / (357 - 192))
  tri(p, A, B, C)
  seg(p, B, D)
  seg(p, N, M)
  lbl(p, B, $B$, dir: "n", d: 9)
  lbl(p, N, $N$, dir: "nw", d: 11)
  lbl(p, M, $M$, dir: "ne", d: 11)
  lbl(p, E, $E$, dir: "ne", d: 11)
  lbl(p, A, $A$, dir: "sw", d: 10)
  lbl(p, D, $D$, dir: "s", d: 10)
  lbl(p, C, $C$, dir: "se", d: 10)
})

// 习题 1·12 第 4 题：两圆 O、O' 外切于 P，外公切线 AB，内公切线 PM 交 AB 于 M
#let fig-E-ex12-4(width: 380 * k) = px-canvas(380, 195, origin: (170, 805), width: width, (p, u) => {
  import cetz.draw: *
  let r1 = 88
  let O = (266, 901)
  let O1 = (425, 917)
  let r2 = dist(O, O1) - r1
  let (A, B) = ((266, 989), (425, 989))
  let t = r1 / (r1 + r2)
  let P = lerp(O, O1, t)
  // 内公切线方向垂直于 OO'
  let dx = O1.at(0) - O.at(0)
  let dy = O1.at(1) - O.at(1)
  let l = calc.sqrt(dx * dx + dy * dy)
  let (tx, ty) = (-dy / l, dx / l)       // 向下为正的切线方向
  let s = (989 - P.at(1)) / ty
  let M = (P.at(0) + tx * s, 989)
  let top = (P.at(0) - tx * (P.at(1) - 820) / ty, 820)
  circ(p, O, r1)
  circ(p, O1, r2)
  line(p(165, 989), p(517, 989), stroke: lw)
  pdot(p, (157, 990), r: 1.6)
  line(p(..top), p(..M), stroke: lb)
  seg(p, O, O1)
  seg(p, O, A)
  seg(p, O1, B)
  dseg(p, P, A)
  dseg(p, P, B)
  rtmark(p, A, O, (150, 989), s: 7)
  rtmark(p, B, O1, (540, 989), s: 7)
  rtmark(p, P, O, top, s: 7)
  amk(p, A, O, P, 26)
  amk(p, B, O1, P, 26)
  amk(p, P, O, A, 20)
  amk(p, P, O1, B, 20)
  ticks(p, M, P, 1)
  ticks(p, A, M, 1)
  ticks(p, M, B, 1)
  ring(p, O, r: 3)
  ring(p, O1, r: 3)
  lbl(p, O, $O$, dir: "w", d: 11)
  lbl(p, O1, $O'$, dir: "e", d: 12)
  wlbl(p, (P.at(0) - 8, P.at(1) - 13), $P$)
  lbl(p, A, $A$, dir: "s", d: 10)
  lbl(p, M, $M$, dir: "s", d: 10)
  lbl(p, B, $B$, dir: "s", d: 10)
})

// 习题 1·12 第 6 题：AF ∥ BE ∥ CD，BF ∥ CE，梯形 ABEF 与 BCDE
#let fig-E-ex12-6(width: 320 * k) = px-canvas(320, 175, origin: (550, 820), width: width, (p, u) => {
  import cetz.draw: *
  let (A, F, C, D) = ((611.5, 846), (752.5, 846), (561, 981), (851, 981))
  let B = lerp(A, C, (901 - 846) / (981 - 846))
  let E = lerp(F, D, (901 - 846) / (981 - 846))
  seg(p, A, C)
  seg(p, F, D)
  seg(p, A, F)
  seg(p, B, E)
  seg(p, C, D)
  seg(p, B, F)
  seg(p, C, E)
  lbl(p, A, $A$, dir: "n", d: 10)
  lbl(p, F, $F$, dir: "n", d: 10)
  lbl(p, B, $B$, dir: "w", d: 11)
  lbl(p, E, $E$, dir: "e", d: 11)
  lbl(p, C, $C$, dir: "sw", d: 10)
  lbl(p, D, $D$, dir: "se", d: 10)
})
