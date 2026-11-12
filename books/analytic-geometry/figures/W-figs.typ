// W 段插图：图 6·13–6·19（原书 p.399–409）、习题 6·5~6·6 第 1、2、11、12 题图（p.410–414）、复习题六第 8、12 题图（p.416–417）。
// 读图：render-pages.py --offset 3 --dpi 200 --grid 100（build/pages-W/g/），坐标为 200 dpi 页面像素（y 向下）。
// 曲线（椭圆、双曲线、抛物线、旋轮线、渐开线、星形线）按原图量出的原点、比例和方程算点重画，不照抄手绘的偏差。
// 图 6·13(b) 画椭圆的工具按几何关系画成示意（十字槽、活动木条、三个钉孔）。
#import "/common/geo.typ": *
#let k = 0.0145cm

#let W-t(p, pt, body) = { import cetz.draw: *; content(p(..pt), tt(body)) }
#let W-ln(p, a, b, st: lt) = { import cetz.draw: *; line(p(..a), p(..b), stroke: st) }
// 坐标轴：o 为原点（页面像素），x 轴从 x0 到 x1，y 轴从下端 y0 到上端 y1
#let W-axes(p, o, x0, x1, y0, y1, ol: (-10, 12), olab: $O$) = {
  import cetz.draw: *
  let (ox, oy) = o
  line(p(x0, oy), p(x1, oy), stroke: lt, mark: arw)
  line(p(ox, y0), p(ox, y1), stroke: lt, mark: arw)
  W-t(p, (x1 + 11, oy), $x$)
  W-t(p, (ox, y1 - 11), $y$)
  if olab != none { W-t(p, (ox + ol.at(0), oy + ol.at(1)), olab) }
}
// 参数曲线：f(t) 返回页面像素坐标
#let W-curve(p, f, t0, t1, n: 90, st: lw) = {
  import cetz.draw: *
  line(..range(n + 1).map(i => p(..f(t0 + (t1 - t0) * i / n))), stroke: st)
}
// 小空心圈
#let W-ring(p, c, r: 2.8) = { import cetz.draw: *; circle(p(..c), radius: r, stroke: lt, fill: white) }
// 角弧：顶点 v，从方向角 a0 到 a1（度，数学方向，逆时针为正），半径 r（像素）
#let W-arc(p, v, a0, a1, r) = W-curve(p, t => (v.at(0) + r * calc.cos(t * 1deg), v.at(1) - r * calc.sin(t * 1deg)), a0, a1, n: 24, st: lt)
// 二次方程 A x² + B x + C = 0 的两根（小、大）
#let W-roots(A, B, C) = {
  let d = calc.sqrt(B * B - 4 * A * C)
  let r1 = (-B - d) / (2 * A)
  let r2 = (-B + d) / (2 * A)
  (calc.min(r1, r2), calc.max(r1, r2))
}
// 分图标号 (a)(b)(c)
#let W-sub(body) = text(size: 8pt, body)

// 图 6·13(a)（p.399）：A 在 y 轴上、B 在 x 轴上滑动，θ = 45°。原点 (548, 749)。
#let fig-W-6-13a(width: 440 * k) = px-canvas(440, 395, origin: (480, 540), width: width, (p, u) => {
  import cetz.draw: *
  let o = (548, 749)
  W-axes(p, o, 490, 905, 905, 565, ol: (-12, 14))
  let A = (548, 824)
  let B = (623, 749)
  let P = (728, 644)
  let M = (728, 749)
  let Q = (728, 824)
  W-ln(p, A, P, st: lw)
  line(p(..P), p(..M), stroke: dsh)
  line(p(..M), p(..Q), stroke: dsh)
  line(p(..A), p(..Q), stroke: dsh)
  pdot(p, P, r: 3)
  W-arc(p, B, 0, 45, 16)
  W-arc(p, A, 0, 45, 18)
  W-t(p, (735, 628), $P(x, y)$)
  W-t(p, (612, 737), $B$)
  W-t(p, (648, 736), $theta$)
  W-t(p, (575, 812), $theta$)
  W-t(p, (535, 826), $A$)
  W-t(p, (740, 737), $M$)
  W-t(p, (742, 830), $Q$)
  W-t(p, (612, 920), W-sub[$(a)$])
})

