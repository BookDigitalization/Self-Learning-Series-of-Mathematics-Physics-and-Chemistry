// 图 2·25（原书 p.94）、图 2·26、2·27（p.95）、图 2·28（p.96）、图 2·29（p.99）、图 2·30、2·31（p.100）、图 2·32（p.101）；页面 200 dpi 坐标。
#import "F-base.typ": *

// 图 2·25 例 2：AB=AC，BAD 一直线，AE 平分 ∠DAC，AE∥BC
#let fig-F-2-25(width: 340 * k) = px-canvas(340, 290, origin: (512, 588), width: width, (p, u) => {
  import cetz.draw: *
  let (B, C, D) = ((528, 857), (810, 857), (795, 603))
  let A = (672, 720)
  let E = (825, 720)
  seg(p, B, D)
  seg(p, B, C)
  seg(p, A, C)
  seg(p, A, E)
  ticks(p, B, A, 1)
  ticks(p, A, C, 1)
  anglearc(p, A, D, E, 22)
  anglearc(p, A, E, C, 22)
  lbl(p, D, $D$, dir: "e", d: 11)
  lbl(p, E, $E$, dir: "e", d: 11)
  lbl(p, A, $A$, dir: "nw", d: 11)
  lbl(p, B, $B$, dir: "sw", d: 11)
  lbl(p, C, $C$, dir: "se", d: 11)
  F-num(p, 706, 709, $1$)
  F-num(p, 707, 738, $2$)
})

// 图 2·26 例 3：AB=AC，∠A=80°，BE⊥AC
#let fig-F-2-26(width: 400 * k) = px-canvas(400, 250, origin: (468, 170), width: width, (p, u) => {
  import cetz.draw: *
  let (A, B, C) = ((670, 200), (500, 393), (838, 393))
  let E = F-foot(B, A, C)
  poly(p, (A, B, C), close: true)
  seg(p, B, E)
  rtmark(p, E, A, B, s: 8)
  anglearc(p, A, B, C, 24)
  anglearc(p, B, C, E, 30)
  lbl(p, (A.at(0) - 3, A.at(1) + 38), $80°$, dir: "c", d: 0)
  lbl(p, A, $A$, dir: "n", d: 11)
  lbl(p, B, $B$, dir: "sw", d: 11)
  lbl(p, C, $C$, dir: "se", d: 11)
  lbl(p, E, $E$, dir: "ne", d: 11)
  F-num(p, 536, 380, $1$)
})

// 图 2·27 例 4：钢板上的槽 AB、MN 和要锉的槽 A′B′
#let fig-F-2-27(width: 290 * k) = px-canvas(290, 225, origin: (555, 762), width: width, (p, u) => {
  import cetz.draw: *
  poly(p, ((565, 768), (835, 768), (835, 973), (565, 973)), close: true)
  F-bar(p, (700, 802), (700, 945), 16, hatch: true)
  F-bar(p, (652, 820), (608, 917), 12, hatch: true)
  F-bar(p, (748, 820), (792, 917), 12)
  dseg(p, (652, 820), (748, 820))
  dseg(p, (608, 917), (792, 917))
  lbl(p, (700, 802), $M$, dir: "n", d: 11)
  lbl(p, (700, 945), $N$, dir: "s", d: 11)
  lbl(p, (708, 820), $O$, dir: "se", d: 10)
  lbl(p, (652, 820), $A$, dir: "nw", d: 11)
  lbl(p, (748, 820), $A'$, dir: "ne", d: 11)
  lbl(p, (608, 917), $B$, dir: "sw", d: 11)
  lbl(p, (792, 917), $B'$, dir: "se", d: 11)
})

// 图 2·28 例 5：A、B 在 l 同旁，A′ 是 A 关于 l 的对称点
#let fig-F-2-28(width: 380 * k) = px-canvas(380, 300, origin: (295, 143), width: width, (p, u) => {
  import cetz.draw: *
  let (A, B, M, A2, P2) = ((410, 168), (577, 190), (410, 288), (410, 408), (577, 288))
  let P = F-meet(A2, B, (312, 288), (662, 288))
  line(p(312, 288), p(662, 288), stroke: lb)
  dseg(p, A, A2)
  seg(p, A, P)
  seg(p, A, P2)
  seg(p, A2, B)
  seg(p, B, P2)
  dseg(p, A2, P2)
  lbl(p, (312, 288), $l$, dir: "w", d: 9)
  lbl(p, A, $A$, dir: "n", d: 10)
  lbl(p, B, $B$, dir: "n", d: 10)
  lbl(p, M, $M$, dir: "nw", d: 10)
  lbl(p, A2, $A'$, dir: "s", d: 10)
  lbl(p, P, $P$, dir: "se", d: 10)
  lbl(p, P2, $P'$, dir: "se", d: 10)
})

