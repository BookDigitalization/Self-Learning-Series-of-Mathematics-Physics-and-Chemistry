// 图 2·64（原书 p.186）、图 2·65、2·66（p.187）、图 2·67（p.188）；页面 200 dpi 坐标。
#import "J-base.typ": *

#let fig-J-2-64(width: 245 * k) = px-canvas(245, 235, origin: (625, 420), width: width, (p, u) => {
  import cetz.draw: *
  let (A, B, C, D) = ((660, 618), (800, 617), (835, 552), (697, 553))
  let (A1, B1, C1, D1) = ((660, 512), (800, 510), (836, 446), (697, 447))
  JS(p, A1, A, B, C, C1, D1, A1, B1, B)
  JS(p, B1, C1)
  JS(p, D1, B1)
  JD(p, A, D, C)
  JD(p, D, D1)
  JD(p, D, B1)
  anglearc(p, B1, D1, D, 16)
  L(p, 683, 435, $D_1$)
  L(p, 849, 434, $C_1$)
  L(p, 644, 528, $A_1$)
  L(p, 688, 538, $D$)
  L(p, 817, 534, $B_1$)
  L(p, 852, 557, $C$)
  L(p, 650, 640, $A$)
  L(p, 805, 640, $B$)
  L(p, 734, 600, [8cm])
})

#let fig-J-2-65(width: 345 * k) = px-canvas(345, 255, origin: (550, 220), width: width, (p, u) => {
  import cetz.draw: *
  let A = (655, 280)
  let B = (577, 348)
  let C = (722, 350)
  let K = (820, 242)
  let G = (872, 300)
  let D = (582, 413)
  let E = (718, 418)
  let F = (870, 342)
  // 屋顶、山墙、正面墙
  JS(p, B, A, C)
  JS(p, A, K, G, C)
  JS(p, (582, 349), D, E, (718, 351))
  JS(p, B, C)
  // 侧墙
  JS(p, G, F, E)
  // 屋顶的木板
  for i in range(1, 10) {
    let t = i / 10
    JT(p, Jlerp(A, K, t), Jlerp(C, G, t))
  }
  // 山墙的竖板
  for x in range(592, 716, step: 12) {
    let yt = if x <= 655 { 348 - (x - 577) * 68 / 78 } else { 280 + (x - 655) * 70 / 67 }
    JT(p, (x, 348), (x, yt + 3))
  }
  // 正面墙、侧墙的横板
  for i in range(1, 5) {
    let y = 350 + 13.6 * i
    JT(p, (582, y), (718, y + 1))
  }
  for i in range(1, 5) {
    let t = i / 5
    JT(p, Jlerp(C, E, t), Jlerp((870, 302), F, t))
  }
  // 侧墙上的门
  JS(p, (778, 330), (778, 393))
  JS(p, (816, 316), (816, 378))
  for x in (788, 797, 806) { JT(p, (x, 327 - (x - 778) * 0.35), (x, 390 - (x - 778) * 0.4)) }
  // 屋顶到地面的距离 AH
  JD(p, A, (652, 418))
  L(p, 650, 268, $A$)
  L(p, 567, 335, $B$)
  L(p, 735, 340, $C$)
  L(p, 566, 415, $D$)
  L(p, 725, 437, $E$)
  L(p, 648, 436, $H$)
  L(p, 640, 360, $M$)
  L(p, 823, 228, $K$)
  L(p, 887, 302, $G$)
  L(p, 887, 350, $F$)
  content(p(565, 381), std.rotate(-90deg, tt[$3 m$]))
  content(p(665, 382), std.rotate(-90deg, tt[$5 m$]))
  L(p, 622, 456, $6 m$)
  content(p(836, 402), std.rotate(-28deg, tt[$8 m$]))
})

#let fig-J-2-66(width: 280 * k) = px-canvas(280, 245, origin: (630, 600), width: width, (p, u) => {
  import cetz.draw: *
  let (A, B, C, D) = ((655, 818), (788, 819), (703, 770), (837, 772))
  let (A1, B1, C1, D1) = ((700, 677), (835, 681), (748, 630), (878, 634))
  let (Q, P) = ((708, 715), (810, 749))
  JS(p, A1, A, B, D, D1, C1, A1, B1, B)
  JS(p, B1, D1)
  JS(p, C1, B1)
  JD(p, A, C, D)
  JD(p, C, C1)
  JD(p, C, B)
  JD(p, Q, P)
  ring(p, Q, r: 3)
  L(p, 757, 617, $C_1$)
  L(p, 896, 630, $D_1$)
  L(p, 683, 681, $A_1$)
  L(p, 845, 705, $B_1$)
  L(p, 714, 698, $Q$)
  L(p, 822, 756, $P$)
  L(p, 691, 764, $C$)
  L(p, 853, 777, $D$)
  L(p, 797, 834, $B$)
  L(p, 642, 822, $A$)
})

#let fig-J-2-67(width: 285 * k) = px-canvas(285, 310, origin: (590, 465), width: width, (p, u) => {
  import cetz.draw: *
  let v = (52, -192)
  let up(a) = (a.at(0) + v.at(0), a.at(1) + v.at(1))
  let A = (615, 747)
  let B = (790, 745)
  let C = (675, 685)
  let D = Jlerp(A, B, 0.5)
  let E = Jlerp(B, C, 0.5)
  let F = (C.at(0) + D.at(0) - A.at(0), C.at(1) + D.at(1) - A.at(1))
  let (A1, B1, C1, D1, E1, F1) = (up(A), up(B), up(C), up(D), up(E), up(F))
  let P = (812, 660)
  let Q = (668, 621)
  let K = Jlerp(E, E1, (E.at(1) - 643.5) / 192)
  JS(p, A1, A, B, B1, A1, C1, F1)
  JS(p, C1, B1)
  JS(p, D1, F1)
  JS(p, D, D1)
  JD(p, A, C, B)
  JD(p, C, F)
  JD(p, D, F)
  JD(p, C, C1)
  JD(p, F, F1)
  JD(p, E, E1)
  JD(p, Q, P)
  ring(p, Q, r: 3.2)
  ring(p, K, r: 3.2)
  L(p, 715, 476, $C_1$)
  L(p, 832, 477, $F_1$)
  L(p, 777, 504, $E_1$)
  L(p, 746, 538, $D_1$)
  L(p, 648, 548, $A_1$)
  L(p, 856, 558, $B_1$)
  L(p, 676, 598, $Q$)
  L(p, 753, 626, $K$)
  L(p, 776, 601, $a$)
  L(p, 828, 664, $P$)
  L(p, 664, 680, $C$)
  L(p, 776, 686, $F$)
  L(p, 738, 734, $E$)
  L(p, 602, 756, $A$)
  L(p, 707, 763, $D$)
  L(p, 803, 757, $B$)
})
