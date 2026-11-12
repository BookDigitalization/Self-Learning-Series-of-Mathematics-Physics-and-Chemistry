// 解析几何 段 E：图 2·1–图 2·8（原书 p.74、76、77、80、81、83、84）。
// 读坐标时的页面渲染 200 dpi（页宽约 1031 像素）；k = 0.0152 cm/像素。
// 曲线按方程算点后用折线画出；各图的像素单位长度见各图注释（原图手绘，单位长度略有出入，取平均值）。
#import "/common/geo.typ": *
#let k = 0.0152cm

#let E-ax(p, a, b) = {
  import cetz.draw: *
  line(p(..a), p(..b), stroke: lw, mark: arw)
}
#let E-t(p, pt, body) = lbl(p, pt, body, dir: "c", d: 0)
#let E-d(p, c, r: 2.4) = pdot(p, c, r: r)
// 轴上的小刻度：在 (x, y) 处画一短线，horizontal 为 true 时刻度竖直（在 x 轴上）
#let E-tick(p, x, y, horizontal: true, s: 4) = {
  import cetz.draw: *
  if horizontal { line(p(x, y - s), p(x, y + s), stroke: lt) } else { line(p(x - s, y), p(x + s, y), stroke: lt) }
}
// 按函数取点画曲线：pts 为页面像素坐标列表
#let E-curve(p, pts) = {
  import cetz.draw: *
  line(..pts.map(c => p(..c)), stroke: lw)
}

// ───────── 图 2·1（p.74）：y = 2x - 3，原点 (248,1152)，单位 26.5 ─────────
#let fig-E-2-1(width: 400 * k) = px-canvas(400, 470, origin: (80, 925), width: width, (p, u) => {
  import cetz.draw: *
  let (ox, oy, s) = (248, 1152, 26.5)
  let P = (x, y) => (ox + s * x, oy - s * y)
  E-ax(p, (118, oy), (410, oy))
  E-ax(p, (ox, 1385), (ox, 940))
  for i in range(-4, 6) {
    if i != 0 { E-tick(p, ox + s * i, oy) }
  }
  for i in range(-9, 6) {
    if i != 0 { E-tick(p, ox, oy - s * i, horizontal: false) }
  }
  line(p(..P(-2.75, -8.5)), p(..P(4.45, 5.9)), stroke: lw)
  for x in range(-2, 5) { E-d(p, P(x, 2 * x - 3)) }
  E-d(p, P(3.5, 4))
  E-d(p, P(-2, -3))
  E-t(p, (425, oy), $x$)
  E-t(p, (ox + 7, 935), $y$)
  E-t(p, (232, 1165), $O$)
  E-t(p, (254, 1163), $1$)
  E-t(p, (237, 1125), $1$)
  E-t(p, (396, 1048), $P_1 (3.5, 4)$)
  E-t(p, (146, 1262), $Q (-2, -3)$)
})

// ───────── 图 2·2（p.76）：x² + y² = 25，原点 (493,1160)，单位 28 ─────────
#let fig-E-2-2(width: 430 * k) = px-canvas(430, 440, origin: (300, 925), width: width, (p, u) => {
  import cetz.draw: *
  let (ox, oy, s) = (493, 1160, 28)
  let P = (x, y) => (ox + s * x, oy - s * y)
  E-ax(p, (309, oy), (715, oy))
  E-ax(p, (ox, 1350), (ox, 928))
  for i in range(-5, 6) {
    if i != 0 { E-tick(p, ox + s * i, oy) }
  }
  for i in range(-5, 6) {
    if i != 0 { E-tick(p, ox, oy - s * i, horizontal: false) }
  }
  circle(p(ox, oy), radius: 5 * s, stroke: lw)
  for c in ((0, 5), (0, -5), (5, 0), (-5, 0), (3, 4), (-3, 4), (3, -4), (-3, -4), (4, 3), (-4, 3), (4, -3), (-4, -3)) {
    E-d(p, P(..c))
  }
  E-t(p, (715, 1170), $x$)
  E-t(p, (500, 935), $y$)
  E-t(p, (539, 1009), $B (0, 5)$)
  E-t(p, (408, 1176), $A' (-5, 0)$)
  E-t(p, (479, 1175), $O$)
  E-t(p, (524, 1175), $1$)
  E-t(p, (597, 1176), $A (5, 0)$)
  E-t(p, (548, 1313), $B' (0, -5)$)
  E-t(p, (594, 1036), $K$)
  E-t(p, (619, 1065), $E$)
})

