// 图 4·31–4·43（O 段：原书 p.243–264），读图 150 dpi（页宽 768 像素），k = 0.0198 cm/像素（约为原图 1 倍）。
// 坐标轴整理为水平、铅直；双曲线按标准方程用页面像素的半轴长采样画出，半轴长、焦点、刻度单位按原图量取，
// 焦点按 c² = a² + b² 算出（个别原图手绘的焦点位置略有出入）。
#import "/common/geo.typ": *
#let O-k = 0.0198cm
#let O-t(p, pt, body) = { import cetz.draw: *; content(p(..pt), tt(body)) }
// 坐标轴：原点 (ox, oy)，x 轴从 x0 到 x1，y 轴从 y1（下）到 y0（上），带箭头和轴名
#let O-axes(p, ox, oy, x0, x1, y0, y1, o: (-9, 11)) = {
  import cetz.draw: *
  line(p(x0, oy), p(x1, oy), stroke: lt, mark: arw)
  line(p(ox, y1), p(ox, y0), stroke: lt, mark: arw)
  O-t(p, (x1 + 10, oy), $x$)
  O-t(p, (ox, y0 - 10), $y$)
  O-t(p, (ox + o.at(0), oy + o.at(1)), $O$)
}
// 焦点在 x 轴上的双曲线：中心 (ox, oy)，半轴 A、B（像素），画到 |y − oy| ≤ Y
#let O-hx(p, ox, oy, A, B, Y, n: 40, sides: (-1, 1), ..style) = {
  import cetz.draw: *
  let ys = range(0, n + 1).map(i => -Y + 2 * Y * i / n)
  for s in sides {
    line(..ys.map(y => p(ox + s * A * calc.sqrt(1 + calc.pow(y / B, 2)), oy + y)), stroke: lb, ..style)
  }
}
// 焦点在 y 轴上的双曲线：中心 (ox, oy)，A 为竖直半轴（实轴），B 为水平半轴，画到 |x − ox| ≤ X
#let O-hy(p, ox, oy, A, B, X, n: 40, ..style) = {
  import cetz.draw: *
  let xs = range(0, n + 1).map(i => -X + 2 * X * i / n)
  for s in (-1, 1) {
    line(..xs.map(x => p(ox + x, oy + s * A * calc.sqrt(1 + calc.pow(x / B, 2)))), stroke: lb, ..style)
  }
}
// 渐近线：过中心、斜率 ±B/A（页面像素意义），水平方向画到 ±X
#let O-asym(p, ox, oy, A, B, X) = {
  import cetz.draw: *
  line(p(ox - X, oy + X * B / A), p(ox + X, oy - X * B / A), stroke: lt)
  line(p(ox - X, oy - X * B / A), p(ox + X, oy + X * B / A), stroke: lt)
}
// 以中心为中心、半宽 W、半高 H 的虚线矩形
#let O-rect(p, ox, oy, W, H) = {
  import cetz.draw: *
  rect(p(ox - W, oy - H), p(ox + W, oy + H), stroke: dsh)
}
// 轴上刻度：x 轴在 xs 各点、y 轴在 ys 各点画短线
#let O-ticks(p, ox, oy, xs: (), ys: (), s: 3) = {
  import cetz.draw: *
  for x in xs { line(p(x, oy), p(x, oy - s), stroke: lt) }
  for y in ys { line(p(ox, y), p(ox + s, y), stroke: lt) }
}
// 花括号：从 a 到 b，尖朝 dir 一侧（"up" "down" "left" "right"），amp 为高度（像素）
#let O-brace(p, a, b, dir: "down", amp: 5) = {
  import cetz.draw: *
  // cetz 的 brace 尖朝起点→终点方向的左侧
  let (s, e) = if dir == "up" { (a, b) } else if dir == "down" { (b, a) } else if dir == "left" { (a, b) } else { (b, a) }
  let (s, e) = if dir in ("left", "right") {
    // 竖直括号：a 在上，b 在下；尖朝左时从下往上画
    if dir == "left" { (b, a) } else { (a, b) }
  } else { (s, e) }
  cetz.decorations.brace(p(..s), p(..e), amplitude: amp, stroke: lt)
}
// 空心小圆点
#let O-ring(p, c, r: 2.6) = { import cetz.draw: *; circle(p(..c), radius: r, stroke: lt, fill: white) }

