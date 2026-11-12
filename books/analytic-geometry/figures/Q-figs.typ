// 段 Q 插图：图 4·58–4·68（原书 p.285–299），读图 200 dpi（页宽约 1024 像素）。
// 示意曲线（图 4·58–4·62）按原图点位用 hobby 曲线描；坐标图（图 4·63–4·68）按方程计算，
// 单位长取原图刻度，轴线整理为水平、竖直。
#import "/common/geo.typ": *
#let Q-k = 0.0148cm
#let Q-t(p, pt, body) = { import cetz.draw: *; content(p(..pt), tt(body)) }
// 坐标轴：原点 (ox, oy)，x 轴从 x0 到 x1，y 轴从 y1（下端）到 y0（上端），带箭头和 x、y、O。
#let Q-axes(p, ox, oy, x0, x1, y0, y1, olab: (-12, 14)) = {
  import cetz.draw: *
  line(p(x0, oy), p(x1, oy), stroke: lt, mark: arw)
  line(p(ox, y1), p(ox, y0), stroke: lt, mark: arw)
  Q-t(p, (x1 + 12, oy), $x$)
  Q-t(p, (ox + 12, y0 + 4), $y$)
  Q-t(p, (ox + olab.at(0), oy + olab.at(1)), $O$)
}
// 刻度：在原点 (ox, oy)、单位 u 下，x 轴取 xs 各整数、y 轴取 ys 各整数。
#let Q-ticks(p, ox, oy, u, xs, ys, s: 4) = {
  import cetz.draw: *
  for i in xs { if i != 0 { line(p(ox + i * u, oy), p(ox + i * u, oy - s), stroke: lt) } }
  for j in ys { if j != 0 { line(p(ox, oy - j * u), p(ox + s, oy - j * u), stroke: lt) } }
}
// 数学坐标 (x, y) → 页面像素
#let Q-m(ox, oy, u) = (x, y) => (ox + x * u, oy - y * u)
// 参数曲线：f(t) 返回数学坐标，t 从 a 到 b 取 n 段
#let Q-curve(p, m, f, a, b, n: 80, st: lw) = {
  import cetz.draw: *
  let pts = range(n + 1).map(i => p(..m(..f(a + (b - a) * i / n))))
  line(..pts, stroke: st)
}

// 图 4·58（p.285）
#let fig-Q-4-58(width: 430 * Q-k) = px-canvas(430, 225, origin: (305, 1325), width: width, (p, u) => {
  import cetz.draw: *
  hobby(..((325, 1293), (360, 1252), (405, 1221), (440, 1245), (468, 1278), (492, 1285), (522, 1278), (545, 1261), (575, 1232), (612, 1186), (675, 1115)).map(q => p(..q)), stroke: lw)
  line(p(362, 1207), p(640, 1287), stroke: lt)
  line(p(535, 1110), p(680, 1253), stroke: lt)
  pdot(p, (410, 1221)); pdot(p, (545, 1260)); pdot(p, (612, 1185), r: 3.2)
  Q-t(p, (408, 1200), $P_1$)
  Q-t(p, (540, 1238), $P_2$)
  Q-t(p, (633, 1190), $P_3$)
  Q-t(p, (655, 1292), $l_1$)
  Q-t(p, (522, 1106), $l_2$)
})

// 图 4·59（p.286）
#let fig-Q-4-59(width: 390 * Q-k) = px-canvas(390, 325, origin: (140, 1075), width: width, (p, u) => {
  import cetz.draw: *
  Q-axes(p, 190, 1005, 140, 515, 765, 1075, olab: (-14, 14))
  hobby(..((275, 1000), (249, 968), (253, 928), (285, 897), (316, 883), (370, 872), (420, 878), (450, 903)).map(q => p(..q)), stroke: lw)
  let P1 = (253, 928)
  // 切线 P1T
  line(p(178, 1040), p(330, 782), stroke: lt)
  // 割线 P1P4、P1P3、P1P2（P1 左侧延长部分画点线）
  for (e, sty) in (((410, 800), lt), ((450, 840), dsh), ((475, 862), lt)) {
    line(p(..P1), p(..e), stroke: sty)
    let d = (P1.at(0) - e.at(0), P1.at(1) - e.at(1))
    let s = 50 / calc.sqrt(d.at(0) * d.at(0) + d.at(1) * d.at(1))
    line(p(..P1), p(P1.at(0) + d.at(0) * s, P1.at(1) + d.at(1) * s), stroke: dotted)
  }
  for q in ((316, 883), (370, 872), (420, 878)) { pdot(p, q) }
  pdot(p, P1, r: 3)
  Q-t(p, (302, 866), $P_4$)
  Q-t(p, (360, 856), $P_3$)
  Q-t(p, (432, 862), $P_2$)
  Q-t(p, (300, 950), $P_1 (x_1, y_1)$)
  Q-t(p, (343, 776), $T$)
})

