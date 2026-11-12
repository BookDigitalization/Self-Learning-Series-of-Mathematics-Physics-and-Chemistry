// 图 3·70（原书 p.278）、3·71（p.279）、3·72（p.280）、3·73 (1)(2)（p.281）；页面 200 dpi 坐标。
#import "O-base.typ": *

// 图 3·70 等边圆锥与以它的高为直径的球（原图两幅并排，无分图号）
#let fig-O-3-70(width: 420 * k) = px-canvas(420, 185, origin: (290, 1108), width: width, (p, u) => {
  import cetz.draw: *
  // 圆锥
  let V = (382, 1130)
  let O = (382, 1263)
  let A = (317, 1263)
  let B = (447, 1263)
  O-ell(p, O, 65, 27)
  seg(p, V, A)
  seg(p, V, B)
  dseg(p, V, O)
  dseg(p, A, B)
  L(p, 384, 1117, $V$)
  L(p, 302, 1263, $A$)
  L(p, 461, 1264, $B$)
  L(p, 380, 1279, $O$)
  // 球
  let O1 = (619, 1204.5)
  circ(p, O1, 65.5, stroke: lb)
  O-ell(p, O1, 65.5, 21)
  dseg(p, (619, 1139), (619, 1270))
  circle(p(..O1), radius: 2.4, stroke: lt, fill: white)
  L(p, 621, 1127, $V$)
  L(p, 634, 1209, $O_1$)
  L(p, 619, 1284, $O$)
})

// 图 3·71 宇宙飞船的视野
#let fig-O-3-71(width: 260 * k) = px-canvas(260, 355, origin: (645, 680), width: width, (p, u) => {
  import cetz.draw: *
  let O = (772, 905)
  let r = 120
  let P = (772, 705)
  let A = (676, 833)
  let B = (868, 833)
  let C = (772, 833)
  let D = (772, 785)
  // 球冠（弓形）阴影
  O-hatch(p, O-arcpts(O, r, 36.87, 143.13), ang: 60, gap: 6)
  circ(p, O, r, stroke: lb)
  poly(p, (A, P, B))
  seg(p, P, O)
  seg(p, A, B)
  poly(p, (A, O, B))
  L(p, 772, 690, $P$)
  L(p, 782, 773, $D$)
  L(p, 661, 829, $A$)
  L(p, 883, 822, $B$)
  L(p, 783, 846, $C$)
  L(p, 772, 923, $O$)
})

// 图 3·72 球冠的轴截面
#let fig-O-3-72(width: 280 * k) = px-canvas(280, 285, origin: (600, 525), width: width, (p, u) => {
  import cetz.draw: *
  let O = (737, 670)
  let r = 132
  circ(p, O, r, stroke: lb)
  let A = (737, 538)
  let hw = calc.sqrt(r * r - 60 * 60)
  let D = (737 - hw, 610)
  let C = (737 + hw, 610)
  let B = (737, 610)
  seg(p, A, O)
  seg(p, D, C)
  seg(p, O, D)
  seg(p, O, C)
  anglearc(p, O, B, C, 14)
  L(p, 739, 530, $A$)
  L(p, 727, 584, $h$)
  L(p, 610, 607, $D$)
  L(p, 866, 603, $C$)
  L(p, 750, 625, $B$)
  L(p, 727, 640, $x$)
  L(p, 731, 688, $O$)
  content(p(765, 684), tsm($α / 2$))
})

// 图 3·73 (1) 球心不在两个底面之间
#let fig-O-3-73a(width: 290 * k) = px-canvas(290, 285, origin: (172, 560), width: width, (p, u) => {
  import cetz.draw: *
  let O = (317, 701)
  let r = 131
  circ(p, O, r, stroke: lb)
  let N = (317, 612)
  let rxN = calc.sqrt(r * r - 89 * 89)
  O-ell(p, N, rxN, 20)
  let M = (317, 662)
  let rxM = calc.sqrt(r * r - 39 * 39)
  O-ell(p, M, rxM, 30)
  let A = (317 - rxN, 612)
  let C = (317 + rxN, 612)
  let B = (317 - rxM, 662)
  let D = (317 + rxM, 662)
  dseg(p, A, C)
  dseg(p, B, D)
  dseg(p, N, O)
  dseg(p, O, A)
  dseg(p, O, B)
  pdot(p, O, r: 1.6)
  L(p, 211, 600, $A$)
  L(p, 317, 598, $N$)
  L(p, 423, 600, $C$)
  L(p, 178, 664, $B$)
  L(p, 328, 652, $M$)
  L(p, 459, 662, $D$)
  L(p, 317, 716, $O$)
})

// 图 3·73 (2) 球心在两个底面之间
#let fig-O-3-73b(width: 310 * k) = px-canvas(310, 300, origin: (548, 548), width: width, (p, u) => {
  import cetz.draw: *
  let O = (703, 699)
  let r = 144
  circ(p, O, r, stroke: lb)
  let N1 = (703, 595)
  let rxN = calc.sqrt(r * r - 104 * 104)
  O-ell(p, N1, rxN, 22)
  let M1 = (703, 725)
  let rxM = calc.sqrt(r * r - 26 * 26)
  O-ell(p, M1, rxM, 26)
  let A1 = (703 - rxN, 595)
  let C1 = (703 + rxN, 595)
  let B1 = (703 - rxM, 725)
  let D1 = (703 + rxM, 725)
  dseg(p, A1, C1)
  dseg(p, B1, D1)
  seg(p, N1, O)
  dseg(p, O, M1)
  dseg(p, O, A1)
  pdot(p, O, r: 1.6)
  L(p, A1.at(0) - 14, 584, $A_1$)
  L(p, 707, 580, $N_1$)
  L(p, C1.at(0) + 14, 584, $C_1$)
  L(p, 714, 689, $O$)
  L(p, 719, 716, $M_1$)
  L(p, B1.at(0) - 14, 735, $B_1$)
  L(p, D1.at(0) + 16, 733, $D_1$)
})