// 图 4·31（p.243）：观察站 A、B、C 与两支双曲线
#let fig-O-4-31() = px-canvas(370, 290, origin: (195, 780), width: 370 * O-k, (p, u) => {
  import cetz.draw: *
  line(p(200, 689), p(560, 692), stroke: lt)
  // 以 A、B 为焦点的一支（实线）
  catmull(p(425, 513), p(400, 545), p(388, 562), p(370, 600), p(358, 640), p(352, 690), p(355, 750), stroke: lb, tension: 0.5)
  // 以 B、C 为焦点的一支（虚线）
  catmull(p(360, 500), p(375, 535), p(390, 562), p(420, 600), p(455, 630), p(500, 652), stroke: (paint: black, thickness: 0.9pt, dash: "dashed"), tension: 0.5)
  // A–P、B–C 方向的虚线
  line(p(212, 711), p(432, 526), stroke: dsh)
  line(p(370, 713), p(505, 553), stroke: dsh)
  O-ring(p, (235, 689)); O-ring(p, (387, 690)); pdot(p, (476, 586)); O-ring(p, (390, 560))
  O-t(p, (240, 702), $A$)
  O-t(p, (394, 704), $B$)
  O-t(p, (488, 586), $C$)
  O-t(p, (378, 556), $P$)
  // 炮的示意
  circle(p(432, 566), radius: 6, stroke: lt)
  line(p(432, 560), p(432, 572), stroke: 0.4pt); line(p(426, 566), p(438, 566), stroke: 0.4pt)
  line(p(428, 562), p(410, 552), stroke: 2pt)
  line(p(436, 570), p(446, 573), stroke: lt)
  O-t(p, (520, 638), [双曲线])
  O-t(p, (378, 740), [双曲线])
})

// 图 4·32（p.244）：用线和铅笔画双曲线（原图的两只手略去，只画钉子、线和铅笔）
#let fig-O-4-32() = px-canvas(300, 270, origin: (80, 590), width: 300 * O-k, (p, u) => {
  import cetz.draw: *
  let (ox, oy, A, B) = (219, 475, 46, 64)
  line(p(85, oy), p(370, oy), stroke: lt)
  // 右支（实线，已画出）、左支（虚线，用同法可画）
  O-hx(p, ox, oy, A, B, 92, sides: (1,))
  O-hx(p, ox, oy, A, B, 92, sides: (-1,), stroke: (paint: black, thickness: 1.1pt, dash: "dashed"))
  let P = (ox + A * calc.sqrt(1 + calc.pow(65 / B, 2)), 410)
  let M = (226, 532)
  let F1 = (140, oy)
  let F2 = (298, oy)
  // 钉子
  for f in (F1, F2) {
    line(p(f.at(0), oy), p(f.at(0), oy - 12), stroke: 1pt)
    line(p(f.at(0) - 4, oy - 12), p(f.at(0) + 4, oy - 12), stroke: 1pt)
    pdot(p, f)
  }
  // 线：F1–P、F2–P，两线从 P 一同拉到 M
  line(p(..F1), p(..P), stroke: lt)
  line(p(..F2), p(..P), stroke: lt)
  line(p(..P), p(..M), stroke: lt)
  line(p(P.at(0) + 2, P.at(1)), p(M.at(0) + 2, M.at(1)), stroke: lt)
  pdot(p, M, r: 2)
  // 铅笔
  line(p(P.at(0), P.at(1) + 3), p(P.at(0), 320), stroke: 2.2pt)
  O-t(p, (P.at(0) - 10, P.at(1) - 4), $P$)
  O-t(p, (M.at(0) + 10, M.at(1) - 6), $M$)
  O-t(p, (140, 490), $F_1$)
  O-t(p, (298, 490), $F_2$)
})

// 图 4·33（p.245）
#let fig-O-4-33() = px-canvas(320, 230, origin: (370, 465), width: 300 * O-k, (p, u) => {
  import cetz.draw: *
  let (ox, oy, A, B) = (511, 353, 48, 64)
  let c = calc.sqrt(A * A + B * B)
  O-axes(p, ox, oy, 380, 662, 245, 455, o: (-10, 12))
  O-hx(p, ox, oy, A, B, 88)
  let P = (ox + A * calc.sqrt(1 + calc.pow(65 / B, 2)), oy - 65)
  line(p(ox - c, oy), p(..P), stroke: lt)
  line(p(ox + c, oy), p(..P), stroke: lt)
  O-ring(p, (ox - c, oy)); pdot(p, (ox + c, oy), r: 2.6); pdot(p, P, r: 1.8)
  O-t(p, (P.at(0) + 30, P.at(1)), $P(x, y)$)
  O-t(p, (ox - c - 2, oy + 14), $F_1(-c, 0)$)
  O-t(p, (ox + c + 22, oy + 14), $F_2(c, 0)$)
})