// 图 2·29：作线段 AB 的垂直平分线
#let fig-F-2-29(width: 290 * k) = px-canvas(290, 760, origin: (537, 113), width: width, (p, u) => {
  import cetz.draw: *
  let (A, B, M, E, F) = ((565, 628), (795, 628), (680, 628), (680, 152), (680, 822))
  seg(p, A, B)
  line(p(..E), p(..F), stroke: dsh)
  dseg(p, A, E)
  dseg(p, B, E)
  dseg(p, A, F)
  dseg(p, B, F)
  ticks(p, A, E, 1)
  ticks(p, E, B, 1)
  ticks(p, A, F, 1)
  ticks(p, F, B, 1)
  F-cross(p, A, E, half: 6)
  F-cross(p, B, E, half: 6)
  F-cross(p, A, F, half: 6)
  F-cross(p, B, F, half: 6)
  lbl(p, E, $E$, dir: "n", d: 14)
  lbl(p, F, $F$, dir: "s", d: 14)
  lbl(p, A, $A$, dir: "w", d: 11)
  lbl(p, B, $B$, dir: "e", d: 11)
  lbl(p, M, $M$, dir: "ne", d: 11)
})

// 图 2·30：作角 A 的平分线
#let fig-F-2-30(width: 410 * k) = px-canvas(410, 290, origin: (455, 125), width: width, (p, u) => {
  import cetz.draw: *
  let A = (487, 267)
  let (B, C) = ((835, 148), (838, 402))
  let (E, F, P) = ((632, 205), (632, 329), (780, 267))
  seg(p, A, B)
  seg(p, A, C)
  seg(p, A, (855, 267))
  F-arc(p, A, F-dist(A, E), -34, 34, st: dsh)
  dseg(p, E, P)
  dseg(p, F, P)
  F-cross(p, E, P, half: 8)
  F-cross(p, F, P, half: 8)
  lbl(p, A, $A$, dir: "w", d: 11)
  lbl(p, B, $B$, dir: "e", d: 10)
  lbl(p, C, $C$, dir: "e", d: 10)
  lbl(p, E, $E$, dir: "ne", d: 11)
  lbl(p, F, $F$, dir: "se", d: 11)
  lbl(p, P, $P$, dir: "se", d: 11)
})

// 图 2·31：过直线外（左）、直线上（右）一点作垂线
#let fig-F-2-31(width: 730 * k) = px-canvas(730, 310, origin: (150, 770), width: width, (p, u) => {
  import cetz.draw: *
  // 左
  let (A, B, P, Q, E, F) = ((162, 978), (495, 978), (318, 812), (318, 1070), (235, 978), (400, 978))
  seg(p, A, B)
  seg(p, P, Q)
  dseg(p, P, E)
  dseg(p, P, F)
  dseg(p, Q, E)
  dseg(p, Q, F)
  F-arc(p, P, F-dist(P, E), -90 - 38, -90 + 38, st: dsh)
  F-cross(p, E, Q, half: 8)
  F-cross(p, F, Q, half: 8)
  lbl(p, P, $P$, dir: "n", d: 11)
  lbl(p, A, $A$, dir: "w", d: 11)
  lbl(p, B, $B$, dir: "e", d: 11)
  lbl(p, E, $E$, dir: "sw", d: 10)
  lbl(p, F, $F$, dir: "se", d: 10)
  lbl(p, Q, $Q$, dir: "se", d: 11)
  // 右
  let (A, B, P, Q, E, F) = ((525, 978), (870, 978), (710, 978), (710, 822), (600, 978), (815, 978))
  seg(p, A, B)
  seg(p, (710, 822), (710, 1015))
  dseg(p, Q, E)
  dseg(p, Q, F)
  F-cross(p, E, Q, half: 8)
  F-cross(p, F, Q, half: 8)
  lbl(p, A, $A$, dir: "w", d: 11)
  lbl(p, B, $B$, dir: "e", d: 11)
  lbl(p, E, $E$, dir: "s", d: 12)
  lbl(p, P, $P$, dir: "se", d: 12)
  lbl(p, F, $F$, dir: "s", d: 12)
  lbl(p, Q, $Q$, dir: "n", d: 12)
})

// 图 2·32：尺规作图的几种简单作图（直线、圆、两直线交点、直线与圆交点、两圆交点）
#let fig-F-2-32(width: 650 * k) = px-canvas(650, 400, origin: (150, 490), width: width, (p, u) => {
  import cetz.draw: *
  // 1 过两点的直线
  seg(p, (153, 592), (358, 592))
  ring(p, (200, 592))
  ring(p, (303, 592))
  // 2 圆
  circ(p, (471, 592), 84)
  seg(p, (471, 592), (555, 592))
  ring(p, (471, 592))
  // 3 两直线
  let (a1, a2, b1, b2) = ((600, 535), (800, 641), (603, 662), (799, 558))
  seg(p, a1, a2)
  seg(p, b1, b2)
  ring(p, F-meet(a1, a2, b1, b2))
  // 4 直线与圆
  let c = (320, 796)
  circ(p, c, 87)
  seg(p, (198, 736), (435, 736))
  let dy = 736 - 796
  let dx = calc.sqrt(87 * 87 - dy * dy)
  ring(p, (320 - dx, 736))
  ring(p, (320 + dx, 736))
  // 5 两圆
  let (c1, c2) = ((548, 792), (662, 792))
  circ(p, c1, 73)
  circ(p, c2, 85)
  let (q1, q2) = F-cc(c1, 73, c2, 85)
  ring(p, q1)
  ring(p, q2)
})
