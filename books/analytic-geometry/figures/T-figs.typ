// 段 T 插图：图 5·11–5·15（原书 p.350–360），读图 200 dpi（页宽约 1024 像素），k = 0.0148 cm/像素。
// 坐标图按方程计算：原点、单位长取原图刻度；转轴后的新轴按书中求得的 θ（tan θ = 2 或 1/2）画，
// 曲线按化简后的标准方程在新坐标系里采样再换回页面坐标。轴线整理为水平、竖直。
#import "/common/geo.typ": *
#let T-k = 0.0148cm
#let T-t(p, pt, body) = { import cetz.draw: *; content(p(..pt), tt(body)) }
// 旋转坐标系：原点 o（页面像素），单位 u 像素，x 轴正向与水平成角 th（逆时针）
// 返回 (X, Y) ↦ 页面像素
#let T-frame(o, u, th) = (X, Y) => (
  o.at(0) + u * (X * calc.cos(th) - Y * calc.sin(th)),
  o.at(1) - u * (X * calc.sin(th) + Y * calc.cos(th)),
)
// 折线曲线：f(t) 给出页面像素坐标，t 从 a 到 b 取 n 段
#let T-curve(p, f, a, b, n: 80, st: lw) = {
  import cetz.draw: *
  line(..range(n + 1).map(i => p(..f(a + (b - a) * i / n))), stroke: st)
}
// 带箭头的轴（细线）
#let T-ax(p, a, b) = { import cetz.draw: *; line(p(..a), p(..b), stroke: lt, mark: arw) }
// 在框架 m 的 X 轴（或 Y 轴）上第 i 个单位处画短刻度
#let T-tick(p, m, i, axis: "X", s: 0.13) = {
  import cetz.draw: *
  if axis == "X" { line(p(..m(i, 0)), p(..m(i, s)), stroke: lt) } else { line(p(..m(0, i)), p(..m(s, i)), stroke: lt) }
}

// 图 5·11（p.350）：4xy − 3x² + 4 = 0，即 y = 3x/4 − 1/x；转轴 tan θ = 2 后为 −x′²/4 + y′² = 1。
// 原点 (474, 569)，单位 22 像素（由曲线端点与原图吻合定出）。
#let fig-T-5-11(width: 420 * T-k) = px-canvas(420, 430, origin: (295, 345), width: width, (p, u) => {
  import cetz.draw: *
  let O = (474, 569)
  let s = 22
  let th = calc.atan(2)
  let m = T-frame(O, s, 0deg)
  let mr = T-frame(O, s, th)
  T-ax(p, (305, 569), (690, 569))
  T-ax(p, (474, 762), (474, 372))
  T-t(p, (701, 570), $x$)
  T-t(p, (481, 358), $y$)
  // 新轴 x′、y′
  T-ax(p, mr(-8.4, 0), mr(8.2, 0))
  T-ax(p, mr(0, -6.6), mr(0, 6.6))
  T-t(p, (563, 400), $x'$)
  T-t(p, (330, 492), $y'$)
  // 渐近线 y = 3x/4（另一条是 y 轴）
  line(p(..m(-6.6, -4.95)), p(..m(6.6, 4.95)), stroke: lt)
  // 以渐近线为对角线的矩形（x′ = ±2，y′ = ±1）
  line(p(..mr(2, 1)), p(..mr(2, -1)), p(..mr(-2, -1)), p(..mr(-2, 1)), close: true, stroke: lt)
  // 双曲线两支
  T-curve(p, t => m(t, 3 * t / 4 - 1 / t), 0.128, 6.3)
  T-curve(p, t => m(t, 3 * t / 4 - 1 / t), -6.3, -0.128)
  // 角 θ
  arc(p(..O), start: 0deg, stop: th, radius: 62, anchor: "origin", stroke: lt)
  T-t(p, (544, 543), $θ$)
  T-t(p, (462, 583), $O$)
  T-t(p, (628, 607), $tan θ = 2$)
})

