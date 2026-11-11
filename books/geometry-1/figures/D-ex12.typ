// 习题 1·12 的插图：第 1–5 题（原书 p.66）、第 6–10 题（p.67）、第 11、12、14、15 题（p.68）；页面 200 dpi 坐标。
#import "D-base.typ": *

// 第 1 题
#let fig-D-e12-q1(width: 300 * k) = px-canvas(300, 160, origin: (135, 305), width: width, (p, u) => {
  import cetz.draw: *
  let Ap = (278, 320)
  seg(p, (150, 320), (410, 320))
  seg(p, (150, 398), (410, 398))
  seg(p, Ap, (220, 458))
  seg(p, Ap, (378, 460))
  D-T(p, 142, 318, $A$)
  D-T(p, 419, 318, $B$)
  D-T(p, 145, 398, $C$)
  D-T(p, 423, 398, $D$)
  D-N(p, 262, 331, $1$)
  D-N(p, 282, 343, $2$)
  D-N(p, 305, 332, $3$)
  D-N(p, 237, 388, $8$)
  D-N(p, 258, 389, $9$)
  D-N(p, 308, 388, $10$)
  D-N(p, 346, 388, $11$)
  D-N(p, 222, 409, $4$)
  D-N(p, 246, 411, $5$)
  D-N(p, 328, 411, $6$)
  D-N(p, 355, 411, $7$)
})

// 第 2 题
#let fig-D-e12-q2(width: 310 * k) = px-canvas(310, 170, origin: (530, 290), width: width, (p, u) => {
  import cetz.draw: *
  let (D, C, B, A) = ((610, 315), (812, 310), (752, 445), (552, 450))
  poly(p, (D, C, B, A), close: true)
  seg(p, A, C)
  D-arc(p, A, B, C, 26)
  D-arc(p, C, D, A, 28)
  D-T(p, 604, 303, $D$)
  D-T(p, 823, 303, $C$)
  D-T(p, 760, 456, $B$)
  D-T(p, 540, 456, $A$)
  D-N(p, 575, 425, $1$)
  D-N(p, 785, 340, $2$)
})

// 第 3 题
#let fig-D-e12-q3(width: 310 * k) = px-canvas(310, 170, origin: (150, 660), width: width, (p, u) => {
  import cetz.draw: *
  let (C, D, A, B, E, F) = ((165, 680), (375, 680), (165, 808), (370, 808), (265, 718), (440, 722))
  seg(p, C, D)
  seg(p, A, B)
  seg(p, E, D)
  seg(p, E, B)
  dseg(p, E, F)
  D-arc(p, D, C, E, 22)
  D-arc(p, B, A, E, 20, n: 2)
  D-T(p, 158, 677, $C$)
  D-T(p, 385, 677, $D$)
  D-T(p, 256, 721, $E$)
  D-T(p, 449, 727, $F$)
  D-T(p, 158, 806, $A$)
  D-T(p, 379, 813, $B$)
})

// 第 4 题
#let fig-D-e12-q4(width: 280 * k) = px-canvas(280, 170, origin: (535, 660), width: width, (p, u) => {
  import cetz.draw: *
  let (D, C, B, A) = ((555, 682), (800, 682), (800, 806), (555, 806))
  poly(p, (D, C, B, A), close: true)
  rtmark(p, A, D, B, s: 10)
  D-T(p, 548, 670, $D$)
  D-T(p, 797, 670, $C$)
  D-T(p, 555, 822, $A$)
  D-T(p, 800, 820, $B$)
})

// 第 5 题
#let fig-D-e12-q5(width: 340 * k) = px-canvas(340, 230, origin: (310, 1025), width: width, (p, u) => {
  import cetz.draw: *
  let (a1, a2) = ((322, 1167), (498, 1037))
  let (b1, b2) = ((415, 1204), (638, 1043))
  let (h1, h2) = ((335, 1090), (640, 1090))
  let (d1, d2) = ((335, 1090), (610, 1243))
  seg(p, a1, a2)
  seg(p, b1, b2)
  line(p(..h1), p(..h2), stroke: lw, mark: (end: "stealth", fill: black, scale: 0.4))
  seg(p, d1, d2)
  let Pa = D-aty(a1, a2, 1090)
  let Pb = D-aty(b1, b2, 1090)
  let I3 = D-meet(a1, a2, d1, d2)
  let I4 = D-meet(b1, b2, d1, d2)
  D-arc(p, Pa, h2, a2, 16)
  D-arc(p, Pb, h2, b2, 16)
  D-arc(p, I3, d2, a1, 18)
  D-arc(p, I4, d1, b1, 18, n: 2)
  D-T(p, 505, 1028, $a$)
  D-T(p, 641, 1034, $b$)
  D-N(p, 468, 1080, $1$)
  D-N(p, 603, 1077, $2$)
  D-N(p, 390, 1138, $3$)
  D-N(p, 435, 1165, $4$)
})