// 图 6·13(b)（p.399）：画椭圆的工具。椭圆中心 (668, 1186)，a = 156、b = 90 像素，木条 PBA 与 x 轴成 44.5°。
#let fig-W-6-13b(width: 440 * k) = px-canvas(440, 480, origin: (475, 950), width: width, (p, u) => {
  import cetz.draw: *
  let o = (668, 1186)
  let (a, b) = (156, 90)
  W-curve(p, t => (o.at(0) + a * calc.cos(t), o.at(1) - b * calc.sin(t)), 0, 2 * calc.pi, n: 120)
  line(p(480, 1186), p(905, 1186), stroke: lt, mark: arw)
  line(p(668, 1395), p(668, 970), stroke: lt, mark: arw)
  W-t(p, (916, 1186), $x$)
  W-t(p, (668, 959), $y$)
  // 十字形木条（中间挖槽）
  rect(p(555, 1171), p(781, 1207), stroke: lt, fill: white)
  rect(p(648, 1034), p(689, 1331), stroke: lt, fill: white)
  rect(p(649, 1172), p(688, 1206), stroke: none, fill: white)
  for yy in (1180, 1193) { line(p(560, yy), p(776, yy), stroke: dsh) }
  for xx in (661, 675) { line(p(xx, 1039), p(xx, 1326), stroke: dsh) }
  line(p(668, 1186), p(905, 1186), stroke: lt, mark: arw)
  // 活动木条 PBA
  let th = 44.5deg
  let P = (o.at(0) + a * calc.cos(th), o.at(1) - b * calc.sin(th))
  let A = (o.at(0), o.at(1) + (a - b) * calc.sin(th))
  let B = (o.at(0) + (a - b) * calc.cos(th), o.at(1))
  let (dx, dy) = (calc.cos(th), -calc.sin(th))
  let (nx, ny) = (-dy * 6, dx * 6)
  let s0 = -70
  let s1 = a + 22
  let e(s, n) = (A.at(0) + s * dx + n * nx, A.at(1) + s * dy + n * ny)
  line(p(..e(s0, 1)), p(..e(s1, 1)), p(..e(s1, -1)), p(..e(s0, -1)), close: true, stroke: lt, fill: white)
  for c in (A, B, P) { W-ring(p, c, r: 5.5); pdot(p, c, r: 1.6) }
  W-t(p, (P.at(0) - 15, P.at(1) - 10), $P$)
  W-t(p, (B.at(0) - 12, B.at(1) - 14), $B$)
  W-t(p, (A.at(0) + 26, A.at(1) + 6), $A$)
  W-t(p, (668, 1418), W-sub[$(b)$])
})

// 图 6·14（p.400）：旋轮线。原点 (276, 970)，r = 66 像素；图中位置 θ = 1.318 弧度（使 OA ≈ 87 像素）。
#let fig-W-6-14(width: 650 * k) = px-canvas(650, 335, origin: (170, 735), width: width, (p, u) => {
  import cetz.draw: *
  let o = (276, 970)
  let r = 66
  let m(x, y) = (o.at(0) + x, o.at(1) - y)
  W-axes(p, o, 180, 812, 1060, 745, ol: (-11, 14))
  W-curve(p, t => m(r * (t - calc.sin(t)), r * (1 - calc.cos(t))), -2.0, 8.17, n: 160, st: 1.1pt)
  let th = 1.318
  let C = m(r * th, r)
  let A = m(r * th, 0)
  let P = m(r * (th - calc.sin(th)), r * (1 - calc.cos(th)))
  let M = m(r * (th - calc.sin(th)), 0)
  let Q = (C.at(0), P.at(1))
  circle(p(..C), radius: r, stroke: lt)
  W-ln(p, C, P)
  line(p(..P), p(..M), stroke: dsh)
  line(p(..P), p(..Q), stroke: dsh)
  line(p(..C), p(..A), stroke: dsh)
  W-arc(p, C, 194, 270, 14)
  W-t(p, (P.at(0) - 11, P.at(1) - 6), $P$)
  W-t(p, (C.at(0) + 10, C.at(1) - 8), $C$)
  W-t(p, (Q.at(0) + 10, Q.at(1) + 8), $Q$)
  W-t(p, ((P.at(0) + C.at(0)) / 2 - 2, (P.at(1) + C.at(1)) / 2 - 10), $r$)
  W-t(p, (C.at(0) - 18, C.at(1) + 21), $theta$)
  W-t(p, (M.at(0) + 2, 987), $M$)
  W-t(p, (A.at(0), 987), $A$)
  W-t(p, (o.at(0) + 2 * calc.pi * r, 987), $E$)
})