// 图 4·60（p.287）：P1N ⊥ P1T
#let fig-Q-4-60(width: 300 * Q-k) = px-canvas(300, 270, origin: (355, 470), width: width, (p, u) => {
  import cetz.draw: *
  let P1 = (450, 345)
  let t = (0.485, -0.875)          // 切线方向（页面坐标）
  let n = (-0.875, -0.485)         // 法线方向，与 t 垂直
  line(p(P1.at(0) - 135 * t.at(0), P1.at(1) - 135 * t.at(1)), p(P1.at(0) + 140 * t.at(0), P1.at(1) + 140 * t.at(1)), stroke: lw)
  line(p(P1.at(0) + 85 * n.at(0), P1.at(1) + 85 * n.at(1)), p(P1.at(0) - 195 * n.at(0), P1.at(1) - 195 * n.at(1)), stroke: lw)
  hobby(p(..P1), p(475, 322), p(520, 307), p(570, 304), p(640, 310), stroke: lw)
  hobby(p(..P1), p(442, 372), p(448, 398), p(460, 413), stroke: lw)
  rtmark(p, P1, (P1.at(0) - n.at(0), P1.at(1) - n.at(1)), (P1.at(0) + t.at(0), P1.at(1) + t.at(1)), s: 12)
  pdot(p, P1)
  Q-t(p, (430, 352), $P_1$)
  Q-t(p, (370, 298), $N$)
  Q-t(p, (522, 215), $T$)
})

// 图 4·61（p.287）
#let fig-Q-4-61(width: 420 * Q-k) = px-canvas(420, 340, origin: (500, 1215), width: width, (p, u) => {
  import cetz.draw: *
  Q-axes(p, 533, 1157, 500, 860, 890, 1210, olab: (-12, 14))
  let P1 = (597, 1032)
  let P2 = (703, 953)
  hobby(..((720, 1128), (650, 1125), (610, 1095), (595, 1060), P1, (610, 998), (650, 966), P2, (765, 948)).map(q => p(..q)), stroke: lw)
  // 切线 P1T
  line(p(553, 1170), p(630, 912), stroke: lt)
  // 割线 P1P2（P1、P2 之间画虚线）
  let d = ((P2.at(0) - P1.at(0)) / 106, (P2.at(1) - P1.at(1)) / 106)
  line(p(P1.at(0) - 45 * d.at(0), P1.at(1) - 45 * d.at(1)), p(..P1), stroke: lt)
  line(p(..P1), p(..P2), stroke: dsh)
  line(p(..P2), p(P2.at(0) + 50 * d.at(0), P2.at(1) + 50 * d.at(1)), stroke: lt)
  // P1Q、QP2
  line(p(..P1), p(703, 1032), stroke: dsh)
  line(p(703, 1032), p(..P2), stroke: dsh)
  anglearc(p, P1, (703, 1032), P2, 26)
  pdot(p, P1); pdot(p, P2)
  Q-t(p, (652, 1020), $Δ x$)
  Q-t(p, (722, 994), $Δ y$)
  Q-t(p, (718, 1036), $Q$)
  Q-t(p, (650, 1055), $P_1 (x_1, y_1)$)
  Q-t(p, (805, 966), $P_2 (x_1 + Δ x, y_1 + Δ y)$)
  Q-t(p, (641, 905), $T$)
})