// 第 6 题
#let fig-D-e12-q6(width: 480 * k) = px-canvas(480, 150, origin: (240, 230), width: width, (p, u) => {
  import cetz.draw: *
  let (A, B, C, D, E, F) = ((258, 262), (450, 258), (525, 372), (693, 372), (268, 328), (695, 303))
  seg(p, A, B)
  seg(p, E, B)
  seg(p, B, C)
  seg(p, C, D)
  seg(p, C, F)
  D-arc(p, B, A, E, 22)
  D-arc(p, C, D, F, 24)
  D-T(p, 247, 260, $A$)
  D-T(p, 463, 252, $B$)
  D-T(p, 256, 336, $E$)
  D-T(p, 515, 381, $C$)
  D-T(p, 704, 372, $D$)
  D-T(p, 704, 299, $F$)
  D-N(p, 397, 267, $1$)
  D-N(p, 578, 363, $2$)
})

// 第 7 题
#let fig-D-e12-q7(width: 300 * k) = px-canvas(300, 240, origin: (150, 535), width: width, (p, u) => {
  import cetz.draw: *
  let (T1, T2) = ((330, 545), (208, 762))
  seg(p, (160, 595), (415, 597))
  seg(p, (160, 702), (415, 705))
  seg(p, T1, T2)
  D-T(p, 424, 596, $l_1$)
  D-T(p, 424, 704, $l_2$)
  D-N(p, 318, 584, $1$)
  D-N(p, 258, 692, $5$)
  D-N(p, 245, 715, $8$)
})

// 第 8 题
#let fig-D-e12-q8(width: 310 * k) = px-canvas(310, 190, origin: (500, 575), width: width, (p, u) => {
  import cetz.draw: *
  let (D, C, B, A) = ((600, 597), (800, 597), (722, 735), (520, 740))
  poly(p, (D, C, B, A), close: true)
  D-T(p, 598, 588, $D$)
  D-T(p, 806, 590, $C$)
  D-T(p, 724, 752, $B$)
  D-T(p, 513, 752, $A$)
})

// 第 9 题（用曲尺画 CD ⊥ AB，再画 EF ⊥ AB）
#let fig-D-e12-q9(width: 420 * k) = px-canvas(420, 215, origin: (100, 990), width: width, (p, u) => {
  import cetz.draw: *
  // 纸（矩形）
  rect(p(137, 1000), p(513, 1168), stroke: lw)
  // 曲尺（L 形，白底盖在纸上）
  line(p(108, 1098), p(437, 1098), p(437, 1127), p(137, 1127), p(137, 1196), p(108, 1196),
    close: true, stroke: lw, fill: white)
  for i in range(0, 50) {
    let x = 141 + i * 6
    line(p(x, 1098), p(x, 1098 + if calc.rem(i, 5) == 2 { 13 } else { 8 }), stroke: lt)
  }
  for i in range(0, 14) {
    let y = 1104 + i * 6.5
    line(p(108, y), p(108 + if calc.rem(i, 5) == 2 { 17 } else { 10 }, y), stroke: lt)
  }
  // 沿曲尺边画的 EF（箭头向右），沿曲尺另一边画的 AB、CD
  line(p(437, 1098), p(450, 1098), stroke: lw, mark: (end: "stealth", fill: black, scale: 0.4))
  seg(p, (198, 1039), (432, 1039))
  seg(p, (408, 1020), (408, 1145))
  D-T(p, 405, 1011, $A$)
  D-T(p, 407, 1156, $B$)
  D-T(p, 188, 1041, $C$)
  D-T(p, 443, 1041, $D$)
  D-T(p, 189, 1088, $E$)
  D-T(p, 459, 1103, $F$)
})

// 第 10 题
#let fig-D-e12-q10(width: 310 * k) = px-canvas(310, 190, origin: (535, 1010), width: width, (p, u) => {
  import cetz.draw: *
  let (D, C, B, A) = ((588, 1038), (790, 1038), (830, 1170), (550, 1170))
  poly(p, (D, C, B, A), close: true)
  D-T(p, 590, 1026, $D$)
  D-T(p, 783, 1026, $C$)
  D-T(p, 839, 1185, $B$)
  D-T(p, 543, 1185, $A$)
})

