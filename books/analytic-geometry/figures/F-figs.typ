// 解析几何 段 F：图 2·9–图 2·17（原书 p.95–103，§2·4 方程的讨论）。
// 读坐标时的页面渲染 200 dpi（页宽约 1031 像素）；k = 0.0152 cm/像素。
// 曲线按方程取点采样（折线逼近），坐标位置、轴上刻度与标注依原图；原图手绘的小偏差不照描。
#import "/common/geo.typ": *
#let k = 0.0152cm

// 带箭头的轴线
#let F-ax(p, a, b) = {
  import cetz.draw: *
  line(p(..a), p(..b), stroke: lw, mark: arw)
}
// 小数字 / 文字标注（页面坐标，居中）
#let F-t(p, pt, body) = {
  import cetz.draw: *
  content(p(..pt), tsm(body))
}
#let F-d(p, c) = pdot(p, c, r: 3.2)
// 刻度短线
#let F-tk(p, a, b) = {
  import cetz.draw: *
  line(p(..a), p(..b), stroke: lt)
}
// 较粗的虚线（原图的渐近线、范围线）
#let F-ds(p, a, b) = {
  import cetz.draw: *
  line(p(..a), p(..b), stroke: (paint: black, thickness: 0.8pt, dash: (5pt, 3pt)))
}
// 参数曲线：g(t) 返回页面坐标 (x, y)，t 从 t0 到 t1 取 n 段
#let F-curve(p, g, t0, t1, n: 160, ..style) = {
  import cetz.draw: *
  let pts = range(n + 1).map(i => p(..g(t0 + (t1 - t0) * i / n)))
  line(..pts, stroke: lw, ..style)
}

// ───────── 图 2·9（p.95）：4x²+9y²+16x−18y−11=0，椭圆，中心 (−2, 1)，半轴 3、2 ─────────
#let fig-F-2-9(width: 560 * k) = px-canvas(560, 450, origin: (230, 675), width: width, (p, u) => {
  import cetz.draw: *
  let (ox, oy, s) = (575, 974.5, 55.2)
  let X = x => ox + s * x
  let Y = y => oy - s * y
  // 范围线
  F-ds(p, (X(-5), 787), (X(-5), 1056))
  F-ds(p, (X(1), 774), (X(1), 1056))
  F-ds(p, (264, Y(3)), (661, Y(3)))
  F-ds(p, (264, Y(-1)), (661, Y(-1)))
  // 椭圆
  F-curve(p, t => (X(-2 + 3 * calc.cos(t)), Y(1 + 2 * calc.sin(t))), 0, 2 * calc.pi, n: 200)
  // 坐标轴
  F-ax(p, (240, oy), (752, oy))
  F-ax(p, (ox, 1113), (ox, 696))
  F-t(p, (764, 969), $x$)
  F-t(p, (572, 683), $y$)
  for (x, l) in ((-5, $-5$), (-4, $-4$), (-3, $-3$), (-2, $-2$), (-1, $-1$)) {
    F-tk(p, (X(x), oy), (X(x), oy - 4))
    F-t(p, (X(x) - 2, 991), l)
  }
  F-t(p, (570, 986), $0$)
  F-tk(p, (X(1), oy), (X(1), oy - 4))
  F-t(p, (639, 986), $1$)
  for (y, l) in ((1, $1$), (2, $2$), (3, $3$)) {
    F-tk(p, (ox, Y(y)), (ox + 4, Y(y)))
    F-t(p, (565, Y(y)), l)
  }
  F-t(p, (603, 1020), $-1$)
})