// 图 5·12（p.352）：4x² + 4xy + y² + 6x − 12y = 0；转轴 tan θ = 1/2 后为 x′² = (6√5/5) y′。
// 原点 (489, 995)，单位 27 像素。
#let fig-T-5-12(width: 440 * T-k) = px-canvas(440, 360, origin: (300, 765), width: width, (p, u) => {
  import cetz.draw: *
  let O = (489, 995)
  let th = calc.atan(0.5)
  let mr = T-frame(O, 27, th)
  T-ax(p, (305, 995), (718, 995))
  T-ax(p, (489, 1118), (489, 778))
  T-t(p, (729, 993), $x$)
  T-t(p, (489, 768), $y$)
  T-ax(p, mr(-5.2, 0), mr(7.5, 0))
  T-ax(p, mr(0, -3.6), mr(0, 6.8))
  T-t(p, (684, 898), $x'$)
  T-t(p, (403, 818), $y'$)
  // 抛物线 y′ = (√5/6) x′²
  T-curve(p, t => mr(t, calc.sqrt(5) / 6 * t * t), -3.9, 3.7)
  arc(p(..O), start: 0deg, stop: th, radius: 52, anchor: "origin", stroke: lt)
  T-t(p, (546, 982), $θ$)
  T-t(p, (479, 1008), $O$)
  T-t(p, (645, 1036), $θ = arctan 1/2$)
})