// 图 4·34（p.249）
#let fig-O-4-34() = px-canvas(310, 270, origin: (230, 615), width: 300 * O-k, (p, u) => {
  import cetz.draw: *
  let (ox, oy, A, B) = (373, 476, 60, 53)
  let c = calc.sqrt(A * A + B * B)
  O-axes(p, ox, oy, 240, 520, 362, 605, o: (9, -8))
  O-hx(p, ox, oy, A, B, 95)
  line(p(ox - A, 380), p(ox - A, 585), stroke: dsh)
  line(p(ox + A, 380), p(ox + A, 585), stroke: dsh)
  line(p(ox, oy - B), p(ox + A, oy), stroke: dsh)
  pdot(p, (ox - c, oy)); pdot(p, (ox + c, oy)); pdot(p, (ox, oy - B)); pdot(p, (ox, oy + B))
  pdot(p, (ox - A, oy), r: 1.6); pdot(p, (ox + A, oy), r: 1.6)
  O-brace(p, (ox, oy - B), (ox, oy), dir: "left", amp: 6)
  O-brace(p, (ox, oy), (ox + A, oy), dir: "down", amp: 5)
  O-t(p, (ox - 16, oy - B / 2), $b$)
  O-t(p, (ox + A / 2, oy + 16), $a$)
  O-t(p, (ox + A / 2 + 8, oy - B / 2 - 5), $c$)
  O-t(p, (ox + 32, oy - B - 1), $B(0, b)$)
  O-t(p, (ox + 30, oy + B + 10), $B'(0, -b)$)
  O-t(p, (ox + A + 26, oy - 10), $A(a, 0)$)
  O-t(p, (ox - A - 38, oy - 10), $A'(-a, 0)$)
  O-t(p, (ox + c + 14, oy + 13), $F_2(c, 0)$)
  O-t(p, (ox - c + 10, oy + 14), $F_1(-c, 0)$)
})

// 图 4·35（p.251）
#let fig-O-4-35() = px-canvas(320, 260, origin: (370, 420), width: 300 * O-k, (p, u) => {
  import cetz.draw: *
  let (ox, oy, A, B) = (507, 297, 56, 37)
  let c = calc.sqrt(A * A + B * B)
  O-axes(p, ox, oy, 375, 670, 172, 412, o: (-11, 13))
  O-rect(p, ox, oy, A, B)
  O-asym(p, ox, oy, A, B, 135)
  O-hx(p, ox, oy, A, B, 86)
  // 半轴 a、b
  line(p(ox, oy), p(ox, oy - B), stroke: lt)
  pdot(p, (ox - c, oy)); pdot(p, (ox + c, oy))
  // P 和它到渐近线 y = (b/a)x 的距离 d
  let P = (ox + A * calc.sqrt(1 + calc.pow(62 / B, 2)), oy - 62)
  pdot(p, P)
  let (dx, dy) = (P.at(0) - ox, P.at(1) - oy)
  let (ux, uy) = (A / c, -B / c)
  let tt0 = dx * ux + dy * uy
  let Q = (ox + tt0 * ux, oy + tt0 * uy)
  line(p(..P), p(..Q), stroke: lt)
  O-t(p, (Q.at(0) - 4, Q.at(1) - 9), $d$)
  O-t(p, (P.at(0) + 26, P.at(1) + 10), $P(x, y)$)
  O-t(p, (ox + 10, oy - B - 8), $B$)
  O-t(p, (ox - 9, oy - B / 2 - 3), $b$)
  O-t(p, (ox - A + 10, oy - 9), $A'$)
  O-t(p, (ox + A - 8, oy - 9), $A$)
  O-t(p, (ox + A / 2, oy + 10), $a$)
  O-t(p, (ox - 9, oy + B + 10), $B'$)
  O-t(p, (ox - c - 4, oy + 13), $F_1$)
  O-t(p, (ox + c + 6, oy + 13), $F_2$)
  O-t(p, (418, 392), $y = b/a x$)
  O-t(p, (600, 392), $y = -b/a x$)
})

