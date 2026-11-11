// 第 2 章 §2·1–§2·3（图 2·1–2·18，p.77–88）及习题 2·1、2·2 的插图。页面渲染 200 dpi。
// 图 2·1 是写实插画（起重机、桥、电杆、木屋）：原扫描二值化裁剪 E-2-1.png。
#import "/books/geometry-1/figures/E-lib.typ": *

// 图 2·1（p.77）
#let fig-E-2-1(width: 635 * k) = px-canvas(635, 550, origin: (215, 702), width: width, (p, u) => {
  import cetz.draw: *
  E-img(p, u, "E-2-1.png", (215, 702, 850, 1252))
})

// 图 2·2（p.78）：△ABC 的边 a、b、c
#let fig-E-2-2(width: 340 * k) = px-canvas(340, 205, origin: (490, 215), width: width, (p, u) => {
  import cetz.draw: *
  let A = (508, 393)
  let B = (790, 393)
  let C = (715, 230)
  poly(p, (A, B, C), close: true)
  lbl(p, A, $A$, dir: "sw", d: 9)
  lbl(p, B, $B$, dir: "se", d: 9)
  lbl(p, C, $C$, dir: "n", d: 10)
  E-t(p, (770, 308), tt($a$))
  E-t(p, (603, 296), tt($b$))
  E-t(p, (660, 408), tt($c$))
})

// 图 2·3 (1)（p.78）：△ABC 的外角 ∠CBP
#let fig-E-2-3a(width: 370 * k) = px-canvas(370, 185, origin: (100, 945), width: width, (p, u) => {
  import cetz.draw: *
  let A = (132, 1096)
  let B = (345, 1096)
  let C = (297, 985)
  let P = (433, 1096)
  seg(p, A, P)
  seg(p, A, C)
  seg(p, C, B)
  anglearc(p, B, P, C, 17)
  anglearc(p, B, P, C, 22)
  lbl(p, C, $C$, dir: "n", d: 12)
  lbl(p, A, $A$, dir: "sw", d: 9)
  lbl(p, B, $B$, dir: "se", d: 9)
  lbl(p, P, $P$, dir: "e", d: 10)
})

// 图 2·3 (2)（p.78）：三角形每个顶角的两个外角
#let fig-E-2-3b(width: 310 * k) = px-canvas(310, 210, origin: (490, 940), width: width, (p, u) => {
  import cetz.draw: *
  seg(p, (497, 1095), (800, 1095))
  seg(p, (498, 1124), (726, 957))
  seg(p, (690, 953), (764, 1130))
  E-n(p, 532, 1081, $1$)
  E-n(p, 542, 1109, $2$)
  E-n(p, 745, 1112, $3$)
  E-n(p, 759, 1083, $4$)
  E-n(p, 713, 989, $5$)
  E-n(p, 688, 969, $6$)
  E-t(p, (518, 1103), tt($A$))
  E-t(p, (772, 1101), tt($B$))
  E-t(p, (706, 961), tt($C$))
})

// 图 2·4（p.79）：不等边三角形
#let fig-E-2-4(width: 490 * k) = px-canvas(490, 160, origin: (255, 620), width: width, (p, u) => {
  import cetz.draw: *
  poly(p, ((268, 765), (437, 648), (500, 765)), close: true)
  poly(p, ((530, 632), (630, 768), (732, 768)), close: true)
})

// 图 2·5（p.79）：等腰三角形（顶角、腰、底）
#let fig-E-2-5(width: 450 * k) = px-canvas(450, 225, origin: (140, 825), width: width, (p, u) => {
  import cetz.draw: *
  let T1 = ((237, 852), (152, 1015), (318, 1015))
  poly(p, T1, close: true)
  ticks(p, T1.at(0), T1.at(1), 1)
  ticks(p, T1.at(0), T1.at(2), 1)
  E-t(p, (237, 835), tt[顶角])
  E-t(p, (176, 930), tt[腰])
  E-t(p, (299, 930), tt[腰])
  E-t(p, (237, 1033), tt[底])
  let T2 = ((370, 1015), (472, 918), (578, 1015))
  poly(p, T2, close: true)
  ticks(p, T2.at(0), T2.at(1), 2)
  ticks(p, T2.at(1), T2.at(2), 2)
})

