// V 段插图：图 6·1–6·12（原书 p.381–398）。
// 读图：crop-view.py --offset 3 --dpi 200（build/pages-V/f6*.png），坐标为 200 dpi 页面像素（y 向下）。
// 曲线按原图量出的原点、单位长和题中方程算点重画，不照抄手绘的偏差。
#import "/common/geo.typ": *
#let k = 0.0145cm

#let V-t(p, pt, body) = { import cetz.draw: *; content(p(..pt), tt(body)) }
#let V-ln(p, a, b, st: lt) = { import cetz.draw: *; line(p(..a), p(..b), stroke: st) }
// 坐标轴：o 为原点（页面像素），x 轴从 x0 到 x1，y 轴从下端 y0 到上端 y1
#let V-axes(p, o, x0, x1, y0, y1, ol: (-10, 13), olab: $O$) = {
  import cetz.draw: *
  let (ox, oy) = o
  line(p(x0, oy), p(x1, oy), stroke: lt, mark: arw)
  line(p(ox, y0), p(ox, y1), stroke: lt, mark: arw)
  V-t(p, (x1 + 11, oy), $x$)
  V-t(p, (ox, y1 - 11), $y$)
  if olab != none { V-t(p, (ox + ol.at(0), oy + ol.at(1)), olab) }
}
// 参数曲线：f(t) 返回页面像素坐标
#let V-curve(p, f, t0, t1, n: 72, st: lw) = {
  import cetz.draw: *
  line(..range(n + 1).map(i => p(..f(t0 + (t1 - t0) * i / n))), stroke: st)
}
// 花括号（同 H-figs 的 H-brace）：a、b 为两端，n 为指向尖端的单位向量（页面坐标）
#let V-brace(p, a, b, n, r: 4) = {
  import cetz.draw: *
  let dx = b.at(0) - a.at(0)
  let dy = b.at(1) - a.at(1)
  let l = calc.sqrt(dx * dx + dy * dy)
  let (ux, uy) = (dx / l, dy / l)
  let q(s, t) = p(a.at(0) + ux * s + n.at(0) * t, a.at(1) + uy * s + n.at(1) * t)
  let m = l / 2
  bezier(q(0, 0), q(r, r), q(0, r), stroke: lt)
  line(q(r, r), q(m - r, r), stroke: lt)
  bezier(q(m - r, r), q(m, 2 * r), q(m, r), stroke: lt)
  bezier(q(m, 2 * r), q(m + r, r), q(m, r), stroke: lt)
  line(q(m + r, r), q(l - r, r), stroke: lt)
  bezier(q(l - r, r), q(l, 0), q(l, r), stroke: lt)
}
// 小叉号
#let V-cross(p, c, s: 4) = {
  import cetz.draw: *
  line(p(c.at(0) - s, c.at(1) - s), p(c.at(0) + s, c.at(1) + s), stroke: lt)
  line(p(c.at(0) - s, c.at(1) + s), p(c.at(0) + s, c.at(1) - s), stroke: lt)
}