// 图 6·15（p.402）：圆的渐开线。原点 (579, 546)，r = 72 像素，曲线画到 θ = 3π/2，每隔 π/8 画一条切线；图中位置 θ = 3π/8（原图约 64°）。
#let fig-W-6-15(width: 760 * k) = px-canvas(585, 455, origin: (215, 245), width: width, (p, u) => {
  import cetz.draw: *
  let o = (579, 546)
  let r = 72
  let m(x, y) = (o.at(0) + x, o.at(1) - y)
  let T(t) = m(r * calc.cos(t), r * calc.sin(t))
  let I(t) = m(r * (calc.cos(t) + t * calc.sin(t)), r * (calc.sin(t) - t * calc.cos(t)))
  W-axes(p, o, 225, 785, 690, 255, olab: none)
  for i in range(1, 13) {
    let t = i * calc.pi / 8
    W-ln(p, T(t), I(t))
    W-ln(p, o, T(t))
  }
  circle(p(..o), radius: r, stroke: lw)
  W-curve(p, I, 0, 1.5 * calc.pi, n: 120, st: 1.1pt)
  let th = 3 * calc.pi / 8
  let B = T(th)
  let P = I(th)
  let D = (B.at(0), o.at(1))
  let Q = (B.at(0), P.at(1))
  let M = (P.at(0), o.at(1))
  W-ln(p, o, B, st: 0.8pt)
  W-ln(p, B, P, st: 0.8pt)
  line(p(..B), p(..D), stroke: dsh)
  line(p(..Q), p(..P), stroke: dsh)
  line(p(..P), p(..M), stroke: dsh)
  W-arc(p, o, 0, 67.5, 13)
  W-arc(p, B, 270, 337.5, 13)
  W-t(p, (B.at(0) + 2, B.at(1) - 12), $B$)
  W-t(p, (P.at(0) + 10, P.at(1) - 4), $P$)
  W-t(p, (Q.at(0) - 8, Q.at(1) + 9), $Q$)
  W-t(p, (o.at(0) + 20, o.at(1) - 9), $theta$)
  W-t(p, (B.at(0) + 7, B.at(1) + 19), $theta$)
  W-t(p, (o.at(0) + 8, o.at(1) - 43), $r$)
  W-t(p, (o.at(0) - 5, o.at(1) + 14), $O$)
  W-t(p, (D.at(0) + 4, o.at(1) + 14), $D$)
  W-t(p, (m(r, 0).at(0) + 4, o.at(1) + 14), $A$)
  W-t(p, (M.at(0) + 3, o.at(1) + 14), $M$)
})

// 图 6·16（p.403）：垂心的轨迹。原点 (684, 977)，a = 87、h = 153、t = 34 像素；抛物线 y = (a² − x²)/h，三角形外的部分画虚线。
#let fig-W-6-16(width: 400 * k) = px-canvas(400, 425, origin: (495, 735), width: width, (p, u) => {
  import cetz.draw: *
  let o = (684, 977)
  let (a, h, t) = (87, 153, 34)
  let m(x, y) = (o.at(0) + x, o.at(1) - y)
  W-axes(p, o, 520, 872, 1150, 748, ol: (-11, 14), olab: none)
  line(p(..m(-136, h)), p(..m(178, h)), stroke: (paint: black, thickness: 0.9pt, dash: "dashed"))
  let f(x) = m(x, (a * a - x * x) / h)
  W-curve(p, f, -a, a, n: 60)
  W-curve(p, f, -175, -a, n: 40, st: (paint: black, thickness: 0.9pt, dash: "dashed"))
  W-curve(p, f, a, 175, n: 40, st: (paint: black, thickness: 0.9pt, dash: "dashed"))
  let A = m(a, 0)
  let B = m(-a, 0)
  let C = m(t, h)
  let D = m(t, 0)
  let P = m(t, (a * a - t * t) / h)
  // E：B 到 AC 的垂足
  let (ux, uy) = (C.at(0) - A.at(0), C.at(1) - A.at(1))
  let s = ((B.at(0) - A.at(0)) * ux + (B.at(1) - A.at(1)) * uy) / (ux * ux + uy * uy)
  let E = (A.at(0) + s * ux, A.at(1) + s * uy)
  line(p(..B), p(..C), p(..A), stroke: lw)
  W-ln(p, C, D)
  W-ln(p, B, E)
  pdot(p, A, r: 3); pdot(p, B, r: 3); pdot(p, C, r: 3); pdot(p, P, r: 1.8)
  W-t(p, (C.at(0) + 4, C.at(1) - 15), $C(t, h)$)
  W-t(p, (P.at(0) - 10, P.at(1) - 12), $P$)
  W-t(p, (E.at(0) + 12, E.at(1) - 2), $E$)
  W-t(p, (A.at(0) + 28, A.at(1) - 13), $A(a, 0)$)
  W-t(p, (B.at(0) + 26, B.at(1) + 15), $B(-a, 0)$)
  W-t(p, (o.at(0) - 9, o.at(1) + 14), $O$)
  W-t(p, (D.at(0) + 2, o.at(1) + 14), $D$)
})

