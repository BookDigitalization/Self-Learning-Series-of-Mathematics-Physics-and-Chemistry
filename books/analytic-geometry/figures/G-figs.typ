// 解析几何 段 G：图 2·18–图 2·22（原书 p.105、106、107、109、111）及复习题二第 11 题插图（p.114）。
// 读坐标时的页面渲染 200 dpi（页宽约 1031 像素）；k = 0.0152 cm/像素。
// px-canvas 的 origin 是画布左上角的页面坐标。
#import "/common/geo.typ": *
#let G-k = 0.0152cm

#let G-ax(p, a, b) = {
  import cetz.draw: *
  line(p(..a), p(..b), stroke: lw, mark: arw)
}
#let G-t(p, pt, body) = lbl(p, pt, body, dir: "c", d: 0)
#let G-d(p, c, r: 2.4) = pdot(p, c, r: r)

// ───────── 图 2·18（p.105）─────────
// 手绘示意图：两条相交曲线 C1、C2，交点 P1。
#let fig-G-2-18(width: 290 * G-k) = px-canvas(290, 285, origin: (640, 215), width: width, (p, u) => {
  import cetz.draw: *
  G-ax(p, (645, 409), (902, 409))
  G-ax(p, (702, 487), (702, 238))
  G-t(p, (911, 405), $x$)
  G-t(p, (700, 226), $y$)
  G-t(p, (693, 422), $O$)
  line(p(675, 388), p(718, 354), p(759.5, 324), p(807.5, 277.5), stroke: lw)
  line(p(737.5, 275), p(759.5, 324), p(783, 362), p(804, 401.5), stroke: lw)
  G-d(p, (759.5, 324), r: 2.6)
  G-t(p, (817, 271), $C_1$)
  G-t(p, (740, 265), $C_2$)
  G-t(p, (815, 326), $P_1 (x_1, y_1)$)
})

// ───────── 图 2·19（p.106）─────────
// 椭圆 x²+4y²=52 与双曲线 x²-y²=7；单位长约 27.3 像素，O 在 (468, 939)（原图为手绘，坐标轴略斜，这里取水平）。
#let fig-G-2-19(width: 520 * G-k) = px-canvas(520, 330, origin: (240, 780), width: width, (p, u) => {
  import cetz.draw: *
  let un = 27.3
  let ox = 468
  let oy = 939
  let X = x => ox + un * x
  let Y = y => oy - un * y
  G-ax(p, (245, oy), (762, oy))
  G-ax(p, (ox, 1093), (ox, 758))
  G-t(p, (770, oy + 9), $x$)
  G-t(p, (ox + 2, 742), $y$)
  for n in range(-7, 8) {
    if n != 0 { line(p(X(n), oy), p(X(n), oy - 4), stroke: lt) }
  }
  // 椭圆
  let N = 120
  let ell = range(N + 1).map(i => {
    let t = 360deg * i / N
    p(X(7.2 * calc.cos(t)), Y(3.6 * calc.sin(t)))
  })
  line(..ell, stroke: lw)
  // 双曲线两支（x 从 √7 到 4.9）
  let xv = calc.sqrt(7)
  let M = 60
  for sg in (1, -1) {
    let up = range(M + 1).map(i => {
      let x = xv + (4.9 - xv) * i / M
      let y = calc.sqrt(calc.max(x * x - 7, 0))
      p(X(sg * x), Y(y))
    })
    let dn = range(M + 1).map(i => {
      let x = xv + (4.9 - xv) * i / M
      let y = calc.sqrt(calc.max(x * x - 7, 0))
      p(X(sg * x), Y(-y))
    })
    line(..up, stroke: lw)
    line(..dn, stroke: lw)
  }
  // 点
  for (x, y) in ((0, 3.6), (0, -3.6), (7.2, 0), (-7.2, 0), (2, 3.5), (2, -3.5), (4, 3), (4, -3), (6, 2), (6, -2), (-4, 3), (-4, -3), (xv, 0), (-xv, 0)) {
    G-d(p, (X(x), Y(y)), r: 2.6)
  }
  G-t(p, (ox - 15, oy - 11), $O$)
  G-t(p, (ox + 10, Y(1)), $1$)
  G-t(p, (ox + 10, Y(-1)), $-1$)
  G-t(p, (X(-1) - 3, oy + 11), $-1$)
  G-t(p, (X(1) + 3, oy + 11), $1$)
  G-t(p, (415, 860), $C(-4, 3)$)
  // 原书作 A(4, 8)（扫描“3”处印成像“8”），按正文 A(4, 3) 订正
  G-t(p, (622, 855), $A(4, 3)$)
  G-t(p, (397, 1050), $D(-4, -3)$)
  G-t(p, (629, 1034), $B(4, -3)$)
})

