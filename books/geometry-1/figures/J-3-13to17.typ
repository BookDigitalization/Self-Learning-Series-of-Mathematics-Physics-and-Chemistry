// 图 3·13（原书 p.174）、3·14、3·15（p.175）、3·16、3·17（p.176）；页面 200 dpi 坐标。
#import "J-base.typ": *

// 图 3·13：AB = DC，AD = BC（AB、DC 各 1 道，AD、BC 各 2 道短横），对角线 DB 虚线；∠1–∠4
#let fig-J-3-13(width: 370 * k) = px-canvas(370, 195, origin: (520, 700), width: width, (p, u) => {
  import cetz.draw: *
  let (D, C, B, A) = ((611, 727), (853, 727), (790, 862), (548, 862))
  poly(p, (A, B, C, D), close: true)
  seg(p, D, B, stroke: dsh)
  ticks(p, A, B, 1)
  ticks(p, D, C, 1)
  ticks(p, A, D, 2)
  ticks(p, B, C, 2)
  lbl(p, D, $D$, dir: "nw", d: 11)
  lbl(p, C, $C$, dir: "ne", d: 11)
  lbl(p, B, $B$, dir: "se", d: 11)
  lbl(p, A, $A$, dir: "sw", d: 11)
  J-num(p, (617, 747), $4$)
  J-num(p, (642, 740), $1$)
  J-num(p, (777, 846), $3$)
  J-num(p, (750, 852), $2$)
})

// 图 3·14：OA = OC（1 道）、OB = OD（2 道）
#let fig-J-3-14(width: 370 * k) = px-canvas(370, 215, origin: (530, 460), width: width, (p, u) => {
  import cetz.draw: *
  let (D, C, B, A) = ((621, 481), (858, 481), (790, 616), (553, 616))
  let O = (705.5, 548.5)
  poly(p, (A, B, C, D), close: true)
  seg(p, A, C)
  seg(p, B, D)
  ticks(p, O, A, 1)
  ticks(p, O, C, 1)
  ticks(p, O, B, 2)
  ticks(p, O, D, 2)
  lbl(p, D, $D$, dir: "nw", d: 11)
  lbl(p, C, $C$, dir: "ne", d: 11)
  lbl(p, B, $B$, dir: "se", d: 11)
  lbl(p, A, $A$, dir: "sw", d: 11)
  lbl(p, O, $O$, dir: "ne", d: 10)
})

// 点 q 在直线 a–b 上的垂足
#let J-foot(a, b, q) = {
  let (dx, dy) = (b.at(0) - a.at(0), b.at(1) - a.at(1))
  let t = ((q.at(0) - a.at(0)) * dx + (q.at(1) - a.at(1)) * dy) / (dx * dx + dy * dy)
  (a.at(0) + dx * t, a.at(1) + dy * t)
}

// 图 3·15：AC 是 □ABCD 的对角线，BM ⊥ AC，DN ⊥ AC
#let fig-J-3-15(width: 400 * k) = px-canvas(400, 240, origin: (480, 820), width: width, (p, u) => {
  import cetz.draw: *
  let (D, C, B, A) = ((565, 845), (840, 845), (773, 1018), (498, 1018))
  let M = J-foot(A, C, B)
  let N = J-foot(A, C, D)
  poly(p, (A, B, C, D), close: true)
  seg(p, A, C)
  seg(p, B, D)
  seg(p, B, M)
  seg(p, D, N)
  rtmark(p, M, C, B, s: 9)
  rtmark(p, N, A, D, s: 9)
  lbl(p, D, $D$, dir: "nw", d: 11)
  lbl(p, C, $C$, dir: "ne", d: 11)
  lbl(p, B, $B$, dir: "se", d: 11)
  lbl(p, A, $A$, dir: "sw", d: 11)
  lbl(p, M, $M$, dir: "ne", d: 11)
  lbl(p, N, $N$, dir: "se", d: 11)
  J-num(p, (822, 866), $1$)
  J-num(p, (520, 997), $2$)
})

// 图 3·16：M、N、P、Q 分别是 OA、OB、OC、OD 的中点
#let fig-J-3-16(width: 430 * k) = px-canvas(430, 230, origin: (440, 415), width: width, (p, u) => {
  import cetz.draw: *
  let (D, C, B, A) = ((568, 436), (840, 436), (738, 607), (466, 607))
  let O = (653, 521.5)
  let mid(a, b) = ((a.at(0) + b.at(0)) / 2, (a.at(1) + b.at(1)) / 2)
  let (M, N, P, Q) = (mid(O, A), mid(O, B), mid(O, C), mid(O, D))
  poly(p, (A, B, C, D), close: true)
  seg(p, A, C)
  seg(p, B, D)
  poly(p, (M, N, P, Q), close: true)
  lbl(p, D, $D$, dir: "nw", d: 11)
  lbl(p, C, $C$, dir: "ne", d: 11)
  lbl(p, B, $B$, dir: "se", d: 11)
  lbl(p, A, $A$, dir: "sw", d: 11)
  lbl(p, O, $O$, dir: "n", d: 10)
  lbl(p, M, $M$, dir: "s", d: 10)
  lbl(p, N, $N$, dir: "se", d: 10)
  lbl(p, P, $P$, dir: "ne", d: 10)
  lbl(p, Q, $Q$, dir: "n", d: 10)
})

// 图 3·17：天平示意图
#let fig-J-3-17(width: 320 * k) = px-canvas(320, 170, origin: (550, 1060), width: width, (p, u) => {
  import cetz.draw: *
  // 秤盘
  line(p(560, 1074), p(657, 1074), p(645, 1087), p(572, 1087), close: true, stroke: lb)
  line(p(750, 1074), p(852, 1074), p(833, 1087), p(762, 1087), close: true, stroke: lb)
  // 吊杆
  line(p(603, 1087), p(603, 1163), stroke: lb)
  line(p(800, 1087), p(800, 1163), stroke: lb)
  // 横杆
  line(p(603, 1116), p(800, 1116), stroke: lb)
  line(p(605, 1164), p(800, 1164), stroke: lb)
  // 支柱（空心长条）与中间的细杆
  line(p(693, 1192), p(693, 1092), p(713, 1092), p(713, 1192), stroke: lb)
  line(p(703, 1100), p(703, 1160), stroke: 2.2pt)
  // 底座
  rect(p(568, 1213), p(842, 1193), stroke: lb)
  for (c, r) in (((603, 1116), 3.5), ((800, 1116), 3.5), ((703, 1116), 3.5),
    ((605, 1164), 3.5), ((800, 1164), 3.5), ((703, 1164), 3.5)) {
    J-ring(p, c, r: r)
  }
  lbl(p, (603, 1116), $A$, dir: "w", d: 11)
  lbl(p, (800, 1116), $B$, dir: "e", d: 12)
  lbl(p, (703, 1116), $O$, dir: "ne", d: 12)
  lbl(p, (703, 1164), $O_1$, dir: "ne", d: 14)
  lbl(p, (605, 1164), $A_1$, dir: "sw", d: 12)
  lbl(p, (800, 1164), $B_1$, dir: "se", d: 14)
})