// 图 2·6（p.79）：等边三角形
#let fig-E-2-6(width: 215 * k) = px-canvas(215, 185, origin: (635, 855), width: width, (p, u) => {
  import cetz.draw: *
  let T = ((655, 1020), (745, 872), (832, 1020))
  poly(p, T, close: true)
  ticks(p, T.at(0), T.at(1), 1)
  ticks(p, T.at(1), T.at(2), 1)
  ticks(p, T.at(2), T.at(0), 1)
})

// 习题 2·1 第 1 题（p.80）
#let fig-E-ex2-1-1(width: 340 * k) = px-canvas(340, 145, origin: (310, 880), width: width, (p, u) => {
  import cetz.draw: *
  let A = (338, 1005)
  let B = (620, 1005)
  let C = (558, 903)
  let D = (367, 928)
  let O = E-meet(A, C, B, D)
  poly(p, (A, B, C, D), close: true)
  seg(p, A, C)
  seg(p, B, D)
  lbl(p, D, $D$, dir: "nw", d: 9)
  lbl(p, C, $C$, dir: "ne", d: 9)
  lbl(p, A, $A$, dir: "sw", d: 9)
  lbl(p, B, $B$, dir: "se", d: 9)
  lbl(p, O, $O$, dir: "s", d: 9)
})

// 图 2·7（p.81）：把三角形的两个角剪下来拼到第三个角上。阴影纸片的边界按原图描出（手撕边，大致相似）
#let fig-E-2-7(width: 610 * k) = px-canvas(610, 120, origin: (220, 975), width: width, (p, u) => {
  import cetz.draw: *
  let blob(pts, fill-paint) = line(..pts.map(t => p(..t)), close: true, stroke: lt, fill: fill-paint)
  // 左：三角形，剪下 ∠1（左下）和 ∠2（上）
  let A = (240, 1077)
  let T = (313, 988)
  let C = (458, 1077)
  seg(p, (236, 1077), (462, 1077))
  seg(p, A, T)
  seg(p, T, C)
  blob(((240, 1077), (270, 1040), (283, 1040), (295, 1050), (300, 1060), (298, 1070), (293, 1077)), E-hd)
  blob(((270, 1040), (313, 988), (387, 1034), (378, 1045), (360, 1051), (340, 1049), (323, 1045), (313, 1050),
    (300, 1053), (295, 1050), (283, 1040)), E-hv)
  anglearc(p, T, A, C, 20)
  anglearc(p, C, T, A, 22)
  E-n(p, 267, 1068, $1$)
  E-n(p, 322, 1015, $2$)
  E-n(p, 429, 1070, $3$)
  // 右：∠1、∠2 拼到 ∠3 旁，三个角在一条直线上
  let A2 = (515, 1078)
  let T2 = (598, 985)
  let V = (762, 1077)
  seg(p, (511, 1078), (822, 1078))
  seg(p, A2, T2)
  seg(p, T2, V)
  blob(((515, 1078), (537, 1052), (550, 1032), (565, 1033), (572, 1040), (578, 1050), (580, 1058), (583, 1065),
    (582, 1072), (577, 1078)), E-hd)
  blob(((550, 1032), (598, 985), (680, 1032), (673, 1043), (663, 1050), (650, 1055), (640, 1053), (628, 1047),
    (617, 1045), (612, 1050), (600, 1047), (587, 1040), (575, 1037), (565, 1033)), E-hv)
  blob((V, (680, 1032), (687, 1028), (697, 1018), (707, 1012), (717, 1011), (727, 1013), (737, 1018), (748, 1018),
    (757, 1016), (767, 1018), (777, 1022), (787, 1030), (795, 1035), (802, 1038)), E-hv)
  blob((V, (802, 1038), (810, 1052), (817, 1057), (817, 1067), (820, 1075), (822, 1078)), E-hd)
  anglearc(p, A2, T2, V, 22)
  anglearc(p, T2, A2, V, 22)
  anglearc(p, V, (700, 1077), T2, 17)
  anglearc(p, V, T2, (802, 1038), 17)
  anglearc(p, V, (802, 1038), (830, 1077), 17)
  E-n(p, 547, 1067, $1$)
  E-n(p, 600, 1017, $2$)
  E-n(p, 728, 1070, $3$)
  E-n(p, 763, 1052, $2$)
  E-n(p, 795, 1066, $1$)
})

