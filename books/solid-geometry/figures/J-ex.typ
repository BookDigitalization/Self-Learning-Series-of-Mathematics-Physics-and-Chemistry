// 习题里的不编号插图：习题 2·13 第 5 题（原书 p.189）、第 7、9 题（p.190）；
// 习题 2·14 第 8 题（p.196）、第 11、12 题（p.197）。页面 200 dpi 坐标。
#import "J-base.typ": *

#let fig-J-ex13-5(width: 200 * k) = px-canvas(200, 225, origin: (715, 825), width: width, (p, u) => {
  import cetz.draw: *
  let v = (25, -132)
  let up(a) = (a.at(0) + v.at(0), a.at(1) + v.at(1))
  let (A, E, B, D, C) = ((742, 1020), (827, 1020), (860, 1020), (762, 985), (847, 985))
  let (A1, E1, B1, D1, C1) = (up(A), up(E), up(B), up(D), up(C))
  // 阴影面 CEE1C1
  for i in range(0, 9) {
    let t = 0.04 + i * 0.1
    let t2 = calc.min(t + 0.12, 1)
    line(p(..Jlerp(E, E1, t)), p(..Jlerp(C, C1, t2)), stroke: 0.5pt)
  }
  JS(p, A1, A, B, B1, A1, D1, C1, B1)
  JS(p, E, E1, C1)
  JD(p, A, D, C, B)
  JD(p, D, D1)
  JD(p, C, C1)
  JD(p, C, E)
  L(p, 775, 840, $D_1$)
  L(p, 888, 845, $C_1$)
  L(p, 750, 880, $A_1$)
  L(p, 838, 876, $E_1$)
  L(p, 903, 891, $B_1$)
  L(p, 777, 975, $D$)
  L(p, 864, 985, $C$)
  L(p, 729, 1025, $A$)
  L(p, 827, 1037, $E$)
  L(p, 875, 1026, $B$)
})

#let fig-J-ex13-7(width: 310 * k) = px-canvas(310, 130, origin: (545, 255), width: width, (p, u) => {
  import cetz.draw: *
  poly(p, ((553, 349), (608.5, 290), (756.5, 290), (812, 349)), close: true)
  // 上底尺寸 8
  JT(p, (608.5, 262), (608.5, 290))
  JT(p, (756.5, 262), (756.5, 290))
  dimh(p, 608.5, 756.5, 270, lab: $8$)
  // 下底尺寸 14
  JT(p, (553, 349), (553, 379))
  JT(p, (812, 349), (812, 379))
  dimh(p, 553, 812, 370, lab: $14$)
  // 高 3.2
  JT(p, (756.5, 290), (845, 290))
  JT(p, (812, 349), (845, 349))
  line(p(830, 307), p(830, 290), stroke: lt, mark: (end: "stealth", fill: black, scale: 0.45))
  line(p(830, 332), p(830, 349), stroke: lt, mark: (end: "stealth", fill: black, scale: 0.45))
  L(p, 833, 320, $3.2$)
})

#let fig-J-ex13-9(width: 285 * k) = px-canvas(285, 230, origin: (575, 755), width: width, (p, u) => {
  import cetz.draw: *
  let (A, B, C, D) = ((603, 953), (727, 953), (789, 903), (665, 903))
  let (A1, B1, C1, D1) = ((645, 832), (769, 832), (831, 782), (707, 782))
  let O = (645, 941.7)
  let E = (633, 953)
  JS(p, A1, A, B, C, C1, D1, A1, B1, B)
  JS(p, B1, C1)
  JS(p, A1, E)
  JD(p, A, D, C)
  JD(p, D, D1)
  JD(p, A, C)
  JD(p, A1, O, E)
  L(p, 703, 768, $D_1$)
  L(p, 843, 776, $C_1$)
  L(p, 626, 832, $A_1$)
  L(p, 786, 843, $B_1$)
  L(p, 674, 893, $D$)
  L(p, 803, 911, $C$)
  L(p, 655, 928, $O$)
  L(p, 589, 956, $A$)
  L(p, 632, 973, $E$)
  L(p, 735, 967, $B$)
})

#let fig-J-ex14-8(width: 210 * k) = px-canvas(210, 232, origin: (640, 1088), width: width, (p, u) => {
  import cetz.draw: *
  let (P, A, B, C) = ((678, 1118), (660, 1240), (818, 1190), (765, 1290))
  JS(p, A, P, B, C, A)
  JS(p, P, C)
  JD(p, A, B)
  L(p, 676, 1100, $P$)
  L(p, 703, 1140, $α$)
  L(p, 752, 1140, $b$)
  L(p, 734, 1200, $b$)
  L(p, 837, 1192, $B$)
  L(p, 648, 1242, $A$)
  L(p, 770, 1307, $C$)
})

#let fig-J-ex14-11(width: 230 * k) = px-canvas(230, 250, origin: (270, 500), width: width, (p, u) => {
  import cetz.draw: *
  let V = (402, 528)
  let (A, B, C, D, E) = ((305, 682), (342, 715), (437, 722), (475, 682), (405, 662))
  let s = 0.58
  let (A1, B1, C1, D1, E1) = (A, B, C, D, E).map(x => Jlerp(V, x, s))
  let O = (404, 690)
  let O1 = Jlerp(V, O, s)
  JS(p, A, V, B)
  JS(p, C, V, D)
  JS(p, A, B, C, D)
  JS(p, A1, B1, C1, D1)
  JD(p, V, E)
  JD(p, A, E, D)
  JD(p, A1, E1, D1)
  JD(p, V, O)
  ring(p, O, r: 3)
  ring(p, O1, r: 2.6)
  L(p, 402, 512, $V$)
  L(p, 330, 614, $A_1$)
  L(p, 350, 644, $B_1$)
  L(p, 382, 625, $O_1$)
  L(p, 393, 596, $E_1$)
  L(p, 472, 619, $D_1$)
  L(p, 444, 655, $C_1$)
  L(p, 392, 671, $E$)
  L(p, 291, 684, $A$)
  L(p, 489, 687, $D$)
  L(p, 389, 695, $O$)
  L(p, 340, 736, $B$)
  L(p, 437, 739, $C$)
})

#let fig-J-ex14-12(width: 210 * k) = px-canvas(210, 245, origin: (570, 515), width: width, (p, u) => {
  import cetz.draw: *
  let (A, B, C, D) = ((687, 545), (750, 680), (600, 678), (712, 723))
  let O = (687, 691)
  let E = (732, 700)
  JS(p, B, A, C, D, B)
  JS(p, A, D)
  JS(p, A, E)
  JD(p, C, B)
  JD(p, A, O, E)
  L(p, 687, 530, $A$)
  L(p, 584, 680, $C$)
  L(p, 767, 682, $B$)
  L(p, 715, 742, $D$)
  L(p, 690, 709, $O$)
  L(p, 748, 713, $E$)
  L(p, 718, 688, $α$)
})