// 图 5·13（p.358）：2x² + 4xy + 5y² − 4x − 22y + 7 = 0；移轴到 O′(−2, 3)，再转轴 θ = ½ arccot(−3/4)（tan θ = 2），
// 得 6x″² + y″² = 22。原点 (550, 960)，单位 33 像素。
#let fig-T-5-13(width: 480 * T-k) = px-canvas(480, 400, origin: (280, 640), width: width, (p, u) => {
  import cetz.draw: *
  let s = 33
  let O = (550, 960)
  let O1 = (O.at(0) - 2 * s, O.at(1) - 3 * s)
  let th = calc.atan(2)
  let m = T-frame(O, s, 0deg)
  let mr = T-frame(O1, s, th)
  // 原坐标轴
  T-ax(p, (295, 960), (737, 960))
  T-ax(p, (550, 1030), (550, 662))
  T-t(p, (748, 960), $x$)
  T-t(p, (546, 648), $y$)
  for i in (-3, -2, -1, 1, 2, 3) { T-tick(p, m, i) }
  for j in (1, 2, 3, 4, 5) { T-tick(p, m, j, axis: "Y") }
  for (i, l) in ((-3, $-3$), (-2, $-2$), (-1, $-1$), (1, $1$), (2, $2$), (3, $3$)) {
    T-t(p, (O.at(0) + i * s - 2, 975), l)
  }
  T-t(p, (539, 975), $O$)
  for j in (1, 2, 3) { T-t(p, (561, O.at(1) - j * s), $#j$) }
  // 移轴后的 x′、y′ 轴
  T-ax(p, (295, O1.at(1)), (737, O1.at(1)))
  T-ax(p, (O1.at(0), 1030), (O1.at(0), 662))
  T-t(p, (748, 858), $x'$)
  T-t(p, (481, 648), $y'$)
  T-t(p, (470, 876), $O'$)
  // 转轴后的 x″、y″ 轴；y″ 轴上每单位一刻度
  T-ax(p, mr(-5.4, 0), mr(5.6, 0))
  T-ax(p, mr(0, -5.9), mr(0, 6.4))
  T-t(p, (575, 679), $x''$)
  T-t(p, (287, 758), $y''$)
  for i in (-5, -4, -3, -2, -1, 1, 2, 3, 4, 5) { T-tick(p, mr, i, axis: "Y") }
  // 椭圆 6x″² + y″² = 22
  let a = calc.sqrt(22 / 6)
  let b = calc.sqrt(22)
  T-curve(p, t => mr(a * calc.cos(t), b * calc.sin(t)), 0, 2 * calc.pi, n: 120)
  arc(p(..O1), start: 0deg, stop: th, radius: 30, anchor: "origin", stroke: lt)
  T-t(p, (518, 846), $θ$)
  T-t(p, (668, 745), $θ = 1/2 arccot(-3/4)$)
})

// 图 5·14（p.359）：3x² − 10xy + 3y² + 26x − 22y + 35 = 0，即两直线 x − 3y + 7 = 0、3x − y + 5 = 0，交于 O′(−1, 2)。
// 原点 (713, 950)，单位 29 像素。
#let fig-T-5-14(width: 340 * T-k) = px-canvas(340, 340, origin: (570, 715), width: width, (p, u) => {
  import cetz.draw: *
  let s = 29
  let O = (713, 950)
  let m = T-frame(O, s, 0deg)
  let O1 = m(-1, 2)
  T-ax(p, (577, 950), (890, 950))
  T-ax(p, (713, 1048), (713, 730))
  T-t(p, (901, 950), $x$)
  T-t(p, (713, 719), $y$)
  for i in (-2, -1, 1, 2, 3) { T-tick(p, m, i) }
  for j in (1, 2, 3, 4, 5) { T-tick(p, m, j, axis: "Y") }
  for (i, l) in ((-2, $-2$), (-1, $-1$), (1, $1$), (2, $2$), (3, $3$)) {
    T-t(p, (O.at(0) + i * s + (if i > 0 { 4 } else { -2 }), 965), l)
  }
  T-t(p, (723, 965), $O$)
  for j in (1, 2, 3, 4, 5) { T-t(p, (730, O.at(1) - j * s), $#j$) }
  // x′、y′ 轴
  T-ax(p, (577, O1.at(1)), (890, O1.at(1)))
  T-ax(p, (O1.at(0), 1048), (O1.at(0), 730))
  T-t(p, (901, O1.at(1) - 4), $x'$)
  T-t(p, (O1.at(0), 719), $y'$)
  T-t(p, (O1.at(0) + 14, O1.at(1) + 12), $O'$)
  // 两条直线 y = (x + 7)/3、y = 3x + 5
  line(p(..m(-4.7, 2.3 / 3)), p(..m(4.1, 11.1 / 3)), stroke: lw)
  line(p(..m(-2.47, -2.4)), p(..m(0.6, 6.8)), stroke: lw)
})

// 图 5·15（p.360）：x² − 4xy + 4y² − 6√5x − 8√5y − 35 = 0；转轴 tan θ = 1/2，再移轴到 O″（x′ = −2，y′ = 1），
// 得 y″² = 4x″。原点 (285, 1054)，单位 26 像素（O″ 在 x 轴上 x = −√5 处，与原图吻合）。
#let fig-T-5-15(width: 380 * T-k) = px-canvas(380, 380, origin: (110, 850), width: width, (p, u) => {
  import cetz.draw: *
  let s = 26
  let O = (285, 1054)
  let th = calc.atan(0.5)
  let m = T-frame(O, s, 0deg)
  let mr = T-frame(O, s, th)
  let O2 = mr(-2, 1)
  let mrr = T-frame(O2, s, th)
  T-ax(p, (120, 1054), (455, 1054))
  T-ax(p, (285, 1222), (285, 862))
  T-t(p, (467, 1054), $x$)
  T-t(p, (289, 852), $y$)
  for i in (-1, 1, 2) { T-tick(p, m, i) }
  for j in (1, 2) { T-tick(p, m, j, axis: "Y") }
  T-t(p, (311, 1068), $1$)
  T-t(p, (339, 1068), $2$)
  T-t(p, (276, 1020), $1$)
  T-t(p, (276, 997), $2$)
  // 转轴后的 x′、y′ 轴（过 O）
  T-ax(p, mr(-4.7, 0), mr(4.1, 0))
  T-ax(p, mr(0, -4.9), mr(0, 5.3))
  T-t(p, (393, 1000), $x'$)
  T-t(p, (220, 917), $y'$)
  // 移轴后的 x″、y″ 轴（过 O″）
  T-ax(p, mrr(-3.2, 0), mrr(6.0, 0))
  T-ax(p, mrr(0, -6.2), mrr(0, 4.4))
  T-t(p, (374, 970), $x''$)
  T-t(p, (172, 937), $y''$)
  // 抛物线 y″² = 4x″
  T-curve(p, t => mrr(t * t / 4, t), -4.4, 4.4)
  arc(p(..O), start: 0deg, stop: th, radius: 26, anchor: "origin", stroke: lt)
  T-t(p, (322, 1042), $θ$)
  T-t(p, (217, 1067), $O''$)
  T-t(p, (274, 1067), $O$)
})