// 图 2·8（p.82）：延长 BC 到 D，过 C 画 CE ∥ BA
#let fig-E-2-8(width: 430 * k) = px-canvas(430, 200, origin: (270, 245), width: width, (p, u) => {
  import cetz.draw: *
  let B = (300, 412)
  let C = (580, 412)
  let A = (390, 288)
  let E = (676, 276)
  seg(p, B, A)
  seg(p, A, C)
  seg(p, B, (672, 412))
  seg(p, C, E)
  E-n(p, 573, 390, $1$)
  E-n(p, 602, 400, $2$)
  lbl(p, A, $A$, dir: "n", d: 10)
  lbl(p, B, $B$, dir: "sw", d: 9)
  lbl(p, C, $C$, dir: "s", d: 12)
  lbl(p, (672, 412), $D$, dir: "e", d: 10)
  lbl(p, E, $E$, dir: "ne", d: 8)
})

// 图 2·9（p.83）：锐角三角形
#let fig-E-2-9(width: 280 * k) = px-canvas(280, 185, origin: (100, 160), width: width, (p, u) => {
  import cetz.draw: *
  poly(p, ((118, 325), (315, 172), (358, 320)), close: true)
})

// 图 2·10（p.83）：直角三角形（直角边、斜边）
#let fig-E-2-10(width: 460 * k) = px-canvas(460, 225, origin: (380, 125), width: width, (p, u) => {
  import cetz.draw: *
  let T = (410, 138)
  let R = (410, 325)
  let S = (560, 325)
  poly(p, (T, R, S), close: true)
  rtmark(p, R, T, S, s: 9)
  content(p(397, 235), tt[直角边], angle: 90deg)
  E-t(p, (482, 341), tt[直角边])
  content(p(494, 224), tt[斜边], angle: -51deg)
  let T2 = (752, 203)
  poly(p, ((590, 302), T2, (815, 298)), close: true)
  rtmark(p, T2, (590, 302), (815, 298), s: 9)
})

// 图 2·11（p.83）：钝角三角形
#let fig-E-2-11(width: 350 * k) = px-canvas(350, 280, origin: (290, 395), width: width, (p, u) => {
  import cetz.draw: *
  let a = (300, 460)
  let b = (377, 627)
  let c = (509, 627)
  poly(p, (a, b, c), close: true)
  anglearc(p, b, a, c, 20)
  content(p(397, 608), tt[钝角], angle: -35deg)
  let d = (562, 408)
  let e = (527, 511)
  let f = (619, 655)
  poly(p, (d, e, f), close: true)
  anglearc(p, e, d, f, 20)
})

// 图 2·12（p.83）：AB ∥ CF，AD 与 BC 相交于 E，CDF 是直线
#let fig-E-2-12(width: 400 * k) = px-canvas(400, 235, origin: (300, 1000), width: width, (p, u) => {
  import cetz.draw: *
  let A = (342, 1018)
  let B = (505, 1018)
  let C = (322, 1213)
  let D = (562, 1213)
  let F = (676, 1213)
  let E = E-meet(A, D, B, C)
  seg(p, A, B)
  seg(p, A, D)
  seg(p, B, C)
  seg(p, C, F)
  anglearc(p, B, A, C, 20)
  anglearc(p, B, A, C, 25)
  anglearc(p, C, F, B, 20)
  anglearc(p, C, F, B, 25)
  anglearc(p, D, F, E, 22)
  lbl(p, A, $A$, dir: "nw", d: 9)
  lbl(p, B, $B$, dir: "ne", d: 9)
  lbl(p, E, $E$, dir: "ne", d: 11)
  lbl(p, C, $C$, dir: "sw", d: 9)
  lbl(p, D, $D$, dir: "s", d: 11)
  lbl(p, F, $F$, dir: "e", d: 10)
})

