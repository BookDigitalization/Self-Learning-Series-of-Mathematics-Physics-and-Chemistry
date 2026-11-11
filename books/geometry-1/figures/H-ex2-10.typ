// 习题 2·10 各题插图（原书 p.128 第 3、4 题；p.129 第 5–8 题；p.130 第 9、11、12 题）；页面 200 dpi 坐标。
#import "H-base.typ": *

// 第 3 题：OP 平分 ∠AOB，MN⊥OP 于 C
#let fig-H-e10-q3(width: 350 * k) = px-canvas(350, 290, origin: (120, 540), width: width, (p, u) => {
  import cetz.draw: *
  let O = (148, 688)
  let (M, N) = ((390, 574), (390, 802))
  let (Pe, Ae, Be) = ((448, 688), (435, 551), (435, 825))
  let C = (390, 688)
  seg(p, O, Ae)
  seg(p, O, Be)
  seg(p, O, Pe)
  seg(p, M, N)
  rtmark(p, C, M, O)
  lbl(p, O, $O$, dir: "w", d: 11)
  lbl(p, Ae, $A$, dir: "ne", d: 9)
  lbl(p, Be, $B$, dir: "se", d: 9)
  lbl(p, Pe, $P$, dir: "e", d: 10)
  lbl(p, M, $M$, dir: "n", d: 11)
  lbl(p, N, $N$, dir: "s", d: 11)
  lbl(p, C, $C$, dir: "ne", d: 9)
})

// 第 4 题：OP=OQ，用三角板从 P、Q 作 OA、OB 的垂线，交于 C，连 OC（三角板画成直角三角形框，内有小孔）
#let fig-H-e10-q4(width: 340 * k) = px-canvas(340, 320, origin: (530, 535), width: width, (p, u) => {
  import cetz.draw: *
  let O = (695, 565)
  let (A, B) = ((552, 815), (838, 815))
  let (P, Q) = ((590, 748), (800, 748))
  let C = (695, 808)
  seg(p, O, A)
  seg(p, O, B)
  seg(p, O, (695, 838))
  seg(p, P, C)
  seg(p, Q, C)
  // 延长线（C 处交叉）
  H-thin(p, C, H-go(P, C, 148))
  H-thin(p, C, H-go(Q, C, 148))
  // 三角板
  let (T1, T2) = ((655, 650), (645, 782))
  poly(p, (P, T1, T2), close: true)
  line(p(630, 710), p(620, 755), p(641, 755), close: true, stroke: lt)
  let (S1, S2) = ((735, 650), (745, 782))
  poly(p, (Q, S1, S2), close: true)
  line(p(760, 710), p(770, 755), p(749, 755), close: true, stroke: lt)
  lbl(p, O, $O$, dir: "n", d: 11)
  lbl(p, A, $A$, dir: "sw", d: 10)
  lbl(p, B, $B$, dir: "se", d: 10)
  lbl(p, P, $P$, dir: "w", d: 10)
  lbl(p, Q, $Q$, dir: "e", d: 10)
  lbl(p, C, $C$, dir: "ne", d: 12)
})

// 第 5 题：OM 平分 ∠AOB，MC⊥OA，MD⊥OB
#let fig-H-e10-q5(width: 350 * k) = px-canvas(350, 300, origin: (110, 160), width: width, (p, u) => {
  import cetz.draw: *
  let O = (135, 315)
  let M = (388, 315)
  let (Ae, Be) = ((428, 180), (428, 450))
  let C = H-foot(M, O, Ae)
  let D = H-foot(M, O, Be)
  seg(p, O, Ae)
  seg(p, O, Be)
  seg(p, O, (447, 315))
  seg(p, C, D)
  seg(p, M, C)
  seg(p, M, D)
  lbl(p, O, $O$, dir: "w", d: 11)
  lbl(p, Ae, $A$, dir: "ne", d: 9)
  lbl(p, Be, $B$, dir: "se", d: 9)
  lbl(p, C, $C$, dir: "n", d: 11)
  lbl(p, D, $D$, dir: "s", d: 11)
  lbl(p, M, $M$, dir: "ne", d: 10)
})

// 第 6 题：AM=MC，CD⊥BM，AE⊥BM；M 为 AC 的中点
#let fig-H-e10-q6(width: 360 * k) = px-canvas(360, 310, origin: (500, 170), width: width, (p, u) => {
  import cetz.draw: *
  let (B, C, A) = ((680, 198), (825, 325), (535, 410))
  let M = H-at(A, C, 0.5)
  let D = (680, 325)
  let E = (680, 410)
  seg(p, B, A)
  seg(p, B, C)
  seg(p, A, C)
  seg(p, B, (680, 462))
  seg(p, D, C)
  seg(p, A, E)
  lbl(p, B, $B$, dir: "n", d: 11)
  lbl(p, C, $C$, dir: "e", d: 11)
  lbl(p, A, $A$, dir: "w", d: 11)
  lbl(p, D, $D$, dir: "w", d: 11)
  lbl(p, M, $M$, dir: "ne", d: 11)
  lbl(p, E, $E$, dir: "ne", d: 11)
})