// 图 6·1（p.381）：长 2a 的棒 AB 两端在两轴上滑动，中点 P 的轨迹是圆。原点 (649, 1038)，a ≈ 111 像素，φ 取 46°。
#let fig-V-6-1(width: 400 * k) = px-canvas(400, 410, origin: (500, 790), width: width, (p, u) => {
  import cetz.draw: *
  let o = (649, 1038)
  let a = 111
  let ph = 46deg
  let P = (o.at(0) + a * calc.cos(ph), o.at(1) - a * calc.sin(ph))
  let A = (o.at(0) + 2 * a * calc.cos(ph), o.at(1))
  let B = (o.at(0), o.at(1) - 2 * a * calc.sin(ph))
  V-axes(p, o, 510, 870, 1198, 812, ol: (-10, 14))
  circle(p(..o), radius: a, stroke: lw)
  // AB 两端略外伸
  V-ln(p, (B.at(0) - 0.08 * (A.at(0) - B.at(0)), B.at(1) - 0.08 * (A.at(1) - B.at(1))), (A.at(0) + 0.12 * (A.at(0) - B.at(0)), A.at(1) + 0.12 * (A.at(1) - B.at(1))))
  let N = (o.at(0), P.at(1))
  let M = (P.at(0), o.at(1))
  line(p(..N), p(..P), stroke: dsh)
  line(p(..P), p(..M), stroke: dsh)
  line(p(..o), p(..P), stroke: dsh)
  pdot(p, P)
  anglearc(p, P, N, B, 14)
  anglearc(p, A, o, B, 16)
  V-t(p, (P.at(0) - 30, P.at(1) - 8), $phi$)
  V-t(p, (A.at(0) - 26, A.at(1) - 12), $phi$)
  V-t(p, (B.at(0) - 13, B.at(1) + 2), $B$)
  V-t(p, (N.at(0) - 12, N.at(1)), $N$)
  V-t(p, (P.at(0) + 32, P.at(1) - 2), $P(x, y)$)
  V-t(p, (M.at(0), M.at(1) + 14), $M$)
  V-t(p, (A.at(0) - 5, A.at(1) + 14), $A$)
})

// 图 6·2（p.382）：抛射物体的路线。原点 (192.5, 1181)，射程 282.5 像素，最大高度 85 像素（tan α = 4H/R）。
#let fig-V-6-2(width: 450 * k) = px-canvas(450, 330, origin: (125, 915), width: width, (p, u) => {
  import cetz.draw: *
  let o = (192.5, 1181)
  let R = 282.5
  let H = 85
  let ta = 4 * H / R
  let f(x) = (o.at(0) + x, o.at(1) - ta * x * (1 - x / R))
  V-axes(p, o, 135, 545, 1240, 932, ol: (-13, 15))
  V-curve(p, f, 0, R)
  let xm = 111.5
  let P = f(xm)
  let Q = (o.at(0) + xm, o.at(1) - ta * xm)
  let M = (o.at(0) + xm, o.at(1))
  V-ln(p, o, (o.at(0) + 168, o.at(1) - ta * 168))
  line(p(..Q), p(..M), stroke: dsh)
  pdot(p, Q); pdot(p, P)
  anglearc(p, o, (o.at(0) + 30, o.at(1)), Q, 22)
  V-t(p, (o.at(0) + 28, o.at(1) - 9), $alpha$)
  V-t(p, (Q.at(0) - 15, Q.at(1) - 10), $Q$)
  V-t(p, (P.at(0) + 32, P.at(1) - 17), $P(x, y)$)
  V-t(p, (M.at(0), M.at(1) + 15), $M$)
  V-t(p, (o.at(0) + R, o.at(1) + 15), $A$)
  V-t(p, (o.at(0) + 180, o.at(1) - ta * 168 - 8), $G$)
})

// 图 6·3（p.387）：x = 2t²，y = 2t³（半立方抛物线）。原点 (411, 721)，x 单位 26.6、y 单位 16.1 像素（原图纵横比例不同）。
#let fig-V-6-3(width: 340 * k) = px-canvas(340, 590, origin: (355, 430), width: width, (p, u) => {
  import cetz.draw: *
  let o = (411, 721)
  let sx = 26.6
  let sy = 16.1
  let m(x, y) = (o.at(0) + sx * x, o.at(1) - sy * y)
  V-axes(p, o, 358, 678, 1012, 444, ol: (-9, 13))
  for i in range(1, 9) { V-ln(p, (m(i, 0).at(0), o.at(1)), (m(i, 0).at(0), o.at(1) - 4)) }
  for j in range(-17, 18) { if j != 0 { V-ln(p, (o.at(0), m(0, j).at(1)), (o.at(0) + 4, m(0, j).at(1))) } }
  V-t(p, (o.at(0) - 7, m(0, 1).at(1) - 3), $1$)
  V-t(p, (m(1, 0).at(0), o.at(1) + 12), $1$)
  let f(t) = m(2 * t * t, 2 * t * t * t)
  V-curve(p, f, 0, 2.06, n: 60)
  V-curve(p, f, 0, -2.06, n: 60)
  for t in (0, 0.5, -0.5, 1, -1, 1.5, -1.5, 2, -2) { pdot(p, f(t), r: 2.8) }
})