// 图 4·36（p.253）：x²/9 − y²/4 = 1，单位 24 像素
#let fig-O-4-36() = px-canvas(400, 310, origin: (180, 845), width: 330 * O-k, (p, u) => {
  import cetz.draw: *
  let (ox, oy, s) = (374, 697, 24)
  let (A, B) = (3 * s, 2 * s)
  O-axes(p, ox, oy, 185, 572, 545, 838, o: (-10, 13))
  O-rect(p, ox, oy, A, B)
  O-asym(p, ox, oy, A, B, 165)
  O-hx(p, ox, oy, A, B, 98)
  O-ticks(p, ox, oy, xs: (-2, -1, 1, 2).map(i => ox + i * s), ys: (-1, 1).map(i => oy + i * s))
  let c = calc.sqrt(13) * s
  pdot(p, (ox - c, oy)); pdot(p, (ox + c, oy)); pdot(p, (ox, oy - B)); pdot(p, (ox + A, oy))
  O-t(p, (ox + 27, oy - B - 10), $B(0, 2)$)
  O-t(p, (ox + A + 26, oy - 11), $A(3, 0)$)
  O-t(p, (ox - c - 36, oy + 15), $F_1(-sqrt(13), 0)$)
  O-t(p, (ox + c + 40, oy + 15), $F_2(sqrt(13), 0)$)
})

// 图 4·37（p.254）：a = 3, b = 2 与 a = 1.5, b = 1 两条双曲线，单位 24 像素
#let fig-O-4-37() = px-canvas(400, 300, origin: (170, 475), width: 330 * O-k, (p, u) => {
  import cetz.draw: *
  let (ox, oy, s) = (360, 346, 24)
  O-axes(p, ox, oy, 175, 570, 185, 470, o: (-10, 12))
  O-rect(p, ox, oy, 3 * s, 2 * s)
  O-rect(p, ox, oy, 1.5 * s, 1 * s)
  O-asym(p, ox, oy, 3, 2, 168)
  O-hx(p, ox, oy, 3 * s, 2 * s, 100)
  O-hx(p, ox, oy, 1.5 * s, 1 * s, 108)
  O-ticks(p, ox, oy, xs: (-6, -4, -2, 4, 6).map(i => ox + i * s), ys: (oy - 4 * s, oy + 3 * s))
  O-t(p, (262, 452), $y = 2/3 x$)
  O-t(p, (456, 452), $y = -2/3 x$)
})

// 图 4·38（p.256）：Ⅰ x²/a² − y²/b² = 1，b/a = 1/2；Ⅱ b/a = 3；单位 25 像素
#let fig-O-4-38() = px-canvas(390, 400, origin: (205, 555), width: 310 * O-k, (p, u) => {
  import cetz.draw: *
  let (ox, oy, s) = (360, 368, 25)
  O-axes(p, ox, oy, 215, 562, 168, 550, o: (-10, 13))
  // Ⅰ：a = 2, b = 1
  O-rect(p, ox, oy, 2 * s, 1 * s)
  O-asym(p, ox, oy, 2, 1, 138)
  O-hx(p, ox, oy, 2 * s, 1 * s, 66)
  // Ⅱ：a = 1, b = 3
  O-rect(p, ox, oy, 1 * s, 3 * s)
  O-asym(p, ox, oy, 1, 3, 52)
  O-hx(p, ox, oy, 1 * s, 3 * s, 152)
  O-ticks(p, ox, oy, xs: (-4, -3, 3, 4).map(i => ox + i * s), ys: (-4, -2, 2, 4).map(i => oy + i * s))
  O-t(p, (420, 232), [Ⅱ])
  O-t(p, (510, 295), [Ⅰ])
  O-t(p, (262, 450), $y = 1/2 x$)
  O-t(p, (342, 522), $y = 3x$)
})

// 图 4·39（p.258）：x²/64 − y²/36 = 1，单位 8.5 像素
#let fig-O-4-39() = px-canvas(380, 300, origin: (195, 545), width: 320 * O-k, (p, u) => {
  import cetz.draw: *
  let (ox, oy, s) = (357, 400, 8.5)
  let (A, B) = (8 * s, 6 * s)
  O-axes(p, ox, oy, 200, 560, 262, 538, o: (-10, 13))
  O-rect(p, ox, oy, A, B)
  O-asym(p, ox, oy, A, B, 147)
  O-hx(p, ox, oy, A, B, 100)
  O-ticks(p, ox, oy, xs: range(-7, 8).filter(i => i != 0).map(i => ox + i * s), ys: range(-5, 6).filter(i => i != 0).map(i => oy + i * s))
  let c = 10 * s
  pdot(p, (ox - c, oy)); pdot(p, (ox + c, oy)); pdot(p, (ox, oy - B)); pdot(p, (ox + A, oy))
  O-t(p, (ox + 27, oy - B - 10), $B(0, 6)$)
  O-t(p, (ox + A + 27, oy - 11), $A(8, 0)$)
  O-t(p, (ox - c - 26, oy + 14), $F_1(-10, 0)$)
  O-t(p, (ox + c + 22, oy + 14), $F_2(10, 0)$)
})

