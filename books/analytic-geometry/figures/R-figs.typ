// R 段插图：图 4·69–4·80（原书 p.301–315）、本章提要表内三幅小图（p.316）、复习题四第 4 题图（p.318）。
// 读图：render-pages.py --offset 3 --dpi 200 --grid 100（build/pages-R/g/），坐标为 200 dpi 页面像素（y 向下）。
// 曲线（椭圆、双曲线、抛物线）按原图量出的原点、比例和题中方程算点重画，切线、法线按方程算斜率，不照抄手绘的偏差。
// 图 4·74 右半的太阳能灶是写实插画，用扫描裁剪二值化 PNG：figures/R-4-74.png
//   （crop-figure.py original/analytic-geometry.pdf 310 "478,335,870,765" --offset 3 --dpi 400 --threshold 170）。
#import "/common/geo.typ": *
#let k = 0.0145cm

#let R-t(p, pt, body) = { import cetz.draw: *; content(p(..pt), tt(body)) }
#let R-ts(p, pt, body) = { import cetz.draw: *; content(p(..pt), tsm(body)) }
// 细线 / 虚线段
#let R-ln(p, a, b, st: lt, ..style) = { import cetz.draw: *; line(p(..a), p(..b), stroke: st, ..style) }
// 坐标轴：o 为原点（页面像素），x 轴从 x0 到 x1，y 轴从下端 y0 到上端 y1
#let R-axes(p, o, x0, x1, y0, y1, ol: (-10, 12), olab: $O$) = {
  import cetz.draw: *
  let (ox, oy) = o
  line(p(x0, oy), p(x1, oy), stroke: lt, mark: arw)
  line(p(ox, y0), p(ox, y1), stroke: lt, mark: arw)
  R-t(p, (x1 + 11, oy), $x$)
  R-t(p, (ox, y1 - 11), $y$)
  if olab != none { R-t(p, (ox + ol.at(0), oy + ol.at(1)), olab) }
}
// 参数曲线：f(t) 返回页面像素坐标
#let R-curve(p, f, t0, t1, n: 72, st: lw) = {
  import cetz.draw: *
  line(..range(n + 1).map(i => p(..f(t0 + (t1 - t0) * i / n))), stroke: st)
}
// 经过页面点 P、数学斜率 sl（y 向上）的直线，取 x 从 xa 到 xb 的一段
#let R-sline(p, P, sl, xa, xb, st: lt) = R-ln(p, (xa, P.at(1) - sl * (xa - P.at(0))), (xb, P.at(1) - sl * (xb - P.at(0))), st: st)
// 两点连线向 b 外延长 f 倍
#let R-ext(a, b, f) = (b.at(0) + f * (b.at(0) - a.at(0)), b.at(1) + f * (b.at(1) - a.at(1)))
// 双曲线一支：中心 o，半轴 A、B（像素），sg = 1 右支、-1 左支，t 为双曲参数
#let R-hyp(p, o, A, B, sg, t0, t1) = R-curve(p, t => (o.at(0) + sg * A * calc.cosh(t), o.at(1) - B * calc.sinh(t)), t0, t1)
// 椭圆（中心 o，半轴 A、B，像素）
#let R-ell(p, o, A, B) = R-curve(p, t => (o.at(0) + A * calc.cos(t), o.at(1) - B * calc.sin(t)), 0, 2 * calc.pi, n: 120)
// 开口向右的抛物线 y² = 2Px（顶点 v，像素），纵向偏移 y 从 ya 到 yb（数学方向，向上为正）
#let R-par(p, v, P, ya, yb) = R-curve(p, y => (v.at(0) + y * y / (2 * P), v.at(1) - y), ya, yb)
// 小空心圈（焦点）
#let R-ring(p, c, r: 2.6) = { import cetz.draw: *; circle(p(..c), radius: r, stroke: lt, fill: white) }
// 中间带箭头的线段（箭头指向 b）
#let R-arrowseg(p, a, b, st: lt, at: 0.55) = {
  import cetz.draw: *
  let m = (a.at(0) + at * (b.at(0) - a.at(0)), a.at(1) + at * (b.at(1) - a.at(1)))
  line(p(..a), p(..m), stroke: st, mark: arw)
  line(p(..m), p(..b), stroke: st)
}

