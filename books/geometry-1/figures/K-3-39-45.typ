// 图 3·39、3·40（原书 p.199）、3·41、3·42（p.200）、3·43、3·44（p.201）、3·45（p.202）；页面 200 dpi 坐标。
#import "K-base.typ": *

// 在顶点 v 处画角弧，并在 a、b 两条射线的角平分线方向上加一小段径向短横（r0 到 r1）
#let K-arctick(p, v, a, b, r0, r1) = {
  import cetz.draw: *
  let t1 = dirang(a.at(0) - v.at(0), a.at(1) - v.at(1))
  let t2 = dirang(b.at(0) - v.at(0), b.at(1) - v.at(1))
  let m = (t1 + t2) / 2
  let (c, s) = (calc.cos(m), -calc.sin(m))
  line(p(v.at(0) + c * r0, v.at(1) + s * r0), p(v.at(0) + c * r1, v.at(1) + s * r1), stroke: lt)
}

// 图 3·39：梯形 ABCD 的上底、下底、高 DK、中位线 MN、底角 A、B
#let fig-K-3-39(width: 280 * k) = px-canvas(280, 185, origin: (560, 640), width: width, (p, u) => {
  import cetz.draw: *
  let (D, C, A, B) = ((650, 657), (782, 657), (585, 794), (820, 794))
  let Kp = (650, 794)
  let M = K-mid(D, A)
  let N = K-mid(C, B)
  K-b(p, A, B)
  K-b(p, B, C)
  K-b(p, C, D)
  K-b(p, D, A)
  K-b(p, D, Kp)
  K-b(p, M, N)
  anglearc(p, A, B, D, 22)
  anglearc(p, B, A, C, 18)
  anglearc(p, B, A, C, 23)
  K-zh(p, (729, 647), [上底])
  K-zh(p, (661, 692), [高])
  K-zh(p, (717, 736), [中位线])
  K-zh(p, (717, 779), [下底])
  lbl(p, (648, 646), $D$, dir: "c", d: 0)
  lbl(p, (793, 648), $C$, dir: "c", d: 0)
  lbl(p, (601, 719), $M$, dir: "c", d: 0)
  lbl(p, (818, 718), $N$, dir: "c", d: 0)
  lbl(p, (573, 801), $A$, dir: "c", d: 0)
  lbl(p, (648, 810), $K$, dir: "c", d: 0)
  lbl(p, (832, 801), $B$, dir: "c", d: 0)
})

// 图 3·40：(1) 等腰梯形，(2) 直角梯形
#let fig-K-3-40(width: 545 * k) = px-canvas(545, 200, origin: (218, 972), width: width, (p, u) => {
  import cetz.draw: *
  // (1)
  let (E, H, F, G) = ((295, 987), (418, 987), (245, 1124), (470, 1124))
  K-b(p, E, H)
  K-b(p, H, G)
  K-b(p, G, F)
  K-b(p, F, E)
  ticks(p, F, E, 1)
  ticks(p, G, H, 1)
  K-zh(p, (324, 1065), [等腰梯形])
  lbl(p, (287, 975), $E$, dir: "c", d: 0)
  lbl(p, (426, 975), $H$, dir: "c", d: 0)
  lbl(p, (232, 1131), $F$, dir: "c", d: 0)
  lbl(p, (480, 1131), $G$, dir: "c", d: 0)
  lbl(p, (352, 1160), $(1)$, dir: "c", d: 0)
  // (2)
  let (a, b, c, d) = ((530, 987), (655, 987), (746, 1125), (530, 1125))
  K-b(p, a, b)
  K-b(p, b, c)
  K-b(p, c, d)
  K-b(p, d, a)
  anglearc(p, d, a, c, 22)
  lbl(p, (556, 1105), $δ$, dir: "c", d: 0)
  K-zh(p, (615, 1057), [直角梯形])
  lbl(p, (629, 1160), $(2)$, dir: "c", d: 0)
})

// 图 3·41：定理 1，AB = CD，AS ∥ DC
#let fig-K-3-41(width: 305 * k) = px-canvas(305, 175, origin: (545, 338), width: width, (p, u) => {
  import cetz.draw: *
  let (A, D, B, C) = ((624, 352), (760, 354), (562, 489), (829, 489))
  let S = (A.at(0) + (C.at(0) - D.at(0)), 489)
  K-b(p, A, D)
  K-b(p, D, C)
  K-b(p, C, B)
  K-b(p, B, A)
  seg(p, A, S, stroke: dsh)
  ticks(p, B, A, 1)
  ticks(p, A, S, 1)
  ticks(p, D, C, 1)
  anglearc(p, B, A, C, 20)
  anglearc(p, S, A, B, 20)
  anglearc(p, C, D, B, 20)
  lbl(p, (618, 344), $A$, dir: "c", d: 0)
  lbl(p, (771, 349), $D$, dir: "c", d: 0)
  lbl(p, (551, 497), $B$, dir: "c", d: 0)
  lbl(p, (839, 491), $C$, dir: "c", d: 0)
  lbl(p, (693, 503), $S$, dir: "c", d: 0)
})