// 图 6·4（p.388）：x = 3cos φ，y = 2sin φ（椭圆）。原点 (508, 684)，1 单位 ≈ 56.6 像素；点取 φ = 0°，30°，…，330°。
#let fig-V-6-4(width: 510 * k) = px-canvas(510, 410, origin: (270, 455), width: width, (p, u) => {
  import cetz.draw: *
  let o = (508, 684)
  let s = 56.6
  let m(x, y) = (o.at(0) + s * x, o.at(1) - s * y)
  V-axes(p, o, 280, 765, 858, 488, ol: (-9, 13))
  for i in (-2, -1, 1, 2) { V-ln(p, (m(i, 0).at(0), o.at(1)), (m(i, 0).at(0), o.at(1) - 5)) }
  for j in (-1, 1) { V-ln(p, (o.at(0), m(0, j).at(1)), (o.at(0) + 5, m(0, j).at(1))) }
  V-t(p, (m(1, 0).at(0), o.at(1) + 13), $1$)
  V-t(p, (o.at(0) - 8, m(0, 1).at(1)), $1$)
  let f(ph) = m(3 * calc.cos(ph), 2 * calc.sin(ph))
  V-curve(p, f, 0deg, 360deg, n: 120)
  for i in range(12) { pdot(p, f(i * 30deg), r: 2.8) }
})

// 图 6·5（p.389）：柳叶线 x = 3at/(1+t³)，y = 3at²/(1+t³) 及渐近线 x + y + a = 0。原点 (306, 952.5)，a ≈ 48 像素。
#let fig-V-6-5(width: 360 * k) = px-canvas(360, 360, origin: (140, 750), width: width, (p, u) => {
  import cetz.draw: *
  let o = (306, 952.5)
  let a = 48
  let m(x, y) = (o.at(0) + x, o.at(1) - y)
  let f(t) = m(3 * a * t / (1 + t * t * t), 3 * a * t * t / (1 + t * t * t))
  let g(t) = m(3 * a * t * t / (1 + t * t * t), 3 * a * t / (1 + t * t * t))   // 交换 x、y（t → 1/t）
  V-axes(p, o, 145, 482, 1108, 775, ol: (-10, 14))
  V-curve(p, f, -0.67, 0, n: 60)                      // 左上一支
  V-curve(p, g, -0.6, 0, n: 60)                       // 右下一支（对称）
  V-curve(p, f, 0, 1, n: 50)                          // 圈的下半
  V-curve(p, g, 0, 1, n: 50)                          // 圈的上半
  // 渐近线 x + y + a = 0
  let A1 = m(-3 * a, 2 * a)
  let A2 = m(1.45 * a, -2.45 * a)
  V-ln(p, A1, A2)
  pdot(p, A2, r: 2.2)
  line(p(..o), p(..m(1.5 * a, 1.5 * a)), stroke: dsh)
})

