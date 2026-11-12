// U 段插图：图 5·16–5·21（原书 p.365–377）。
// 读图：render-pages.py --offset 3 --dpi 200 --grid 100（build/pages-U/g/），坐标为 200 dpi 页面像素（y 向下）。
// 曲线按原图量出的原点、比例和方程算点重画，不照抄手绘的偏差（各图说明见函数上方注释）。
#import "/common/geo.typ": *
#let k = 0.0145cm

#let U-t(p, pt, body, angle: 0deg) = { import cetz.draw: *; content(p(..pt), tt(body), angle: angle) }
#let U-ln(p, a, b, st: lt, ..style) = { import cetz.draw: *; line(p(..a), p(..b), stroke: st, ..style) }
// 坐标轴：o 为原点（页面像素），x 轴从 x0 到 x1，y 轴从下端 y0 到上端 y1
#let U-axes(p, o, x0, x1, y0, y1) = {
  import cetz.draw: *
  let (ox, oy) = o
  line(p(x0, oy), p(x1, oy), stroke: lt, mark: arw)
  line(p(ox, y0), p(ox, y1), stroke: lt, mark: arw)
  U-t(p, (x1 + 11, oy), $x$)
  U-t(p, (ox, y1 - 11), $y$)
}
// 参数曲线：f(t) 返回页面像素坐标
#let U-curve(p, f, t0, t1, n: 72, st: lw) = {
  import cetz.draw: *
  line(..range(n + 1).map(i => p(..f(t0 + (t1 - t0) * i / n))), stroke: st)
}
// 小空心圈（焦点）
#let U-ring(p, c, r: 2.6) = { import cetz.draw: *; circle(p(..c), radius: r, stroke: lt, fill: white) }

// 图 5·16（p.365）：到定点 F 与到定直线 l（y 轴）距离之比为 e 的动点 P 的轨迹（示意）。
// 原图曲线只是示意（未给 e 的值），按原图描：顶点 (691, 912)，x = 691 + 0.01148 (y − 912)²，过 P(772, 828)。
#let fig-U-5-16(width: 300 * k) = px-canvas(300, 335, origin: (612, 712), width: width, (p, u) => {
  import cetz.draw: *
  let o = (647, 912)
  let P = (772, 828)
  let F = (731, 912)
  U-axes(p, o, 647, 885, 1040, 735)
  U-curve(p, t => (691 + 0.01148 * t * t, 912 + t), -112, 112)
  U-ln(p, (647, 828), P)
  U-ln(p, P, (772, 912), st: dsh)
  U-ln(p, F, P, st: dsh)
  pdot(p, F); pdot(p, P)
  U-t(p, (636, 828), $N$)
  U-t(p, (812, 834), $P(x, y)$)
  U-t(p, (781, 900), $M$)
  U-t(p, (636, 924), $O$)
  U-t(p, (758, 930), $F(p, 0)$)
  U-t(p, (639, 1025), $l$)
})