// 图 6·17（p.404）：椭圆两垂直切线的交点在圆 x² + y² = a² + b² 上。原点 (504, 792)，a = 110、b = 48 像素；交点取在 49.6° 处。
#let fig-W-6-17(width: 420 * k) = px-canvas(420, 400, origin: (290, 580), width: width, (p, u) => {
  import cetz.draw: *
  let o = (504, 792)
  let (a, b) = (110, 48)
  let R = calc.sqrt(a * a + b * b)
  let m(x, y) = (o.at(0) + x, o.at(1) - y)
  W-axes(p, o, 300, 690, 975, 595, ol: (-11, 14))
  W-curve(p, t => m(a * calc.cos(t), b * calc.sin(t)), 0, 2 * calc.pi, n: 120)
  W-curve(p, t => m(R * calc.cos(t), R * calc.sin(t)), 0, 2 * calc.pi, n: 120)
  let th = 49.6deg
  let (x0, y0) = (R * calc.cos(th), R * calc.sin(th))
  // 过 (x0, y0) 的切线斜率：(x0² − a²)m² − 2x0y0 m + (y0² − b²) = 0
  let (m1, m2) = W-roots(x0 * x0 - a * a, -2 * x0 * y0, y0 * y0 - b * b)
  let L(sl, xa, xb) = W-ln(p, m(xa, y0 + sl * (xa - x0)), m(xb, y0 + sl * (xb - x0)), st: 0.8pt)
  // m1 < 0（陡）、m2 > 0（缓）
  L(m2, -200, x0 + 50)
  L(m1, x0 - 14, x0 + 54)
  pdot(p, m(x0, y0), r: 2.6)
  // 直角记号
  let d1 = (1 / calc.sqrt(1 + m2 * m2), m2 / calc.sqrt(1 + m2 * m2))
  let d2 = (1 / calc.sqrt(1 + m1 * m1), m1 / calc.sqrt(1 + m1 * m1))
  let s = 8
  line(p(..m(x0 - s * d1.at(0), y0 - s * d1.at(1))), p(..m(x0 - s * d1.at(0) + s * d2.at(0), y0 - s * d1.at(1) + s * d2.at(1))), p(..m(x0 + s * d2.at(0), y0 + s * d2.at(1))), stroke: lt)
})

// 图 6·18(a)（p.405）：圆的一组平行弦，中点在直径上。圆心 (319, 1065)，r = 124 像素。
#let fig-W-6-18a(width: 290 * k) = px-canvas(290, 320, origin: (175, 925), width: width, (p, u) => {
  import cetz.draw: *
  let c = (319, 1065)
  let r = 124
  for i in range(1, 20) {
    let y = -r + i * 2 * r / 20
    let w = calc.sqrt(r * r - y * y)
    W-ln(p, (c.at(0) - w, c.at(1) + y), (c.at(0) + w, c.at(1) + y), st: 0.5pt)
  }
  circle(p(..c), radius: r, stroke: lw)
  for i in range(0, 21) { W-ring(p, (c.at(0), c.at(1) - r + i * 2 * r / 20), r: 3) }
  W-t(p, (319, 1225), W-sub[$(a)$])
})

// 图 6·18(b)（p.405）：椭圆的一组平行弦（斜率 0.64）和它们中点所在的直径 UV。原点 (663, 1098)，a = 125、b = 64 像素。
#let fig-W-6-18b(width: 470 * k) = px-canvas(470, 320, origin: (470, 925), width: width, (p, u) => {
  import cetz.draw: *
  let o = (663, 1098)
  let (a, b) = (125, 64)
  let ks = 0.64
  let m(x, y) = (o.at(0) + x, o.at(1) - y)
  let tmax = calc.sqrt(a * a * ks * ks + b * b)
  let dt = tmax / 6.5
  let chord(t) = {
    let (x1, x2) = W-roots(b * b + a * a * ks * ks, 2 * a * a * ks * t, a * a * (t * t - b * b))
    (m(x1, ks * x1 + t), m(x2, ks * x2 + t))
  }
  for j in range(-6, 7) {
    let (e1, e2) = chord(j * dt)
    W-ln(p, e1, e2, st: if j == 2 { 1.3pt } else { 0.5pt })
  }
  W-curve(p, t => m(a * calc.cos(t), b * calc.sin(t)), 0, 2 * calc.pi, n: 120)
  W-axes(p, o, 490, 922, 1215, 975, ol: (-10, 13), olab: none)
  // 直径 UV：y = −b²/(a²k) x
  let kd = -b * b / (a * a * ks)
  let xu = a * b / calc.sqrt(b * b + a * a * kd * kd)
  W-ln(p, m(-xu, -kd * xu), m(xu, kd * xu), st: 0.6pt)
  for j in range(-6, 7) {
    if j != 0 {
      let x = -a * a * ks * j * dt / (a * a * ks * ks + b * b)
      W-ring(p, m(x, ks * x + j * dt), r: 2.8)
    }
  }
  W-ring(p, o, r: 2.8)
  let (P1, P2) = chord(2 * dt)
  pdot(p, P1, r: 2.4); pdot(p, P2, r: 2.4)
  let xm = -a * a * ks * 2 * dt / (a * a * ks * ks + b * b)
  W-t(p, (P1.at(0) - 12, P1.at(1) + 12), $P_1$)
  W-t(p, (P2.at(0) + 4, P2.at(1) - 13), $P_2$)
  W-t(p, (m(xm, 0).at(0) - 2, m(0, ks * xm + 2 * dt).at(1) - 12), $P'$)
  W-t(p, (m(-xu, 0).at(0) - 8, m(0, -kd * xu).at(1) - 10), $U$)
  W-t(p, (m(xu, 0).at(0) + 10, m(0, kd * xu).at(1) + 10), $V$)
  W-t(p, (o.at(0) - 9, o.at(1) + 13), $O$)
  W-t(p, (663, 1232), W-sub[$(b)$])
})