// 图 4·62（p.288）
#let fig-Q-4-62(width: 380 * Q-k) = px-canvas(380, 320, origin: (135, 1385), width: width, (p, u) => {
  import cetz.draw: *
  Q-axes(p, 215, 1256, 140, 475, 1090, 1385, olab: (-10, 16))
  let P1 = (233, 1208)
  let P2 = (325, 1140)
  hobby(..((345, 1375), (300, 1356), (260, 1335), (235, 1310), (222, 1282), (220, 1258), (223, 1235), P1, (255, 1186), (290, 1160), P2, (395, 1110)).map(q => p(..q)), stroke: lw)
  // 切线（过 P1）
  line(p(145, 1335), p(315, 1100), stroke: lt)
  // 割线 P1P2
  line(p(145, 1275), p(..P1), stroke: lt)
  line(p(..P1), p(..P2), stroke: dsh)
  line(p(..P2), p(388, 1094), stroke: lt)
  line(p(..P1), p(325, 1208), stroke: dsh)
  line(p(325, 1208), p(..P2), stroke: dsh)
  pdot(p, P1); circle(p(..P2), radius: 2.6, fill: white, stroke: lt)
  Q-t(p, (277, 1196), $Δ x$)
  Q-t(p, (342, 1180), $Δ y$)
  Q-t(p, (290, 1226), $P_1 (x_1, y_1)$)
  Q-t(p, (410, 1150), $P_2 (x_1 + Δ x, y_1 + Δ y)$)
})

// 图 4·63（p.292）：y² = 8x，P(2, −4)，切线 x + y + 2 = 0，法线 x − y − 6 = 0
#let fig-Q-4-63(width: 360 * Q-k) = {
  let (ox, oy, s) = (210, 537, 27)
  let m = Q-m(ox, oy, s)
  px-canvas(360, 390, origin: (130, 725), width: width, (p, u) => {
    import cetz.draw: *
    Q-axes(p, ox, oy, 130, 470, 355, 722, olab: (-12, 14))
    Q-ticks(p, ox, oy, s, range(-2, 10), range(-6, 7))
    Q-curve(p, m, t => (t * t / 8, t), -5.85, 6.1)
    line(p(..m(-1.6, -0.4)), p(..m(4.6, -6.6)), stroke: lt)
    line(p(..m(1.4, -4.6)), p(..m(7.2, 1.2)), stroke: lt)
    pdot(p, m(2, -4), r: 2.8)
    Q-t(p, (312, 655), $P(2, -4)$)
    Q-t(p, (178, 575), $T$)
    Q-t(p, (418, 512), $N$)
  })
}

// 图 4·64（p.293）：2y² = 9x，A(−6, 3)，切线 x − 4y + 18 = 0、3x + 4y + 6 = 0
#let fig-Q-4-64(width: 470 * Q-k) = {
  let (ox, oy, s) = (516, 662, 11)
  let m = Q-m(ox, oy, s)
  px-canvas(470, 390, origin: (400, 840), width: width, (p, u) => {
    import cetz.draw: *
    Q-axes(p, ox, oy, 400, 845, 480, 835, olab: (-11, 14))
    Q-ticks(p, ox, oy, s, range(-9, 29), range(-15, 15), s: 3)
    Q-curve(p, m, t => (2 * t * t / 9, t), -9.3, 10.9)
    line(p(..m(-9.5, 2.125)), p(..m(28, 11.5)), stroke: lt)
    line(p(..m(-7.8, 4.35)), p(..m(18, -15)), stroke: lt)
    pdot(p, m(-6, 3), r: 2.8); pdot(p, m(18, 9), r: 2.8); pdot(p, m(2, -3), r: 2.8)
    Q-t(p, (470, 608), $A(-6, 3)$)
    Q-t(p, (765, 585), $P(18, 9)$)
    Q-t(p, (590, 690), $P'(2, -3)$)
  })
}

