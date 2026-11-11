// 图 2·1、2·2（原书 p.116）、2·3、2·4（p.117）、2·5（p.118）、2·6、2·7（p.119）、2·8（p.120）；页面 120 dpi 坐标。
// 图 2·5：C 点按 AC'=2、C'B=8、CC'=4 算出（1 cm = 33.5 像素），原图手绘略偏高。图 2·6、2·7 的点 D 按比例中项算出。
#import "G-base.typ": *

// 图 2·1
#let fig-G-2-1(width: 330 * k) = px-canvas(330, 230, origin: (140, 690), width: width, (p, u) => {
  import cetz.draw: *
  line(p(165, 886), p(448, 886), stroke: lb)
  lbl(p, (152, 886), $M$, dir: "c", d: 0)
  lbl(p, (462, 886), $N$, dir: "c", d: 0)
  // 左：点 A 在 MN 上，射影是它本身
  dseg(p, (257, 812), (257, 880))
  lbl(p, (268, 870), $A$, dir: "c", d: 0)
  lbl(p, (252, 904), $(A')$, dir: "c", d: 0)
  // 右：AA' ⊥ MN
  dseg(p, (378, 722), (378, 886))
  rtmark(p, (378, 886), (378, 722), (440, 886), s: 9)
  lbl(p, (381, 702), $A$, dir: "c", d: 0)
  lbl(p, (380, 902), $A'$, dir: "c", d: 0)
})

// 图 2·2
#let fig-G-2-2(width: 330 * k) = px-canvas(330, 230, origin: (515, 690), width: width, (p, u) => {
  import cetz.draw: *
  line(p(545, 886), p(828, 886), stroke: lb)
  lbl(p, (537, 886), $M$, dir: "c", d: 0)
  lbl(p, (840, 886), $N$, dir: "c", d: 0)
  let A = (645, 765)
  let B = (762, 702)
  dseg(p, A, (645, 886))
  dseg(p, B, (762, 886))
  G-bold(p, A, B)
  rtmark(p, (645, 886), A, (720, 886), s: 9)
  rtmark(p, (762, 886), B, (800, 886), s: 9)
  lbl(p, A, $A$, dir: "nw", d: 9)
  lbl(p, B, $B$, dir: "ne", d: 8)
  lbl(p, (645, 902), $A'$, dir: "c", d: 0)
  lbl(p, (764, 902), $B'$, dir: "c", d: 0)
})

// 图 2·3：七种情形（线段 A_iB_i 在直线 MN 上的射影）
#let fig-G-2-3(width: 740 * k) = px-canvas(740, 235, origin: (130, 175), width: width, (p, u) => {
  import cetz.draw: *
  let y0 = 322
  line(p(160, y0), p(840, y0), stroke: lb)
  lbl(p, (148, y0 - 2), $M$, dir: "c", d: 0)
  lbl(p, (850, y0 + 2), $N$, dir: "c", d: 0)
  // 1
  G-bold(p, (216, 230), (310, 230))
  dseg(p, (216, 230), (216, y0))
  dseg(p, (310, 230), (310, y0))
  lbl(p, (216, 218), $A_1$, dir: "c", d: 0)
  lbl(p, (312, 218), $B_1$, dir: "c", d: 0)
  lbl(p, (216, 340), $A'_1$, dir: "c", d: 0)
  lbl(p, (310, 340), $B'_1$, dir: "c", d: 0)
  // 2
  G-bold(p, (338, 262), (423, 218))
  dseg(p, (338, 262), (338, y0))
  dseg(p, (423, 218), (423, y0))
  lbl(p, (328, 252), $A_2$, dir: "c", d: 0)
  lbl(p, (424, 204), $B_2$, dir: "c", d: 0)
  lbl(p, (338, 340), $A'_2$, dir: "c", d: 0)
  lbl(p, (424, 340), $B'_2$, dir: "c", d: 0)
  // 3
  G-bold(p, (448, y0), (527, 242))
  dseg(p, (527, 242), (527, y0))
  lbl(p, (437, 302), $A_3$, dir: "c", d: 0)
  lbl(p, (532, 230), $B_3$, dir: "c", d: 0)
  lbl(p, (452, 340), $A'_3$, dir: "c", d: 0)
  lbl(p, (527, 340), $B'_3$, dir: "c", d: 0)
  // 4
  G-bold(p, (556, 365), (651, 278))
  dseg(p, (556, 365), (556, y0))
  dseg(p, (651, 278), (651, y0))
  lbl(p, (556, 310), $A'_4$, dir: "c", d: 0)
  lbl(p, (556, 380), $A_4$, dir: "c", d: 0)
  lbl(p, (656, 266), $B_4$, dir: "c", d: 0)
  lbl(p, (650, 340), $B'_4$, dir: "c", d: 0)
  // 5
  G-bold(p, (684, 195), (684, 286))
  dseg(p, (684, 286), (684, y0))
  lbl(p, (684, 183), $B_5$, dir: "c", d: 0)
  lbl(p, (698, 286), $A_5$, dir: "c", d: 0)
  lbl(p, (708, 340), $A'_5 (B'_5)$, dir: "c", d: 0)
  // 6
  G-bold(p, (735, 220), (735, y0))
  lbl(p, (741, 207), $B_6$, dir: "c", d: 0)
  lbl(p, (745, 338), $A_6$, dir: "c", d: 0)
  lbl(p, (735, 360), $(A'_6 B'_6)$, dir: "c", d: 0)
  // 7
  G-bold(p, (785, 270), (785, 378))
  lbl(p, (790, 258), $B_7$, dir: "c", d: 0)
  lbl(p, (810, 338), $A'_7 (B'_7)$, dir: "c", d: 0)
  lbl(p, (787, 392), $A_7$, dir: "c", d: 0)
})

// 图 2·4：直角三角形 ABC，CD ⊥ AB
#let fig-G-2-4(width: 330 * k) = px-canvas(330, 195, origin: (530, 880), width: width, (p, u) => {
  import cetz.draw: *
  let A = (556, 1048)
  let B = (830, 1048)
  let C = (760, 908)
  let D = (760, 1048)
  seg(p, A, B)
  seg(p, A, C)
  seg(p, C, B)
  seg(p, C, D)
  rtmark(p, D, C, B, s: 9)
  anglearc(p, A, B, C, 30)
  anglearc(p, C, D, B, 24)
  lbl(p, A, $A$, dir: "nw", d: 9)
  lbl(p, B, $B$, dir: "ne", d: 9)
  lbl(p, C, $C$, dir: "n", d: 9)
  lbl(p, D, $D$, dir: "s", d: 11)
})

// 图 2·5：半圆，C' 是 C 在直径 AB 上的射影，AC' = 2，C'B = 8
#let fig-G-2-5(width: 375 * k) = px-canvas(375, 240, origin: (495, 800), width: width, (p, u) => {
  import cetz.draw: *
  let A = (513, 1010)
  let B = (848, 1010)
  let O = (680.5, 1010)
  let C1 = (580, 1010)
  let C = (580, 1010 - 4 * 33.5)
  G-semi(p, O, 167.5, stroke: lb)
  seg(p, A, B)
  seg(p, A, C)
  seg(p, C, B)
  seg(p, C, C1)
  rtmark(p, C1, C, B, s: 9)
  rtmark(p, C, A, B, s: 10)
  lbl(p, A, $A$, dir: "sw", d: 9)
  lbl(p, B, $B$, dir: "se", d: 9)
  lbl(p, C1, $C'$, dir: "s", d: 12)
  lbl(p, C, $C$, dir: "nw", d: 9)
})

// 图 2·6：已知线段 a、b，作比例中项 BD
#let fig-G-2-6(width: 425 * k) = px-canvas(425, 260, origin: (285, 550), width: width, (p, u) => {
  import cetz.draw: *
  pseg(p, (312, 575), (470, 575))
  pseg(p, (312, 605), (418, 605))
  lbl(p, (396, 565), $a$, dir: "c", d: 0)
  lbl(p, (362, 595), $b$, dir: "c", d: 0)
  let A = (382, 780)
  let B = (537, 780)
  let C = (643, 780)
  let O = (512.5, 780)
  let D = (537, 780 - calc.sqrt(155 * 106))
  line(p(300, 780), p(700, 780), stroke: lt)
  lbl(p, (293, 780), $M$, dir: "c", d: 0)
  lbl(p, (712, 780), $N$, dir: "c", d: 0)
  G-semi(p, O, 130.5, stroke: (thickness: 1.3pt, dash: "dashed"))
  dseg(p, A, D)
  dseg(p, D, C)
  G-bold(p, B, D)
  lbl(p, A, $A$, dir: "s", d: 13)
  lbl(p, B, $B$, dir: "s", d: 13)
  lbl(p, C, $C$, dir: "s", d: 13)
  lbl(p, (460, 795), $a$, dir: "c", d: 0)
  lbl(p, (590, 795), $b$, dir: "c", d: 0)
  lbl(p, D, $D$, dir: "n", d: 11)
})