// 图 6·19(a)（p.409）：椭圆的两共轭直径 UV、U'V' 及两组平行弦。原点 (513, 403)，a = 143、b = 79 像素；U'V' 斜率 1，UV 斜率 −b²/a²。
#let fig-W-6-19a(width: 470 * k) = px-canvas(470, 360, origin: (290, 220), width: width, (p, u) => {
  import cetz.draw: *
  let o = (513, 403)
  let (a, b) = (143, 79)
  let m(x, y) = (o.at(0) + x, o.at(1) - y)
  let k1 = 1.0
  let k2 = -b * b / (a * a * k1)
  let chord(sl, t) = {
    let (x1, x2) = W-roots(b * b + a * a * sl * sl, 2 * a * a * sl * t, a * a * (t * t - b * b))
    (m(x1, sl * x1 + t), m(x2, sl * x2 + t))
  }
  for sl in (k1, k2) {
    let tmax = calc.sqrt(a * a * sl * sl + b * b)
    for j in (-4, -3, -2, -1, 1, 2, 3, 4) {
      let (e1, e2) = chord(sl, j * tmax / 5)
      line(p(..e1), p(..e2), stroke: dsh)
    }
  }
  W-axes(p, o, 300, 745, 552, 228, ol: (-4, 12), olab: none)
  W-t(p, (o.at(0) - 1, o.at(1) + 13), $O$)
  W-curve(p, t => m(a * calc.cos(t), b * calc.sin(t)), 0, 2 * calc.pi, n: 120)
  let (U, V) = chord(k2, 0)
  let (U2, V2) = chord(k1, 0)
  W-ln(p, U, V, st: 1pt)
  W-ln(p, U2, V2, st: 1pt)
  W-t(p, (U.at(0) - 6, U.at(1) - 12), $U$)
  W-t(p, (V.at(0) + 10, V.at(1) + 10), $V$)
  W-t(p, (U2.at(0) - 10, U2.at(1) + 10), $U'$)
  W-t(p, (V2.at(0) + 10, V2.at(1) - 10), $V'$)
  W-t(p, (513, 568), W-sub[$(a)$])
})

// 图 6·19(b)（p.409）：双曲线的两共轭直径及两组平行弦。原点 (305, 818)，a = 46、b = 52 像素；
// 缓的一组弦斜率 0.36（两支之间），陡的一组弦斜率 b²/(a²·0.36)（同一支上），各由另一条直径平分。
#let fig-W-6-19b(width: 370 * k) = px-canvas(370, 360, origin: (150, 640), width: width, (p, u) => {
  import cetz.draw: *
  let o = (305, 818)
  let (a, b) = (46, 52)
  let m(x, y) = (o.at(0) + x, o.at(1) - y)
  let ks = 0.36
  let kt = b * b / (a * a * ks)
  // 直线 y = sl·x + t 与双曲线 b²x² − a²y² = a²b² 的两交点
  let cut(sl, t) = {
    let (x1, x2) = W-roots(b * b - a * a * sl * sl, -2 * a * a * sl * t, -a * a * (t * t + b * b))
    ((x1, sl * x1 + t), (x2, sl * x2 + t))
  }
  for j in range(-4, 4) {
    let t = (j + 0.5) * 26.3
    let (e1, e2) = cut(ks, t)
    line(p(..m(..e1)), p(..m(..e2)), stroke: dsh)
    pdot(p, m((e1.at(0) + e2.at(0)) / 2, (e1.at(1) + e2.at(1)) / 2), r: 2.2)
  }
  for s in (-170, -210, -250, -290, -330, 170, 210, 250, 290, 330) {
    let (e1, e2) = cut(kt, s)
    line(p(..m(..e1)), p(..m(..e2)), stroke: dsh)
    pdot(p, m((e1.at(0) + e2.at(0)) / 2, (e1.at(1) + e2.at(1)) / 2), r: 2.2)
  }
  W-axes(p, o, 160, 505, 965, 650, ol: (-4, 13), olab: none)
  W-t(p, (o.at(0) + 6, o.at(1) + 13), $O$)
  for sg in (1, -1) {
    W-curve(p, t => m(sg * a * calc.cosh(t), b * calc.sinh(t)), -1.85, 1.85, n: 80, st: 1.1pt)
  }
  W-ln(p, m(-142 / kt, -142), m(150 / kt, 150), st: 0.7pt)
  W-ln(p, m(-135, -135 * ks), m(175, 175 * ks), st: 0.7pt)
  W-t(p, (305, 982), W-sub[$(b)$])
})