// 图 4·65（p.294）：椭圆，P1、P2 及割线（原图右上角有一段与本图无关的弧形污迹，未画）
#let fig-Q-4-65(width: 470 * Q-k) = {
  let (cx, cy, a, b) = (498, 850, 126, 81)
  px-canvas(470, 310, origin: (270, 1000), width: width, (p, u) => {
    import cetz.draw: *
    Q-axes(p, cx, cy, 285, 715, 700, 995, olab: (-12, 15))
    Q-curve(p, (x, y) => (x, y), t => (cx + a * calc.cos(t), cy - b * calc.sin(t)), 0, 2 * calc.pi, n: 120)
    let P1 = (383, 818)
    let P2 = (460, 773)
    line(p(330, 849), p(520, 738), stroke: lt)
    line(p(..P1), p(460, 818), stroke: dsh)
    line(p(460, 818), p(..P2), stroke: dsh)
    circle(p(..P1), radius: 2.6, fill: white, stroke: lt)
    circle(p(..P2), radius: 2.6, fill: white, stroke: lt)
    Q-t(p, (425, 836), $Δ x$)
    Q-t(p, (476, 797), $Δ y$)
    Q-t(p, (330, 812), $P_1 (x_1, y_1)$)
    Q-t(p, (375, 756), $P_2 (x_1 + Δ x, y_1 + Δ y)$)
  })
}

// 图 4·66（p.298）：x² + 9y² = 40，P(−2, 2)，切线 x − 9y + 20 = 0
#let fig-Q-4-66(width: 400 * Q-k) = {
  let (ox, oy, s) = (318, 578, 28.5)
  let m = Q-m(ox, oy, s)
  px-canvas(400, 315, origin: (120, 700), width: width, (p, u) => {
    import cetz.draw: *
    Q-axes(p, ox, oy, 120, 520, 395, 700, olab: (-12, 15))
    Q-ticks(p, ox, oy, s, range(-6, 7), range(-3, 4))
    let a = calc.sqrt(40)
    let b = calc.sqrt(40 / 9)
    Q-curve(p, m, t => (a * calc.cos(t), b * calc.sin(t)), 0, 2 * calc.pi, n: 120)
    line(p(..m(-5.8, 14.2 / 9)), p(..m(5.8, 25.8 / 9)), stroke: lt)
    pdot(p, m(-2, 2))
    Q-t(p, (228, 496), $P(-2, 2)$)
    Q-t(p, (430, 486), $x - 9 y + 20 = 0$)
  })
}

// 图 4·67（p.298）：xy = 2，P(1, 2)，切线 2x + y − 4 = 0
#let fig-Q-4-67(width: 500 * Q-k) = {
  let (ox, oy, s) = (448, 1250, 33)
  let m = Q-m(ox, oy, s)
  px-canvas(500, 420, origin: (250, 1435), width: width, (p, u) => {
    import cetz.draw: *
    Q-axes(p, ox, oy, 255, 735, 1025, 1430, olab: (-14, 15))
    Q-ticks(p, ox, oy, s, range(-5, 9), range(-5, 7))
    Q-curve(p, m, t => (t, 2 / t), 0.36, 4.6)
    Q-curve(p, m, t => (t, 2 / t), -5, -0.4)
    line(p(..m(-0.5, 5)), p(..m(2.95, -1.9)), stroke: lt)
    pdot(p, m(1, 2), r: 2.8)
    Q-t(p, (530, 1178), $P(1, 2)$)
    content(p(578, 1308), angle: -63.4deg, tt($2 x + y - 4 = 0$))
  })
}

// 图 4·68（p.299）：5x² + y² = 5，A(−2, −1)，切线 2x − y + 3 = 0、2x + 3y + 7 = 0
#let fig-Q-4-68(width: 430 * Q-k) = {
  let (ox, oy, s) = (505, 755, 66)
  let m = Q-m(ox, oy, s)
  px-canvas(430, 420, origin: (300, 965), width: width, (p, u) => {
    import cetz.draw: *
    Q-axes(p, ox, oy, 310, 725, 560, 960, olab: (-14, 15))
    Q-ticks(p, ox, oy, s, (-2, 2), (-2, -1, 1, 2), s: 6)
    Q-curve(p, m, t => (calc.cos(t), calc.sqrt(5) * calc.sin(t)), 0, 2 * calc.pi, n: 120)
    line(p(..m(-2, -1)), p(..m(-0.45, 2.1)), stroke: lw)
    line(p(..m(-2, -1)), p(..m(0.05, -2.37)), stroke: lw)
    pdot(p, m(-2, -1)); pdot(p, m(-2 / 3, 5 / 3)); pdot(p, m(-2 / 7, -15 / 7))
    Q-t(p, (440, 632), $P_1$)
    Q-t(p, (478, 918), $P_2$)
    Q-t(p, (332, 838), $A(-2, -1)$)
  })
}