// 图 4·40（p.260）。
#let fig-O-4-40() = px-canvas(310, 270, origin: (95, 590), width: 270 * O-k, (p, u) => {
  import cetz.draw: *
  let (ox, oy, A, B) = (222, 474, 42, 33)
  let c = calc.sqrt(A * A + B * B)
  O-axes(p, ox, oy, 100, 380, 330, 580, o: (-10, 12))
  O-rect(p, ox, oy, A, B)
  O-asym(p, ox, oy, A, B, 120)
  O-hx(p, ox, oy, A, B, 86)
  pdot(p, (ox - c, oy)); pdot(p, (ox + c, oy)); pdot(p, (ox + A, oy), r: 2.6)
  O-t(p, (ox + 28, oy - B - 9), $B(0, b)$)
  line(p(ox + 2, oy + B + 2), p(ox + 10, oy + B + 26), stroke: 0.4pt)
  O-t(p, (ox + 38, oy + B + 34), $B'(0, -b)$)
  O-t(p, (ox + A + 30, oy - 12), $A(a, 0)$)
  // 原书作 F₁(0, −c)
  O-t(p, (ox - c - 18, oy + 14), $F_1(-c, 0)$)
  O-t(p, (ox + c + 22, oy + 14), $F_2(c, 0)$)
})

// 图 4·41（p.260）。B 的标注扫描中像“L(b, 0)”，按 B′(−b, 0) 判为 B(b, 0)。
#let fig-O-4-41() = px-canvas(290, 330, origin: (430, 610), width: 260 * O-k, (p, u) => {
  import cetz.draw: *
  let (ox, oy, A, B) = (528, 450, 38, 31)
  let c = calc.sqrt(A * A + B * B)
  O-axes(p, ox, oy, 438, 700, 290, 605, o: (-11, 12))
  O-rect(p, ox, oy, B, A)
  O-asym(p, ox, oy, B, A, 88)
  O-hy(p, ox, oy, A, B, 88)
  pdot(p, (ox, oy - c)); pdot(p, (ox, oy + c)); pdot(p, (ox, oy - A), r: 1.6)
  line(p(ox + 2, oy - c - 3), p(ox + 10, oy - c - 40), stroke: 0.4pt)
  O-t(p, (ox + 38, oy - c - 48), $F_2(0, c)$)
  line(p(ox + 2, oy + c + 3), p(ox + 10, oy + c + 40), stroke: 0.4pt)
  O-t(p, (ox + 36, oy + c + 50), $F_1(0, -c)$)
  O-t(p, (ox + 27, oy - A + 12), $A(0, a)$)
  O-t(p, (ox - B - 30, oy + 13), $B'(-b, 0)$)
  O-t(p, (ox + B + 24, oy + 13), $B(b, 0)$)
})

// 图 4·42（p.263）：−x²/16 + y²/36 = 1，单位 9.7 像素；描点 (2.4, 7)、(3.5, 8)、(5.3, 10)
#let fig-O-4-42() = px-canvas(300, 370, origin: (400, 760), width: 230 * O-k, (p, u) => {
  import cetz.draw: *
  let (ox, oy, s) = (519, 590, 9.7)
  let (A, B) = (6 * s, 4 * s)
  O-axes(p, ox, oy, 405, 650, 408, 755, o: (-10, 13))
  O-rect(p, ox, oy, B, A)
  O-asym(p, ox, oy, B, A, 94)
  O-hy(p, ox, oy, A, B, 94)
  O-ticks(p, ox, oy, xs: range(-7, 8).filter(i => i != 0).map(i => ox + i * s), ys: range(-12, 13).filter(i => i != 0 and calc.abs(i) != 6).map(i => oy + i * s))
  let c = 2 * calc.sqrt(13) * s
  pdot(p, (ox, oy - c)); pdot(p, (ox, oy + c))
  for (x, y) in ((2.4, 7), (3.53, 8), (5.33, 10)) { pdot(p, (ox + x * s, oy - y * s), r: 3.2) }
  O-t(p, (ox - 12, oy - c), $F_2$)
  O-t(p, (ox - 12, oy + c + 4), $F_1$)
})