// 图 2·7：另一作法，AB = a，AC = b，以 AB 为直径作半圆，DC ⊥ AB
#let fig-G-2-7(width: 320 * k) = px-canvas(320, 160, origin: (550, 1100), width: width, (p, u) => {
  import cetz.draw: *
  let A = (627, 1210)
  let B = (788, 1210)
  let C = (733, 1210)
  let O = (707.5, 1210)
  let D = (733, 1210 - calc.sqrt(106 * 55))
  line(p(572, 1210), p(840, 1210), stroke: lt)
  lbl(p, (562, 1210), $M$, dir: "c", d: 0)
  lbl(p, (852, 1210), $N$, dir: "c", d: 0)
  G-semi(p, O, 80.5, stroke: (thickness: 1.3pt, dash: "dashed"))
  G-bold(p, A, D)
  dseg(p, D, C)
  dseg(p, D, B)
  lbl(p, A, $A$, dir: "s", d: 12)
  lbl(p, C, $C$, dir: "s", d: 12)
  lbl(p, B, $B$, dir: "s", d: 12)
  lbl(p, D, $D$, dir: "n", d: 10)
  lbl(p, (693, 1194), $b$, dir: "c", d: 0)
  dimh(p, 627, 788, 1238, lab: $a$, labx: 705)
  seg(p, (627, 1228), (627, 1248))
  seg(p, (788, 1228), (788, 1248))
})

// 图 2·8：△ABC，CD ⊥ AB，CD² = AD · DB
#let fig-G-2-8(width: 365 * k) = px-canvas(365, 220, origin: (495, 540), width: width, (p, u) => {
  import cetz.draw: *
  let A = (520, 722)
  let D = (628, 722)
  let B = (830, 722)
  let C = (628, 568)
  seg(p, A, B)
  seg(p, A, C)
  seg(p, C, B)
  seg(p, C, D)
  rtmark(p, D, C, B, s: 9)
  anglearc(p, A, B, C, 26)
  anglearc(p, C, D, B, 22)
  lbl(p, A, $A$, dir: "sw", d: 9)
  lbl(p, B, $B$, dir: "ne", d: 9)
  lbl(p, C, $C$, dir: "n", d: 10)
  lbl(p, D, $D$, dir: "s", d: 11)
})