// 图 6·19(c)（p.409）：抛物线的直径平行于轴。原点 (647, 803)，p = 55.8 像素，平行弦斜率 1.5。
#let fig-W-6-19c(width: 320 * k) = px-canvas(320, 360, origin: (580, 640), width: width, (p, u) => {
  import cetz.draw: *
  let o = (647, 803)
  let pp = 55.8
  let ks = 1.5
  let m(x, y) = (o.at(0) + x, o.at(1) - y)
  let yd = pp / ks
  for j in range(0, 6) {
    let t = -10 - 26 * j
    let d = calc.sqrt(yd * yd - 2 * pp * t / ks)
    let (y1, y2) = (yd - d, yd + d)
    line(p(..m((y1 - t) / ks, y1)), p(..m((y2 - t) / ks, y2)), stroke: dsh)
    pdot(p, m((yd - t) / ks, yd), r: 2.2)
  }
  W-axes(p, o, 592, 884, 966, 650, ol: (-9, 13))
  W-curve(p, y => m(y * y / (2 * pp), y), -146, 146, n: 90)
  W-ln(p, m(yd * yd / (2 * pp), yd), m(200, yd), st: 1pt)
  W-t(p, (712, 982), W-sub[$(c)$])
})

#let fig-W-6-19() = stack(spacing: 0.8em,
  align(center, fig-W-6-19a()),
  grid(columns: 2, column-gutter: 2.5em, align: bottom, fig-W-6-19b(), fig-W-6-19c()))

// 习题 6·5~6·6 第 1 题图（p.410）：原点 (414, 1282)，B (414, 1159)，A (596, 1282)，P 分 BA 为 0.65 : 0.35。
#let fig-W-q1(width: 385 * k) = px-canvas(385, 380, origin: (315, 1030), width: width, (p, u) => {
  import cetz.draw: *
  let o = (414, 1282)
  W-axes(p, o, 325, 685, 1392, 1042, ol: (-11, 14))
  let B = (414, 1159)
  let A = (596, 1282)
  let s = 0.65
  let P = (B.at(0) + s * (A.at(0) - B.at(0)), B.at(1) + s * (A.at(1) - B.at(1)))
  let N = (414, P.at(1))
  let M = (P.at(0), 1282)
  W-ln(p, B, A, st: lw)
  line(p(..N), p(..P), stroke: dsh)
  line(p(..P), p(..M), stroke: dsh)
  W-ring(p, P, r: 2.6)
  W-arc(p, A, 180, 214, 20)
  W-t(p, (B.at(0) - 11, B.at(1) - 2), $B$)
  W-t(p, (N.at(0) - 11, N.at(1) + 2), $N$)
  W-t(p, (M.at(0), 1297), $M$)
  W-t(p, (A.at(0), 1297), $A$)
  W-t(p, (P.at(0) + 34, P.at(1) - 12), $P(x, y)$)
  W-t(p, ((B.at(0) + P.at(0)) / 2 + 6, (B.at(1) + P.at(1)) / 2 - 10), $a$)
  W-t(p, ((A.at(0) + P.at(0)) / 2 + 6, (A.at(1) + P.at(1)) / 2 - 10), $b$)
  W-t(p, (A.at(0) - 31, A.at(1) - 8), $theta$)
})

// 习题 6·5~6·6 第 2 题图（p.411）：原点 (446, 791)，Q (354, 643)，P 为 AB 的中点。
#let fig-W-q2(width: 410 * k) = px-canvas(410, 345, origin: (320, 535), width: width, (p, u) => {
  import cetz.draw: *
  let o = (446, 791)
  W-axes(p, o, 325, 718, 877, 548, ol: (-11, 14))
  let Q = (354, 643)
  let A = (625, 791)
  let B = (446, A.at(1) - (A.at(1) - Q.at(1)) * (A.at(0) - 446) / (A.at(0) - Q.at(0)))
  let P = ((A.at(0) + B.at(0)) / 2, (A.at(1) + B.at(1)) / 2)
  let N = (446, P.at(1))
  let M = (P.at(0), 791)
  W-ln(p, Q, A, st: lw)
  line(p(..N), p(..P), stroke: dsh)
  line(p(..P), p(..M), stroke: dsh)
  pdot(p, Q, r: 3)
  W-ring(p, P, r: 2.6)
  W-t(p, (Q.at(0) + 30, Q.at(1) - 17), $Q(a, b)$)
  W-t(p, (B.at(0) + 10, B.at(1) - 8), $B$)
  W-t(p, (P.at(0) + 10, P.at(1) - 12), $P$)
  W-t(p, (N.at(0) - 11, N.at(1)), $N$)
  W-t(p, (M.at(0), 806), $M$)
  W-t(p, (A.at(0), 806), $A$)
})