// ───────── 图 2·10（p.96）：y = 1 ± √(x²+4)，双曲线，垂直方向的两支 ─────────
#let fig-F-2-10(width: 460 * k) = px-canvas(460, 440, origin: (270, 985), width: width, (p, u) => {
  import cetz.draw: *
  let (ox, oy, s) = (485, 1227, 24)
  let X = x => ox + s * x
  let Y = y => oy - s * y
  let f1 = x => 1 + calc.sqrt(x * x + 4)
  let f2 = x => 1 - calc.sqrt(x * x + 4)
  F-ds(p, (322, Y(3)), (654, Y(3)))
  F-ds(p, (322, Y(-1)), (654, Y(-1)))
  F-curve(p, x => (X(x), Y(f1(x))), -6.4, 6.4, n: 120)
  F-curve(p, x => (X(x), Y(f2(x))), -6.3, 6.3, n: 120)
  for x in (0, 2, 3, 6, -2, -3, -6) {
    F-d(p, (X(x), Y(f1(x))))
    F-d(p, (X(x), Y(f2(x))))
  }
  F-ax(p, (309, oy), (703, oy))
  F-ax(p, (ox, 1414), (ox, 1017))
  F-t(p, (713, 1229), $x$)
  F-t(p, (492, 993), $y$)
  F-t(p, (497, 1216), $O$)
  for x in (-6, -5, -4, -3, -2, -1, 1, 2, 3, 4, 5, 6) {
    F-tk(p, (X(x), oy), (X(x), oy - 3))
    F-t(p, (X(x) + if x < 0 { -1 } else { 0 }, 1240), $#x$)
  }
  for y in (7, 6, 5, 4, 3, 2, 1) {
    F-tk(p, (ox, Y(y)), (ox + 3, Y(y)))
    F-t(p, (477, Y(y)), $#y$)
  }
  for y in (-1, -2, -3, -4, -5, -6, -7) {
    F-tk(p, (ox, Y(y)), (ox + 3, Y(y)))
    F-t(p, (474, Y(y) + if y == -1 { 14 } else if y == -2 { 4 } else { 0 }), $#y$)
  }
})

// ───────── 图 2·11（p.97）：y = x³（实线，y 轴上 5、10 的刻度；虚线为 x、y 同一单位的曲线）─────────
#let fig-F-2-11(width: 380 * k) = px-canvas(380, 570, origin: (565, 815), width: width, (p, u) => {
  import cetz.draw: *
  let (ox, oy, sx) = (700.5, 1126, 27.6)
  let sy = 5.68
  let X = x => ox + sx * x
  // 虚线曲线（同一单位）
  F-curve(p, x => (X(x), oy - sx * calc.pow(x, 3)), -2, 2, n: 80,
    stroke: (paint: black, thickness: 0.7pt, dash: (5pt, 3pt)))
  // 实线曲线
  F-curve(p, x => (X(x), oy - sy * calc.pow(x, 3)), -3.4, 3.4, n: 120)
  for x in (-3, -2, -1, 1, 2, 3) { F-d(p, (X(x), oy - sy * calc.pow(x, 3))) }
  F-d(p, (ox, oy))
  for x in (-2, -1, 1, 2) { F-d(p, (X(x), oy - sx * calc.pow(x, 3))) }
  F-ax(p, (569, oy), (903, oy))
  F-ax(p, (ox, 1375), (ox, 833))
  F-t(p, (908, 1126), $x$)
  F-t(p, (696, 826), $y$)
  F-t(p, (690, 1114), $O$)
  for x in (-4, -3, -2, -1, 1, 2, 3, 4) { F-tk(p, (X(x), oy), (X(x), oy - 4)) }
  for (x, l) in ((1, $1$), (2, $2$), (3, $3$), (4, $4$)) { F-t(p, (X(x), 1139), l) }
  for j in range(-8, 9) {
    if j != 0 { F-tk(p, (ox - 4, oy - sx * j), (ox, oy - sx * j)) }
  }
  F-tk(p, (ox, oy - sy * 10), (ox + 4, oy - sy * 10))
  F-tk(p, (ox, oy - sy * 5), (ox + 4, oy - sy * 5))
  F-t(p, (718, 1070.5), $10$)
  F-t(p, (713.5, 1098), $5$)
  F-t(p, (717, 1155), $-5$)
  F-t(p, (734.5, 1181.5), $-10$)
})

