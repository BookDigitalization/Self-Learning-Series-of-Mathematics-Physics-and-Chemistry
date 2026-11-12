// 习题里的小图：习题 3·5 第 8 题（原书 p.241）、习题 3·6 第 3、4 题（p.245）、习题 3·7 第 3、4 题（p.250）；
// 页面 200 dpi 坐标。
#import "M-base.typ": *

// 习题 3·5 第 8 题：正四棱柱中钻圆柱形孔
#let fig-M-ex35-8(width: 180 * k) = px-canvas(185, 205, origin: (710, 932), width: width, (p, u) => {
  import cetz.draw: *
  let F1 = (718, 987)
  let F2 = (838, 987)
  let F3 = (838, 1130)
  let F4 = (718, 1130)
  let K1 = (765, 942)
  let K2 = (885, 942)
  let K3 = (885, 1082)
  let K4 = (765, 1082)
  poly(p, (F1, F2, F3, F4), close: true)
  poly(p, (F1, K1, K2, F2))
  poly(p, (K2, K3, F3))
  dseg(p, K1, K4)
  dseg(p, K4, K3)
  dseg(p, K4, F4)
  // 圆柱形孔
  let c1 = (800, 965)
  let c0 = (800, 1110)
  M-earc(p, c1, 47, 18, 0, 360)
  dseg(p, (753, 965), (753, 1110))
  dseg(p, (847, 965), (847, 1110))
  M-earc(p, c0, 47, 18, 0, 360, st: dsh)
})

// 习题 3·6 第 3 题：圆锥的中截面
#let fig-M-ex36-3(width: 170 * k) = px-canvas(170, 240, origin: (250, 495), width: width, (p, u) => {
  import cetz.draw: *
  let V = (337, 512)
  let O = (337, 676)
  let A = (267, 676)
  let R0 = (407, 676)
  let t = (606 - 512) / (676 - 512)
  let A2 = M-lerp(V, A, t)
  let O2 = (337, 606)
  seg(p, V, A)
  seg(p, V, R0)
  M-base-ell(p, O, 70, 40)
  M-base-ell(p, O2, 70 * t, 20)
  dseg(p, V, O)
  dseg(p, A2, O2)
  rtmark(p, O2, A2, O, s: 6)
  M-tseg(p, A, R0)
  M-L(p, 337, 498, $V$)
  M-L(p, 287, 601, $A'$)
  M-L(p, 352, 599, $O'$)
  M-L(p, 255, 680, $A$)
  M-L(p, 300, 668, $r$)
  M-L(p, 336, 692, $O$)
})

// 习题 3·6 第 4 题：圆锥的轴截面
#let fig-M-ex36-4(width: 210 * k) = px-canvas(215, 210, origin: (585, 503), width: width, (p, u) => {
  import cetz.draw: *
  let V = (690, 520)
  let L = (598, 702)
  let A = (780, 702)
  let O = (690, 702)
  let M = M-lerp(V, A, 0.5)
  // MN ⊥ VA，N 在轴 VO 上
  let N = (690, M.at(1) + (M.at(0) - 690) * (A.at(0) - V.at(0)) / (A.at(1) - V.at(1)))
  poly(p, (V, A, L), close: true)
  dseg(p, V, O)
  M-thin(p, M, N)
  rtmark(p, M, N, A, s: 6)
  M-L(p, 690, 505, $V$)
  M-L(p, 753, 609, $M$)
  M-L(p, 679, 637, $N$)
  M-L(p, 792, 708, $A$)
  M-L(p, 690, 718, $O$)
})

// 习题 3·7 第 3 题：锅炉上的圆台形罩盖（尺寸单位：米）
#let fig-M-ex37-3(width: 220 * k) = px-canvas(245, 255, origin: (195, 875), width: width, (p, u) => {
  import cetz.draw: *
  // 罩盖（圆台的轴截面轮廓）
  poly(p, ((282, 1035), (325, 1035), (398, 1100), (210, 1100)), close: true)
  // 烟管：外壁、内壁和弯头
  seg(p, (282, 1035), (282, 929))
  M-carc(p, (327, 929), 45, 180, 90)
  seg(p, (327, 884), (405, 884))
  seg(p, (405, 884), (405, 925))
  seg(p, (325, 1035), (325, 950))
  M-carc(p, (350, 950), 25, 180, 90)
  seg(p, (350, 925), (405, 925))
  // 中心线（点划线）
  line(p(303.5, 1100), p(303.5, 940), stroke: M-dashdot)
  M-carc(p, (339, 940), 35.5, 180, 90, st: M-dashdot)
  line(p(339, 904.5), p(418, 904.5), stroke: M-dashdot)
  // 尺寸 φ0.2
  line(p(250, 1012), p(282, 1012), stroke: lt, mark: arw)
  line(p(357, 1012), p(325, 1012), stroke: lt, mark: arw)
  M-L(p, 350, 992, $phi.alt 0.2$)
  // 尺寸 0.3
  M-thin(p, (325, 1035), (420, 1035))
  M-thin(p, (398, 1100), (420, 1100))
  line(p(410, 1062), p(410, 1035), stroke: lt, mark: arw)
  line(p(410, 1080), p(410, 1100), stroke: lt, mark: arw)
  M-L(p, 413, 1071, $0.3$)
  // 尺寸 φ1.0
  M-thin(p, (210, 1100), (210, 1127))
  M-thin(p, (398, 1100), (398, 1127))
  dimh(p, 210, 398, 1117, lab: $phi.alt 1.0$, gapw: 48)
})

// 习题 3·7 第 4 题：圆台的轴截面（一半）
#let fig-M-ex37-4(width: 230 * k) = px-canvas(250, 195, origin: (675, 925), width: width, (p, u) => {
  import cetz.draw: *
  let O1 = (710, 944)
  let A = (838, 944)
  let B = (870, 1100)
  let O = (710, 1100)
  let Q = (710, 1046)
  let P = M-lerp(A, B, (1046 - 944) / (1100 - 944))
  let N = (838, 1046)
  let H = (838, 1100)
  poly(p, (O1, A, B, O), close: true)
  seg(p, Q, P)
  dseg(p, A, H)
  M-thin(p, (868, 1027), M-lerp(N, P, 0.6))
  M-L(p, 693, 945, $O_1$)
  M-L(p, 774, 935, $r$)
  M-L(p, 853, 945, $A$)
  M-L(p, 897, 1015, $(x - r)$)
  M-L(p, 766, 1037, $x$)
  M-L(p, 824, 1037, $N$)
  M-L(p, 692, 1050, $Q$)
  M-L(p, 881, 1050, $P$)
  M-L(p, 692, 1100, $O$)
  M-L(p, 781, 1088, $R$)
  M-L(p, 858, 1088, $R - r$)
  M-L(p, 838, 1115, $H$)
  M-L(p, 884, 1104, $B$)
})