// 图 4·69（p.301）：双曲线 x² − 4y² = 9 与斜率为 −2 的两条切线。原点 (466, 1237)，1 单位 ≈ 28.7 像素。
#let fig-R-4-69(width: 510 * k) = px-canvas(510, 400, origin: (250, 1000), width: width, (p, u) => {
  import cetz.draw: *
  let o = (466, 1237)
  let s = 28.7
  let m(x, y) = (o.at(0) + s * x, o.at(1) - s * y)
  R-axes(p, o, 255, 705, 1385, 1035, ol: (-12, 14))
  R-hyp(p, o, 3 * s, 1.5 * s, 1, -1.5, 1.5)
  R-hyp(p, o, 3 * s, 1.5 * s, -1, -1.5, 1.5)
  let mm = 1.5 * calc.sqrt(15)
  R-ln(p, m((mm - 4.25) / 2, 4.25), m((mm + 4.1) / 2, -4.1))
  R-ln(p, m(-(mm - 4.25) / 2, -4.25), m(-(mm + 4.1) / 2, 4.1))
  let P = m(18 / mm, -2.25 / mm)
  let P2 = m(-18 / mm, 2.25 / mm)
  pdot(p, P); pdot(p, P2)
  R-t(p, (P.at(0) - 15, P.at(1) + 13), $P$)
  R-t(p, (P2.at(0) + 16, P2.at(1) - 8), $P'$)
})

// 图 4·70（p.304）：椭圆 7x² + 3y² = 28 与斜率为 2/3 的两条切线。原点 (258, 1012)，1 单位 ≈ 36.6 像素。
#let fig-R-4-70(width: 330 * k) = px-canvas(330, 440, origin: (125, 785), width: width, (p, u) => {
  import cetz.draw: *
  let o = (258, 1012)
  let s = 36.6
  let m(x, y) = (o.at(0) + s * x, o.at(1) - s * y)
  R-axes(p, o, 150, 440, 1205, 810, ol: (-10, 14))
  R-ell(p, o, 2 * s, calc.sqrt(28 / 3) * s)
  for i in (-1, 1) { R-ln(p, m(i, 0), (m(i, 0).at(0), o.at(1) - 4)) }
  for j in (-2, -1, 1, 2) { R-ln(p, m(0, j), (o.at(0) + 4, m(0, j).at(1))) }
  R-t(p, (m(-1, 0).at(0) - 3, o.at(1) - 10), $1$)
  R-t(p, (m(1, 0).at(0) + 3, o.at(1) - 10), $1$)
  R-ln(p, m(-2.95, 2 / 3 * -2.95 + 10 / 3), m(1.5, 2 / 3 * 1.5 + 10 / 3))
  R-ln(p, m(-1.31, 2 / 3 * -1.31 - 10 / 3), m(3.25, 2 / 3 * 3.25 - 10 / 3))
  pdot(p, m(-0.8, 2.8), r: 1.8); pdot(p, m(0.8, -2.8))
  R-t(p, (182, 880), $(-4/5, 14/5)$)
  R-t(p, (350, 1127), $(4/5, -14/5)$)
})

// 图 4·71（p.305）：抛物线 y² = 5x 与圆 x² + y² = (4/3)² 的两条公切线 y = ±(3/4 x + 5/3)。原点 (446, 1157)，1 单位 ≈ 31 像素。
#let fig-R-4-71(width: 400 * k) = px-canvas(400, 530, origin: (320, 870), width: width, (p, u) => {
  import cetz.draw: *
  let o = (446, 1157)
  let s = 31
  let m(x, y) = (o.at(0) + s * x, o.at(1) - s * y)
  R-axes(p, o, 330, 700, 1390, 895, ol: (-9, 12))
  circ(p, o, 4 / 3 * s)
  R-par(p, o, 2.5 * s, -5.9 * s, 5.9 * s)
  R-ln(p, m(-20 / 9, 0), m(6.6, 0.75 * 6.6 + 5 / 3))
  R-ln(p, m(-20 / 9, 0), m(6.6, -(0.75 * 6.6 + 5 / 3)))
})

