// 图 3·27（原书 p.238）、3·28（p.239）、3·29（p.240）、3·30（p.242）、3·31、3·32（p.243）、3·33、3·34（p.244）；
// 页面 200 dpi 坐标。
#import "M-base.typ": *

// 图 3·27 圆柱及其侧面展开图
#let fig-M-3-27(width: 500 * k) = px-canvas(565, 240, origin: (205, 1068), width: width, (p, u) => {
  import cetz.draw: *
  let c1 = (311, 1100)
  let c0 = (311, 1272)
  M-earc(p, c1, 62, 22, 0, 360)
  seg(p, (249, 1100), (249, 1272))
  M-tseg(p, (373, 1100), (373, 1272))
  seg(p, (249, 1100), (373, 1100))
  M-base-ell(p, c0, 62, 22)
  dseg(p, (249, 1272), (373, 1272))
  pdot(p, c0, r: 1.8)
  let A = (373, 1272)
  let B = (735, 1272)
  let C = (735, 1101)
  let D = (373, 1100)
  M-tseg(p, D, C)
  M-tseg(p, C, B)
  M-tseg(p, B, A)
  M-L(p, 384, 1086, $D$)
  M-L(p, 751, 1100, $C$)
  M-L(p, 751, 1276, $B$)
  M-L(p, 378, 1294, $A$)
  M-L(p, 228, 1178, $h$)
  M-L(p, 750, 1185, $h$)
  M-L(p, 322, 1258, $R$)
  M-L(p, 535, 1289, $2 pi R$)
})

// 图 3·28 例 1：平行于轴的截面
#let fig-M-3-28(width: 165 * k) = px-canvas(165, 235, origin: (733, 848), width: width, (p, u) => {
  import cetz.draw: *
  let c1 = (811, 890)
  let c0 = (811, 1022)
  M-earc(p, c1, 62, 22, 0, 360)
  seg(p, (749, 890), (749, 1022))
  seg(p, (873, 890), (873, 1022))
  M-base-ell(p, c0, 62, 23)
  let O1 = c1
  let O = c0
  let A1 = (825, 912)
  let B1 = (841, 869)
  let A = (825, 1045)
  let B = (841, 1000)
  let D = M-lerp(A, B, 0.5)
  // 上底面内的三角形
  M-thin(p, O1, A1)
  M-thin(p, O1, B1)
  M-thin(p, A1, B1)
  // 轴、截面的两条母线
  dseg(p, O1, O)
  seg(p, A1, (825, 1000))
  dseg(p, (825, 1000), A)
  dseg(p, B1, B)
  // 下底面内
  M-thin(p, O, A)
  M-thin(p, O, B)
  dseg(p, A, B)
  M-thin(p, O, D)
  rtmark(p, D, O, B, s: 5)
  M-L(p, 848, 857, $B_1$)
  M-L(p, 784, 891, $O_1$)
  M-L(p, 836, 931, $A_1$)
  M-L(p, 853, 988, $B$)
  M-L(p, 794, 1022, $O$)
  M-L(p, 846, 1032, $D$)
  M-L(p, 826, 1064, $A$)
})

// 图 3·29 例 3：平行于底面的截面
#let fig-M-3-29(width: 150 * k) = px-canvas(150, 225, origin: (712, 733), width: width, (p, u) => {
  import cetz.draw: *
  let O1 = (784, 761)
  let O2 = (784, 829)
  let O3 = (784, 923)
  M-earc(p, O1, 62, 22, 0, 360)
  seg(p, (722, 761), (722, 923))
  seg(p, (846, 761), (846, 923))
  M-base-ell(p, O2, 62, 22)
  M-base-ell(p, O3, 62, 22)
  dseg(p, O1, O3)
  ring(p, O1, r: 2.5)
  ring(p, O2, r: 2.5)
  ring(p, O3, r: 2.5)
  M-L(p, 803, 758, $O_1$)
  M-L(p, 803, 826, $O_2$)
  M-L(p, 803, 920, $O_3$)
})