// ───────── 图 2·12（p.98）：y² = x³，半立方抛物线（x 轴单位长 27.9，y 轴单位长 11.1 像素）─────────
#let fig-F-2-12(width: 380 * k) = px-canvas(380, 480, origin: (100, 860), width: width, (p, u) => {
  import cetz.draw: *
  let (ox, oy, sx, sy) = (182.6, 1139.5, 27.9, 11.1)
  let X = x => ox + sx * x
  F-curve(p, x => (X(x), oy - sy * calc.pow(x, 1.5)), 0, 6.5, n: 120)
  F-curve(p, x => (X(x), oy + sy * calc.pow(x, 1.5)), 0, 6.4, n: 120)
  for x in (1, 4, 6) {
    F-d(p, (X(x), oy - sy * calc.pow(x, 1.5)))
    F-d(p, (X(x), oy + sy * calc.pow(x, 1.5)))
  }
  F-d(p, (ox, oy))
  F-ax(p, (112, oy), (432, oy))
  F-ax(p, (ox, 1334), (ox, 884))
  F-t(p, (449, 1140), $x$)
  F-t(p, (186, 871), $y$)
  F-t(p, (170, 1127), $O$)
  for x in (1, 2, 3, 4, 5, 6, 7) { F-tk(p, (X(x), oy), (X(x), oy - 4)) }
  for j in range(-14, 18) {
    if j != 0 { F-tk(p, (ox, oy - sy * j), (ox + 3, oy - sy * j)) }
  }
  F-t(p, (197, 1124), $2$)
  F-t(p, (170, 1154), $-2$)
})

// ───────── 图 2·13（p.99）：x²/9 + y²/4 = 1，椭圆 ─────────
#let fig-F-2-13(width: 520 * k) = px-canvas(520, 380, origin: (270, 1015), width: width, (p, u) => {
  import cetz.draw: *
  let (ox, oy, s) = (486.7, 1243, 55.1)
  let X = x => ox + s * x
  let Y = y => oy - s * y
  F-curve(p, t => (X(3 * calc.cos(t)), Y(2 * calc.sin(t))), 0, 2 * calc.pi, n: 200)
  for x in (-3, -2, -1, 0, 1, 2, 3) {
    let y = 2 * calc.sqrt(1 - x * x / 9)
    F-d(p, (X(x), Y(y)))
    if y > 0.001 { F-d(p, (X(x), Y(-y))) }
  }
  F-ax(p, (280, oy), (770, oy))
  F-ax(p, (ox, 1387), (ox, 1030))
  F-t(p, (783, 1239), $x$)
  F-t(p, (483, 1021), $y$)
  for x in (-3, -2, -1, 1, 2, 3) { F-tk(p, (X(x), oy), (X(x), oy - 4)) }
  for y in (-2, -1, 1, 2) { F-tk(p, (ox, Y(y)), (ox + 4, Y(y))) }
  for (x, l) in ((-3, $-3$), (-2, $-2$), (-1, $-1$), (1, $1$), (2, $2$), (3, $3$)) {
    F-t(p, (X(x) - if x < 0 { 3 } else { 0 }, 1256), l)
  }
  F-t(p, (478, 1256), $0$)
  F-t(p, (498, 1117), $2$)
  F-t(p, (500, 1187), $1$)
  F-t(p, (517, 1297), $-1$)
  F-t(p, (507, 1367), $-2$)
})

// ───────── 图 2·14（p.100）：y = |2x − 3|，折线 ─────────
#let fig-F-2-14(width: 360 * k) = px-canvas(360, 450, origin: (110, 385), width: width, (p, u) => {
  import cetz.draw: *
  let (ox, oy, s) = (222.5, 697, 27.7)
  let X = x => ox + s * x
  let Y = y => oy - s * y
  line(p(X(-2.4), Y(7.8)), p(X(1.5), Y(0)), p(X(5.4), Y(7.8)), stroke: lw)
  for (x, y) in ((1.5, 0), (-2, 7), (-1, 5), (0, 3), (1, 1), (2, 1), (3, 3), (4, 5)) { F-d(p, (X(x), Y(y))) }
  F-ax(p, (117.5, oy), (460, oy))
  F-ax(p, (ox, 812), (ox, 398))
  F-t(p, (467, 706), $x$)
  F-t(p, (230, 402), $y$)
  F-t(p, (212, 691), $O$)
  for x in (-3, -2, -1, 1, 2, 3, 4) { F-tk(p, (X(x), oy), (X(x), oy - 4)) }
  for (x, l) in ((-3, $-3$), (-2, $-2$), (-1, $-1$), (1, $1$), (2, $2$), (3, $3$), (4, $4$)) {
    F-t(p, (X(x) - if x < 0 { 2 } else { 0 }, 712), l)
  }
  for y in (-3, -2, -1, 1, 2, 3, 4, 5, 6, 7) {
    F-tk(p, (ox, Y(y)), (ox + 4, Y(y)))
    F-t(p, (212, Y(y) + if y < 0 { 2 } else { 0 }), $#y$)
  }
  content(p(180, 568), tsm($y = 3 - 2x$), angle: -64deg)
  content(p(335, 604), tsm($y = 2x - 3$), angle: 62deg)
})

