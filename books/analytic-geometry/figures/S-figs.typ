// S 段插图：图 5·1–5·10（原书 p.322–341）。
// 读图：render-pages.py --offset 3 --dpi 150 --grid 50（build/pages-S/g/），坐标为 150 dpi 页面像素（y 向下，页宽 768）。
// 坐标轴整理为水平、铅直；原点、单位长度按原图量取（图 5·1、5·2 单位 21 像素，5·3、5·6 单位 27，5·4 单位 20，
// 5·5 单位 21，5·7 单位 23）；曲线按正文方程算点画出，不照抄手绘偏差。
#import "/common/geo.typ": *
#let S-k = 0.0198cm

#let S-t(p, pt, body) = { import cetz.draw: *; content(p(..pt), tt(body)) }
#let S-ts(p, pt, body) = { import cetz.draw: *; content(p(..pt), tsm(body)) }
// 带箭头的轴：从 a 到 b（箭头在 b），轴名 nm 放在 b 外 d 像素处（方向沿轴）
#let S-axis(p, a, b, nm: none, d: 11, off: (0, 0)) = {
  import cetz.draw: *
  line(p(..a), p(..b), stroke: lt, mark: arw)
  if nm != none {
    let (dx, dy) = (b.at(0) - a.at(0), b.at(1) - a.at(1))
    let l = calc.sqrt(dx * dx + dy * dy)
    S-t(p, (b.at(0) + dx / l * d + off.at(0), b.at(1) + dy / l * d + off.at(1)), nm)
  }
}
// 参数曲线：f(t) 返回页面像素坐标
#let S-curve(p, f, t0, t1, n: 80, st: lw) = {
  import cetz.draw: *
  line(..range(n + 1).map(i => p(..f(t0 + (t1 - t0) * i / n))), stroke: st)
}
// 横轴上的刻度（向上短线）、纵轴上的刻度（向右短线）
#let S-xt(p, y, xs, s: 3) = { import cetz.draw: *; for x in xs { line(p(x, y), p(x, y - s), stroke: lt) } }
#let S-yt(p, x, ys, s: 3) = { import cetz.draw: *; for y in ys { line(p(x, y), p(x + s, y), stroke: lt) } }

// 花括号（细线）：从页面点 a 到 b，尖朝 n 方向（页面单位向量），高 h 像素
#let S-brace(p, a, b, n, h: 6) = {
  import cetz.draw: *
  let (ax, ay) = a
  let (bx, by) = b
  let L = calc.sqrt((bx - ax) * (bx - ax) + (by - ay) * (by - ay))
  let (ux, uy) = ((bx - ax) / L, (by - ay) / L)
  let (nx, ny) = n
  let w = calc.min(h, L / 6)
  let pt(t, k) = p(ax + ux * t + nx * k, ay + uy * t + ny * k)
  let m = L / 2
  bezier(pt(0, 0), pt(w, h / 2), pt(0, h / 2), stroke: lt)
  line(pt(w, h / 2), pt(m - w, h / 2), stroke: lt)
  bezier(pt(m - w, h / 2), pt(m, h), pt(m, h / 2), stroke: lt)
  bezier(pt(m, h), pt(m + w, h / 2), pt(m, h / 2), stroke: lt)
  line(pt(m + w, h / 2), pt(L - w, h / 2), stroke: lt)
  bezier(pt(L - w, h / 2), pt(L, 0), pt(L, h / 2), stroke: lt)
}