// 图 4·43（p.264）：用圆规画双曲线上的点。a = 64.5，c = 90.5 像素；t 取 32、48、65 像素（按原图 P₁、P₂、P₃ 的位置反算）
#let fig-O-4-43() = px-canvas(360, 350, origin: (215, 1048), width: 340 * O-k, (p, u) => {
  import cetz.draw: *
  let (ox, oy, A, c) = (339, 855, 64.5, 90.5)
  let B = calc.sqrt(c * c - A * A)
  O-axes(p, ox, oy, 220, 520, 712, 950, o: (-10, 12))
  O-hx(p, ox, oy, A, B, 93)
  let F1 = (ox - c, oy)
  let F2 = (ox + c, oy)
  pdot(p, F1); pdot(p, F2)
  // 双曲线上到 F2 的距离为 t 的点：r2 = e·x − a
  let pts(t) = {
    let x = (t + A) * A / c
    let y = B * calc.sqrt(x * x / (A * A) - 1)
    ((ox + x, oy - y), (ox + x, oy + y))
  }
  let ts = (32, 48, 65)
  for (i, t) in ts.enumerate() {
    for (j, q) in pts(t).enumerate() {
      pdot(p, q, r: 1.8)
      // 两段小弧：以 F1 为圆心半径 2a + t、以 F2 为圆心半径 t
      let r1 = 2 * A + t
      let a1 = calc.atan2(q.at(0) - F1.at(0), F1.at(1) - q.at(1))
      arc(p(..F1), start: a1 - 4deg, stop: a1 + 4deg, radius: r1, anchor: "origin", stroke: 0.4pt)
      let a2 = calc.atan2(q.at(0) - F2.at(0), F2.at(1) - q.at(1))
      arc(p(..F2), start: a2 - 14deg, stop: a2 + 14deg, radius: t, anchor: "origin", stroke: 0.4pt)
      let nm = if j == 0 { ($P_1$, $P_2$, $P_3$).at(i) } else { ($P'_1$, $P'_2$, $P'_3$).at(i) }
      O-t(p, (q.at(0) - 18, q.at(1) + (if j == 0 { -12 } else { 14 })), nm)
    }
  }
  let P1 = pts(32).at(0)
  line(p(..F1), p(..P1), stroke: lt)
  line(p(..F2), p(..P1), stroke: dotted)
  O-t(p, (310, 836), $2a + t$)
  O-t(p, ((P1.at(0) + F2.at(0)) / 2 + 8, (P1.at(1) + F2.at(1)) / 2), $t$)
  O-t(p, (F1.at(0), oy + 13), $F_1$)
  O-t(p, (F2.at(0) + 3, oy + 13), $F_2$)
  // 下方：线段 A′A = 2a，AM = t；F1F2 = 2c
  let (xa, xA) = (249, 249 + 2 * A)
  let xM = xA + 32
  let yb = 987
  line(p(xa, yb - 2), p(xM, yb - 2), stroke: lt)
  line(p(xa, yb + 2), p(xM, yb + 2), stroke: lt)
  line(p(xM, yb), p(xM + 30, yb), stroke: dsh)
  for x in (xa, xA, xM) { line(p(x, yb - 4), p(x, yb + 4), stroke: lt) }
  O-brace(p, (xa, yb - 5), (xA, yb - 5), dir: "up", amp: 4)
  O-brace(p, (xa, yb + 5), (xM, yb + 5), dir: "down", amp: 4)
  O-t(p, ((xa + xA) / 2, yb - 16), $2a$)
  O-t(p, ((xa + xM) / 2, yb + 17), $2a + t$)
  O-t(p, (xa - 8, yb), $A'$)
  O-t(p, (xA - 4, yb - 12), $A$)
  O-t(p, ((xA + xM) / 2, yb - 12), $t$)
  O-t(p, (xM + 7, yb - 12), $M$)
  let yc = 1028
  line(p(xa, yc), p(xa + 2 * c, yc), stroke: lt)
  for x in (xa, xa + 2 * c) { line(p(x, yc - 4), p(x, yc + 4), stroke: lt) }
  O-brace(p, (xa, yc + 4), (xa + 2 * c, yc + 4), dir: "down", amp: 4)
  O-t(p, (xa + c, yc + 17), $2c$)
})