// ───────── 图 2·15（p.101）：y = x/(x²−9)，渐近线 x = ±3 与 y = 0 ─────────
#let fig-F-2-15(width: 520 * k) = px-canvas(520, 410, origin: (245, 590), width: width, (p, u) => {
  import cetz.draw: *
  let (ox, oy, s) = (485, 780.6, 23.4)
  let X = x => ox + s * x
  let Y = y => oy - s * y
  let f = x => x / (x * x - 9)
  F-ds(p, (X(-3), 642), (X(-3), 961))
  F-ds(p, (X(3), 642), (X(3), 961))
  F-curve(p, x => (X(x), Y(f(x))), 3.086, 8.8, n: 160)
  F-curve(p, x => (X(x), Y(f(x))), -9, -3.065, n: 160)
  F-curve(p, x => (X(x), Y(f(x))), -2.914, 2.92, n: 200)
  for x in (3.1, 4, 6, 8, -3.1, -4, -6, -8, -2.9, -2, -1, 0, 1, 2, 2.9) {
    F-d(p, (X(x), Y(f(x))))
  }
  F-ax(p, (258, oy), (748, oy))
  F-ax(p, (ox, 986), (ox, 596))
  F-t(p, (757, 777), $x$)
  F-t(p, (481, 600), $y$)
  F-t(p, (474, 792), $O$)
  F-t(p, (421, 632), $x = -3$)
  F-t(p, (554, 632), $x = 3$)
  F-t(p, (308, 770), $y = 0$)
})

// ───────── 图 2·16（p.103）：x − y = 0 与 x + y = 0 ─────────
#let fig-F-2-16(width: 340 * k) = px-canvas(340, 330, origin: (130, 755), width: width, (p, u) => {
  import cetz.draw: *
  let (ox, oy) = (251.5, 927.5)
  line(p(ox - 72, oy + 70), p(ox + 78, oy - 76), stroke: lw)
  line(p(ox - 73, oy - 76), p(ox + 73, oy + 75), stroke: lw)
  F-ax(p, (140, oy), (452, oy))
  F-ax(p, (ox, 1046), (ox, 778))
  F-t(p, (462, 934), $x$)
  F-t(p, (255, 766), $y$)
  F-t(p, (229, 936), $O$)
  for j in (-4, -3, -2, -1, 1, 2, 3, 4) {
    F-tk(p, (ox + 27.5 * j, oy), (ox + 27.5 * j, oy - 4))
    F-tk(p, (ox, oy - 27.5 * j), (ox + 4, oy - 27.5 * j))
  }
  content(p(207.5, 865), tsm($x + y = 0$), angle: -45deg)
  content(p(295, 866), tsm($x - y = 0$), angle: 48deg)
})

// ───────── 图 2·17（p.103）：x − y = 0 与 x² + y² − 25 = 0 ─────────
#let fig-F-2-17(width: 400 * k) = px-canvas(400, 365, origin: (495, 710), width: width, (p, u) => {
  import cetz.draw: *
  let (ox, oy, s) = (659, 905, 22.5)
  circ(p, (ox, oy), 5 * s)
  line(p(ox - 104, oy + 105), p(ox + 110, oy - 107), stroke: lw)
  F-ax(p, (502.5, oy), (880, oy))
  F-ax(p, (ox, 1070), (ox, 732))
  F-t(p, (892, 907), $x$)
  F-t(p, (659, 715), $y$)
  F-t(p, (668, 918), $O$)
  for j in (-4, -3, -2, -1, 1, 2, 3, 4) {
    F-tk(p, (ox + s * j, oy), (ox + s * j, oy - 4))
    F-tk(p, (ox, oy - s * j), (ox + 4, oy - s * j))
  }
})