// 图 3·30 圆锥及其侧面展开图
#let fig-M-3-30(width: 230 * k) = px-canvas(255, 335, origin: (590, 588), width: width, (p, u) => {
  import cetz.draw: *
  let V = (663, 724)
  let c0 = (663, 890)
  let R = (723, 890)
  let L = (603, 890)
  seg(p, V, L)
  seg(p, V, R)
  M-base-ell(p, c0, 60, 21)
  dseg(p, V, c0)
  dseg(p, L, R)
  // 展开的扇形：半径 = 母线长
  let rr = calc.sqrt(60 * 60 + 166 * 166)
  let a1 = 46
  let a2 = M-ang(V, R)
  let P = M-ept(V, rr, rr, a1)
  seg(p, V, P)
  M-carc(p, V, rr, a1, a2)
  M-carc(p, V, 28, a1, a2, st: lt)
  M-L(p, 684, 734, $alpha$)
  M-L(p, 700, 812, $l$)
  M-L(p, 678, 878, $R$)
  M-L(p, 815, 762, $2 pi R$)
})

// 图 3·31 圆锥的侧面展开图
#let fig-M-3-31(width: 300 * k) = px-canvas(320, 225, origin: (560, 255), width: width, (p, u) => {
  import cetz.draw: *
  let V = (717, 280)
  let A = (598, 422)
  let rr = calc.sqrt(119 * 119 + 142 * 142)
  let a1 = M-ang(V, A)
  let a2 = -180 - a1
  let A1 = M-ept(V, rr, rr, a2)
  seg(p, V, A)
  seg(p, V, A1)
  M-carc(p, V, rr, a1, a2)
  M-carc(p, V, 18, a1, a2, st: lt)
  M-L(p, 717, 265, $V$)
  M-L(p, 717, 310, $alpha$)
  M-L(p, 645, 352, $l$)
  M-L(p, 580, 424, $A$)
  M-L(p, 856, 428, $A_1$)
  M-L(p, 720, 447, $2 pi R$)
})

// 图 3·32 例 1：等边圆锥
#let fig-M-3-32(width: 200 * k) = px-canvas(205, 185, origin: (690, 1022), width: width, (p, u) => {
  import cetz.draw: *
  let V = (787, 1048)
  let O = (787, 1163)
  let A = (712, 1163)
  let B = (862, 1163)
  seg(p, V, A)
  seg(p, V, B)
  M-base-ell(p, O, 75, 21)
  dseg(p, V, O)
  dseg(p, A, B)
  rtmark(p, O, V, A, s: 6)
  M-L(p, 787, 1033, $V$)
  M-L(p, 700, 1167, $A$)
  M-L(p, 876, 1168, $B$)
  M-L(p, 799, 1153, $O$)
})

// 图 3·33 例 2
#let fig-M-3-33(width: 180 * k) = px-canvas(185, 205, origin: (672, 302), width: width, (p, u) => {
  import cetz.draw: *
  let V = (760, 328)
  let O = (760, 477)
  let A = (700, 477)
  let B = (820, 477)
  seg(p, V, A)
  seg(p, V, B)
  M-base-ell(p, O, 60, 20)
  dseg(p, V, O)
  dseg(p, A, B)
  rtmark(p, O, V, A, s: 6)
  anglearc(p, V, O, B, 26)
  M-L(p, 760, 313, $V$)
  M-L(p, 769, 378, $alpha$)
  M-L(p, 685, 480, $A$)
  M-L(p, 836, 482, $B$)
  M-L(p, 772, 466, $O$)
})

// 图 3·34 例 3
#let fig-M-3-34(width: 220 * k) = px-canvas(240, 305, origin: (655, 952), width: width, (p, u) => {
  import cetz.draw: *
  let V = (700, 975)
  let O = (700, 1233)
  let A = (728, 1233)
  let L = (672, 1233)
  seg(p, V, L)
  seg(p, V, A)
  M-base-ell(p, O, 28, 13)
  dseg(p, V, O)
  dseg(p, O, A)
  let rr = calc.sqrt(28 * 28 + 258 * 258)
  let a1 = M-ang(V, A)
  // 扇形圆心角按例 3 题设 α = 36° 画；原图约 24°，与题设、与图中 r、l 之比（约 39°）都不符
  let a2 = a1 + 36
  let S = M-ept(V, rr, rr, a2)
  M-thin(p, V, S)
  M-carc(p, V, rr, a1, a2, st: lt)
  M-carc(p, V, 40, a1, a2, st: lt)
  M-L(p, 700, 961, $V$)
  M-L(p, 714, 1022, $alpha$)
  M-L(p, 724, 1140, $l$)
  M-L(p, 689, 1229, $O$)
  M-L(p, 713, 1229, $r$)
  M-L(p, 734, 1249, $A$)
  M-L(p, 808, 1236, $2 pi r$)
  M-L(p, 884, 1166, $S$)
})