// 习题 6·5~6·6 第 11 题图（p.412）：四歧点内摆线（星形线）。原点 (499, 994)，大圆半径 4r = 176 像素，图中位置 φ = 26°。
#let fig-W-q11(width: 500 * k) = px-canvas(500, 475, origin: (270, 740), width: width, (p, u) => {
  import cetz.draw: *
  let o = (499, 994)
  let R = 176
  let r = R / 4
  let m(x, y) = (o.at(0) + x, o.at(1) - y)
  W-axes(p, o, 281, 756, 1207, 750, ol: (-11, 14))
  circle(p(..o), radius: R, stroke: lw)
  W-curve(p, t => m(R * calc.pow(calc.cos(t), 3), R * calc.pow(calc.sin(t), 3)), 0, 2 * calc.pi, n: 200)
  let ph = 26deg
  let C = m(3 * r * calc.cos(ph), 3 * r * calc.sin(ph))
  let B = m(R * calc.cos(ph), R * calc.sin(ph))
  let P = m(3 * r * calc.cos(ph) + r * calc.cos(3 * ph), 3 * r * calc.sin(ph) - r * calc.sin(3 * ph))
  let D = (C.at(0), o.at(1))
  let E = (C.at(0), P.at(1))
  let M = (P.at(0), o.at(1))
  circle(p(..C), radius: r, stroke: lt)
  line(p(..o), p(..C), stroke: dsh)
  W-ln(p, C, B)
  W-ln(p, C, P)
  line(p(..C), p(..D), stroke: dsh)
  W-ln(p, E, P)
  W-ln(p, P, M)
  pdot(p, C, r: 2.4); pdot(p, P, r: 2.4)
  W-arc(p, o, 0, 26, 22)
  W-arc(p, C, -78, 26, 10)
  W-t(p, (o.at(0) + 34, o.at(1) - 8), $phi.alt$)
  W-t(p, (C.at(0) + 19, C.at(1) + 9), $4 phi.alt$)
  W-t(p, (C.at(0) - 10, C.at(1) - 9), $C$)
  W-t(p, (B.at(0) + 10, B.at(1) - 8), $B$)
  W-t(p, ((C.at(0) + B.at(0)) / 2 + 2, (C.at(1) + B.at(1)) / 2 - 10), $r$)
  W-t(p, (P.at(0) + 6, P.at(1) - 12), $P$)
  W-t(p, (E.at(0) - 10, E.at(1) - 3), $E$)
  W-t(p, (D.at(0) - 7, 1010), $D$)
  W-t(p, (M.at(0) + 6, 1010), $M$)
  W-t(p, (o.at(0) + R + 7, 1010), $A$)
  W-t(p, (o.at(0) - 12, o.at(1) - 2 * r), $4r$)
})

// 习题 6·5~6·6 第 12 题图（p.414）：曲柄连杆。原点 (457, 456)，r = 122 像素，θ = 37°，|AB| = |OB|，P 分 BA 为 0.38 : 0.62。
#let fig-W-q12(width: 490 * k) = px-canvas(490, 395, origin: (270, 240), width: width, (p, u) => {
  import cetz.draw: *
  let o = (457, 456)
  let r = 122
  W-axes(p, o, 282, 743, 629, 252, ol: (-11, 14), olab: none)
  W-t(p, (o.at(0) - 2, o.at(1) + 16), $O$)
  circle(p(..o), radius: r, stroke: lw)
  let th = 37deg
  let B = (o.at(0) + r * calc.cos(th), o.at(1) - r * calc.sin(th))
  let A = (o.at(0) + 2 * r * calc.cos(th), o.at(1))
  let s = 0.38
  let P = (B.at(0) + s * (A.at(0) - B.at(0)), B.at(1) + s * (A.at(1) - B.at(1)))
  let C = (B.at(0), P.at(1))
  let D = (B.at(0), o.at(1))
  let M = (P.at(0), o.at(1))
  W-ln(p, o, B, st: 0.8pt)
  W-ln(p, B, A, st: 0.8pt)
  line(p(..B), p(..D), stroke: dsh)
  line(p(..C), p(..P), stroke: dsh)
  line(p(..P), p(..M), stroke: dsh)
  pdot(p, B, r: 2.4); pdot(p, P, r: 2.4)
  W-arc(p, o, 0, 37, 20)
  W-arc(p, A, 143, 180, 20)
  W-arc(p, P, 143, 180, 12)
  W-t(p, (o.at(0) + 30, o.at(1) - 9), $theta$)
  W-t(p, (A.at(0) - 30, A.at(1) - 8), $theta$)
  W-t(p, (P.at(0) - 19, P.at(1) - 4), $theta$)
  W-t(p, (B.at(0), B.at(1) - 14), $B$)
  W-t(p, (C.at(0) - 10, C.at(1) + 3), $C$)
  W-t(p, (P.at(0) + 12, P.at(1) - 9), $P$)
  W-t(p, ((o.at(0) + B.at(0)) / 2 - 6, (o.at(1) + B.at(1)) / 2 - 10), $r$)
  W-t(p, ((B.at(0) + P.at(0)) / 2 + 4, (B.at(1) + P.at(1)) / 2 - 11), $b$)
  W-t(p, ((A.at(0) + P.at(0)) / 2 + 4, (A.at(1) + P.at(1)) / 2 - 11), $a$)
  W-t(p, (D.at(0), 473), $D$)
  W-t(p, (M.at(0), 473), $M$)
  W-t(p, (A.at(0), 473), $A$)
})