// 图 5·17（p.366）：椭圆的两条准线。中心 (492, 1104)，a = 121，b = 70 像素；准线 x = ±a²/c。P 取在椭圆上 x = 67 像素处。
#let fig-U-5-17(width: 410 * k) = px-canvas(410, 285, origin: (295, 950), width: width, (p, u) => {
  import cetz.draw: *
  let o = (492, 1104)
  let (A, B) = (121, 70)
  let c = calc.sqrt(A * A - B * B)
  let d = A * A / c
  let F1 = (492 - c, 1104)
  let F2 = (492 + c, 1104)
  let Bp = (492, 1104 - B)
  let P = (492 + 67, 1104 - B * calc.sqrt(1 - 67 * 67 / (A * A)))
  let (xl, xr) = (492 - d, 492 + d)
  U-axes(p, o, 302, 695, 1222, 962)
  U-curve(p, t => (492 + A * calc.cos(t), 1104 - B * calc.sin(t)), 0, 2 * calc.pi, n: 120)
  U-ln(p, (xl, 996), (xl, 1200))
  U-ln(p, (xr, 996), (xr, 1200))
  U-ln(p, (xl, Bp.at(1)), Bp, st: dsh)
  U-ln(p, (xl, P.at(1)), (xr, P.at(1)), st: dsh)
  U-ln(p, F1, Bp, st: dsh)
  U-ln(p, F1, P, st: dsh)
  U-ln(p, P, F2, st: dsh)
  pdot(p, F1); pdot(p, F2); pdot(p, Bp); pdot(p, P)
  U-t(p, (xl - 13, Bp.at(1) - 3), $H$)
  U-t(p, (xl - 14, P.at(1) + 6), $N'$)
  U-t(p, (xr + 12, P.at(1)), $N$)
  U-t(p, (xl + 6, 990), $l'$)
  U-t(p, (xr + 6, 990), $l$)
  U-t(p, (xl - 12, 1118), $D'$)
  U-t(p, (492 - A - 8, 1118), $A'$)
  U-t(p, (F1.at(0) + 2, 1120), $F_1$)
  U-t(p, (482, 1118), $O$)
  U-t(p, (F2.at(0) + 3, 1120), $F_2$)
  U-t(p, (492 + A + 9, 1118), $A$)
  U-t(p, (xr + 10, 1118), $D$)
  U-t(p, (502, 1022), $B$)
  U-t(p, (P.at(0) + 2, P.at(1) - 17), $P$)
  U-t(p, (502, 1186), $B'$)
})

// 图 5·18（p.368）：双曲线的两条准线。中心 (521, 1252)，a = 61，c = 100 像素；准线 x = ±a²/c。P 取在右支 y = 127 像素处。
// 焦点字母：原图左为 F₂、右为 F₁，与正文（例 2、图 5·17：F₁ 在左 (−c, 0)，F₂ 在右）相反，按正文改为左 F₁、右 F₂。
#let fig-U-5-18(width: 340 * k) = px-canvas(340, 365, origin: (370, 1050), width: width, (p, u) => {
  import cetz.draw: *
  let o = (521, 1252)
  let (A, c) = (61, 100)
  let B = calc.sqrt(c * c - A * A)
  let d = A * A / c
  let (xl, xr) = (521 - d, 521 + d)
  let yP = 127
  let P = (521 + A * calc.sqrt(1 + yP * yP / (B * B)), 1252 - yP)
  let Fr = (521 + c, 1252)
  let Fl = (521 - c, 1252)
  U-axes(p, o, 378, 698, 1406, 1062)
  let ts = calc.ln(138 / B + calc.sqrt(1 + 138 * 138 / (B * B)))
  for sg in (1, -1) {
    U-curve(p, t => (521 + sg * A * calc.cosh(t), 1252 - B * calc.sinh(t)), -ts, ts)
  }
  U-ln(p, (xl, 1097), (xl, 1378))
  U-ln(p, (xr, 1097), (xr, 1378))
  U-ln(p, (xl, P.at(1)), P, st: dsh)
  U-ln(p, P, Fr, st: dsh)
  pdot(p, Fr); pdot(p, Fl); pdot(p, P)
  U-t(p, (xl - 14, P.at(1) - 2), $N'$)
  U-t(p, (xr + 11, P.at(1) - 14), $N$)
  U-t(p, (P.at(0) + 11, P.at(1) + 6), $P$)
  U-t(p, (Fl.at(0) - 3, 1268), $F_1$)  // 原图作 F₂
  U-t(p, (521 - A - 12, 1268), $A'$)
  U-t(p, (xl - 10, 1268), $D'$)
  U-t(p, (511, 1268), $O$)
  U-t(p, (xr + 9, 1268), $D$)
  U-t(p, (521 + A + 10, 1268), $A$)
  U-t(p, (Fr.at(0) + 6, 1268), $F_2$)  // 原图作 F₁
})

// 图 5·19（p.370）：抛物线 y² = 2px 的切线、焦点半径 FP 与 FQ ⊥ FP，Q 在准线上。
// 原图手绘（焦点位置与曲线开口不符），按方程重画：顶点 O(236, 1095)，p = 60 像素，P 取 x₁ = 50 像素。
#let fig-U-5-19(width: 300 * k) = px-canvas(300, 330, origin: (125, 915), width: width, (p, u) => {
  import cetz.draw: *
  let O = (236, 1095)
  let pp = 60
  let m(x, y) = (236 + x, 1095 - y)
  let x1 = 50
  let y1 = calc.sqrt(2 * pp * x1)
  let P = m(x1, y1)
  let F = m(pp / 2, 0)
  let Q = m(-pp / 2, pp * (x1 - pp / 2) / y1)
  U-axes(p, O, 130, 465, 1238, 932)
  U-ln(p, m(-pp / 2, 140), m(-pp / 2, -138))
  U-curve(p, y => m(y * y / (2 * pp), y), -134, 134)
  U-ln(p, Q, m(132, pp * (132 + x1) / y1))
  U-ln(p, Q, F)
  U-ln(p, F, P)
  rtmark(p, F, Q, P, s: 7)
  pdot(p, Q); pdot(p, P); pdot(p, F)
  U-t(p, (Q.at(0) - 11, Q.at(1) - 2), $Q$)
  U-t(p, (P.at(0) + 39, P.at(1) + 7), $P(x_1, y_1)$)
  U-t(p, (F.at(0) + 30, F.at(1) + 22), $F(p/2, 0)$)
  U-t(p, (227, 1110), $O$)
  U-t(p, (m(-pp / 2, 0).at(0) - 9, 951), $D$)
  U-t(p, (m(-pp / 2, 0).at(0) - 10, 1236), $D'$)
})

// 图 5·20（p.376）：双曲线系 x²/16 − y²/9 = k（k = 16, 9, 4, 1, 0, −1, −4, −9）。原点 (499, 619)，1 单位 = 12.2 像素。
// 各支画到原图所见的长度为止；原图曲线旁的标注作大写“K = …”，与正文小写 k 不一致，按正文改作小写 k。
// 右侧 k = 9 的标注扫描不清（像“K=0”），按正文 k = 16，9，4，1，0，−1，−4，−9 及曲线位置（k = 4 与 k = 16 之间）判读为 k = 9。
#let fig-U-5-20(width: 560 * k) = px-canvas(560, 390, origin: (215, 418), width: width, (p, u) => {
  import cetz.draw: *
  let (ox, oy) = (499, 619)
  let s = 12.2
  let m(x, y) = (ox + s * x, oy - s * y)
  U-axes(p, (ox, oy), 220, 760, 800, 445)
  // 渐近线 3x ± 4y = 0
  for sg in (1, -1) { U-ln(p, m(-19.8, -sg * 14.85), m(19.8, sg * 14.85)) }
  // k > 0：左右两支，ym 为画到的 |y|（单位）
  for (kk, ym) in ((1, 7.4), (4, 11.9), (9, 12.4), (16, 12.2)) {
    let a = 4 * calc.sqrt(kk)
    let b = 3 * calc.sqrt(kk)
    let ts = calc.ln(ym / b + calc.sqrt(1 + ym * ym / (b * b)))
    for sg in (1, -1) { U-curve(p, t => m(sg * a * calc.cosh(t), b * calc.sinh(t)), -ts, ts) }
  }
  // k < 0：上下两支，xm 为画到的 |x|（单位）
  for (kk, xm) in ((1, 12.3), (4, 17.0), (9, 16.5)) {
    let a = 4 * calc.sqrt(kk)
    let b = 3 * calc.sqrt(kk)
    let ts = calc.ln(xm / a + calc.sqrt(1 + xm * xm / (a * a)))
    for sg in (1, -1) { U-curve(p, t => m(a * calc.sinh(t), sg * b * calc.cosh(t)), -ts, ts) }
  }
  U-t(p, (487, 631), $O$)
  U-t(p, (489, 593), $3$)
  U-t(p, (537, 630), $4$)
  U-t(p, (645, 449), $k=-9$, angle: 28deg)
  U-t(p, (598, 502), $k=-4$, angle: 30deg)
  U-t(p, (553, 551), $k=-1$, angle: 33deg)
  U-t(p, (514, 594), $k=0$, angle: 40deg)
  U-t(p, (598, 571), $k=1$, angle: 45deg)
  U-t(p, (655, 547), $k=4$, angle: 50deg)
  U-t(p, (706, 531), $k=9$, angle: 62deg)
  U-t(p, (760, 510), $k=16$, angle: 65deg)
})

// 图 5·21（p.377）：同焦点有心圆锥曲线系（示意）。中心 (495, 636)，c = 81 像素。
// 椭圆短半轴 b = 161、114、57、26 像素；双曲线实半轴 a = 26、44、63、76 像素（读原图渐近方向折算），各支画到距中心约 190–210 像素处，端点加小圆点（原图如此）。
#let fig-U-5-21(width: 460 * k) = px-canvas(460, 420, origin: (268, 440), width: width, (p, u) => {
  import cetz.draw: *
  let (ox, oy) = (495, 636)
  let c = 81
  U-axes(p, (ox, oy), 276, 714, 852, 452)
  for B in (161, 114, 57, 26) {
    let A = calc.sqrt(B * B + c * c)
    U-curve(p, t => (ox + A * calc.cos(t), oy - B * calc.sin(t)), 0, 2 * calc.pi, n: 120)
  }
  for (A, R) in ((26, 190), (44, 193), (63, 198), (76, 208)) {
    let B = calc.sqrt(c * c - A * A)
    // 解 A²ch² + B²sh² = R²：sh² = (R² − A²)/(A² + B²)
    let sh = calc.sqrt((R * R - A * A) / (A * A + B * B))
    let ts = calc.ln(sh + calc.sqrt(1 + sh * sh))
    for sg in (1, -1) {
      U-curve(p, t => (ox + sg * A * calc.cosh(t), oy - B * calc.sinh(t)), -ts, ts)
      for e in (-1, 1) {
        pdot(p, (ox + sg * A * calc.cosh(ts), oy - e * B * calc.sinh(ts)), r: 2.8)
      }
    }
  }
  U-ring(p, (ox - c, oy)); U-ring(p, (ox + c, oy))
  content(p(ox - c - 16, oy - 14), box(fill: white, inset: 0.6pt, tt($F_1$)))
  content(p(ox + c + 17, oy - 14), box(fill: white, inset: 0.6pt, tt($F_2$)))
  U-t(p, (ox - 10, oy + 13), $O$)
})
