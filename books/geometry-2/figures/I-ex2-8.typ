// 习题 2·8 的小图：第 3 题（原书 p.156）、第 7 题（p.157）、第 10 题（p.157）、第 14、15 题（p.158）、第 17 题（p.159）；页面 120 dpi 坐标。
#import "I-base.typ": *

// 第 3 题：已知线段 b、a；M、A、B 共线，圆过 A、B，MC 切圆于 C
#let fig-I-ex2-8-3(width: 520 * k) = px-canvas(520, 235, origin: (220, 900), width: width, (p, u) => {
  import cetz.draw: *
  pseg(p, (225, 917), (337, 917))
  lbl(p, (281, 917), $b$, dir: "n", d: 8)
  pseg(p, (225, 954), (475, 950))
  lbl(p, (350, 952), $a$, dir: "n", d: 8)
  let M = (463, 1090)
  let A = (565, 1087)
  let B = (712, 1078)
  let mid = lerp(A, B, 0.5)
  let n = nrm(A, B)   // 指向页面下方
  let O = (mid.at(0) - n.at(0) * 47, mid.at(1) - n.at(1) * 47)
  let r = dist(O, A)
  let C = tang-pt(M, O, r)
  darc(p, O, r, 0, 360)
  dseg(p, M, B)
  tseg(p, M, C)
  lbl(p, M, $M$, dir: "w", d: 9)
  lbl(p, A, $A$, dir: "se", d: 8)
  lbl(p, B, $B$, dir: "e", d: 9)
  lbl(p, C, $C$, dir: "nw", d: 9)
})

// 第 7 题：半圆，直径 m 上分 x、y，垂线高 n
#let fig-I-ex2-8-7(width: 260 * k) = px-canvas(260, 150, origin: (625, 565), width: width, (p, u) => {
  import cetz.draw: *
  let O = (760, 685)
  let r = 110
  carc(p, O, r, 0, 180)
  tseg(p, (650, 685), (870, 685))
  let x1 = 685
  let y1 = 685 - calc.sqrt(r * r - 75 * 75)
  tseg(p, (x1, 685), (x1, y1))
  seg(p, (640, y1), (x1, y1))
  adim(p, (645, y1), (645, 685))
  lbl(p, (645, 643), $n$, dir: "w", d: 8)
  lbl(p, (667, 678), $x$, dir: "n", d: 4)
  lbl(p, (775, 678), $y$, dir: "n", d: 4)
  dimh(p, 650, 870, 703, lab: $m$)
})

// 第 10 题：正方形 ABCD，P 在 CD 上，AP = a + x
#let fig-I-ex2-8-10(width: 250 * k) = px-canvas(250, 250, origin: (640, 995), width: width, (p, u) => {
  import cetz.draw: *
  let (A, D, B, C) = ((657, 1018), (858, 1018), (658, 1222), (857, 1222))
  let P = (858, 1172)
  line(p(..A), p(..D), p(..C), p(..B), close: true, stroke: lb)
  tseg(p, A, P)
  lbl(p, A, $A$, dir: "nw", d: 8)
  lbl(p, D, $D$, dir: "ne", d: 8)
  lbl(p, B, $B$, dir: "sw", d: 9)
  lbl(p, C, $C$, dir: "se", d: 9)
  lbl(p, P, $P$, dir: "e", d: 10)
  lbl(p, (770, 1010), $a$, dir: "n", d: 4)
  lbl(p, (873, 1198), $x$, dir: "c", d: 0)
  rlbl(p, (748, 1112), -33, $a + x$)
})

// 第 14 题：半圆，AQ = BP = x
#let fig-I-ex2-8-14(width: 300 * k) = px-canvas(300, 190, origin: (140, 555), width: width, (p, u) => {
  import cetz.draw: *
  let O = (287, 712)
  let r = 137
  let P = (318, 712 - calc.sqrt(r * r - 31 * 31))
  carc(p, O, r, 0, 180)
  tseg(p, (150, 712), (425, 712))
  tseg(p, P, (318, 712))
  dseg(p, P, (425, 712))
  lbl(p, (150, 712), $A$, dir: "sw", d: 10)
  lbl(p, (318, 712), $Q$, dir: "s", d: 12)
  lbl(p, (428, 712), $B$, dir: "se", d: 10)
  lbl(p, P, $P$, dir: "n", d: 11)
  lbl(p, (235, 712), $x$, dir: "n", d: 8)
  lbl(p, lerp(P, (425, 712), 0.5), $x$, dir: "ne", d: 10)
})

// 第 15 题：同心圆，弦 AB 交小圆于 C、D，OE ⊥ AB
#let fig-I-ex2-8-15(width: 320 * k) = px-canvas(320, 320, origin: (490, 485), width: width, (p, u) => {
  import cetz.draw: *
  let O = (646, 634)
  let R = 150
  let x = 47
  let AE = calc.sqrt(R * R - x * x)
  let r = calc.sqrt(AE * AE / 4 + x * x)
  let yy = 634 - x
  let A = (646 - AE, yy)
  let B = (646 + AE, yy)
  let C = (646 - AE / 2, yy)
  let D = (646 + AE / 2, yy)
  let E = (646, yy)
  circ(p, O, R)
  circ(p, O, r)
  seg(p, A, B)
  seg(p, O, E)
  seg(p, O, C)
  seg(p, O, A)
  ring(p, O, r: 3)
  lbl(p, A, $A$, dir: "w", d: 9)
  lbl(p, B, $B$, dir: "e", d: 9)
  lbl(p, C, $C$, dir: "nw", d: 9)
  lbl(p, D, $D$, dir: "ne", d: 9)
  lbl(p, E, $E$, dir: "n", d: 11)
  lbl(p, O, $O$, dir: "s", d: 12)
  lbl(p, (662, 610), $x$, dir: "c", d: 0)
  lbl(p, (612, 604), $r$, dir: "n", d: 0)
  lbl(p, (578, 628), $R$, dir: "c", d: 0)
})

// 第 17 题：过 A、B 作圆与直线 MN 相切于 T，AB 延长交 MN 于 P
#let fig-I-ex2-8-17(width: 470 * k) = px-canvas(470, 290, origin: (275, 470), width: width, (p, u) => {
  import cetz.draw: *
  let O = (532, 583)
  let r = 100
  let A = (563, 490)
  let B = (437, 617)
  let P = (358, 688)
  let T = (532, 683)
  circ(p, O, r)
  tseg(p, (303, 689), (718, 677))
  tseg(p, P, A)
  ring(p, A, r: 3)
  ring(p, B, r: 3)
  ring(p, T, r: 3)
  lbl(p, A, $A$, dir: "ne", d: 11)
  lbl(p, B, $B$, dir: "nw", d: 12)
  lbl(p, T, $T$, dir: "s", d: 11)
  lbl(p, P, $P$, dir: "s", d: 11)
  lbl(p, (296, 689), $M$, dir: "w", d: 6)
  lbl(p, (728, 677), $N$, dir: "e", d: 6)
})
