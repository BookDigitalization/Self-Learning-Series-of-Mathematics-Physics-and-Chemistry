// 段 M 插图：图 4·6–4·18（原书 p.203–221），读图 150 dpi（页宽约 770 像素）。
// 坐标图按原图量出的原点、单位长度（像素）定标，圆、直线、切点按书中方程算出后画；坐标轴整理为水平、铅直。
// 刻度只画原图上有的范围。图 4·10、4·12 是示意图（无刻度），切点按原图的方位角取。
#import "/common/geo.typ": *
#let M-k = 0.019cm
// 标注
#let M-t(p, pt, body, ..args) = { import cetz.draw: *; content(p(..pt), tt(body), ..args) }
// 数学坐标 → 页面像素：q(x, y)
#let M-q(ox, oy, u) = (x, y) => (ox + u * x, oy - u * y)
// 坐标轴：横轴 xmin–xmax，纵轴 ytop（箭头端）–ybot，都是页面像素
#let M-axes(p, ox, oy, xmin, xmax, ytop, ybot, xl: auto, yl: auto, ol: auto) = {
  import cetz.draw: *
  line(p(xmin, oy), p(xmax, oy), stroke: lt, mark: arw)
  line(p(ox, ybot), p(ox, ytop), stroke: lt, mark: arw)
  M-t(p, if xl == auto { (xmax + 10, oy) } else { xl }, $x$)
  M-t(p, if yl == auto { (ox, ytop - 11) } else { yl }, $y$)
  M-t(p, if ol == auto { (ox - 8, oy + 10) } else { ol }, $O$)
}
// 整数刻度：xs、ys 为刻度的数学坐标
#let M-ticks(p, q, xs, ys, s: 4) = {
  import cetz.draw: *
  for i in xs { let (x, y) = q(i, 0); line(p(x, y), p(x, y - s), stroke: lt) }
  for j in ys { let (x, y) = q(0, j); line(p(x, y), p(x + s, y), stroke: lt) }
}
// 两个数学点之间的线段
#let M-ln(p, q, a, b, st: lw) = {
  import cetz.draw: *
  line(p(..q(..a)), p(..q(..b)), stroke: st)
}
#let M-dot(p, q, a) = pdot(p, q(..a))
#let M-circ(p, q, c, r, u) = circ(p, q(..c), r * u)

// 图 4·6（p.203）：经过 A(5, 1)、B(0, −1)、C(2, −3) 的圆
#let fig-M-4-6() = px-canvas(370, 300, origin: (200, 665), width: 370 * M-k, (p, u) => {
  import cetz.draw: *
  let (ox, oy, s) = (296, 822, 27)
  let q = M-q(ox, oy, s)
  M-axes(p, ox, oy, 212, 540, 700, 950, xl: (552, 821), yl: (296, 680), ol: (304, 833))
  M-ticks(p, q, (-1, 1, 2, 3, 4, 5, 6), (-3, -2, -1, 1, 2, 3))
  M-circ(p, q, (37/14, -5/14), calc.sqrt(1450) / 14, s)
  for pt in ((5, 1), (0, -1), (2, -3), (37/14, -5/14)) { M-dot(p, q, pt) }
  M-t(p, (463, 794), $A(5, 1)$)
  M-t(p, (262, 850), $B(0, -1)$)
  M-t(p, (368, 853), $(37/14, -5/14)$)
  M-t(p, (378, 917), $C(2, -3)$)
})

// 图 4·7（p.204）：以 C(−1, −5) 为圆心、和 x 轴相切的圆
#let fig-M-4-7() = px-canvas(295, 325, origin: (80, 375), width: 295 * M-k, (p, u) => {
  import cetz.draw: *
  let (ox, oy, s) = (226, 466, 18)
  let q = M-q(ox, oy, s)
  M-axes(p, ox, oy, 87, 352, 395, 685, xl: (362, 468), yl: (230, 385), ol: (219, 457))
  M-ticks(p, q, (-6, -5, -4, -3, -2, -1, 1, 2, 3, 4), (1, -1, -2, -3, -4, -5, -6, -7, -8, -9))
  M-circ(p, q, (-1, -5), 5, s)
  M-dot(p, q, (-1, -5))
  M-t(p, (180, 567), $C(-1, -5)$)
})

