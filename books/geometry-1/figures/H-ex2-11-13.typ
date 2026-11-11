// 习题 2·11（原书 p.137 第 5 题、p.138 第 12 题）、习题 2·12（p.141 第 4、7、8 题，p.142 第 10 题）、
// 习题 2·13（p.145 第 2、4 题）各题插图；页面 200 dpi 坐标。
#import "H-base.typ": *

// ───── 习题 2·11 ─────
// 第 5 题：已知腰 b 和顶角 ∠A，作等腰三角形（左：已知，右：所作 △ABC）
#let fig-H-e11-q5(width: 610 * k) = px-canvas(610, 270, origin: (170, 465), width: width, (p, u) => {
  import cetz.draw: *
  pseg(p, (195, 495), (450, 495))
  content(p(328, 483), tt($b$))
  let A0 = (187, 598)
  seg(p, A0, H-pol(A0, 225, 16.4))
  seg(p, A0, H-pol(A0, 238, -26.9))
  H-arc(p, A0, 96, -38, 30, st: dsh)
  lbl(p, A0, $A$, dir: "w", d: 11)
  let (A, B, C) = ((638, 458), (538, 707), (738, 707))
  poly(p, (A, B, C), close: true)
  let a1 = H-ang(A, B)
  let a2 = H-ang(A, C)
  H-arc(p, A, 91, a1 - 3, a2 + 3, st: dsh)
  lbl(p, A, $A$, dir: "n", d: 12)
  lbl(p, B, $B$, dir: "sw", d: 10)
  lbl(p, C, $C$, dir: "se", d: 10)
  content(p(576, 582), tt($b$))
  content(p(704, 593), tt($b$))
})

// 第 12 题（星号题）：已知 ∠A、对边 a（=BC）和 AB 边上的高 CH
// 原图 AC 旁只有零星墨点，无字母；H 点字母形似 H，凭文意（高的垂足）标 H，用 unclear 标出
#let fig-H-e11-q12(width: 430 * k) = px-canvas(430, 260, origin: (270, 330), width: width, (p, u) => {
  import cetz.draw: *
  let (A, B, C) = ((300, 547), (655, 547), (555, 348))
  let Hf = (555, 547)
  poly(p, (A, B, C), close: true)
  seg(p, C, Hf)
  rtmark(p, Hf, C, B)
  anglearc(p, A, B, C, 45)
  lbl(p, A, $A$, dir: "w", d: 11)
  lbl(p, B, $B$, dir: "e", d: 11)
  lbl(p, C, $C$, dir: "n", d: 11)
  content(p(555, 565), tt(unclear[$H$]))
  content(p(541, 452), tt($h$))
  content(p(622, 436), tt($a$))
})

// ───── 习题 2·12 ─────
// 第 4 题：∠2>∠1（∠1、∠2 分别是 A、C 处的外角）
#let fig-H-e12-q4(width: 310 * k) = px-canvas(310, 240, origin: (550, 460), width: width, (p, u) => {
  import cetz.draw: *
  let (B, A, C) = ((663, 490), (620, 655), (798, 653))
  poly(p, (A, B, C), close: true)
  seg(p, (572, 655), (838, 655))
  lbl(p, B, $B$, dir: "n", d: 11)
  lbl(p, A, $A$, dir: "s", d: 12)
  lbl(p, C, $C$, dir: "s", d: 12)
  content(p(609, 642), tsm($1$))
  content(p(810, 640), tsm($2$))
})

// 第 7 题：AB=AC，ACE 是一直线，D 在 AB 上
#let fig-H-e12-q7(width: 320 * k) = px-canvas(320, 300, origin: (170, 930), width: width, (p, u) => {
  import cetz.draw: *
  let (A, B, C) = ((302, 957), (200, 1120), (402, 1127))
  let E = (445, 1198)
  let D = (232, 1068)
  seg(p, A, B)
  seg(p, A, E)
  seg(p, B, C)
  seg(p, D, E)
  lbl(p, A, $A$, dir: "n", d: 11)
  lbl(p, B, $B$, dir: "sw", d: 10)
  lbl(p, C, $C$, dir: "ne", d: 10)
  lbl(p, D, $D$, dir: "w", d: 11)
  lbl(p, E, $E$, dir: "se", d: 10)
})

