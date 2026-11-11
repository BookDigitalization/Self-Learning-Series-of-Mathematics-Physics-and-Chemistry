// 图 1·77–1·91（原书 p.56–65）；页面 200 dpi 坐标。图 1·80 是写实插画（用丁字尺画平行线的手势），保留扫描的二值化 PNG（来源 p.57）。
#import "D-base.typ": *

// 图 1·77
#let fig-D-1-77(width: 330 * k) = px-canvas(330, 300, origin: (535, 505), width: width, (p, u) => {
  import cetz.draw: *
  let (E, F, G, H) = ((548, 587), (838, 585), (548, 714), (838, 718))
  let (P, Q) = ((748, 520), (612, 788))
  seg(p, E, F)
  seg(p, G, H)
  seg(p, P, Q)
  D-T(p, 747, 511, $P$)
  D-T(p, 711, 570, $A$)
  D-T(p, 655, 727, $B$)
  D-T(p, 611, 796, $Q$)
  D-T(p, 538, 587, $E$)
  D-T(p, 848, 586, $F$)
  D-T(p, 538, 714, $G$)
  D-T(p, 849, 719, $H$)
  D-N(p, 698, 598, $3$)
  D-N(p, 722, 598, $4$)
  D-N(p, 667, 704, $5$)
})

// 图 1·78 直尺和三角板
#let fig-D-1-78(width: 360 * k) = px-canvas(360, 340, origin: (520, 950), width: width, (p, u) => {
  import cetz.draw: *
  // 直尺
  poly(p, ((535, 977), (561, 963), (763, 1260), (738, 1277)), close: true)
  circle(p(557, 984), radius: 6.5, fill: black, stroke: none)
  // 画出的两条平行线
  line(p(605, 1030), p(852, 1030), stroke: lb)
  line(p(640, 1082), p(862, 1082), stroke: lb)
  // 三角板（靠在直尺上滑动）
  line(p(640, 1082), p(710, 1182), p(862, 1082), stroke: lb)
  poly(p, ((692, 1108), (777, 1106), (717, 1145)), close: true, stroke: lb)
  // 三角板边与直尺边的夹角记号
  let r1 = (561 + 202 * (1030 - 963) / 297, 1030)
  let r2 = (561 + 202 * (1082 - 963) / 297, 1082)
  anglearc(p, r1, (r1.at(0) + 50, 1030), (r1.at(0) + 202 / 297 * 50, 1030 + 50), 26)
  anglearc(p, r2, (r2.at(0) + 50, 1082), (r2.at(0) + 202 / 297 * 50, 1082 + 50), 26)
})

// 图 1·79 丁字尺
#let fig-D-1-79(width: 330 * k) = px-canvas(330, 310, origin: (535, 195), width: width, (p, u) => {
  import cetz.draw: *
  // 上：尺头与尺身固定成直角
  rect(p(548, 205), p(571, 339), stroke: lw, radius: 6)
  line(p(571, 274), p(820, 272), stroke: lw)
  line(p(571, 297), p(820, 289), stroke: lw)
  circle(p(804, 281), radius: 3, stroke: lt)
  line(p(820, 272), p(826, 281), p(820, 289), stroke: lw)
  for (x, y) in ((556, 283), (565, 283), (556, 291), (565, 291), (560, 287)) {
    circle(p(x, y), radius: 1.6, fill: black, stroke: none)
  }
  line(p(572, 235), p(590, 217), p(608, 217), stroke: lt)
  D-T(p, 631, 217, text(font: fonts.kai, size: 8pt)[尺头])
  line(p(660, 272), p(675, 257), p(693, 257), stroke: lt)
  D-T(p, 717, 257, text(font: fonts.kai, size: 8pt)[尺身])
  // 下：尺头可以转动
  rect(p(548, 375), p(571, 495), stroke: lw, radius: 6)
  line(p(571, 425), p(820, 425), stroke: lw)
  line(p(571, 445), p(820, 445), stroke: lw)
  circle(p(804, 440), radius: 3, stroke: lt)
  line(p(820, 425), p(826, 435), p(820, 445), stroke: lw)
  arc(p(566, 434), start: 90deg, stop: 270deg, radius: 17, anchor: "origin", stroke: lw)
  line(p(566, 434), p(558, 442), stroke: lt)
  line(p(572, 395), p(590, 379), p(608, 379), stroke: lt)
  D-T(p, 631, 380, text(font: fonts.kai, size: 8pt)[尺头])
  line(p(675, 424), p(695, 410), p(713, 410), stroke: lt)
  D-T(p, 736, 411, text(font: fonts.kai, size: 8pt)[尺身])
})

// 图 1·80 用丁字尺画平行线（写实插画，原扫描二值化）
#let fig-D-1-80(width: 750 * k) = px-canvas(750, 241, origin: (115, 622), width: width, (p, u) => {
  import cetz.draw: *
  content(p(115, 622), image("D-1-80.png", width: 750 * u), anchor: "north-west")
})