// 图 4·8（p.205）：以 C(4, 7) 为圆心、和直线 3x − 4y + 1 = 0 相切的圆
#let fig-M-4-8() = px-canvas(305, 345, origin: (365, 245), width: 305 * M-k, (p, u) => {
  import cetz.draw: *
  let (ox, oy, s) = (432.5, 517.5, 21)
  let q = M-q(ox, oy, s)
  M-axes(p, ox, oy, 375, 645, 277, 580, xl: (656, 517), yl: (435, 262), ol: (441, 531))
  M-ticks(p, q, (-1, 1, 2, 3, 4, 5, 6), (-2, -1, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11))
  M-circ(p, q, (4, 7), 3, s)
  M-ln(p, q, (-1.55, (3 * -1.55 + 1) / 4), (8.4, (3 * 8.4 + 1) / 4))
  M-ln(p, q, (4, 7), (5.8, 4.6), st: lt)
  for pt in ((4, 7), (5.8, 4.6), (1, 1), (3, 2.5)) { M-dot(p, q, pt) }
  M-t(p, (540, 359), $C(4, 7)$)
  M-t(p, (544, 401), $r$)
  M-t(p, (566, 431), $3x - 4y + 1 = 0$, angle: 36.87deg)
})

// 图 4·9（p.206）：△ABC 的外接圆（弧）与内切圆
#let fig-M-4-9() = px-canvas(430, 355, origin: (160, 172), width: 400 * M-k, (p, u) => {
  import cetz.draw: *
  let (ox, oy, s) = (377.5, 321, 21)
  let q = M-q(ox, oy, s)
  M-axes(p, ox, oy, 168, 570, 203, 520, xl: (580, 323), yl: (380, 190), ol: (386, 333))
  M-ticks(p, q, range(-8, 7).filter(i => i != 0), range(-8, 3).filter(i => i != 0))
  let A = (-55/7, -50/7)
  let B = (-1, 2)
  let C = (13/3, 2)
  let I = (-5/21, 10/21)
  let T = (0.676, -0.743)
  // 外接圆：圆心 (5/3, −50/7)，半径约 9.52；原图只画 A 下方到 C 右方的一段弧
  let R = calc.sqrt(calc.pow(5/3, 2) + calc.pow(50/7, 2) + 775/21) * s
  arc(p(..q(5/3, -50/7)), start: 63.7deg, stop: 186.7deg, radius: R, anchor: "origin", stroke: lw)
  circle(p(..q(..I)), radius: 32/21 * s, stroke: lw)
  M-ln(p, q, B, C, st: lt)
  M-ln(p, q, B, I, st: lt)
  M-ln(p, q, A, B, st: dsh)
  M-ln(p, q, A, I, st: dsh)
  M-ln(p, q, A, T, st: lt)
  M-ln(p, q, T, C, st: dsh)
  for pt in (A, B, C, I) { M-dot(p, q, pt) }
  M-t(p, (203, 471), $A$)
  M-t(p, (357, 266), $B$)
  M-t(p, (472, 267), $C$)
})

// 图 4·10（p.209）：经过圆上一点 P₁ 的切线（示意图，以半径为单位）
#let fig-M-4-10() = px-canvas(310, 285, origin: (375, 597), width: 290 * M-k, (p, u) => {
  import cetz.draw: *
  let (ox, oy, s) = (490, 765, 72)
  let q = M-q(ox, oy, s)
  let th = 44.4deg
  let (c, sn) = (calc.cos(th), calc.sin(th))
  M-axes(p, ox, oy, 383, 657, 625, 872, xl: (669, 766), yl: (490, 612), ol: (481, 774))
  M-circ(p, q, (0, 0), 1, s)
  M-ln(p, q, (c - 1.34 * sn, sn + 1.34 * c), (c + 1.32 * sn, sn - 1.32 * c))
  M-ln(p, q, (0, 0), (c, sn), st: lt)
  M-ln(p, q, (c, sn), (c, 0), st: lt)
  M-dot(p, q, (c, sn))
  M-t(p, (582, 709), $P_1 (x_1, y_1)$)
  M-t(p, (510, 733), $r$)
  M-t(p, (617, 787), $L$)
})