// ───────── 图 2·3（p.77）：x = y² - 2y - 8，原点 (497,830)，单位 19.5 ─────────
#let fig-E-2-3(width: 510 * k) = px-canvas(510, 360, origin: (270, 610), width: width, (p, u) => {
  import cetz.draw: *
  let (ox, oy, s) = (497, 830, 19.5)
  let P = (x, y) => (ox + s * x, oy - s * y)
  E-ax(p, (288, oy), (729, oy))
  E-ax(p, (ox, 968), (ox, 634))
  for i in range(-9, 10) {
    if i != 0 { E-tick(p, ox + s * i, oy, s: 3) }
  }
  for i in range(-3, 5) {
    if i != 0 { E-tick(p, ox, oy - s * i, horizontal: false, s: 3) }
  }
  // 虚线 x = -9
  line(p(322, 681), p(322, 950), stroke: dsh)
  // 抛物线 x = y² - 2y - 8，y 从 -3.1 到 5.1
  let pts = ()
  for i in range(0, 61) {
    let y = -3.1 + 8.2 * i / 60
    pts.push(P(y * y - 2 * y - 8, y))
  }
  E-curve(p, pts)
  for (x, y) in ((-8, 0), (-8, 2), (-5, 3), (0, 4), (7, 5), (-5, -1), (0, -2), (7, -3)) {
    E-d(p, P(x, y))
  }
  E-t(p, (741, 828), $x$)
  E-t(p, (496, 625), $y$)
  E-t(p, (329, 675), $X = -9$)
  E-t(p, (307, 842), $-9$)
  E-t(p, (347, 842), $-8$)
  E-t(p, (471, 841), $-1$)
  E-t(p, (519, 841), $1$)
  E-t(p, (486, 803), $1$)
  E-t(p, (486, 819), $0$)
  E-t(p, (486, 739), $4$)
  E-t(p, (486, 875), $-2$)
  E-t(p, (314, 808), $D$)
  E-t(p, (630, 719), $B$)
  E-t(p, (630, 902), $E$)
})

// ───────── 图 2·4（p.80）：原点 (252,1264)，单位 28 ─────────
#let fig-E-2-4(width: 360 * k) = px-canvas(360, 320, origin: (125, 1070), width: width, (p, u) => {
  import cetz.draw: *
  let (ox, oy, s) = (252, 1264, 27.7)
  let P = (x, y) => (ox + s * x, oy - s * y)
  E-ax(p, (134, oy), (485, oy))
  E-ax(p, (ox, 1384), (ox, 1090))
  for i in range(-4, 7) {
    if i != 0 { E-tick(p, ox + s * i, oy, s: 3) }
  }
  for i in range(-4, 6) {
    if i != 0 { E-tick(p, ox, oy - s * i, horizontal: false, s: 3) }
  }
  let A = P(-3, 1)
  let B = P(5, -3)
  let Pp = (337, 1180)
  let P1 = (272, 1312)
  line(p(..A), p(..B), stroke: lw)
  line(p(237, 1210), p(..Pp), stroke: (paint: black, thickness: 0.6pt, dash: "dash-dotted"))
  line(p(..Pp), p(..B), stroke: (paint: black, thickness: 0.6pt, dash: "dash-dotted"))
  line(p(254, 1357), p(349, 1153), stroke: lw)
  E-d(p, A)
  E-d(p, B)
  E-d(p, Pp)
  E-d(p, P1)
  E-t(p, (488, 1268), $x$)
  E-t(p, (256, 1076), $y$)
  E-t(p, (239, 1251), $O$)
  E-t(p, (189, 1217), $A (-3, 1)$)
  E-t(p, (376, 1181), $P (x, y)$)
  E-t(p, (318, 1341), $P_1 (x_1, y_1)$)
  E-t(p, (416, 1362), $B (5, -3)$)
})

// ───────── 图 2·5（p.81）：圆心 C(-1,3)，半径 5，原点 (305,1219)，单位 22.2 ─────────
#let fig-E-2-5(width: 400 * k) = px-canvas(400, 360, origin: (115, 970), width: width, (p, u) => {
  import cetz.draw: *
  let (ox, oy, s) = (305, 1219, 22.2)
  let P = (x, y) => (ox + s * x, oy - s * y)
  E-ax(p, (127, oy), (504, oy))
  E-ax(p, (ox, 1326), (ox, 992))
  for i in range(-8, 9) {
    if i != 0 { E-tick(p, ox + s * i, oy, s: 3) }
  }
  for i in range(-4, 11) {
    if i != 0 { E-tick(p, ox, oy - s * i, horizontal: false, s: 3) }
  }
  let C = P(-1, 3)
  circle(p(..C), radius: 5 * s, stroke: lw)
  let Pp = (385, 1107)
  line(p(..C), p(..Pp), stroke: lw)
  E-d(p, C, r: 3)
  E-d(p, Pp)
  E-d(p, (437, 1199))
  E-d(p, (214, 1239))
  E-t(p, (516, 1223), $x$)
  E-t(p, (310, 977), $y$)
  E-t(p, (292, 1229), $O$)
  E-t(p, (324, 1228), $1$)
  E-t(p, (296, 1196), $1$)
  E-t(p, (260, 1168), $C (-1, 3)$)
  E-t(p, (429, 1111), $P (x, y)$)
  E-t(p, (455, 1184), $R (6, 1)$)
  E-t(p, (176, 1254), $P_1 (x_1, y_1)$)
})