// 图 2·13（p.84）：∠BED = ∠B + ∠D，延长 BE 交 CD 于 F（虚线）
#let fig-E-2-13(width: 270 * k) = px-canvas(270, 210, origin: (610, 480), width: width, (p, u) => {
  import cetz.draw: *
  let A = (633, 503)
  let B = (835, 505)
  let C = (632, 661)
  let D = (850, 661)
  let E = (801, 567)
  let F = E-meet(B, E, C, D)
  seg(p, A, B)
  seg(p, C, D)
  seg(p, B, E)
  seg(p, E, F, stroke: dsh)
  seg(p, E, D)
  anglearc(p, E, B, D, 14)
  anglearc(p, E, B, D, 19)
  anglearc(p, F, E, D, 18)
  E-n(p, 772, 646, $1$)
  lbl(p, A, $A$, dir: "w", d: 10)
  lbl(p, B, $B$, dir: "ne", d: 9)
  lbl(p, E, $E$, dir: "nw", d: 10)
  lbl(p, F, $F$, dir: "s", d: 10)
  lbl(p, C, $C$, dir: "w", d: 10)
  lbl(p, D, $D$, dir: "se", d: 9)
})

// 图 2·14（p.84）：ED ⊥ OA，EF ⊥ OB
#let fig-E-2-14(width: 290 * k) = px-canvas(290, 230, origin: (590, 1000), width: width, (p, u) => {
  import cetz.draw: *
  let O = (608, 1205)
  let Bq = (832, 1072)
  let E = (738, 1015)
  let D = (738, 1205)
  // F 为 E 在 OB 上的垂足
  let (ux, uy) = ((Bq.at(0) - O.at(0)), (Bq.at(1) - O.at(1)))
  let l = calc.sqrt(ux * ux + uy * uy)
  let (ux, uy) = (ux / l, uy / l)
  let tproj = (E.at(0) - O.at(0)) * ux + (E.at(1) - O.at(1)) * uy
  let F = (O.at(0) + ux * tproj, O.at(1) + uy * tproj)
  let P = E-meet(O, Bq, E, D)
  seg(p, O, (862, 1205))
  seg(p, O, Bq)
  seg(p, E, D)
  seg(p, E, F)
  rtmark(p, D, E, (862, 1205), s: 9)
  rtmark(p, F, E, O, s: 9)
  E-n(p, 749, 1109, $1$)
  E-n(p, 727, 1147, $2$)
  lbl(p, E, $E$, dir: "n", d: 10)
  lbl(p, Bq, $B$, dir: "ne", d: 9)
  lbl(p, F, $F$, dir: "se", d: 10)
  lbl(p, P, $P$, dir: "nw", d: 11)
  lbl(p, (862, 1205), $A$, dir: "e", d: 10)
  lbl(p, O, $O$, dir: "sw", d: 9)
  lbl(p, D, $D$, dir: "s", d: 10)
})

// 图 2·15（p.85）：△ABC 的三个外角 ∠1、∠2、∠3
#let fig-E-2-15(width: 400 * k) = px-canvas(400, 280, origin: (470, 550), width: width, (p, u) => {
  import cetz.draw: *
  let A = (522, 773)
  let B = (782, 773)
  let C = (730, 640)
  let E = (703, 570)
  let F = (497, 805)
  let D = (838, 773)
  seg(p, F, C)
  seg(p, E, B)
  seg(p, A, D)
  E-n(p, 788, 762, $1$)
  E-n(p, 718, 636, $2$)
  E-n(p, 536, 790, $3$)
  lbl(p, E, $E$, dir: "n", d: 10)
  E-t(p, (744, 636), tt($C$))
  E-t(p, (517, 764), tt($A$))
  E-t(p, (782, 790), tt($B$))
  lbl(p, D, $D$, dir: "e", d: 10)
  lbl(p, F, $F$, dir: "sw", d: 9)
})