// 图 4·72（p.308）：抛物线 y² = 2px 的切线、法线和焦点半径。直接用页面像素：顶点 O(233, 588)，p = 60 像素，P 的 y₁ = 90 像素。
#let fig-R-4-72(width: 480 * k) = px-canvas(360, 345, origin: (100, 385), width: width, (p, u) => {
  import cetz.draw: *
  let O = (233, 588)
  let pp = 60
  let F = (263, 588)
  let P = (233 + 90 * 90 / (2 * pp), 498)
  let T = (233 - 90 * 90 / (2 * pp), 588)
  let N = (P.at(0) + pp, 588)
  let Q = (203, 498)
  R-axes(p, O, 100, 440, 725, 400, olab: none)
  R-ln(p, (203, 450), (203, 722))
  R-par(p, O, pp, -118, 125)
  R-sline(p, P, pp / 90, 110, 390)
  R-sline(p, P, -90 / pp, 262, 400)
  R-ln(p, F, R-ext(F, P, 0.65))
  R-ln(p, Q, P)
  R-ln(p, P, (415, 498), st: dsh)
  pdot(p, F); pdot(p, P)
  anglearc(p, P, (415, 498), R-ext(T, P, 0.5), 22)
  anglearc(p, P, (415, 498), N, 13)
  anglearc(p, P, N, F, 13)
  anglearc(p, P, T, F, 19)
  anglearc(p, T, N, P, 20)
  anglearc(p, F, N, P, 13)
  R-t(p, (311, 474), $P$)
  R-t(p, (190, 498), $Q$)
  R-t(p, (356, 484), $β_1$)
  R-t(p, (334, 510), $α_1$)
  R-t(p, (308, 527), $α_2$)
  R-t(p, (276, 531), $β_2$)
  R-t(p, (157, 577), $T$)
  R-t(p, (195, 580), $α$)
  R-t(p, (224, 601), $O$)
  R-t(p, (263, 603), $F$)
  R-t(p, (288, 573), $θ$)
  R-t(p, (370, 573), $N$)
  R-t(p, (427, 494), $E$)
  // p/2 的尺寸记号
  R-ln(p, (170, 685), (203, 685), mark: arw)
  R-ln(p, (266, 685), (233, 685), mark: arw)
  R-t(p, (218, 690), $p/2$)
  R-t(p, (393, 714), $y^2 = 2p x$)
})

// 图 4·73（p.309）：平行光线经抛物镜面反射后聚于焦点。顶点 (650, 1110)，焦距 28 像素。
#let fig-R-4-73(width: 310 * k) = px-canvas(310, 250, origin: (590, 990), width: width, (p, u) => {
  import cetz.draw: *
  let V = (650, 1110)
  let F = (678, 1110)
  line(p(600, 1110), p(880, 1110), stroke: lt, mark: arw)
  R-t(p, (893, 1110), $x$)
  R-par(p, V, 56, -112, 100)
  for dy in (85, 63, 42, 22) {
    let H = (650 + dy * dy / 112, 1110 - dy)
    line(p(835, H.at(1)), p(790, H.at(1)), stroke: lt, mark: arw)
    R-ln(p, (790, H.at(1)), H)
    R-ln(p, H, F, st: dsh)
  }
  R-ring(p, F)
  R-t(p, (676, 1127), $F$)
})

// 图 4·74（p.310）：左为抛物镜面聚光示意（CeTZ），右为太阳能灶（扫描插画）。顶点 (225, 553)，焦距 30 像素。
#let fig-R-4-74-a(width: 310 * k) = px-canvas(310, 250, origin: (155, 435), width: width, (p, u) => {
  import cetz.draw: *
  let V = (225, 553)
  let F = (255, 553)
  R-ln(p, (165, 553), (445, 553))
  line(p(380, 553), p(345, 553), stroke: lt, mark: arw)
  R-t(p, (456, 553), $x$)
  R-par(p, V, 60, -112, 106)
  for dy in (88, 68, 46, 25) {
    let H = (225 + dy * dy / 120, 553 - dy)
    line(p(380, H.at(1)), p(345, H.at(1)), stroke: lt, mark: arw)
    R-ln(p, (345, H.at(1)), H)
    R-ln(p, H, F, st: dsh)
  }
  R-ring(p, F)
  R-t(p, (252, 569), $F$)
})
#let fig-R-4-74() = grid(columns: 2, column-gutter: 1.2em, align: bottom,
  fig-R-4-74-a(), image("R-4-74.png", width: 392 * k))