// ───────── 图 2·6（p.83）：x = ±2，原点 (700,1006)，单位 28.5 ─────────
#let fig-E-2-6(width: 330 * k) = px-canvas(330, 380, origin: (565, 785), width: width, (p, u) => {
  import cetz.draw: *
  let (ox, oy, s) = (700, 1006, 28.5)
  E-ax(p, (569, oy), (878, oy))
  E-ax(p, (ox, 1158), (ox, 814))
  E-tick(p, 730, oy, s: 3)
  E-tick(p, ox, 979, horizontal: false, s: 3)
  for i in range(1, 6) { E-tick(p, ox, oy + 28.5 * i, horizontal: false, s: 3) }
  line(p(644, 854), p(644, 1118), stroke: lw)
  line(p(756, 854), p(756, 1118), stroke: lw)
  line(p(700, 895), p(756, 895), stroke: lw)
  E-d(p, (700, 895))
  E-d(p, (756, 895))
  E-t(p, (891, 1005), $x$)
  E-t(p, (698, 791), $y$)
  E-t(p, (650, 842), $x = -2$)
  E-t(p, (753, 841), $x = 2$)
  E-t(p, (601, 936), $x < -2$)
  E-t(p, (700, 936), $-2 < x < 2$)
  E-t(p, (786, 936), $x > 2$)
  E-t(p, (686, 895), $M$)
  E-t(p, (766, 894), $P$)
  E-t(p, (691, 979), $1$)
  E-t(p, (691, 1019), $O$)
  E-t(p, (730, 1017), $1$)
})

// ───────── 图 2·7（p.84）：直线坐标系，O 在 249，单位 56 ─────────
#let fig-E-2-7(width: 330 * k) = px-canvas(330, 70, origin: (125, 385), width: width, (p, u) => {
  import cetz.draw: *
  let y = 427
  E-ax(p, (137, y), (428, y))
  line(p(192, 400), p(192, y), stroke: (paint: black, thickness: 0.6pt, dash: "dashed"))
  line(p(304, 400), p(304, y), stroke: (paint: black, thickness: 0.6pt, dash: "dashed"))
  E-d(p, (192, y))
  E-d(p, (249, y))
  E-d(p, (304, y))
  E-t(p, (430, 427), $x$)
  E-t(p, (156, 392), $x < -2$)
  E-t(p, (256, 408), $-2 < x < 2$)
  E-t(p, (329, 392), $x > 2$)
  E-t(p, (316, 417), $A$)
  E-t(p, (194, 441), $x = -2$)
  E-t(p, (248, 442), $O$)
  E-t(p, (305, 441), $x = 2$)
})

// ───────── 图 2·8（p.84）：原点 (482,899)，单位 56；三个区域用斜线、横线表示 ─────────
// 在矩形 (x0,y0)-(x1,y1)（页面坐标，y 向下）内画间距 gap 的斜线；dir = 1 为“\”，-1 为“/”
#let E-hatch(p, x0, y0, x1, y1, gap, dir) = {
  import cetz.draw: *
  let h = y1 - y0
  let w = x1 - x0
  // 线族：dir=1 时 y - y0 = (x - x0) + c；c 取遍 (-w, h)
  let c = -w + gap / 2
  while c < h {
    // 线与矩形的交点
    let xa = x0 + calc.max(0, -c)
    let xb = x0 + calc.min(w, h - c)
    if xb > xa {
      let ya = y0 + (xa - x0) + c
      let yb = y0 + (xb - x0) + c
      if dir == 1 {
        line(p(xa, ya), p(xb, yb), stroke: 0.35pt)
      } else {
        line(p(x1 - (xa - x0), ya), p(x1 - (xb - x0), yb), stroke: 0.35pt)
      }
    }
    c += gap
  }
}
#let fig-E-2-8(width: 380 * k) = px-canvas(380, 320, origin: (325, 715), width: width, (p, u) => {
  import cetz.draw: *
  let oy = 899
  E-hatch(p, 354, 800, 426, 959, 5, 1)
  E-hatch(p, 538, 800, 605, 959, 5, -1)
  let y = 800
  while y <= 959 {
    line(p(426, y), p(538, y), stroke: 0.35pt)
    y += 4
  }
  line(p(426, 800), p(426, 959), stroke: lw)
  line(p(538, 800), p(538, 959), stroke: lw)
  E-ax(p, (347, oy), (649, oy))
  E-ax(p, (482, 1000), (482, 750))
  E-d(p, (426, oy))
  E-d(p, (538, oy))
  // 标注底衬白色，免得被斜线压住
  let W = (p, pt, body) => {
    content(p(..pt), box(fill: white, inset: (x: 1pt, y: 0pt), tt(body)))
  }
  W(p, (650, 897), $x$)
  W(p, (480, 718), $y$)
  W(p, (380, 850), $x < -2$)
  W(p, (483, 850), $-2 < x < 2$)
  W(p, (564, 850), $x > 2$)
  W(p, (408, 911), $-2$)
  W(p, (446, 911), $-1$)
  W(p, (467, 911), $O$)
  W(p, (508, 911), $1$)
  W(p, (549, 911), $2$)
  W(p, (437, 975), $x = -2$)
  W(p, (538, 975), $x = 2$)
})