// 图 5·1（p.322）：坐标轴的平行移动。O(175, 738)，单位 21 像素；O′(h, k) = (3, 4)，P(7, 7)，A(−2, 2)。
#let fig-S-5-1() = px-canvas(290, 300, origin: (100, 525), width: 290 * S-k, (p, u) => {
  import cetz.draw: *
  let (ox, oy, U) = (175, 738, 21)
  let X(x) = ox + x * U
  let Y(y) = oy - y * U
  let (hx, ky) = (X(3), Y(4))
  let P = (X(7), Y(7))
  // 原坐标轴、新坐标轴
  S-axis(p, (108, oy), (370, oy), nm: $x$)
  S-axis(p, (ox, 800), (ox, 540), nm: $y$)
  S-axis(p, (108, ky), (370, ky), nm: $x'$)
  S-axis(p, (hx, 800), (hx, 540), nm: $y'$)
  S-xt(p, oy, (X(-2), X(-1), X(1), X(2), X(4), X(5), X(6)))
  S-xt(p, ky, (X(-2), X(-1), X(1), X(2), X(4), X(5), X(6)))
  S-yt(p, ox, (Y(1), Y(2), Y(3), Y(5), Y(6)))
  S-yt(p, hx, (Y(1), Y(2), Y(3), Y(5), Y(6)))
  // P 到四轴的虚线
  line(p(ox, P.at(1)), p(..P), stroke: dsh)
  line(p(..P), p(P.at(0), oy), stroke: dsh)
  pdot(p, P)
  pdot(p, (X(-2), Y(2)))
  // h、k 的括号
  S-brace(p, (ox + 3, oy - 3), (hx - 3, oy - 3), (0, -1))
  S-brace(p, (ox + 5, ky + 3), (ox + 5, oy - 3), (1, 0))
  S-t(p, ((ox + hx) / 2, oy - 18), $h$)
  S-t(p, (ox + 20, (ky + oy) / 2), $k$)
  // 标注
  S-t(p, (P.at(0) + 12, P.at(1)), $P$)
  S-t(p, (ox - 12, P.at(1)), $N$)
  S-t(p, (hx + 10, P.at(1) - 9), $N'$)
  S-t(p, (ox - 10, ky - 8), $K$)
  S-t(p, (P.at(0) + 12, ky - 8), $M'$)
  S-t(p, (hx + 26, ky + 11), $O'(h, k)$)
  S-t(p, (hx + 10, oy + 11), $H$)
  S-t(p, (P.at(0), oy + 11), $M$)
  S-t(p, (ox - 7, oy + 11), $O$)
  S-t(p, (X(-1) - 5, oy + 11), $-1$)
  S-t(p, (X(1), oy + 11), $1$)
  S-t(p, (hx - 7, Y(5)), $1$)
  S-t(p, (X(4), ky - 9), $1$)
  S-t(p, (X(-2) - 18, Y(2) + 13), $A(-2, 2)$)
})

// 图 5·2（p.323）：例 1。O(518, 883)，单位 21 像素；O′(3, 4)，A(−2, 2)。
#let fig-S-5-2() = px-canvas(240, 225, origin: (425, 720), width: 240 * S-k, (p, u) => {
  import cetz.draw: *
  let (ox, oy, U) = (518, 883, 21)
  let X(x) = ox + x * U
  let Y(y) = oy - y * U
  let (hx, ky) = (X(3), Y(4))
  S-axis(p, (432, oy), (648, oy), nm: $x$)
  S-axis(p, (ox, 940), (ox, 733), nm: $y$)
  S-axis(p, (432, ky), (648, ky), nm: $x'$)
  S-axis(p, (hx, 940), (hx, 733), nm: $y'$)
  S-xt(p, oy, (X(-3), X(-2), X(-1), X(1), X(2), X(4), X(5)))
  S-xt(p, ky, (X(-3), X(-2), X(-1), X(1), X(2), X(4), X(5)))
  S-yt(p, ox, (Y(1), Y(2), Y(3), Y(5)))
  S-yt(p, hx, (Y(1), Y(2), Y(3), Y(5)))
  pdot(p, (X(-2), Y(2)))
  S-t(p, (X(-2) - 8, Y(2) + 12), $A(-2, 2)$)
  S-t(p, (hx + 27, ky + 11), $O'(3, 4)$)
  S-t(p, (ox - 7, oy + 11), $O$)
})

// 图 5·3（p.326）：椭圆 x′²/9 + y′²/4 = 1，新原点 (−2, 1)。O(280, 636)，单位 27 像素。
#let fig-S-5-3() = px-canvas(330, 235, origin: (85, 490), width: 330 * S-k, (p, u) => {
  import cetz.draw: *
  let (ox, oy, U) = (280, 636, 27)
  let X(x) = ox + x * U
  let Y(y) = oy - y * U
  let (hx, ky) = (X(-2), Y(1))
  S-axis(p, (88, oy), (395, oy), nm: $x$)
  S-axis(p, (ox, 718), (ox, 505), nm: $y$)
  S-axis(p, (88, ky), (395, ky), nm: $x'$)
  S-axis(p, (hx, 718), (hx, 505), nm: $y'$)
  S-xt(p, oy, (X(-5), X(-4), X(-3), X(-1), X(1), X(2)))
  S-xt(p, ky, (X(-4), X(-3), X(-1), X(0)))
  S-yt(p, ox, (Y(2),))
  S-curve(p, t => (hx + 3 * U * calc.cos(t), ky - 2 * U * calc.sin(t)), 0, 2 * calc.pi, n: 120)
  for (x, s) in ((-5, $-5$), (-3, $-3$), (-2, $-2$), (-1, $-1$), (1, $1$), (2, $2$)) {
    S-t(p, (X(x), oy + 11), s)
  }
  S-t(p, (ox + 7, oy + 11), $O$)
  S-t(p, (ox - 8, Y(1) - 8), $1$)
  S-t(p, (ox - 8, Y(2)), $2$)
  S-t(p, (hx - 9, ky + 11), $O'$)
})

// 图 5·4（p.326）：抛物线 y′² = −(5/2)x′，顶点 O′(1, −3)，焦点 F(3/8, −3)。O(273, 868)，单位 20 像素。
#let fig-S-5-4() = px-canvas(240, 265, origin: (145, 785), width: 240 * S-k, (p, u) => {
  import cetz.draw: *
  let (ox, oy, U) = (273, 868, 20)
  let X(x) = ox + x * U
  let Y(y) = oy - y * U
  let (hx, ky) = (X(1), Y(-3))
  S-axis(p, (150, oy), (378, oy), nm: $x$)
  S-axis(p, (ox, 1045), (ox, 795), nm: $y$)
  S-axis(p, (150, ky), (378, ky), nm: $x'$)
  S-axis(p, (hx, 1045), (hx, 795), nm: $y'$)
  S-yt(p, ox, (Y(-1), Y(-2)))
  // x′ = −(2/5)y′²（单位长度）
  S-curve(p, t => (hx - 0.4 * t * t * U, ky - t * U), -3.9, 3.9)
  pdot(p, (X(3 / 8), ky))
  S-t(p, (ox - 8, oy - 9), $O$)
  S-t(p, (hx + 1, oy - 9), $1$)
  S-t(p, (hx + 11, Y(-1)), $-1$)
  S-t(p, (ox - 12, Y(-2)), $-2$)
  S-t(p, (ox - 12, ky - 2), $-3$)
  S-t(p, (X(3 / 8) - 1, ky + 11), $F$)
  S-t(p, (hx + 9, ky + 11), $O'$)
})

// 图 5·5（p.328）：等边双曲线 x′y′ = 6，新原点 O′(4, −3)。O(311, 308)，单位 21 像素。
#let fig-S-5-5() = px-canvas(310, 325, origin: (232, 192), width: 310 * S-k, (p, u) => {
  import cetz.draw: *
  let (ox, oy, U) = (311, 308, 21)
  let X(x) = ox + x * U
  let Y(y) = oy - y * U
  let (hx, ky) = (X(4), Y(-3))
  S-axis(p, (238, oy), (528, oy), nm: $x$)
  S-axis(p, (ox, 512), (ox, 200), nm: $y$)
  S-axis(p, (238, ky), (528, ky), nm: $x'$)
  S-axis(p, (hx, 512), (hx, 200), nm: $y'$)
  S-xt(p, oy, (X(-2), X(-1), X(1), X(2), X(3), X(4), X(5), X(6), X(7)))
  S-yt(p, ox, range(1, 7).map(i => Y(-i)))
  // 两支：x′ 从 0.86 到 5，及其对称
  S-curve(p, t => (hx + t * U, ky - 6 / t * U), 0.86, 5)
  S-curve(p, t => (hx - t * U, ky + 6 / t * U), 0.86, 7.4)
  for t in (1, 2, 3) { pdot(p, (hx + t * U, ky - 6 / t * U)) }
  for t in (2, 3, 6) { pdot(p, (hx - t * U, ky + 6 / t * U)) }
  for (x, s) in ((-2, $-2$), (-1, $-1$), (1, $1$), (2, $2$), (3, $3$), (4, $4$), (5, $5$), (6, $6$), (7, $7$)) {
    S-t(p, (X(x), oy + 10), s)
  }
  S-t(p, (ox - 6, oy + 10), $O$)
  for i in range(1, 7) { S-t(p, (ox - 11, Y(-i)), $-#str(i)$) }
  S-t(p, (hx + 8, ky + 11), $O'$)
})

// 图 5·6（p.334）：椭圆 (x+2)²/4 + (y−1)²/9 = 1。O(251, 752)，单位 27 像素；O′(−2, 1)。
#let fig-S-5-6() = px-canvas(260, 320, origin: (95, 555), width: 260 * S-k, (p, u) => {
  import cetz.draw: *
  let (ox, oy, U) = (251, 752, 27)
  let X(x) = ox + x * U
  let Y(y) = oy - y * U
  let (hx, ky) = (X(-2), Y(1))
  S-axis(p, (100, oy), (335, oy), nm: $x$)
  S-axis(p, (ox, 862), (ox, 565), nm: $y$)
  S-axis(p, (100, ky), (335, ky), nm: $x'$)
  S-axis(p, (hx, 870), (hx, 565), nm: $y'$)
  S-xt(p, oy, (X(-3), X(-2), X(-1), X(1)))
  S-yt(p, ox, (Y(-2), Y(-1), Y(2), Y(3), Y(4)))
  S-curve(p, t => (hx + 2 * U * calc.cos(t), ky - 3 * U * calc.sin(t)), 0, 2 * calc.pi, n: 120)
  ring(p, (hx, ky), r: 2.6)
  S-t(p, (hx + 9, Y(4) - 9), $A$)
  S-t(p, (hx + 10, Y(-2) + 10), $A'$)
  S-t(p, (hx + 22, ky + 13), $O'(-2, 1)$)
  S-t(p, (122, ky - 9), $y=1$)
  S-t(p, (hx - 22, 843), $x=-2$)
  S-t(p, (X(-2), oy + 11), $-2$)
  S-t(p, (X(-1), oy + 11), $-1$)
  S-t(p, (ox + 7, oy + 11), $O$)
  S-t(p, (X(1) + 1, oy + 11), $1$)
  for (y, s) in ((4, $4$), (3, $3$), (2, $2$), (1, $1$), (-1, $-1$), (-2, $-2$)) {
    S-t(p, (ox + 13, Y(y)), s)
  }
})

// 图 5·7（p.334）：双曲线 −(x−2)²/5 + (y+1)²/4 = 1。O(454, 717)，单位 23 像素；O′(2, −1)，F(2, 2)、F′(2, −4)。
#let fig-S-5-7() = px-canvas(290, 300, origin: (372, 578), width: 290 * S-k, (p, u) => {
  import cetz.draw: *
  let (ox, oy, U) = (454, 717, 23)
  let X(x) = ox + x * U
  let Y(y) = oy - y * U
  let (hx, ky) = (X(2), Y(-1))
  let (a, b) = (2, calc.sqrt(5))
  S-axis(p, (375, oy), (642, oy), nm: $x$)
  S-axis(p, (375, ky), (642, ky), nm: $x'$)
  S-axis(p, (ox, 872), (ox, 590), nm: $y$)
  S-axis(p, (hx, 872), (hx, 590), nm: $y'$)
  S-xt(p, oy, (X(-1), X(1), X(3), X(4)))
  S-yt(p, ox, (Y(1), Y(2), Y(3), Y(-1), Y(-2), Y(-3), Y(-4)))
  // 两支（y′ = ±2√(1 + x′²/5)）与渐近线 y′ = ±(2/√5)x′
  S-curve(p, t => (hx + b * calc.sinh(t) * U, ky - a * calc.cosh(t) * U), -1.5, 1.5)
  S-curve(p, t => (hx + b * calc.sinh(t) * U, ky + a * calc.cosh(t) * U), -1.5, 1.5)
  let L = 4.3
  line(p(hx - L * U, ky + L * a / b * U), p(hx + L * U, ky - L * a / b * U), stroke: lt)
  line(p(hx - L * U, ky - L * a / b * U), p(hx + L * U, ky + L * a / b * U), stroke: lt)
  pdot(p, (hx, Y(2)))
  pdot(p, (hx, Y(-4)))
  S-t(p, (hx + 9, Y(2)), $F$)
  S-t(p, (hx + 10, Y(-4)), $F'$)
  S-t(p, (hx + 10, ky + 10), $O'$)
  S-t(p, (598, ky + 10), $y=-1$)
  content(p(hx - 7, 630), angle: -90deg, tt($x=2$))
  S-t(p, (X(-1) - 2, oy + 10), $-1$)
  S-t(p, (ox - 6, oy + 10), $O$)
  for x in (1, 2, 3, 4) { S-t(p, (X(x) + 3, oy + 10), $#str(x)$) }
  for (y, s) in ((3, $3$), (2, $2$), (1, $1$), (-1, $-1$), (-2, $-2$), (-3, $-3$), (-4, $-4$)) {
    S-t(p, (ox - 11, Y(y)), s)
  }
})

// 图 5·8（p.338）：xy = k（k > 0），旋转 45° 的新轴 Ox′、Oy′。O(207, 362)，分支 xy = 1089（像素²）。
#let fig-S-5-8() = px-canvas(250, 255, origin: (95, 230), width: 250 * S-k, (p, u) => {
  import cetz.draw: *
  let (ox, oy) = (207, 362)
  let K = 1089
  S-axis(p, (98, oy), (325, oy), nm: $x$)
  S-axis(p, (ox, 478), (ox, 243), nm: $y$)
  // 新轴（45°、135°）
  S-axis(p, (ox - 77, oy + 77), (ox + 75, oy - 75), nm: $x'$)
  S-axis(p, (ox + 77, oy + 77), (ox - 75, oy - 75), nm: $y'$)
  S-curve(p, t => (ox + t, oy - K / t), 7, 115)
  S-curve(p, t => (ox - t, oy + K / t), 7, 115)
  anglearc(p, (ox, oy), (ox + 30, oy), (ox + 30, oy - 30), 18)
  S-t(p, (ox + 34, oy - 9), $45°$)
  S-t(p, (ox - 9, oy + 10), $O$)
})

// 图 5·9（p.338）：转轴公式。O(451, 958)，旋转角 θ = 35°（原图约 36°），P(521, 818)。
#let fig-S-5-9() = px-canvas(320, 290, origin: (335, 760), width: 320 * S-k, (p, u) => {
  import cetz.draw: *
  let (ox, oy) = (451, 958)
  let th = 35deg
  let (c, s) = (calc.cos(th), calc.sin(th))
  // 新轴单位向量（页面坐标，y 向下）
  let ex = (c, -s)
  let ey = (-s, -c)
  let at(d, e) = (ox + d * e.at(0), oy + d * e.at(1))
  S-axis(p, (340, oy), (645, oy), nm: $x$)
  S-axis(p, (ox, 1045), (ox, 772), nm: $y$)
  S-axis(p, at(-110, ex), at(210, ex), nm: $x'$)
  S-axis(p, at(-100, ey), at(170, ey), nm: $y'$)
  let P = (521, 818)
  let (dx, dy) = (P.at(0) - ox, P.at(1) - oy)
  let xp = dx * ex.at(0) + dy * ex.at(1)
  let yp = dx * ey.at(0) + dy * ey.at(1)
  let Mp = at(xp, ex)
  let Np = at(yp, ey)
  let M = (P.at(0), oy)
  let N = (ox, P.at(1))
  line(p(..N), p(..P), stroke: dsh)
  line(p(..P), p(..M), stroke: dsh)
  line(p(..P), p(..Mp), stroke: dsh)
  line(p(..P), p(..Np), stroke: dsh)
  line(p(ox, oy), p(..P), stroke: dsh)
  pdot(p, P)
  // θ、φ 角弧
  anglearc(p, (ox, oy), (ox + 40, oy), at(40, ex), 22)
  anglearc(p, (ox, oy), at(40, ex), P, 34)
  S-t(p, (ox + 31, oy - 9), $θ$)
  S-t(p, (ox + 32, oy - 33), $φ$)
  S-t(p, (P.at(0) + 10, P.at(1) - 5), $P$)
  S-t(p, (N.at(0) - 10, N.at(1)), $N$)
  S-t(p, (M.at(0) - 6, oy + 10), $M$)
  S-t(p, ((ox + M.at(0)) / 2, oy + 10), $x$)
  S-t(p, (P.at(0) + 7, (P.at(1) + oy) / 2 - 8), $y$)
  S-t(p, (Mp.at(0) + 6, Mp.at(1) + 10), $M'$)
  S-t(p, (Np.at(0) - 10, Np.at(1) + 6), $N'$)
  S-t(p, ((ox + Mp.at(0)) / 2 - 4, (oy + Mp.at(1)) / 2 - 10), $x'$)
  S-t(p, ((P.at(0) + Mp.at(0)) / 2 + 12 * c, (P.at(1) + Mp.at(1)) / 2 - 12 * s), $y'$)
  S-t(p, (ox - 9, oy + 10), $O$)
})

// 图 5·10（p.341）：13x² − 10xy + 13y² = 72 即 x′²/9 + y′²/4 = 1，θ = π/4。O(370, 602)，单位 26 像素。
#let fig-S-5-10() = px-canvas(260, 245, origin: (262, 455), width: 260 * S-k, (p, u) => {
  import cetz.draw: *
  let (ox, oy) = (370, 602)
  let (A, B) = (78, 52)
  let r = calc.sqrt(0.5)
  S-axis(p, (268, oy), (515, oy), nm: $x$)
  S-axis(p, (ox, 698), (ox, 467), nm: $y$)
  S-axis(p, (ox - 78, oy + 78), (ox + 88, oy - 88), nm: $x'$)
  S-axis(p, (ox + 75, oy + 75), (ox - 85, oy - 85), nm: $y'$)
  S-curve(p, t => {
    let (xp, yp) = (A * calc.cos(t), B * calc.sin(t))
    (ox + (xp - yp) * r, oy - (xp + yp) * r)
  }, 0, 2 * calc.pi, n: 120)
  anglearc(p, (ox, oy), (ox + 30, oy), (ox + 30, oy - 30), 18)
  S-t(p, (ox + 36, oy - 11), $45°$)
  S-t(p, (ox - 10, oy + 11), $O$)
  S-t(p, (478, 634), $θ=π/4$)
})