// 第 11 题
#let fig-D-e12-q11(width: 330 * k) = px-canvas(330, 200, origin: (180, 225), width: width, (p, u) => {
  import cetz.draw: *
  let (A, B, C, D, E) = ((312, 243), (205, 405), (332, 405), (472, 403), (463, 245))
  seg(p, B, D)
  seg(p, A, B)
  seg(p, A, C)
  seg(p, C, E)
  D-arc(p, C, D, E, 22)
  D-arc(p, C, E, A, 30)
  D-T(p, 312, 232, $A$)
  D-T(p, 194, 405, $B$)
  D-T(p, 330, 419, $C$)
  D-T(p, 483, 402, $D$)
  D-T(p, 466, 237, $E$)
  D-N(p, 358, 393, $1$)
  D-N(p, 338, 372, $2$)
})

// 第 12 题
#let fig-D-e12-q12(width: 330 * k) = px-canvas(330, 170, origin: (525, 245), width: width, (p, u) => {
  import cetz.draw: *
  let (B, A, C, D, E) = ((647, 268), (840, 270), (552, 320), (645, 402), (840, 403))
  seg(p, B, A)
  seg(p, B, C)
  seg(p, C, D)
  seg(p, D, E)
  D-arc(p, B, A, C, 20, n: 2)
  D-arc(p, D, E, C, 20)
  D-T(p, 648, 255, $B$)
  D-T(p, 853, 270, $A$)
  D-T(p, 541, 318, $C$)
  D-T(p, 646, 416, $D$)
  D-T(p, 853, 405, $E$)
})

// 第 14 题
#let fig-D-e12-q14(width: 500 * k) = px-canvas(500, 280, origin: (275, 695), width: width, (p, u) => {
  import cetz.draw: *
  let (E, F) = ((470, 708), (295, 967))
  let (G, H) = ((503, 710), (738, 942))
  seg(p, (342, 762), (738, 762))
  seg(p, (292, 883), (760, 883))
  seg(p, E, F)
  seg(p, G, H)
  let X1 = D-aty(G, H, 762)
  let X3 = D-aty(E, F, 762)
  let X5 = D-aty(E, F, 883)
  let X2 = D-aty(G, H, 883)
  D-arc(p, X1, G, (342, 762), 16)
  D-arc(p, X3, (738, 762), F, 14)
  D-arc(p, X5, (292, 883), E, 14)
  D-arc(p, X5, (760, 883), E, 20, n: 2)
  D-arc(p, X2, (760, 883), H, 16)
  D-T(p, 332, 765, $D$)
  D-T(p, 751, 762, $C$)
  D-T(p, 281, 883, $A$)
  D-T(p, 776, 883, $B$)
  D-T(p, 473, 699, $E$)
  D-T(p, 498, 698, $G$)
  D-T(p, 293, 978, $F$)
  D-T(p, 738, 951, $H$)
  D-N(p, 443, 773, $3$)
  D-N(p, 527, 752, $1$)
  D-N(p, 347, 873, $5$)
  D-N(p, 380, 872, $4$)
  D-N(p, 703, 893, $2$)
})

// 第 15 题
#let fig-D-e12-q15(width: 330 * k) = px-canvas(330, 170, origin: (550, 1075), width: width, (p, u) => {
  import cetz.draw: *
  let (D, E, A, B, C) = ((575, 1095), (868, 1095), (752, 1095), (570, 1232), (850, 1232))
  seg(p, D, E)
  seg(p, A, B)
  seg(p, A, C)
  seg(p, B, C)
  D-arc(p, A, D, B, 20)
  D-arc(p, A, E, C, 20)
  D-arc(p, B, C, A, 26)
  D-arc(p, C, B, A, 22)
  D-T(p, 563, 1095, $D$)
  D-T(p, 880, 1095, $E$)
  D-T(p, 752, 1082, $A$)
  D-T(p, 562, 1242, $B$)
  D-T(p, 861, 1240, $C$)
  D-N(p, 722, 1106, $4$)
  D-N(p, 775, 1106, $5$)
  D-N(p, 750, 1121, $1$)
  D-N(p, 612, 1218, $2$)
  D-N(p, 822, 1218, $3$)
})
