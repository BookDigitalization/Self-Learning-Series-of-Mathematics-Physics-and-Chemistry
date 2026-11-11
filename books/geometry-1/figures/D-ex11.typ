// 习题 1·11 的插图：第 1 题（原书 p.57）、第 2、3、4、6 题（p.58）、第 8、9、10、11 题（p.59）；页面 200 dpi 坐标。
#import "D-base.typ": *

// 第 1 题
#let fig-D-e11-q1(width: 360 * k) = px-canvas(360, 250, origin: (140, 1035), width: width, (p, u) => {
  import cetz.draw: *
  let (A, B, C, D) = ((170, 1090), (475, 1090), (170, 1205), (480, 1205))
  let (T1, T2) = ((330, 1043), (430, 1265))
  seg(p, A, B)
  seg(p, C, D)
  seg(p, T1, T2)
  seg(p, (237, 1043), (237, 1265))
  D-T(p, 158, 1090, $A$)
  D-T(p, 486, 1090, $B$)
  D-T(p, 159, 1205, $C$)
  D-T(p, 491, 1207, $D$)
  D-N(p, 333, 1076, $2$)
  D-N(p, 361, 1076, $1$)
  D-N(p, 345, 1103, $3$)
  D-N(p, 368, 1103, $4$)
  D-N(p, 247, 1103, $9$)
  D-N(p, 250, 1191, $10$)
  D-N(p, 382, 1193, $6$)
  D-N(p, 408, 1192, $5$)
  D-N(p, 392, 1217, $7$)
  D-N(p, 418, 1218, $8$)
})

// 第 2 题
#let fig-D-e11-q2(width: 440 * k) = px-canvas(440, 270, origin: (150, 195), width: width, (p, u) => {
  import cetz.draw: *
  let (A, B, C, D) = ((183, 450), (245, 335), (497, 337), (560, 212))
  poly(p, (A, B, C, D))
  D-arc(p, B, A, C, 24)
  D-arc(p, C, B, D, 20)
  D-T(p, 178, 455, $A$)
  D-T(p, 238, 322, $B$)
  D-T(p, 497, 350, $C$)
  D-T(p, 562, 203, $D$)
  D-T(p, 268, 363, $120°$)
  D-T(p, 470, 305, $120°$)
})

// 第 3 题
#let fig-D-e11-q3(width: 250 * k) = px-canvas(250, 270, origin: (610, 190), width: width, (p, u) => {
  import cetz.draw: *
  let (N, O, D, M, B, A) = ((650, 280), (826, 284), (810, 208), (795, 382), (637, 380), (633, 450))
  seg(p, N, O)
  seg(p, N, D)
  seg(p, N, M)
  seg(p, B, M)
  seg(p, A, M)
  D-T(p, 637, 276, $N$)
  D-T(p, 836, 284, $O$)
  D-T(p, 820, 204, $D$)
  D-T(p, 810, 393, $M$)
  D-T(p, 628, 380, $B$)
  D-T(p, 630, 456, $A$)
  D-N(p, 706, 268, $1$)
  D-N(p, 692, 293, $2$)
  D-N(p, 758, 370, $3$)
  D-N(p, 743, 393, $4$)
})

// 第 4 题
#let fig-D-e11-q4(width: 350 * k) = px-canvas(350, 270, origin: (150, 775), width: width, (p, u) => {
  import cetz.draw: *
  let (T1, T2) = ((378, 792), (262, 1030))
  seg(p, (180, 850), (473, 853))
  seg(p, (175, 938), (465, 941))
  seg(p, (175, 985), (460, 990))
  seg(p, T1, T2)
  let P1 = D-aty(T1, T2, 851)
  let P2 = D-aty(T1, T2, 939)
  let P3 = D-aty(T1, T2, 987)
  D-arc(p, P1, (P1.at(0) + 60, P1.at(1)), T1, 16)
  D-arc(p, P2, (P2.at(0) + 60, P2.at(1)), T1, 16)
  D-arc(p, P3, (P3.at(0) + 60, P3.at(1)), T1, 16)
  D-T(p, 170, 850, $a$)
  D-T(p, 170, 937, $b$)
  D-T(p, 170, 985, $c$)
  D-N(p, 385, 837, $1$)
  D-N(p, 337, 922, $2$)
  D-N(p, 313, 970, $3$)
})

// 第 6 题
#let fig-D-e11-q6(width: 330 * k) = px-canvas(330, 250, origin: (525, 785), width: width, (p, u) => {
  import cetz.draw: *
  let (A, B, O, D, C) = ((548, 885), (830, 885), (545, 1020), (830, 1020), (775, 795))
  seg(p, A, B)
  seg(p, O, D)
  seg(p, O, C)
  let P = D-aty(O, C, 885)
  D-arc(p, P, B, C, 15)
  D-T(p, 536, 885, $A$)
  D-T(p, 841, 884, $B$)
  D-T(p, 772, 786, $C$)
  D-T(p, 535, 1020, $O$)
  D-T(p, 842, 1020, $D$)
  D-N(p, 673, 858, $1$)
})

// 第 8 题
#let fig-D-e11-q8(width: 310 * k) = px-canvas(310, 250, origin: (150, 395), width: width, (p, u) => {
  import cetz.draw: *
  let (D, C, B, A) = ((230, 423), (437, 423), (363, 617), (163, 617))
  poly(p, (D, C, B, A), close: true)
  seg(p, D, B)
  D-T(p, 226, 410, $D$)
  D-T(p, 440, 408, $C$)
  D-T(p, 365, 631, $B$)
  D-T(p, 158, 631, $A$)
  D-N(p, 233, 448, $3$)
  D-N(p, 255, 436, $4$)
  D-N(p, 339, 604, $1$)
  D-N(p, 360, 595, $2$)
})

// 第 9 题
#let fig-D-e11-q9(width: 340 * k) = px-canvas(340, 200, origin: (505, 435), width: width, (p, u) => {
  import cetz.draw: *
  let (D, C, A, B, E) = ((528, 468), (808, 468), (515, 625), (767, 625), (710, 547))
  seg(p, D, C)
  seg(p, A, B)
  seg(p, C, B)
  seg(p, C, E)
  seg(p, E, B)
  D-T(p, 519, 467, $D$)
  D-T(p, 820, 461, $C$)
  D-T(p, 698, 544, $E$)
  D-T(p, 507, 625, $A$)
  D-T(p, 768, 634, $B$)
  D-N(p, 794, 491, $1$)
  D-N(p, 759, 588, $2$)
})

// 第 10 题
#let fig-D-e11-q10(width: 340 * k) = px-canvas(340, 170, origin: (150, 940), width: width, (p, u) => {
  import cetz.draw: *
  seg(p, (170, 1080), (468, 1083))
  pdot(p, (285, 950), r: 2.5)
  D-T(p, 298, 949, $P$)
  D-T(p, 160, 1079, $a$)
})

// 第 11 题
#let fig-D-e11-q11(width: 330 * k) = px-canvas(330, 170, origin: (545, 945), width: width, (p, u) => {
  import cetz.draw: *
  let (B, A, C) = ((572, 1082), (795, 1085), (790, 962))
  seg(p, B, A)
  seg(p, B, C)
  pdot(p, (783, 1025), r: 2.5)
  D-T(p, 559, 1085, $B$)
  D-T(p, 806, 1086, $A$)
  D-T(p, 794, 953, $C$)
  D-T(p, 794, 1022, $Q$)
})