// 图 1·81 过 O 作 AB 的平行线 CD（虚线是别的直线，都与 AB 相交）
#let fig-D-1-81(width: 340 * k) = px-canvas(340, 230, origin: (515, 420), width: width, (p, u) => {
  import cetz.draw: *
  let O = (686, 492)
  seg(p, (522, 492), (835, 492))
  seg(p, (522, 630), (838, 630))
  line(p(527, 455), p(836, 526), stroke: dsh)
  line(p(537, 547), p(838, 437), stroke: dsh)
  D-T(p, 511, 490, $C$)
  D-T(p, 849, 492, $D$)
  D-T(p, 686, 508, $O$)
  D-T(p, 511, 629, $A$)
  D-T(p, 849, 631, $B$)
})

// 图 1·82
#let fig-D-1-82(width: 320 * k) = px-canvas(320, 300, origin: (540, 965), width: width, (p, u) => {
  import cetz.draw: *
  let (A, B, C, D) = ((557, 1062), (838, 1062), (555, 1182), (840, 1185))
  let (E, F) = ((740, 985), (610, 1252))
  seg(p, A, B)
  seg(p, C, D)
  seg(p, E, F)
  let O = D-aty(E, F, 1062)
  let N = D-aty(E, F, 1183)
  D-arc(p, O, B, E, 15)
  D-arc(p, N, D, E, 15)
  D-T(p, 742, 976, $E$)
  D-T(p, 610, 1262, $F$)
  D-T(p, 547, 1062, $A$)
  D-T(p, 849, 1062, $B$)
  D-T(p, 543, 1182, $C$)
  D-T(p, 852, 1187, $D$)
  D-T(p, 697, 1048, $O$)
  D-N(p, 730, 1047, $1$)
  D-N(p, 669, 1170, $2$)
})

// 图 1·83（虚线 OP 是补助线）
#let fig-D-1-83(width: 320 * k) = px-canvas(320, 300, origin: (540, 385), width: width, (p, u) => {
  import cetz.draw: *
  let (A, B, C, D) = ((557, 480), (838, 477), (557, 600), (838, 602))
  let (E, F) = ((750, 400), (610, 672))
  seg(p, A, B)
  seg(p, C, D)
  seg(p, E, F)
  let O = D-aty(E, F, 478)
  let N = D-aty(E, F, 600)
  line(p(578, 461), p(828, 501), stroke: dsh)
  D-arc(p, O, B, E, 15)
  D-arc(p, N, D, E, 15)
  D-T(p, 750, 391, $E$)
  D-T(p, 610, 681, $F$)
  D-T(p, 547, 480, $A$)
  D-T(p, 850, 477, $B$)
  D-T(p, 547, 600, $C$)
  D-T(p, 850, 602, $D$)
  D-T(p, 836, 503, $P$)
  D-T(p, 700, 466, $O$)
  D-N(p, 738, 463, $1$)
  D-N(p, 673, 584, $2$)
})

// 图 1·84
#let fig-D-1-84(width: 320 * k) = px-canvas(320, 300, origin: (535, 250), width: width, (p, u) => {
  import cetz.draw: *
  let (A, B, C, D) = ((548, 335), (830, 335), (548, 455), (830, 455))
  let (E, F) = ((722, 262), (622, 538))
  seg(p, A, B)
  seg(p, C, D)
  seg(p, E, F)
  D-T(p, 727, 254, $E$)
  D-T(p, 622, 546, $F$)
  D-T(p, 538, 335, $A$)
  D-T(p, 841, 336, $B$)
  D-T(p, 538, 455, $C$)
  D-T(p, 841, 455, $D$)
  D-N(p, 718, 321, $1$)
  D-N(p, 683, 346, $3$)
  D-N(p, 674, 440, $2$)
})

// 图 1·85
#let fig-D-1-85(width: 360 * k) = px-canvas(360, 340, origin: (475, 875), width: width, (p, u) => {
  import cetz.draw: *
  let (A, B, C, D) = ((490, 972), (820, 972), (490, 1112), (830, 1112))
  let (E, F) = ((592, 885), (738, 1205))
  seg(p, A, B)
  seg(p, C, D)
  seg(p, E, F)
  D-T(p, 591, 877, $E$)
  D-T(p, 740, 1214, $F$)
  D-T(p, 482, 971, $A$)
  D-T(p, 832, 972, $B$)
  D-T(p, 482, 1112, $C$)
  D-T(p, 842, 1113, $D$)
  D-N(p, 637, 960, $1$)
  D-N(p, 649, 991, $4$)
  D-N(p, 707, 1099, $2$)
})