// 图 6·6（p.389）：蔓叶线 y²(2a − x) = x³、圆 (x − a)² + y² = a²（虚线）、渐近线 x = 2a、直线 x + 2y − 2a = 0（虚线）。
// 原点 (577, 952)，a ≈ 121 像素；P 取 x = 0.73a。
#let fig-V-6-6(width: 410 * k) = px-canvas(410, 420, origin: (510, 735), width: width, (p, u) => {
  import cetz.draw: *
  let o = (577, 952)
  let a = 121
  let m(x, y) = (o.at(0) + x, o.at(1) - y)
  let f(t) = m(2 * a * t * t / (1 + t * t), 2 * a * t * t * t / (1 + t * t))
  V-axes(p, o, 515, 905, 1150, 752, ol: (-10, 14))
  V-ln(p, m(2 * a, -148), m(2 * a, 188), st: lw)      // 渐近线 x = 2a
  circle(p(..m(a, 0)), radius: a, stroke: (paint: black, thickness: 0.8pt, dash: "dashed"))
  V-curve(p, f, 0, 1.27, n: 60)
  V-curve(p, f, 0, -1.27, n: 60)
  // 直线 x + 2y − 2a = 0
  line(p(..m(-0.32 * a, 1.16 * a)), p(..m(2 * a, 0)), stroke: dsh)
  let xp = 0.73 * a
  let P = m(xp, (2 * a - xp) / 2)
  let M = m(xp, 0)
  line(p(..P), p(..M), stroke: dsh)
  pdot(p, P, r: 3.5); pdot(p, m(0, a), r: 3.5)
  V-t(p, (P.at(0) - 12, P.at(1) - 12), $P$)
  V-t(p, (M.at(0) - 3, M.at(1) + 14), $M$)
  V-t(p, (M.at(0) + 30, M.at(1) + 14), $2a$)
  V-t(p, (m(2 * a, 0).at(0) + 9, o.at(1) + 14), $A$)
})