// ───────── 图 2·20（p.107）─────────
// 圆 x²+y²=5 与三条平行直线 2x-y-3=0，2x-y-5=0，2x-y-7=0；单位长 27 像素，O 在 (700, 1039)。
#let fig-G-2-20(width: 300 * G-k) = px-canvas(300, 430, origin: (600, 850), width: width, (p, u) => {
  import cetz.draw: *
  let un = 27
  let ox = 700
  let oy = 1039
  let X = x => ox + un * x
  let Y = y => oy - un * y
  G-ax(p, (618, oy), (878, oy))
  G-ax(p, (ox, 1277), (ox, 868))
  G-t(p, (891, oy), $x$)
  G-t(p, (ox - 1, 857), $y$)
  circle(p(ox, oy), radius: calc.sqrt(5) * un * u, stroke: lw)
  // 三条直线：(x 起, x 止, c)，y = 2x - c
  let ln = ((-0.2, 3.0, 3), (0.0, 3.9, 5), (0.0, 5.1, 7))
  for (xa, xb, c) in ln {
    line(p(X(xa), Y(2 * xa - c)), p(X(xb), Y(2 * xb - c)), stroke: lw)
  }
  // 直线上方的方程（沿直线方向）
  let ang = calc.atan(2)
  content(p(780, 937), angle: ang, text(size: 7.5pt)[$2x - y - 3 = 0$])
  content(p(800, 952), angle: ang, text(size: 7.5pt)[$2x - y - 5 = 0$])
  content(p(822, 961), angle: ang, text(size: 7.5pt)[$2x - y - 7 = 0$])
  // 点
  let A = (X(2), Y(1))
  let B = (X(0.4), Y(-2.2))
  let T = (X(2), Y(-1))
  for q in (A, B, T) { G-d(p, q, r: 3.4) }
  G-t(p, (742, 1014), $A$)
  G-t(p, (729, 1109), $B$)
  G-t(p, (773, 1066), $T$)
  G-t(p, (ox - 9, oy + 11), $O$)
  // 刻度
  for n in (-2, -1, 1, 2) {
    line(p(X(n), oy), p(X(n), oy - 4), stroke: lt)
    G-t(p, (X(n) - if n < 0 { 2 } else { 0 }, oy + 12), if n < 0 { $-#str(-n)$ } else { $#str(n)$ })
  }
  for n in (-7, -6, -5, -4, -3, -2, -1, 1, 2) {
    line(p(ox - 4, Y(n)), p(ox, Y(n)), stroke: lt)
    G-t(p, (ox - if n < 0 { 19 } else { 13 }, Y(n)), if n < 0 { $-#str(-n)$ } else { $#str(n)$ })
  }
})

// ───────── 图 2·21（p.109）─────────
// 圆 x²+y²=5 与两条切线 2x-y+5=0，2x-y-5=0；单位长 27.5 像素，O 在 (693, 509)。
#let fig-G-2-21(width: 360 * G-k) = px-canvas(360, 450, origin: (550, 270), width: width, (p, u) => {
  import cetz.draw: *
  let un = 27.5
  let ox = 693
  let oy = 509
  let X = x => ox + un * x
  let Y = y => oy - un * y
  G-ax(p, (563, oy), (894, oy))
  G-ax(p, (ox, 711), (ox, 283))
  G-t(p, (903, oy - 1), $x$)
  G-t(p, (697, 266), $y$)
  circle(p(ox, oy), radius: calc.sqrt(5) * un * u, stroke: lw)
  line(p(X(-3.56), Y(2 * -3.56 + 5)), p(X(0.75), Y(2 * 0.75 + 5)), stroke: lw)
  line(p(X(-0.84), Y(2 * -0.84 - 5)), p(X(3.7), Y(2 * 3.7 - 5)), stroke: lw)
  G-d(p, (ox, Y(5)), r: 3)
  G-d(p, (ox, Y(-5)), r: 3)
  G-d(p, (X(-2.5), oy), r: 1.6)
  G-d(p, (X(2.5), oy), r: 1.6)
  G-t(p, (ox + 10, oy + 14), $O$)
  for n in (-3, -2, -1, 1, 2, 3) {
    line(p(X(n), oy), p(X(n), oy - 4), stroke: lt)
    G-t(p, (X(n) - if n < 0 { 2 } else { 0 }, oy + 14), if n < 0 { $-#str(-n)$ } else { $#str(n)$ })
  }
  for n in (-5, -4, -3, -2, -1, 1, 2, 3, 4, 5) {
    line(p(ox, Y(n)), p(ox + 4, Y(n)), stroke: lt)
    G-t(p, (ox - if n < 0 { 20 } else { 14 }, Y(n)), if n < 0 { $-#str(-n)$ } else { $#str(n)$ })
  }
})

// ───────── 图 2·22（p.111）─────────
// y = x³ 与 y = -3x + 2。原图横轴每单位约 28 像素，纵轴每 10 单位约 26 像素（正半轴）/ 28 像素（负半轴），手绘略有偏差；O 在 (650, 468)。
#let fig-G-2-22(width: 400 * G-k) = px-canvas(400, 450, origin: (500, 250), width: width, (p, u) => {
  import cetz.draw: *
  let ox = 650
  let oy = 468
  let xs = 28
  let X = x => ox + xs * x
  let Y = y => if y >= 0 { oy - 2.63 * y } else { oy - 2.82 * y }
  G-ax(p, (510, oy), (876, oy))
  G-ax(p, (ox, 690), (ox, 270))
  G-t(p, (894, oy - 2), $x$)
  G-t(p, (ox + 2, 256), $y$)
  // 立方曲线
  let N = 80
  let cur = range(N + 1).map(i => {
    let x = -4.15 + 8.3 * i / N
    p(X(x), Y(calc.pow(x, 3)))
  })
  line(..cur, stroke: lw)
  // 直线 y = -3x + 2（按原图所画的斜度）
  line(p(540.6, 427), p(767.5, 511), stroke: lw)
  // 点
  for q in ((534.4, 647), (590.6, 494), (704.4, 452), (762.5, 299), (ox - 2, oy - 1), (619, 478)) {
    G-d(p, q, r: 2.8)
  }
  // 刻度
  for n in (-4, -3, -2, -1) { line(p(X(n), oy), p(X(n), oy - 4), stroke: lt) }
  for n in (1, 2, 3, 4) {
    line(p(X(n), oy), p(X(n), oy - 4), stroke: lt)
    G-t(p, (X(n), oy + 19), $#str(n)$)
  }
  for n in (10, 20, 30, 40, 50, 60) {
    line(p(ox - 4, Y(n)), p(ox, Y(n)), stroke: lt)
    G-t(p, (ox - 17, Y(n) + 1), $#str(n)$)
    line(p(ox - 4, Y(-n)), p(ox, Y(-n)), stroke: lt)
    G-t(p, (ox - 24, Y(-n) + 1), $-#str(n)$)
  }
  G-t(p, (ox + 12, oy + 16), $O$)
  G-t(p, (681, 453), $P$)
})

// ───────── 复习题二 第 11 题（p.114）─────────
// 两根杆子绕 A、B 转动，交点 P，AB 中点与 P 的虚线；杆子画成圆头长条。
#let fig-G-11(width: 320 * G-k) = px-canvas(320, 210, origin: (330, 235), width: width, (p, u) => {
  import cetz.draw: *
  let stick = (a, b) => {
    line(p(..a), p(..b), stroke: (paint: black, thickness: 9 * u + 0.9pt, cap: "round"))
  }
  let stickw = (a, b) => {
    line(p(..a), p(..b), stroke: (paint: white, thickness: 9 * u, cap: "round"))
  }
  let a1 = (357, 423)
  let b1 = (573, 261)
  let a2 = (611, 430)
  let b2 = (488, 259)
  stick(a1, b1)
  stick(a2, b2)
  stickw(a1, b1)
  stickw(a2, b2)
  // AB 所在直线（虚线）及 P 到 AB 中点的虚线
  line(p(305, 416), p(646, 416), stroke: (paint: black, thickness: 0.9pt, dash: "dashed"))
  line(p(517, 316), p(487, 416), stroke: (paint: black, thickness: 0.9pt, dash: "dashed"))
  // 铰点 P
  circle(p(517, 302), radius: 3 * u, fill: white, stroke: lw)
  G-d(p, (369, 416), r: 2.2)
  G-d(p, (604, 416), r: 2.2)
  G-t(p, (380, 429), $A$)
  G-t(p, (591, 429), $B$)
  G-t(p, (538, 310), $P$)
})