// 图 4·11（p.210）：与圆 x² + y² = 13 切于 P(−3, 2) 的切线
#let fig-M-4-11() = px-canvas(335, 315, origin: (215, 742), width: 315 * M-k, (p, u) => {
  import cetz.draw: *
  let (ox, oy, s) = (374, 921.5, 24)
  let q = M-q(ox, oy, s)
  M-axes(p, ox, oy, 230, 525, 760, 1047, xl: (538, 922), yl: (375, 750), ol: (365, 932))
  M-ticks(p, q, (-4, -3, -2, -1, 1, 2, 3), (-4, -3, -2, -1, 1, 2, 3, 4, 5))
  M-circ(p, q, (0, 0), calc.sqrt(13), s)
  M-ln(p, q, (-4.92, (3 * -4.92 + 13) / 2), (-0.94, (3 * -0.94 + 13) / 2))
  M-ln(p, q, (0, 0), (-3, 2), st: lt)
  M-dot(p, q, (-3, 2))
  M-t(p, (264, 873), $P(-3, 2)$)
})

// 图 4·12（p.211）：经过圆外一点 P₀ 的切线（示意图，以半径为单位）
#let fig-M-4-12() = px-canvas(345, 295, origin: (345, 552), width: 315 * M-k, (p, u) => {
  import cetz.draw: *
  let (ox, oy, s) = (479, 721, 72.5)
  let q = M-q(ox, oy, s)
  let th = 44.4deg
  let (c, sn) = (calc.cos(th), calc.sin(th))
  M-axes(p, ox, oy, 358, 650, 573, 835, xl: (661, 718), yl: (480, 562), ol: (471, 732))
  M-circ(p, q, (0, 0), 1, s)
  M-ln(p, q, (c - 1.29 * sn, sn + 1.29 * c), (c + 1.785 * sn, sn - 1.785 * c))
  M-ln(p, q, (0, 0), (c, sn), st: lt)
  M-dot(p, q, (c, sn))
  M-dot(p, q, (c + 1.30 * sn, sn - 1.30 * c))
  M-t(p, (572, 669), $P_1 (x_1, y_1)$)
  M-t(p, (637, 739), $P_0 (x_0, y_0)$)
  M-t(p, (455, 604), $L$)
})

// 图 4·13（p.212）：经过圆外一点 P(−4, 7) 的两条切线
#let fig-M-4-13() = px-canvas(365, 345, origin: (200, 717), width: 345 * M-k, (p, u) => {
  import cetz.draw: *
  let (ox, oy, s) = (393.5, 931.5, 21)
  let q = M-q(ox, oy, s)
  M-axes(p, ox, oy, 215, 540, 740, 1050, xl: (551, 931), yl: (394, 727), ol: (384, 943))
  M-ticks(p, q, (-4, -3, -2, -1, 1, 2, 3, 4), (-4, -3, -2, -1, 1, 2, 3, 4, 5, 6, 7))
  M-circ(p, q, (0, 0), calc.sqrt(13), s)
  M-ln(p, q, (-5.1, (13 + 5.1 * 2) / 3), (4.05, (13 - 4.05 * 2) / 3))
  M-ln(p, q, (-(8.36 + 65) / 18, 8.36), (-(-3.02 + 65) / 18, -3.02))
  for pt in ((-4, 7), (2, 3), (-18/5, -1/5)) { M-dot(p, q, pt) }
  M-t(p, (350, 778), $P(-4, 7)$)
  M-t(p, (452, 858), $(2, 3)$)
  M-t(p, (262, 951), $(-3 3/5, -1/5)$)
})

// 图 4·14（p.214）：经过 P₁(1/2, √3/2)、P₂(−1, −2) 与单位圆相切的直线
#let fig-M-4-14() = px-canvas(345, 295, origin: (205, 607), width: 330 * M-k, (p, u) => {
  import cetz.draw: *
  let (ox, oy, s) = (362.5, 761.5, 54)
  let q = M-q(ox, oy, s)
  M-axes(p, ox, oy, 218, 520, 630, 895, xl: (532, 762), yl: (364, 618), ol: (353, 773))
  M-circ(p, q, (0, 0), 1, s)
  M-ln(p, q, (-0.77, (2 + 0.77) / calc.sqrt(3)), (1.71, (2 - 1.71) / calc.sqrt(3)))
  M-ln(p, q, (-1, 1.14), (-1, -2.43))
  M-ln(p, q, (-1.53, (3 * -1.53 - 5) / 4), (1.34, (3 * 1.34 - 5) / 4))
  for pt in ((1/2, calc.sqrt(3) / 2), (-1, 0), (3/5, -4/5), (-1, -2)) { M-dot(p, q, pt) }
  M-t(p, (441, 707), $P_1 (1/2, sqrt(3)/2)$)
  M-t(p, (277, 773), $(-1, 0)$)
  M-t(p, (432, 818), $(3/5, -4/5)$)
  M-t(p, (256, 859), $P_2 (-1, -2)$)
})