// 图 1·86（虚线 PQ 是补助线）
#let fig-D-1-86(width: 340 * k) = px-canvas(340, 340, origin: (495, 420), width: width, (p, u) => {
  import cetz.draw: *
  let (A, B, C, D, E, F) = ((510, 495), (820, 497), (510, 571), (822, 572), (505, 672), (825, 676))
  let (P, Q) = ((735, 432), (583, 748))
  seg(p, A, B)
  seg(p, C, D)
  seg(p, E, F)
  line(p(..P), p(..Q), stroke: dsh)
  D-T(p, 736, 422, $P$)
  D-T(p, 583, 758, $Q$)
  D-T(p, 500, 495, $A$)
  D-T(p, 833, 498, $B$)
  D-T(p, 500, 571, $C$)
  D-T(p, 836, 572, $D$)
  D-T(p, 495, 672, $E$)
  D-T(p, 838, 676, $F$)
  D-N(p, 719, 486, $1$)
  D-N(p, 684, 558, $2$)
  D-N(p, 633, 658, $3$)
})

// 图 1·87
#let fig-D-1-87(width: 340 * k) = px-canvas(340, 250, origin: (520, 1000), width: width, (p, u) => {
  import cetz.draw: *
  let (a1, b1, a2, b2) = ((535, 1062), (845, 1065), (540, 1180), (848, 1182))
  let (T1, T2) = ((740, 1010), (625, 1222))
  seg(p, a1, b1)
  seg(p, a2, b2)
  seg(p, T1, T2)
  pdot(p, b1, r: 2.5)
  pdot(p, b2, r: 2.5)
  D-T(p, 526, 1050, $l_1$)
  D-T(p, 526, 1170, $l_2$)
  D-N(p, 730, 1051, $1$)
  D-N(p, 672, 1163, $5$)
  D-N(p, 634, 1190, $7$)
})

// 图 1·88
#let fig-D-1-88(width: 310 * k) = px-canvas(310, 270, origin: (570, 500), width: width, (p, u) => {
  import cetz.draw: *
  seg(p, (587, 630), (875, 630))
  seg(p, (677, 515), (677, 750))
  seg(p, (808, 515), (808, 750))
  pdot(p, (875, 630), r: 2.5)
  D-T(p, 580, 631, $l_3$)
  D-T(p, 673, 760, $l_1$)
  D-T(p, 808, 760, $l_2$)
  D-N(p, 686, 621, $2$)
  D-N(p, 820, 620, $1$)
})

// 图 1·89
#let fig-D-1-89(width: 330 * k) = px-canvas(330, 270, origin: (565, 1010), width: width, (p, u) => {
  import cetz.draw: *
  let (A, B, C, D, E) = ((580, 1030), (860, 1030), (622, 1150), (865, 1152), (862, 1268))
  seg(p, A, B)
  seg(p, C, B)
  seg(p, C, D)
  seg(p, C, E)
  D-arc(p, B, A, C, 22)
  D-arc(p, C, D, B, 18)
  D-arc(p, C, D, E, 18)
  D-T(p, 570, 1030, $A$)
  D-T(p, 872, 1026, $B$)
  D-T(p, 610, 1152, $C$)
  D-T(p, 877, 1153, $D$)
  D-T(p, 873, 1270, $E$)
  D-N(p, 806, 1041, $1$)
  D-N(p, 667, 1137, $3$)
  D-N(p, 665, 1161, $2$)
})

// 图 1·90
#let fig-D-1-90(width: 310 * k) = px-canvas(310, 190, origin: (555, 245), width: width, (p, u) => {
  import cetz.draw: *
  let (A, B, C, D) = ((585, 418), (820, 415), (838, 268), (668, 268))
  poly(p, (A, B, C, D), close: true)
  seg(p, D, B)
  D-T(p, 660, 259, $D$)
  D-T(p, 852, 264, $C$)
  D-T(p, 573, 421, $A$)
  D-T(p, 829, 427, $B$)
  D-N(p, 672, 292, $1$)
  D-N(p, 700, 285, $2$)
  D-N(p, 789, 405, $3$)
})

// 图 1·91
#let fig-D-1-91(width: 330 * k) = px-canvas(330, 270, origin: (550, 780), width: width, (p, u) => {
  import cetz.draw: *
  let (a1, b1, a2, b2) = ((585, 850), (852, 857), (580, 970), (852, 977))
  seg(p, a1, b1)
  seg(p, a2, b2)
  seg(p, (672, 790), (625, 1042))
  seg(p, (748, 795), (825, 1042))
  pdot(p, b1, r: 2.5)
  pdot(p, b2, r: 2.5)
  D-T(p, 568, 848, $l_1$)
  D-T(p, 567, 968, $l_2$)
  D-N(p, 670, 865, $3$)
  D-N(p, 650, 960, $4$)
  D-N(p, 774, 845, $1$)
  D-N(p, 812, 964, $5$)
  D-N(p, 792, 990, $2$)
})