// 图 4·75（p.311）：椭圆的切线 PT、法线 PN 与两条焦点半径。中心 (480, 404)，a = 171，b = 90 像素。
#let fig-R-4-75(width: 490 * k) = px-canvas(490, 370, origin: (230, 200), width: width, (p, u) => {
  import cetz.draw: *
  let o = (480, 404)
  let (A, B) = (171, 90)
  let c = calc.sqrt(A * A - B * B)
  let F1 = (480 - c, 404)
  let F2 = (480 + c, 404)
  let x1 = 71
  let y1 = B * calc.sqrt(1 - x1 * x1 / (A * A))
  let P = (480 + x1, 404 - y1)
  let kt = -(B * B * x1) / (A * A * y1)
  R-axes(p, o, 245, 695, 560, 225, olab: none)
  R-ell(p, o, A, B)
  R-sline(p, P, kt, 270, 645)
  R-sline(p, P, -1 / kt, P.at(0) - 30, P.at(0) + 8)
  R-ln(p, P, F1); R-ln(p, P, F2)
  R-ring(p, F1); pdot(p, F2); pdot(p, P)
  anglearc(p, P, F1, F2, 11)
  R-t(p, (260, 248), $T$)
  R-t(p, (612, 312), $P(x_1, y_1)$)
  R-t(p, (527, 347), $α_2$)
  R-t(p, (561, 357), $α_1$)
  R-t(p, (366, 428), $F_1 (-c, 0)$)
  R-t(p, (467, 422), $O$)
  R-t(p, (655, 431), $F_2 (c, 0)$)
  R-t(p, (517, 392), $N$)
})

// 图 4·76（p.313）：从椭圆一个焦点发出的光线经反射集中到另一个焦点。按 a = 152、b = 92 像素重画（原图手绘略斜）。
#let fig-R-4-76(width: 490 * k) = px-canvas(490, 240, origin: (295, 385), width: width, (p, u) => {
  import cetz.draw: *
  let o = (530, 505)
  let (A, B) = (152, 92)
  let c = calc.sqrt(A * A - B * B)
  let F1 = (530 - c, 505)
  let F2 = (530 + c, 505)
  R-ln(p, (300, 505), (780, 505))
  R-ell(p, o, A, B)
  let pt(th) = (530 + A * calc.cos(th), 505 - B * calc.sin(th))
  for th in (100deg, 73deg, 45deg, 15deg) {
    let H = pt(th)
    R-arrowseg(p, F1, H, st: dsh)
    R-arrowseg(p, H, F2, st: dsh, at: 0.7)
  }
  let P = pt(73deg)
  let d = (-A * calc.sin(73deg), -B * calc.cos(73deg))
  let dl = calc.sqrt(d.at(0) * d.at(0) + d.at(1) * d.at(1))
  R-ln(p, (P.at(0) - 90 * d.at(0) / dl, P.at(1) - 90 * d.at(1) / dl), (P.at(0) + 90 * d.at(0) / dl, P.at(1) + 90 * d.at(1) / dl))
  R-ring(p, F1); R-ring(p, F2)
  R-t(p, (P.at(0) + 10, P.at(1) - 14), $P$)
  R-t(p, (F1.at(0) - 4, 525), $F_1$)
  R-t(p, (F2.at(0) + 4, 525), $F_2$)
})

// 图 4·77（p.313）：双曲线的切线 PT 平分两条焦点半径的夹角。中心 (445, 1220)，a = 90，b = 52 像素。
#let fig-R-4-77(width: 505 * k) = px-canvas(505, 350, origin: (245, 1050), width: width, (p, u) => {
  import cetz.draw: *
  let o = (445, 1220)
  let (A, B) = (90, 52)
  let c = calc.sqrt(A * A + B * B)
  let F1 = (445 - c, 1220)
  let F2 = (445 + c, 1220)
  let x1 = 145
  let y1 = B * calc.sqrt(x1 * x1 / (A * A) - 1)
  let P = (445 + x1, 1220 - y1)
  let kt = (B * B * x1) / (A * A * y1)
  let T = (445 + A * A / x1, 1220)
  R-axes(p, o, 255, 720, 1390, 1072, olab: none)
  R-hyp(p, o, A, B, 1, -1.42, 1.42)
  R-hyp(p, o, A, B, -1, -1.42, 1.42)
  R-sline(p, P, kt, 420, 655)
  R-sline(p, P, -1 / kt, 540, 668)
  R-ln(p, P, F1)
  R-ln(p, P, F2, st: dsh)
  anglearc(p, P, F2, T, 20)
  R-ring(p, F1); R-ring(p, F2); pdot(p, P)
  R-t(p, (530, 1080), $N$)
  R-t(p, (642, 1160), $P(x_1, y_1)$)
  R-t(p, (332, 1238), $F_1$)
  R-t(p, (430, 1236), $O$)
  R-t(p, (T.at(0) + 12, 1236), $T$)
  R-t(p, (F2.at(0) + 6, 1240), $F_2$)
})