// 图 4·15（p.216）：圆 x² + y² = 13 的两条斜率为 −2/3 的切线
#let fig-M-4-15() = px-canvas(335, 342, origin: (212, 710), width: 320 * M-k, (p, u) => {
  import cetz.draw: *
  let (ox, oy, s) = (360, 904, 24)
  let q = M-q(ox, oy, s)
  M-axes(p, ox, oy, 220, 525, 732, 1042, xl: (536, 904), yl: (360, 721), ol: (352, 914))
  M-ticks(p, q, (-4, -3, -2, -1, 1, 2, 3, 4), (-5, -4, -3, -2, -1, 1, 2, 3, 4))
  M-circ(p, q, (0, 0), calc.sqrt(13), s)
  M-ln(p, q, (-0.77, (13 + 2 * 0.77) / 3), (4.94, (13 - 2 * 4.94) / 3))
  M-ln(p, q, (-4.96, (-13 + 2 * 4.96) / 3), (0.875, (-13 - 2 * 0.875) / 3))
  M-dot(p, q, (2, 3)); M-dot(p, q, (-2, -3))
  M-t(p, (434, 824), $(2, 3)$)
  M-t(p, (271, 981), $(-2, -3)$)
})

// 图 4·16（p.218）：同心圆系
#let fig-M-4-16() = px-canvas(330, 305, origin: (80, 660), width: 300 * M-k, (p, u) => {
  import cetz.draw: *
  let (ox, oy) = (226.5, 823.5)
  M-axes(p, ox, oy, 88, 395, 683, 957, xl: (405, 825), yl: (228, 670), ol: (217, 833))
  for i in (1, 2, 3, 4) { circ(p, (ox, oy), 24.6 * i) }
})

// 图 4·17（p.221）：经过两圆 x² + y² − 6x = 0、x² + y² = 4 的交点和 P(2, −2) 的圆
#let fig-M-4-17() = px-canvas(345, 272, origin: (215, 162), width: 330 * M-k, (p, u) => {
  import cetz.draw: *
  let (ox, oy, s) = (315, 322.5, 24)
  let q = M-q(ox, oy, s)
  M-axes(p, ox, oy, 230, 540, 188, 427, xl: (550, 321), yl: (315, 175), ol: (323, 333))
  M-ticks(p, q, (-1, 1, 2, 3, 4), (-3, -2, -1, 1, 2, 3))
  M-circ(p, q, (0, 0), 2, s)
  M-circ(p, q, (3, 0), 3, s)
  M-circ(p, q, (1.5, 0), calc.sqrt(4.25), s)
  M-dot(p, q, (2, -2))
  M-t(p, (402, 380), $P(2, -2)$)
})

// 图 4·18（p.221）：例 2，圆 C₁、C₂ 和所求的圆（原图圆心旁标小写 c₁、c₂、c₃）
#let fig-M-4-18() = px-canvas(385, 360, origin: (190, 687), width: 345 * M-k, (p, u) => {
  import cetz.draw: *
  let (ox, oy, s) = (315, 893.5, 25)
  let q = M-q(ox, oy, s)
  M-axes(p, ox, oy, 200, 555, 720, 1040, xl: (566, 895), yl: (316, 705), ol: (322, 903))
  M-ticks(p, q, (-3, -2, -1, 1, 2, 3, 4, 5), (-5, -4, -3, -2, -1, 1, 2, 3, 4, 5, 6))
  M-circ(p, q, (2, 0), calc.sqrt(7), s)
  M-circ(p, q, (0, 2), calc.sqrt(7), s)
  M-circ(p, q, (3, -1), calc.sqrt(13), s)
  M-dot(p, q, (3, -1))
  M-t(p, (304, 836), $c_2$)
  M-t(p, (368, 903), $c_1$)
  M-t(p, (403, 919), $c_3$)
})