// 复习题六第 8 题图（p.416）：椭圆共轭直径端点的切线围成平行四边形。原点 (505, 1200)，a = 110、b = 87 像素，P 的离心角 55°。
#let fig-W-r8(width: 400 * k) = px-canvas(400, 390, origin: (330, 1010), width: width, (p, u) => {
  import cetz.draw: *
  let o = (505, 1200)
  let (a, b) = (110, 87)
  let m(x, y) = (o.at(0) + x, o.at(1) - y)
  W-axes(p, o, 335, 718, 1390, 1018, olab: none)
  W-t(p, (o.at(0) - 10, o.at(1) + 13), $O$)
  let th = 55deg
  let P = (a * calc.cos(th), b * calc.sin(th))
  let R = (-a * calc.sin(th), b * calc.cos(th))
  let add(u, v, s1, s2) = m(s1 * u.at(0) + s2 * v.at(0), s1 * u.at(1) + s2 * v.at(1))
  line(p(..add(P, R, 1, 1)), p(..add(P, R, -1, 1)), p(..add(P, R, -1, -1)), p(..add(P, R, 1, -1)), close: true, stroke: lt)
  W-curve(p, t => m(a * calc.cos(t), b * calc.sin(t)), 0, 2 * calc.pi, n: 120, st: 1.1pt)
  W-ln(p, m(..P), m(-P.at(0), -P.at(1)))
  W-ln(p, m(..R), m(-R.at(0), -R.at(1)))
  line(p(..m(..R)), p(..m(..P)), stroke: dsh)
  W-t(p, (m(..P).at(0) + 6, m(..P).at(1) - 12), $P$)
  W-t(p, (m(..R).at(0) - 12, m(..R).at(1) - 6), $R$)
  W-t(p, (m(-P.at(0), 0).at(0) - 10, m(0, -P.at(1)).at(1) + 10), $Q$)
  W-t(p, (m(-R.at(0), 0).at(0) + 10, m(0, -R.at(1)).at(1) + 8), $S$)
})

// 复习题六第 12 题图（p.417）：直线截双曲线及其渐近线。原点 (530, 1169)，a = 76、b = 42 像素，直线 y = 0.18x + 45.7。
#let fig-W-r12(width: 475 * k) = px-canvas(475, 350, origin: (335, 970), width: width, (p, u) => {
  import cetz.draw: *
  let o = (530, 1169)
  let (a, b) = (76, 42)
  let m(x, y) = (o.at(0) + x, o.at(1) - y)
  W-axes(p, o, 343, 736, 1310, 978, olab: none)
  W-t(p, (o.at(0) - 12, o.at(1) + 14), $O$)
  let ka = b / a
  W-ln(p, m(-185, 185 * ka), m(275, -275 * ka))
  W-ln(p, m(-185, -185 * ka), m(275, 275 * ka))
  for sg in (1, -1) {
    W-curve(p, t => m(sg * a * calc.cosh(t), b * calc.sinh(t)), -1.9, 1.9, n: 80, st: 1.1pt)
  }
  let (kl, r) = (0.18, 45.7)
  W-ln(p, m(-150, -150 * kl + r), m(275, 275 * kl + r), st: 0.8pt)
  let (x1, x4) = W-roots(b * b - a * a * kl * kl, -2 * a * a * r * kl, -a * a * (r * r + b * b))
  let x2 = -r / (ka + kl)
  let x3 = r / (ka - kl)
  let pt(x) = m(x, kl * x + r)
  W-t(p, (pt(x1).at(0) - 4, pt(x1).at(1) + 14), $P$)
  W-t(p, (pt(x2).at(0), pt(x2).at(1) - 12), $R$)
  W-t(p, (pt(x3).at(0) - 6, pt(x3).at(1) - 12), $S$)
  W-t(p, (pt(x4).at(0) + 4, pt(x4).at(1) + 14), $Q$)
})