// 图 4·78（p.314）：从焦点 F₂ 发出的光线经双曲线右支反射后，好像从 F₁ 发出。中心 (450, 570)，a = 88，b = 57 像素。
#let fig-R-4-78(width: 480 * k) = px-canvas(480, 430, origin: (230, 345), width: width, (p, u) => {
  import cetz.draw: *
  let o = (450, 570)
  let (A, B) = (88, 57)
  let c = calc.sqrt(A * A + B * B)
  let F1 = (450 - c, 570)
  let F2 = (450 + c, 570)
  R-axes(p, o, 240, 690, 765, 370, ol: (-12, 12))
  R-hyp(p, o, A, B, 1, -1.55, 1.55)
  R-hyp(p, o, A, B, -1, -1.55, 1.55)
  for dy in (-92, -70, -45, -22, 22, 45, 70, 92) {
    let H = (450 + A * calc.sqrt(1 + dy * dy / (B * B)), 570 + dy)
    R-ln(p, F1, H, st: dsh)
    R-ln(p, F2, H, st: dotted)
    let f = (690 - H.at(0)) / (H.at(0) - F1.at(0))
    line(p(..H), p(..R-ext(F1, H, f)), stroke: lt, mark: arw)
  }
  R-ring(p, F1); R-ring(p, F2)
  R-t(p, (F1.at(0) - 10, 590), $F_1$)
  R-t(p, (F2.at(0) + 14, 586), $F_2$)
})

// 图 4·79（p.314）：抛物线 y² = 4x 上 P(9, 6) 点的入射线 FP 与反射线 PE。原点 (368, 1091)，1 单位 = 17 像素。
#let fig-R-4-79(width: 420 * k) = px-canvas(420, 360, origin: (320, 900), width: width, (p, u) => {
  import cetz.draw: *
  let o = (368, 1091)
  let s = 17
  let m(x, y) = (o.at(0) + s * x, o.at(1) - s * y)
  R-axes(p, o, 330, 715, 1250, 925, ol: (-10, 13))
  for i in range(1, 15) { R-ln(p, m(i, 0), (m(i, 0).at(0), o.at(1) - 4)) }
  for j in (-8, -7, -6, -5, -4, -3, -2, -1, 1, 2, 3, 4, 5, 6, 7, 8) { R-ln(p, m(0, j), (o.at(0) + 4, m(0, j).at(1))) }
  R-par(p, o, 2 * s, -7.6 * s, 7.4 * s)
  let P = m(9, 6)
  let F = m(1, 0)
  R-ln(p, F, P)
  R-ln(p, P, (625, P.at(1)))
  pdot(p, F); pdot(p, P)
  R-t(p, (488, 970), $P(9, 6)$)
  R-t(p, (412, 1108), $F(1, 0)$)
  R-t(p, (638, P.at(1)), $E$)
})

// 图 4·80（p.315）：用几何方法作椭圆在 P 点的切线、法线。中心 (500, 970)，a = 121，b = 66 像素。
#let fig-R-4-80(width: 450 * k) = px-canvas(375, 200, origin: (325, 855), width: width, (p, u) => {
  import cetz.draw: *
  let o = (500, 970)
  let (A, B) = (121, 66)
  let c = calc.sqrt(A * A - B * B)
  let F1 = (500 - c, 970)
  let F2 = (500 + c, 970)
  let x1 = 69
  let y1 = B * calc.sqrt(1 - x1 * x1 / (A * A))
  let P = (500 + x1, 970 - y1)
  let kt = -(B * B * x1) / (A * A * y1)
  R-ln(p, (335, 970), (690, 970))
  R-ell(p, o, A, B)
  R-ln(p, F1, R-ext(F1, P, 0.25))
  R-ln(p, F2, R-ext(F2, P, 0.9))
  R-sline(p, P, kt, 488, 640)
  let xn = P.at(0) - y1 / (-1 / kt)  // 法线与长轴的交点 N
  R-sline(p, P, -1 / kt, xn - 6, P.at(0) + 18)
  // 圆规作角平分线时画的弧
  arc(p(P.at(0) + 22 * calc.cos(200deg), P.at(1) - 22 * calc.sin(200deg)), start: 200deg, stop: 340deg, radius: 22, stroke: lt)
  pdot(p, F1); pdot(p, F2); pdot(p, P, r: 1.8)
  R-t(p, (482, 877), $T$)
  R-t(p, (578, 899), $P$)
  R-t(p, (406, 990), $F_1$)
  R-t(p, (xn + 9, 987), $N$)
  R-t(p, (597, 989), $F_2$)
})