// 图 6·7（p.391）：y = 1 + 2x²，参数方程 x = cos φ，y = 2 + cos 2φ 只给出 |x| ≤ 1 的一段（实线），其余画虚线。
// 原点 (725, 1187.5)，1 单位 ≈ 32.5 像素。
#let fig-V-6-7(width: 320 * k) = px-canvas(320, 360, origin: (585, 845), width: width, (p, u) => {
  import cetz.draw: *
  let o = (725, 1187.5)
  let s = 32.5
  let m(x, y) = (o.at(0) + s * x, o.at(1) - s * y)
  V-axes(p, o, 590, 885, 1202, 862, ol: (-9, 14))
  for i in (-2, -1, 1, 2) { V-ln(p, (m(i, 0).at(0), o.at(1)), (m(i, 0).at(0), o.at(1) - 5)) }
  for j in (1, 2, 3, 4) { V-ln(p, (o.at(0), m(0, j).at(1)), (o.at(0) + 5, m(0, j).at(1))) }
  for i in (1, 2) { V-t(p, (m(i, 0).at(0), o.at(1) + 13), [#i]) }
  for j in (1, 2, 3, 4) { V-t(p, (o.at(0) - 8, m(0, j).at(1)), [#j]) }
  let f(x) = m(x, 1 + 2 * x * x)
  V-curve(p, f, -1, 1, n: 50)
  V-curve(p, f, 1, 1.97, n: 30, st: (paint: black, thickness: 0.9pt, dash: "dashed"))
  V-curve(p, f, -1, -1.97, n: 30, st: (paint: black, thickness: 0.9pt, dash: "dashed"))
})

// 图 6·8（p.393）：直线的参数方程。原点 (593, 707)，P₁ (674, 589)，P (783, 494)。
#let fig-V-6-8(width: 470 * k) = px-canvas(470, 400, origin: (470, 410), width: width, (p, u) => {
  import cetz.draw: *
  let o = (593, 707)
  let P1 = (674, 589)
  let P = (783, 494)
  let sl = (P1.at(1) - P.at(1)) / (P.at(0) - P1.at(0))
  let at(x) = (x, P1.at(1) - sl * (x - P1.at(0)))
  V-axes(p, o, 480, 905, 800, 430, ol: (-10, 14))
  V-ln(p, at(511), at(822), st: lw)
  let Q = (P.at(0), P1.at(1))
  let M1 = (P1.at(0), o.at(1))
  let M = (P.at(0), o.at(1))
  line(p(..P1), p(847, P1.at(1)), stroke: dsh)
  line(p(..P), p(..M), stroke: dsh)
  line(p(..P1), p(..M1), stroke: dsh)
  pdot(p, P1, r: 2.8); pdot(p, P, r: 2.8)
  // 角 α：在 P₁ 处和直线与 x 轴的交点处
  anglearc(p, P1, (P1.at(0) + 30, P1.at(1)), P, 16)
  let X0 = P1.at(0) - (o.at(1) - P1.at(1)) / sl
  anglearc(p, (X0, o.at(1)), (X0 + 30, o.at(1)), at(X0 + 30), 16)
  V-t(p, (P1.at(0) + 25, P1.at(1) - 8), $alpha$)
  V-t(p, (X0 + 25, o.at(1) - 7), $alpha$)
  // 花括号：ρ、x − x₁、y − y₁
  let d = (-calc.sin(calc.atan(sl)), -calc.cos(calc.atan(sl)))
  let off(q, t) = (q.at(0) + d.at(0) * t, q.at(1) + d.at(1) * t)
  V-brace(p, off(P1, 7), off(P, 7), d, r: 5)
  V-t(p, off((728.5, 541.5), 30), $rho$)
  V-brace(p, (P1.at(0) + 2, P1.at(1) + 5), (Q.at(0) - 2, Q.at(1) + 5), (0, 1))
  V-t(p, (728, 617), $x - x_1$)
  V-brace(p, (P.at(0) + 4, P.at(1)), (Q.at(0) + 4, Q.at(1)), (1, 0))
  V-t(p, (816, 541), $y - y_1$)
  V-t(p, (633, 557), $P_1(x_1, y_1)$)
  V-t(p, (P.at(0) + 44, P.at(1) - 10), $P(x, y)$)
  V-t(p, (Q.at(0) + 11, Q.at(1) + 13), $Q$)
  V-t(p, (M1.at(0), o.at(1) + 15), $M_1$)
  V-t(p, (M.at(0), o.at(1) + 15), $M$)
})

// 图 6·9（p.394）：圆的参数方程。原点 (203, 842)，圆心 C (345, 694)，r ≈ 114 像素，θ 取 42°。
#let fig-V-6-9(width: 420 * k) = px-canvas(420, 400, origin: (140, 525), width: width, (p, u) => {
  import cetz.draw: *
  let o = (203, 842)
  let C = (345, 694)
  let r = 114
  let th = 42deg
  let P = (C.at(0) + r * calc.cos(th), C.at(1) - r * calc.sin(th))
  let Q = (P.at(0), C.at(1))
  let D = (C.at(0), o.at(1))
  let M = (P.at(0), o.at(1))
  V-axes(p, o, 150, 520, 920, 548, ol: (-10, 14))
  circle(p(..C), radius: r, stroke: lw)
  V-ln(p, C, P)
  line(p(..C), p(..Q), stroke: dsh)
  line(p(..P), p(..M), stroke: dsh)
  line(p(..C), p(..D), stroke: dsh)
  pdot(p, P)
  anglearc(p, C, Q, P, 15)
  V-t(p, (C.at(0) + 25, C.at(1) - 10), $theta$)
  V-t(p, (C.at(0) - 11, C.at(1) + 1), $C$)
  V-t(p, (Q.at(0) + 11, Q.at(1) + 3), $Q$)
  V-t(p, (P.at(0) + 38, P.at(1) - 7), $P(x, y)$)
  V-t(p, (D.at(0), o.at(1) + 15), $D$)
  V-t(p, (M.at(0) + 2, o.at(1) + 15), $M$)
})