// 第 7 题：AB=AC，AD⊥BC，DE⊥AB，DF⊥AC
#let fig-H-e10-q7(width: 350 * k) = px-canvas(350, 270, origin: (110, 790), width: width, (p, u) => {
  import cetz.draw: *
  let (A, B, C, D) = ((285, 815), (138, 1018), (432, 1018), (285, 1018))
  let E = H-foot(D, A, B)
  let F = H-foot(D, A, C)
  poly(p, (A, B, C), close: true)
  seg(p, A, D)
  seg(p, D, E)
  seg(p, D, F)
  lbl(p, A, $A$, dir: "n", d: 11)
  lbl(p, B, $B$, dir: "sw", d: 10)
  lbl(p, C, $C$, dir: "se", d: 10)
  lbl(p, D, $D$, dir: "s", d: 12)
  lbl(p, E, $E$, dir: "nw", d: 11)
  lbl(p, F, $F$, dir: "ne", d: 11)
})

// 第 8 题：AE=FB，CE⊥AB，DF⊥AB，BC∥AD；A、E、F、B 在一条直线上
#let fig-H-e10-q8(width: 430 * k) = px-canvas(430, 230, origin: (450, 805), width: width, (p, u) => {
  import cetz.draw: *
  let (A, D, C, B) = ((478, 1012), (795, 1012), (527, 837), (838, 832))
  let E = H-foot(C, A, B)
  let F = H-foot(D, A, B)
  seg(p, C, B)
  seg(p, A, D)
  seg(p, A, B)
  seg(p, C, E)
  seg(p, D, F)
  lbl(p, C, $C$, dir: "nw", d: 9)
  lbl(p, B, $B$, dir: "e", d: 10)
  lbl(p, A, $A$, dir: "w", d: 10)
  lbl(p, D, $D$, dir: "e", d: 10)
  lbl(p, E, $E$, dir: "sw", d: 10)
  lbl(p, F, $F$, dir: "ne", d: 10)
})

// 第 9 题：池塘，AC⊥AB，B'、A、B 共线，∠ACB'=∠ACB（B 在池塘对岸，CB 虚线）
// 池塘轮廓为示意，不是描摹
#let fig-H-e10-q9(width: 420 * k) = px-canvas(420, 340, origin: (120, 170), width: width, (p, u) => {
  import cetz.draw: *
  let pond = ((345, 232), (365, 192), (405, 179), (460, 182), (514, 196), (519, 226), (500, 262), (492, 300), (500, 340), (470, 395), (430, 418), (395, 410), (370, 372), (352, 322), (340, 276))
  H-hatch(p, pond, 0, 11, st: (paint: black, thickness: 0.6pt, dash: (3pt, 2pt)))
  catmull(..pond.map(q => p(..q)), close: true, stroke: lw)
  let (A, B, C, B2) = ((327, 285), (505, 285), (325, 490), (150, 282))
  seg(p, B2, A)
  seg(p, A, C)
  seg(p, B2, C)
  seg(p, A, B)
  dseg(p, C, B)
  lbl(p, B2, $B'$, dir: "w", d: 11)
  lbl(p, A, $A$, dir: "n", d: 12)
  lbl(p, B, $B$, dir: "ne", d: 9)
  lbl(p, C, $C$, dir: "s", d: 12)
})

// 第 11 题：CB⊥AE，AB=CB，BF=BE，A、F、H 在一直线上
#let fig-H-e10-q11(width: 400 * k) = px-canvas(400, 300, origin: (460, 205), width: width, (p, u) => {
  import cetz.draw: *
  let (A, B, E) = ((493, 472), (725, 472), (832, 472))
  let C = (725, 240)
  let F = (725, 365)
  let H = H-meet(A, F, C, E)
  seg(p, A, E)
  seg(p, B, C)
  seg(p, C, E)
  seg(p, A, H)
  rtmark(p, B, C, A)
  lbl(p, C, $C$, dir: "n", d: 11)
  lbl(p, A, $A$, dir: "w", d: 11)
  lbl(p, B, $B$, dir: "s", d: 12)
  lbl(p, E, $E$, dir: "e", d: 11)
  lbl(p, F, $F$, dir: "w", d: 11)
  lbl(p, H, $H$, dir: "ne", d: 11)
})

// 第 12 题：等腰 △ABC（AB=AC），BR、CS 为底角平分线，AS⊥CS，AR⊥BR
#let fig-H-e10-q12(width: 400 * k) = px-canvas(400, 240, origin: (470, 675), width: width, (p, u) => {
  import cetz.draw: *
  let (B, C, A) = ((500, 873), (838, 873), (669, 704))
  let bb = 45 / 2
  let P1 = H-meet(B, H-pol(B, 100, bb), A, C)
  let Q1 = H-meet(C, H-pol(C, 100, 180 - bb), A, B)
  let R = H-foot(A, B, P1)
  let S = H-foot(A, C, Q1)
  poly(p, (A, B, C), close: true)
  seg(p, B, P1)
  seg(p, C, Q1)
  seg(p, A, R)
  seg(p, A, S)
  rtmark(p, R, A, B, s: 7)
  rtmark(p, S, A, C, s: 7)
  anglearc(p, B, C, P1, 40)
  anglearc(p, B, P1, A, 32)
  anglearc(p, C, B, Q1, 40)
  anglearc(p, C, Q1, A, 32)
  lbl(p, A, $A$, dir: "n", d: 11)
  lbl(p, B, $B$, dir: "w", d: 11)
  lbl(p, C, $C$, dir: "e", d: 11)
  lbl(p, S, $S$, dir: "sw", d: 11)
  lbl(p, R, $R$, dir: "se", d: 11)
})