// 复习题四第 4 题图（p.318）：圆 x² + y² = r² 与纵坐标压缩一半的椭圆。原点 (483, 962)，r = 119 像素。
#let fig-R-q4(width: 370 * k) = px-canvas(370, 340, origin: (330, 765), width: width, (p, u) => {
  import cetz.draw: *
  let o = (483, 962)
  let r = 119
  R-axes(p, o, 340, 675, 1100, 790, ol: (-12, 14))
  circ(p, o, r)
  R-ell(p, o, r, r / 2)
  let x1 = 52
  let P1 = (483 + x1, 962 - calc.sqrt(r * r - x1 * x1))
  let P = (483 + x1, 962 - calc.sqrt(r * r - x1 * x1) / 2)
  let M = (483 + x1, 962)
  R-ln(p, P1, M, st: dsh)
  pdot(p, P1); pdot(p, P)
  R-t(p, (596, 838), $P_1 (x_1, y_1)$)
  R-t(p, (510, 921), $P(x, y)$)
  R-t(p, (537, 978), $M$)
})

// 本章提要表（p.316）里的三幅小图：椭圆、双曲线、抛物线（示意，不按比例量取）。
#let R-mini(draw) = px-canvas(200, 125, origin: (0, 0), width: 3.5cm, draw)
#let R-mini-axes(p) = {
  import cetz.draw: *
  line(p(15, 62), p(180, 62), stroke: lt, mark: arw)
  line(p(100, 120), p(100, 8), stroke: lt, mark: arw)
  R-ts(p, (189, 62), $x$)
  R-ts(p, (100, 0), $y$)
}
#let fig-R-sum-ell() = R-mini((p, u) => {
  import cetz.draw: *
  R-mini-axes(p)
  R-ell(p, (100, 62), 60, 38)
  let c = calc.sqrt(60 * 60 - 38 * 38)
  R-ln(p, (100, 24), (100 + c, 62), st: dsh)
  pdot(p, (100 - c, 62), r: 1.6); pdot(p, (100 + c, 62), r: 1.6)
  R-ts(p, (94, 43), $b$)
  R-ts(p, (128, 38), $a$)
  R-ts(p, (122, 70), $c$)
  R-ts(p, (93, 71), $O$)
  R-ts(p, (100 - c, 72), $F_1$)
  R-ts(p, (100 + c + 5, 72), $F_2$)
})
#let fig-R-sum-hyp() = R-mini((p, u) => {
  import cetz.draw: *
  R-mini-axes(p)
  R-hyp(p, (100, 62), 30, 22, 1, -1.45, 1.45)
  R-hyp(p, (100, 62), 30, 22, -1, -1.45, 1.45)
  let c = calc.sqrt(30 * 30 + 22 * 22)
  R-ln(p, (100, 40), (130, 62), st: dsh)
  pdot(p, (100, 40), r: 1.4)
  pdot(p, (100 - c, 62), r: 1.6); R-ring(p, (100 + c, 62), r: 1.8)
  R-ts(p, (94, 50), $b$)
  R-ts(p, (120, 45), $c$)
  R-ts(p, (116, 71), $a$)
  R-ts(p, (93, 71), $O$)
  R-ts(p, (100 - c - 7, 74), $F_1$)
  R-ts(p, (100 + c + 9, 74), $F_2$)
})
#let fig-R-sum-par() = R-mini((p, u) => {
  import cetz.draw: *
  R-mini-axes(p)
  R-par(p, (100, 62), 24, -50, 48)
  R-ln(p, (88, 15), (88, 112), st: dsh)
  pdot(p, (112, 62), r: 1.6)
  R-ts(p, (94, 71), $O$)
  R-ts(p, (116, 71), $F$)
})