// 图 6·10（p.396）：圆外一点 P₁ 的割线与切线。原点 (519, 600)，a ≈ 113 像素，P₁ (350.5, 678)。
#let fig-V-6-10(width: 440 * k) = px-canvas(440, 400, origin: (318, 378), width: width, (p, u) => {
  import cetz.draw: *
  let o = (519, 600)
  let a = 113
  let P1 = (350.5, 678)
  let m(x, y) = (o.at(0) + x, o.at(1) - y)
  V-axes(p, o, 322, 735, 775, 410, ol: (-11, 13))
  circle(p(..o), radius: a, stroke: lw)
  // 切点 T：P₁ 的方向角 ± arccos(a/d)，取上方一个
  let (x1, y1) = (P1.at(0) - o.at(0), o.at(1) - P1.at(1))
  let d = calc.sqrt(x1 * x1 + y1 * y1)
  let b = calc.atan2(x1, y1)
  let tt1 = b - calc.acos(a / d)
  let T = m(a * calc.cos(tt1), a * calc.sin(tt1))
  // 割线：经过 P₁ 与 S′（取原图 S′ 的方向）
  let Sp0 = (573, 499)
  let (ux, uy) = (Sp0.at(0) - P1.at(0), -(Sp0.at(1) - P1.at(1)))
  let l = calc.sqrt(ux * ux + uy * uy)
  let (ux, uy) = (ux / l, uy / l)
  // 解 |P₁ + ρu|² = a²
  let bb = x1 * ux + y1 * uy
  let cc = x1 * x1 + y1 * y1 - a * a
  let r1 = -bb - calc.sqrt(bb * bb - cc)
  let r2 = -bb + calc.sqrt(bb * bb - cc)
  let S = m(x1 + r1 * ux, y1 + r1 * uy)
  let Sp = m(x1 + r2 * ux, y1 + r2 * uy)
  V-ln(p, P1, m(x1 + (r2 + 30) * ux, y1 + (r2 + 30) * uy))
  V-ln(p, P1, T)
  pdot(p, P1); pdot(p, T)
  V-t(p, (T.at(0) - 12, T.at(1) - 5), $T$)
  V-t(p, (S.at(0) - 12, S.at(1) - 5), $S$)
  V-t(p, (Sp.at(0) + 2, Sp.at(1) - 13), $S'$)
  V-t(p, (P1.at(0) + 38, P1.at(1) + 17), $P_1(x_1, y_1)$)
})

// 图 6·11（p.396）：椭圆的内接矩形。原点 (325, 1199)，a ≈ 128、b ≈ 80 像素；PQRS 取离心角 φ ≈ 71°，ABCD 为 φ = 45° 的最大矩形。
// 大、小虚线圆为辅助圆（半径 a、b）。
#let fig-V-6-11(width: 420 * k) = px-canvas(420, 380, origin: (125, 985), width: width, (p, u) => {
  import cetz.draw: *
  let o = (325, 1199)
  let a = 128
  let b = 80
  let m(x, y) = (o.at(0) + x, o.at(1) - y)
  let e(ph) = m(a * calc.cos(ph), b * calc.sin(ph))
  V-axes(p, o, 135, 530, 1360, 998, ol: (-11, 14), olab: none)
  V-curve(p, e, 0deg, 360deg, n: 120)
  let dsh2 = (paint: black, thickness: 0.8pt, dash: "dashed")
  circle(p(..o), radius: a, stroke: dsh2)
  circle(p(..o), radius: b, stroke: dsh)
  // 最大矩形 ABCD（φ = 45°）
  let (ax, ay) = (a * calc.cos(45deg), b * calc.sin(45deg))
  poly(p, (m(ax, ay), m(-ax, ay), m(-ax, -ay), m(ax, -ay)), close: true)
  // 矩形 PQRS（φ = 71°）：上下两边实线、左右两边虚线
  let ph = 71deg
  let (px, py) = (a * calc.cos(ph), b * calc.sin(ph))
  V-ln(p, m(-px, py), m(px, py))
  V-ln(p, m(-px, -py), m(px, -py), st: lw)
  line(p(..m(px, a * calc.sin(ph))), p(..m(px, -py)), stroke: dsh, mark: (start: "stealth", fill: black, scale: 0.4))
  line(p(..m(-px, py)), p(..m(-px, -py)), stroke: dsh)
  // 离心角 φ 与 45° 的辅助线
  line(p(..o), p(..m(a * calc.cos(ph), a * calc.sin(ph))), stroke: dsh)
  line(p(..o), p(..m(a * calc.cos(45deg), a * calc.sin(45deg))), stroke: dsh)
  line(p(..m(ax, a * calc.sin(45deg))), p(..m(ax, ay)), stroke: lt, mark: (start: "stealth", fill: black, scale: 0.4))
  V-cross(p, m(b * calc.cos(45deg), b * calc.sin(45deg)))
  V-cross(p, m(-b * calc.cos(45deg), b * calc.sin(45deg)))
  anglearc(p, o, m(20, 0), m(calc.cos(ph), calc.sin(ph)), 12)
  anglearc(p, o, m(20, 0), m(1, 1), 26)
  V-t(p, (341, 1178), $phi$)
  V-t(p, (372, 1186), $45°$)
  V-t(p, (314, 1214), $O$)
  V-t(p, (m(px, 0).at(0) - 3, 1214), $M$)
  V-t(p, (311, 1131), $N$)
  V-t(p, (m(-px, 0).at(0) - 2, m(0, py).at(1) - 13), $Q$)
  V-t(p, (m(px, 0).at(0) + 10, m(0, py).at(1) - 13), $P$)
  V-t(p, (m(ax, 0).at(0) + 17, m(0, ay).at(1) - 9), $A$)
  V-t(p, (m(-ax, 0).at(0) - 17, m(0, ay).at(1) - 5), $B$)
  V-t(p, (m(-ax, 0).at(0) - 15, m(0, -ay).at(1) + 15), $C$)
  V-t(p, (m(ax, 0).at(0) + 15, m(0, -ay).at(1) + 15), $D$)
  V-t(p, (m(-px, 0).at(0) - 2, m(0, -py).at(1) + 15), $R$)
  V-t(p, (m(px, 0).at(0) + 2, m(0, -py).at(1) + 15), $S$)
})