// 习题 2·2 第 4 题（p.86）：∠B = ∠C = 45°，AE 是外角 DAC 的平分线
#let fig-E-ex2-2-4(width: 330 * k) = px-canvas(330, 250, origin: (140, 890), width: width, (p, u) => {
  import cetz.draw: *
  let B = (435, 1118)
  let C = (192, 1118)
  let A = (313.5, 996.5)
  let D = (224, 903)
  let E = (170, 997)
  seg(p, C, B)
  seg(p, C, A)
  seg(p, B, D)
  seg(p, A, E)
  anglearc(p, C, B, A, 28)
  anglearc(p, B, C, A, 28)
  E-n(p, 232, 1105, $45°$)
  E-n(p, 391, 1105, $45°$)
  E-n(p, 284, 986, $1$)
  E-n(p, 287, 1009, $2$)
  lbl(p, D, $D$, dir: "nw", d: 9)
  lbl(p, E, $E$, dir: "w", d: 10)
  lbl(p, A, $A$, dir: "ne", d: 10)
  lbl(p, C, $C$, dir: "sw", d: 9)
  lbl(p, B, $B$, dir: "se", d: 9)
})

// 习题 2·2 第 8 题（p.86）：求证 ∠1 + ∠2 = ∠3 + ∠4
#let fig-E-ex2-2-8(width: 310 * k) = px-canvas(310, 215, origin: (530, 920), width: width, (p, u) => {
  import cetz.draw: *
  let A = (555, 1118)
  let B = (815, 1118)
  let D = (648, 942)
  let C = (770, 928)
  let L = (614, 1007)
  let R = (803, 1068)
  seg(p, A, B)
  seg(p, A, D)
  seg(p, B, C)
  seg(p, L, R)
  anglearc(p, A, B, D, 22)
  anglearc(p, A, B, D, 27)
  anglearc(p, B, A, C, 20)
  anglearc(p, B, A, C, 25)
  anglearc(p, L, D, R, 18)
  anglearc(p, R, C, L, 18)
  E-n(p, 590, 1092, $1$)
  E-n(p, 790, 1090, $2$)
  E-n(p, 649, 992, $3$)
  E-n(p, 770, 1015, $4$)
  lbl(p, D, $D$, dir: "n", d: 9)
  lbl(p, C, $C$, dir: "n", d: 9)
  lbl(p, A, $A$, dir: "sw", d: 9)
  lbl(p, B, $B$, dir: "se", d: 9)
})

// 习题 2·2 第 9 题（p.87）：求证 ∠1 − ∠2 = ∠3 − ∠4
#let fig-E-ex2-2-9(width: 350 * k) = px-canvas(350, 210, origin: (160, 360), width: width, (p, u) => {
  import cetz.draw: *
  let L1 = (177, 411)
  let R1 = (480, 378)
  let L2 = (182, 511)
  let R2 = (486, 551)
  let P1 = (316, 396)
  let P2 = (357, 534)
  seg(p, L1, R1)
  seg(p, L2, R2)
  seg(p, P1, R2)
  seg(p, R1, P2)
  pdot(p, L1, r: 2.6)
  pdot(p, L2, r: 2.6)
  anglearc(p, P1, L1, R2, 18)
  anglearc(p, P2, L2, R1, 18)
  anglearc(p, P2, L2, R1, 23)
  E-n(p, 310, 426, $1$)
  E-n(p, 343, 509, $2$)
  E-n(p, 450, 393, $3$)
  E-n(p, 453, 538, $4$)
})

// 习题 2·2 第 10 题（p.87）：∠1 = 27°，∠2 = 95°，∠3 = 38°，求 ∠4
#let fig-E-ex2-2-10(width: 320 * k) = px-canvas(320, 170, origin: (520, 395), width: width, (p, u) => {
  import cetz.draw: *
  let L = (536, 547)
  let U = (796, 411)
  let M = (671, 547)
  let N = (763, 547)
  let X = (581, 399)
  seg(p, L, (820, 547))
  seg(p, L, U)
  seg(p, M, U)
  seg(p, X, N)
  pdot(p, (820, 547), r: 2.6)
  E-n(p, 582, 535, $1$)
  E-n(p, 709, 520, $2$)
  E-n(p, 732, 535, $3$)
  E-n(p, 746, 450, $4$)
})