// 图 3·42：定理 2，等腰梯形的两对角线
#let fig-K-3-42(width: 300 * k) = px-canvas(300, 160, origin: (545, 1040), width: width, (p, u) => {
  import cetz.draw: *
  let (A, D, B, C) = ((632, 1054), (762, 1054), (562, 1187), (832, 1187))
  K-b(p, A, D)
  K-b(p, D, C)
  K-b(p, C, B)
  K-b(p, B, A)
  K-b(p, A, C)
  K-b(p, B, D)
  ticks(p, B, A, 1)
  ticks(p, D, C, 1)
  anglearc(p, B, A, C, 24)
  anglearc(p, C, D, B, 24)
  K-arctick(p, B, A, D, 18, 30)
  K-arctick(p, C, D, A, 18, 30)
  lbl(p, (626, 1046), $A$, dir: "c", d: 0)
  lbl(p, (773, 1048), $D$, dir: "c", d: 0)
  lbl(p, (551, 1195), $B$, dir: "c", d: 0)
  lbl(p, (844, 1194), $C$, dir: "c", d: 0)
})

// 图 3·43：例 1 证 1，延长 AD、BC 交于 P
#let fig-K-3-43(width: 305 * k) = px-canvas(305, 230, origin: (545, 292), width: width, (p, u) => {
  import cetz.draw: *
  let (P, A, B) = ((698, 302), (564, 505), (832, 506))
  let D = (630, 405)
  let C = (766, 405)
  K-b(p, D, A)
  K-b(p, C, B)
  K-b(p, A, B)
  K-b(p, D, C)
  seg(p, P, D, stroke: dsh)
  seg(p, P, C, stroke: dsh)
  anglearc(p, A, B, P, 20)
  anglearc(p, B, A, P, 20)
  lbl(p, (698, 293), $P$, dir: "c", d: 0)
  lbl(p, (621, 399), $D$, dir: "c", d: 0)
  lbl(p, (777, 398), $C$, dir: "c", d: 0)
  lbl(p, (553, 513), $A$, dir: "c", d: 0)
  lbl(p, (844, 514), $B$, dir: "c", d: 0)
})

// 图 3·44：例 1 证 2，DP ∥ CB
#let fig-K-3-44(width: 305 * k) = px-canvas(305, 175, origin: (545, 1065), width: width, (p, u) => {
  import cetz.draw: *
  let (D, C, A, B) = ((627, 1077), (762, 1080), (557, 1210), (830, 1214))
  let P = (689, 1212)
  K-b(p, D, C)
  K-b(p, C, B)
  K-b(p, B, A)
  K-b(p, A, D)
  seg(p, D, P, stroke: dsh)
  anglearc(p, A, B, D, 20)
  anglearc(p, P, A, D, 20)
  anglearc(p, B, A, C, 20)
  lbl(p, (618, 1069), $D$, dir: "c", d: 0)
  lbl(p, (772, 1074), $C$, dir: "c", d: 0)
  lbl(p, (547, 1218), $A$, dir: "c", d: 0)
  lbl(p, (842, 1221), $B$, dir: "c", d: 0)
  lbl(p, (692, 1232), $P$, dir: "c", d: 0)
})

// 图 3·45：例 2，AC = BD，DS ∥ AC
#let fig-K-3-45(width: 445 * k) = px-canvas(445, 185, origin: (280, 785), width: width, (p, u) => {
  import cetz.draw: *
  let (A, D, B, C) = ((359, 804), (493, 804), (297, 937), (561, 937))
  let S = (700, 937)
  K-b(p, A, D)
  K-b(p, D, C)
  K-b(p, C, B)
  K-b(p, B, A)
  K-b(p, A, C)
  K-b(p, B, D)
  seg(p, D, S, stroke: dsh)
  seg(p, C, S, stroke: dsh)
  ticks(p, B, D, 1)
  ticks(p, A, C, 1)
  ticks(p, D, S, 1)
  anglearc(p, B, C, D, 26)
  anglearc(p, C, B, A, 26)
  anglearc(p, S, C, D, 22)
  lbl(p, (337, 928), tsm[1], dir: "c", d: 0)
  lbl(p, (526, 929), tsm[2], dir: "c", d: 0)
  lbl(p, (352, 794), $A$, dir: "c", d: 0)
  lbl(p, (503, 795), $D$, dir: "c", d: 0)
  lbl(p, (288, 946), $B$, dir: "c", d: 0)
  lbl(p, (567, 950), $C$, dir: "c", d: 0)
  lbl(p, (716, 958), $S$, dir: "c", d: 0)
})