// 图 6·12（p.398）：椭圆的几何作图法（习题第 3 题）。原点 (292.5, 546)，a ≈ 129、b ≈ 80 像素，θ 取 44.5°。
#let fig-V-6-12(width: 400 * k) = px-canvas(400, 410, origin: (122, 325), width: width, (p, u) => {
  import cetz.draw: *
  let o = (292.5, 546)
  let a = 129
  let b = 80
  let th = 44.5deg
  let m(x, y) = (o.at(0) + x, o.at(1) - y)
  V-axes(p, o, 125, 492, 728, 348, ol: (-11, 14))
  circle(p(..o), radius: a, stroke: lt)
  circle(p(..o), radius: b, stroke: lt)
  V-curve(p, t => m(a * calc.cos(t), b * calc.sin(t)), 0deg, 360deg, n: 120, st: 1.1pt)
  let N = m(a * calc.cos(th), a * calc.sin(th))
  let M = m(b * calc.cos(th), b * calc.sin(th))
  let P = m(a * calc.cos(th), b * calc.sin(th))
  let D = m(b * calc.cos(th), 0)
  let Np = m(a * calc.cos(th), 0)
  V-ln(p, o, N)
  line(p(..m(0, b * calc.sin(th))), p(..P), stroke: dsh, mark: (end: "stealth", fill: black, scale: 0.4))
  line(p(..N), p(..P), stroke: dsh, mark: (end: "stealth", fill: black, scale: 0.4))
  line(p(..P), p(..Np), stroke: dsh)
  line(p(..M), p(..D), stroke: dsh)
  pdot(p, M, r: 1.8)
  anglearc(p, o, m(20, 0), N, 16)
  V-t(p, (318, 536), $theta$)
  V-t(p, (N.at(0) + 10, N.at(1) - 9), $N$)
  V-t(p, (M.at(0) - 13, M.at(1) + 1), $M$)
  V-t(p, (P.at(0) + 42, P.at(1) - 2), $P(x, y)$)
  V-t(p, (D.at(0) - 2, o.at(1) + 15), $D$)
  V-t(p, (Np.at(0) + 4, o.at(1) + 15), $N'$)
})
