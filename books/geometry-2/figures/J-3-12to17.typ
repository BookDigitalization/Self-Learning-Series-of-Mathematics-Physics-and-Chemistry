// 图 3·12（原书 p.183）、3·13（p.184）、3·14（p.184）、3·15（p.185）、3·16（p.186）、3·17（p.187）；页面 120 dpi 坐标。
// 图 3·13 按等边三角形画（原图手绘偏高）；图 3·15 按菱形、DD' = 12、D'B = 5、BD = 13 的比例重建（原图手绘比例不准）。
#import "J-base.typ": *

// 图 3·12 三角形面积定理：过 B、A 作 BD ∥ CA、AD ∥ CB（虚线）
#let fig-J-3-12(width: 315 * k) = px-canvas(315, 175, origin: (555, 548), width: width, (p, u) => {
  import cetz.draw: *
  let (C, A, B, B1) = ((570, 520), (780, 520), (652, 383), (652, 520))
  let D = (862, 383)
  seg(p, C, A)
  seg(p, C, B)
  seg(p, B, A)
  seg(p, B, B1)
  seg(p, B, D, stroke: dsh)
  seg(p, A, D, stroke: dsh)
  lbl(p, B, $B$, dir: "n", d: 10)
  lbl(p, D, $D$, dir: "ne", d: 9)
  lbl(p, A, $A$, dir: "se", d: 9)
  lbl(p, C, $C$, dir: "sw", d: 9)
  lbl(p, B1, $B'$, dir: "s", d: 11)
})

// 图 3·13 例 1：等边三角形，边 a，高 CD；三边外侧各画一条带箭头的尺寸线，中间标 a
#let fig-J-3-13(width: 290 * k) = px-canvas(290, 296, origin: (165, 833), width: width, (p, u) => {
  import cetz.draw: *
  let (A, B, C, D) = ((205, 790), (425, 790), (315, 600), (315, 790))
  polyc(p, A, B, C)
  seg(p, C, D)
  rtmark(p, D, C, B, s: 8)
  dimlineJ(p, A, C, -13, $a$)
  dimlineJ(p, B, C, 13, $a$)
  dimlineJ(p, A, B, 22, $a$)
  lbl(p, C, $C$, dir: "n", d: 17)
  lbl(p, A, $A$, dir: "sw", d: 18)
  lbl(p, B, $B$, dir: "se", d: 18)
  lbl(p, D, $D$, dir: "ne", d: 16)
})

// 图 3·14 例 2：菱形 ABCD 的对角线 AC、BD 相交于 E
#let fig-J-3-14(width: 155 * k) = px-canvas(155, 285, origin: (590, 832), width: width, (p, u) => {
  import cetz.draw: *
  let (C, B, A, D) = ((668, 558), (730, 693), (668, 823), (600, 693))
  polyc(p, C, B, A, D)
  seg(p, C, A)
  seg(p, D, B)
  lbl(p, C, $C$, dir: "n", d: 10)
  lbl(p, B, $B$, dir: "e", d: 10)
  lbl(p, A, $A$, dir: "s", d: 10)
  lbl(p, D, $D$, dir: "w", d: 10)
  lbl(p, (668, 693), $E$, dir: "se", d: 9)
})

// 图 3·15 例 3：菱形 ABCD，DD' ⊥ AB，AC ⊥ BD 于 O；∠D'BD 与 ∠OBC 各画一道弧
#let fig-J-3-15(width: 420 * k) = px-canvas(420, 200, origin: (315, 1092), width: width, (p, u) => {
  import cetz.draw: *
  let (A, B, D1) = ((335, 1075), (555, 1075), (490, 1075))
  let D = (490, 919)
  let C = (710, 919)
  let O = lerp(B, D, 0.5)
  polyc(p, A, B, C, D)
  seg(p, A, C)
  seg(p, B, D)
  seg(p, D, D1)
  rtmark(p, D1, D, B, s: 8)
  rtmark(p, O, C, B, s: 8)
  anglearc(p, B, A, D, 15)
  anglearc(p, B, D, C, 15)
  lbl(p, D, $D$, dir: "n", d: 10)
  lbl(p, C, $C$, dir: "ne", d: 9)
  lbl(p, A, $A$, dir: "sw", d: 10)
  lbl(p, B, $B$, dir: "s", d: 11)
  lbl(p, D1, $D'$, dir: "s", d: 11)
  lbl(p, O, $O$, dir: "ne", d: 10)
})

// 图 3·16 例 4：△ABC 的三边 a、b、c，CA 上的高 BD（虚线）= h_b
#let fig-J-3-16(width: 340 * k) = px-canvas(340, 200, origin: (515, 1158), width: width, (p, u) => {
  import cetz.draw: *
  let (C, A, B) = ((528, 1133), (830, 1127), (728, 972))
  let D = foot(B, C, A)
  polyc(p, C, A, B)
  seg(p, B, D, stroke: dsh)
  lbl(p, B, $B$, dir: "n", d: 10)
  lbl(p, C, $C$, dir: "sw", d: 9)
  lbl(p, A, $A$, dir: "se", d: 9)
  lbl(p, D, $D$, dir: "se", d: 10)
  lbl(p, lerp(C, B, 0.5), $a$, dir: "nw", d: 9)
  lbl(p, lerp(B, A, 0.5), $c$, dir: "ne", d: 9)
  lbl(p, (684, 1141), $b$, dir: "s", d: 10)
  lbl(p, (728, 1065), $h_b$, dir: "e", d: 14)
})

// 图 3·17 例 5：△ABC 的内切圆 O，切 BC 于 D、CA 于 E、AB 于 F；OA、OB、OC、OD、OE、OF 虚线
#let fig-J-3-17(width: 405 * k) = px-canvas(405, 340, origin: (320, 526), width: width, (p, u) => {
  import cetz.draw: *
  let (B, C, A) = ((627, 215), (332, 500), (710, 500))
  let dist(a, b) = calc.sqrt(calc.pow(a.at(0) - b.at(0), 2) + calc.pow(a.at(1) - b.at(1), 2))
  let la = dist(B, C)
  let lb2 = dist(C, A)
  let lc = dist(A, B)
  let s2 = la + lb2 + lc
  let O = ((la * A.at(0) + lb2 * B.at(0) + lc * C.at(0)) / s2, (la * A.at(1) + lb2 * B.at(1) + lc * C.at(1)) / s2)
  let D = foot(O, B, C)
  let E = foot(O, C, A)
  let F = foot(O, A, B)
  let r = dist(O, E)
  polyc(p, B, C, A)
  circ(p, O, r)
  for X in (A, B, C, D, E, F) { seg(p, O, X, stroke: dsh) }
  lbl(p, B, $B$, dir: "n", d: 10)
  lbl(p, C, $C$, dir: "sw", d: 9)
  lbl(p, A, $A$, dir: "se", d: 9)
  lbl(p, D, $D$, dir: "nw", d: 10)
  lbl(p, E, $E$, dir: "s", d: 11)
  lbl(p, F, $F$, dir: "ne", d: 10)
  lbl(p, O, $O$, dir: "se", d: 10)
})