// 第 8 题：M 为 BC 的中点，延长 AM 至 E，使 ME=AM，连 EC（虚线）
#let fig-H-e12-q8(width: 350 * k) = px-canvas(350, 400, origin: (510, 860), width: width, (p, u) => {
  import cetz.draw: *
  let (A, B, C) = ((738, 873), (550, 1048), (820, 1052))
  let M = H-at(B, C, 0.5)
  let E = (2 * M.at(0) - A.at(0), 2 * M.at(1) - A.at(1))
  poly(p, (A, B, C), close: true)
  seg(p, A, M)
  dseg(p, M, E)
  dseg(p, E, C)
  lbl(p, A, $A$, dir: "n", d: 11)
  lbl(p, B, $B$, dir: "w", d: 11)
  lbl(p, C, $C$, dir: "e", d: 11)
  lbl(p, M, $M$, dir: "ne", d: 12)
  lbl(p, E, $E$, dir: "s", d: 11)
})

// 第 10 题：AD 平分 ∠A，AB>AC；延长 AC 至 E，使 AE=AB，连 DE（虚线）
#let fig-H-e12-q10(width: 310 * k) = px-canvas(310, 290, origin: (530, 290), width: width, (p, u) => {
  import cetz.draw: *
  let (A, B, C) = ((733, 305), (565, 490), (780, 490))
  let ab = calc.sqrt(calc.pow(B.at(0) - A.at(0), 2) + calc.pow(B.at(1) - A.at(1), 2))
  let ac = calc.sqrt(calc.pow(C.at(0) - A.at(0), 2) + calc.pow(C.at(1) - A.at(1), 2))
  let D = H-at(B, C, ab / (ab + ac))
  let E = H-go(A, C, ab)
  poly(p, (A, B, C), close: true)
  seg(p, A, D)
  dseg(p, C, E)
  dseg(p, D, E)
  anglearc(p, A, B, D, 34)
  anglearc(p, A, D, C, 34)
  lbl(p, A, $A$, dir: "n", d: 11)
  lbl(p, B, $B$, dir: "w", d: 11)
  lbl(p, C, $C$, dir: "ne", d: 10)
  lbl(p, D, $D$, dir: "s", d: 12)
  lbl(p, E, $E$, dir: "se", d: 10)
})

// ───── 习题 2·13 ─────
// 第 2 题：A 在海岸线上，B、C 为两岛（AB=AC），P 为目标
#let fig-H-e13-q2(width: 360 * k) = px-canvas(360, 350, origin: (130, 570), width: width, (p, u) => {
  import cetz.draw: *
  let (P, B, C, A) = ((355, 597), (190, 722), (430, 712), (318, 885))
  seg(p, (150, 882), (470, 882))
  seg(p, P, B)
  seg(p, P, C)
  seg(p, A, B)
  seg(p, A, C)
  seg(p, A, P)
  ticks(p, A, B, 1)
  ticks(p, A, C, 1)
  lbl(p, P, $P$, dir: "n", d: 11)
  lbl(p, B, $B$, dir: "w", d: 11)
  lbl(p, C, $C$, dir: "e", d: 11)
  lbl(p, A, $A$, dir: "s", d: 12)
})

// 第 4 题：AD=BC，∠A>∠B，求证 BD>AC。原图顶点字母印作 O（形似），按题文标 C
#let fig-H-e13-q4(width: 360 * k) = px-canvas(360, 260, origin: (500, 620), width: width, (p, u) => {
  import cetz.draw: *
  let (C, D, B, A) = ((600, 648), (535, 715), (825, 715), (730, 842))
  seg(p, C, D)
  seg(p, C, B)
  seg(p, C, A)
  seg(p, D, B)
  seg(p, D, A)
  seg(p, A, B)
  ticks(p, C, B, 1)
  ticks(p, D, A, 1)
  anglearc(p, A, D, B, 26)
  anglearc(p, A, D, B, 31)
  anglearc(p, B, C, A, 32)
  lbl(p, C, $C$, dir: "n", d: 11)
  lbl(p, D, $D$, dir: "w", d: 11)
  lbl(p, B, $B$, dir: "e", d: 11)
  lbl(p, A, $A$, dir: "s", d: 12)
})