// 习题 2·2 第 11 题（p.87）：AE ∥ BD，∠1 = 95°，∠2 = 28°，求 ∠C
#let fig-E-ex2-2-11(width: 400 * k) = px-canvas(400, 240, origin: (260, 720), width: width, (p, u) => {
  import cetz.draw: *
  let D = (340, 740)
  let E = (285, 845)
  let A = (418, 937)
  let B = (618, 935)
  let C = (545, 787)
  seg(p, E, A)
  seg(p, D, B)
  seg(p, A, C)
  seg(p, B, C)
  seg(p, A, B)
  anglearc(p, A, E, C, 20)
  anglearc(p, B, D, C, 20)
  anglearc(p, B, D, C, 25)
  E-n(p, 420, 908, $1$)
  E-n(p, 598, 904, $2$)
  lbl(p, D, $D$, dir: "w", d: 10)
  lbl(p, E, $E$, dir: "w", d: 10)
  lbl(p, C, $C$, dir: "n", d: 10)
  lbl(p, A, $A$, dir: "s", d: 11)
  lbl(p, B, $B$, dir: "se", d: 10)
})

// 图 2·16（p.88）：三角形的高（左：高在三角形内；右：高与边的延长线相交，虚线为延长线）
#let fig-E-2-16(width: 690 * k) = px-canvas(690, 215, origin: (165, 270), width: width, (p, u) => {
  import cetz.draw: *
  poly(p, ((178, 452), (348, 312), (405, 452)), close: true)
  seg(p, (348, 312), (348, 452))
  content(p(336, 385), tt[高])
  anglearc(p, (348, 452), (348, 312), (405, 452), 15)
  E-t(p, (367, 437), tt($d$))
  let F = (475, 452)
  let D = (667, 452)
  let E = (795, 300)
  let H = (795, 452)
  poly(p, (F, D, E), close: true)
  seg(p, D, H, stroke: dsh)
  seg(p, H, (838, 452), stroke: dsh)
  seg(p, E, H)
  content(p(783, 372), tt[高])
  anglearc(p, H, E, (838, 452), 15)
  E-t(p, (816, 437), tt($d$))
  lbl(p, F, $F$, dir: "s", d: 11)
  lbl(p, D, $D$, dir: "s", d: 11)
  lbl(p, H, $H$, dir: "s", d: 11)
  lbl(p, E, $E$, dir: "n", d: 10)
})

// 图 2·17（p.88）：三角形的中线
#let fig-E-2-17(width: 710 * k) = px-canvas(710, 225, origin: (160, 625), width: width, (p, u) => {
  import cetz.draw: *
  let B = (175, 825)
  let C = (487, 825)
  let A = (390, 650)
  let M = (331, 825)
  poly(p, (B, C, A), close: true)
  seg(p, A, M)
  content(p(377, 750), tt[中线], angle: 71deg)
  lbl(p, A, $A$, dir: "n", d: 10)
  lbl(p, B, $B$, dir: "w", d: 9)
  lbl(p, M, $M$, dir: "s", d: 12)
  lbl(p, C, $C$, dir: "e", d: 9)
  let E = (550, 825)
  let F = (722, 825)
  let D = (838, 650)
  poly(p, (E, F, D), close: true)
  seg(p, D, (636, 825))
  content(p(727, 775), tt[中线], angle: 41deg)
  lbl(p, D, $D$, dir: "ne", d: 9)
  lbl(p, E, $E$, dir: "sw", d: 9)
  lbl(p, F, $F$, dir: "se", d: 9)
})

// 图 2·18（p.88）：三角形的角平分线 BE
#let fig-E-2-18(width: 370 * k) = px-canvas(370, 260, origin: (320, 995), width: width, (p, u) => {
  import cetz.draw: *
  let A = (440, 1222)
  let B = (655, 1230)
  let C = (340, 1015)
  let bc = calc.sqrt(315 * 315 + 215 * 215)
  let ba = calc.sqrt(215 * 215 + 8 * 8)
  let E = E-at(C, A, bc / (bc + ba))
  poly(p, (A, B, C), close: true)
  seg(p, B, E)
  anglearc(p, B, A, C, 42)
  content(p(522, 1170), tt[角平分线], angle: -18deg)
  lbl(p, C, $C$, dir: "n", d: 10)
  lbl(p, E, $E$, dir: "w", d: 10)
  lbl(p, A, $A$, dir: "sw", d: 9)
  lbl(p, B, $B$, dir: "se", d: 9)
})
