// X 段插图：图 7·1–7·12（原书 p.420–433）、习题 7·1~7·2 的不编号小图（p.434–437）。
// 极坐标图不描像素：网格（同心圆、每 15° 一条射线）、点、曲线一律按极坐标方程计算后画出。
// 画布坐标就是直角坐标 (x, y) = (ρ cos θ, ρ sin θ)，单位长度按每幅图的外圆半径 R 换算（外圆半径约 2.2 cm）。
// 网格的圆数、刻度位置、外圆所代表的 ρ 值按原图量取（读图 150/300 dpi，见源码各图注释）。
#import "/common/geo.typ": *

#let X-rad(d) = d * calc.pi / 180
#let X-pt(r, d) = (r * calc.cos(X-rad(d)), r * calc.sin(X-rad(d)))
// 文字（8pt 宋体），pos 为画布坐标
#let X-t(pos, body, anc: none) = { import cetz.draw: *; if anc == none { content(pos, tt(body)) } else { content(pos, tt(body), anchor: anc) } }

// 极坐标曲线 ρ = f(θ)（θ 以弧度计），θ 从 t0 到 t1；|ρ| 超过 lim 的部分不画（分段断开）
#let X-curve(f, t0, t1, n: 240, lim: none, st: lw) = {
  import cetz.draw: *
  let segs = ()
  let cur = ()
  for i in range(n + 1) {
    let t = t0 + (t1 - t0) * i / n
    let r = f(t)
    if r == none or (lim != none and calc.abs(r) > lim) {
      if cur.len() > 1 { segs.push(cur) }
      cur = ()
    } else {
      cur.push((r * calc.cos(t), r * calc.sin(t)))
    }
  }
  if cur.len() > 1 { segs.push(cur) }
  for s in segs { line(..s, stroke: st) }
}

// 极坐标网格：外圆代表 ρ = R，n 个等距同心圆；射线每 15° 一条。
//   labs：在外圆外标注的角度及文字，((30, $30°$), …)；这些射线伸出外圆
//   dots：伸出外圆、末端加粗点的射线角度（原图未标度数的 15° 奇数倍射线）
//   ticks：极轴上的刻度数字 ((ρ 值, 文字), …)，排在极轴下方、该圆的左侧
//   dashaxes：把 90°–270° 线、180° 线画成虚线（图 7·4）
#let X-deg30 = range(1, 12).map(i => (i * 30, [$#(i * 30)°$]))
#let X-dot15 = (15, 45, 75, 105, 135, 165, 195, 225, 255, 285, 315, 345)
#let X-grid(R, n: 15, labs: X-deg30, dots: X-dot15, ticks: (), dashaxes: false, olab: (-0.55, -0.6), xlab: true) = {
  import cetz.draw: *
  let s = R / 2.2               // 1 cm 对应的画布单位
  let thin = 0.35pt
  // 同心圆
  for i in range(1, n) { circle((0, 0), radius: R * i / n, stroke: thin) }
  circle((0, 0), radius: R, stroke: 0.8pt)
  circle((0, 0), radius: R / n * 0.45, stroke: thin)
  // 射线（极轴除外）
  for k in range(1, 24) {
    let d = k * 15
    if dashaxes and d in (90, 180, 270) { continue }
    line(X-pt(R / n * 0.45, d), X-pt(R, d), stroke: thin)
  }
  // 伸出外圆的射线
  for (d, body) in labs {
    if not (dashaxes and d in (90, 180, 270)) { line(X-pt(R, d), X-pt(R + 0.3 * s, d), stroke: thin) }
    let c = calc.cos(X-rad(d))
    let sn = calc.sin(X-rad(d))
    content((R * c + (0.3 + 0.32) * s * c, R * sn + (0.3 + 0.22) * s * sn), tt(body))
  }
  for d in dots {
    line(X-pt(R, d), X-pt(R + 0.28 * s, d), stroke: thin)
    line(X-pt(R + 0.16 * s, d), X-pt(R + 0.3 * s, d), stroke: 1.4pt)
  }
  if dashaxes {
    line(X-pt(R + 0.3 * s, 90), X-pt(R + 0.3 * s, 270), stroke: dsh)
    line((0, 0), X-pt(R + 0.3 * s, 180), stroke: dsh)
  }
  // 极轴
  if xlab {
    line((0, 0), (R + 0.55 * s, 0), stroke: lw, mark: arw)
    content((R + 0.75 * s, 0), tt($x$))
  }
  content((olab.at(0) * s * 0.25, olab.at(1) * s * 0.25), tt($O$))
  for (v, body) in ticks { content((v - 0.12 * s, -0.17 * s), tsm(body)) }
}
#let X-canvas(R, body, w: 2.2cm) = {
  set par(first-line-indent: 0em, justify: false, leading: 0.4em)
  cetz.canvas(length: w / R, body)
}
// 实心点、空心点（半径以 cm 计）
#let X-dot(R, pos, r: 0.055) = { import cetz.draw: *; circle(pos, radius: r * R / 2.2, fill: black, stroke: none) }
#let X-ring(R, pos, r: 0.055) = { import cetz.draw: *; circle(pos, radius: r * R / 2.2, fill: white, stroke: 0.6pt) }
// 角弧：从 d0° 到 d1°，半径 r（画布单位），可带箭头
#let X-arc(r, d0, d1, mk: none) = {
  import cetz.draw: *
  let n = 24
  line(..range(n + 1).map(i => X-pt(r, d0 + (d1 - d0) * i / n)), stroke: lt, mark: mk)
}

// 图 7·1（p.420）：外圆 ρ = 5，每单位 3 个圆；OC 与极轴成 45°，P(5, 45°)
#let fig-X-7-1() = X-canvas(5, {
  import cetz.draw: *
  let R = 5
  X-grid(R, ticks: range(1, 6).map(i => (i, [#i])))
  line((0, 0), X-pt(R * 1.14, 45), stroke: lb)
  X-dot(R, X-pt(5, 45))
  X-t(X-pt(R * 1.2, 47), $C$)
  X-t((X-pt(5, 45).at(0) + 0.2, X-pt(5, 45).at(1) + 0.05), $P(5, 45°)$, anc: "west")
  X-arc(0.8, 0, 45, mk: arw)
  X-t(X-pt(1.1, 22), $θ$)
  X-t(X-pt(2.7, 52), $ρ$)
})

// 图 7·2（p.421）：外圆 ρ = 6（每单位 3 个圆）；P(5, 45°)，P′ 在 CO 的延长线上，OP′ = −5
#let fig-X-7-2() = X-canvas(6, {
  import cetz.draw: *
  let R = 6
  X-grid(R, n: 18, ticks: range(1, 7).map(i => (i, [#i])))
  line((0, 0), X-pt(R * 1.14, 45), stroke: lb)
  line((0, 0), X-pt(5.6, 225), stroke: (paint: black, thickness: 1.1pt, dash: "dashed"))
  X-dot(R, X-pt(5, 45))
  X-dot(R, X-pt(5, 225))
  X-t(X-pt(R * 1.2, 47), $C$)
  X-t(X-pt(5.45, 37), $P$)
  X-t(X-pt(5.4, 233), $P'$)
  X-arc(0.9, 0, 45, mk: arw)
  X-t(X-pt(1.25, 22), $θ$)
})

// 图 7·3（p.422）：外圆 ρ = 10；OC、OD 与极轴成 ±30°，P₁(P₅)、P₂(P₆)、P₃、P₄ 都在外圆上
#let fig-X-7-3() = X-canvas(10, {
  import cetz.draw: *
  let R = 10
  X-grid(R, n: 10, ticks: ((1, [1]), (10, [10])))
  line(X-pt(R, 210), X-pt(R * 1.12, 30), stroke: lb)
  line(X-pt(R, 150), X-pt(R * 1.12, 330), stroke: lb)
  X-arc(2.6, 0, 30, mk: arw)
  X-arc(2.1, 0, -30, mk: arw)
  for d in (30, 330) { X-dot(R, X-pt(R, d)) }
  for d in (150, 210) { X-ring(R, X-pt(R, d)) }
  X-t(X-pt(R * 1.2, 36), $C$)
  X-t(X-pt(R * 1.3, 318), $D$)
  X-t(X-pt(R * 0.86, 37), $P_1$)
  X-t(X-pt(R * 1.1, 24), $P_5$)
  X-t(X-pt(R * 1.1, 336), $P_2$)
  X-t(X-pt(R * 0.86, 323), $P_6$)
  X-t(X-pt(R * 0.88, 154), $P_3$)
  X-t(X-pt(R * 0.88, 206), $P_4$)
})

// 图 7·4（p.423）：外圆 ρ = 15；Oy 线（90°）与 180° 线为虚线；P₁–P₄ 在外圆上
#let fig-X-7-4() = X-canvas(15, {
  import cetz.draw: *
  let R = 15
  X-grid(R, labs: X-deg30.filter(((d, b)) => d != 90), dashaxes: true, ticks: ((5, [5]), (10, [10]), (15, [15])))
  X-t(X-pt(R * 1.27, 90), $y$)
  for d in (30, 150, 210, 330) { line((0, 0), X-pt(R, d), stroke: lb) }
  for d in (30, 150) { X-dot(R, X-pt(R, d)) }
  for d in (210, 330) { X-ring(R, X-pt(R, d)) }
  X-t(X-pt(R * 1.1, 24), $P_1$)
  X-t(X-pt(R * 0.9, 154), $P_2$)
  X-t(X-pt(R * 0.9, 206), $P_3$)
  X-t(X-pt(R * 1.1, 336), $P_4$)
})

// 图 7·5（p.425）：外圆 ρ = 15。P、Q、R 的位置按 300 dpi 扫描量取：
// P 约 (10, 60°)，Q 约 (15, 165°)（在 165° 射线与外圆的交点），R 约 (11, −60°)
#let fig-X-7-5() = X-canvas(15, {
  import cetz.draw: *
  let R = 15
  X-grid(R, ticks: ((1, [1]), (5, [5]), (10, [10]), (15, [15])))
  X-dot(R, X-pt(10, 60))
  X-dot(R, X-pt(15, 165))
  X-dot(R, X-pt(11, -60))
  X-t(X-pt(10.4, 66), $P$)
  X-t(X-pt(14, 161), $Q$)
  X-t(X-pt(11.5, -54), $R$)
})

// 图 7·6（p.426）：直线 θ = 30°（经过极点的整条直线）
#let fig-X-7-6() = X-canvas(15, {
  import cetz.draw: *
  let R = 15
  X-grid(R)
  line(X-pt(R, 210), X-pt(R * 1.12, 30), stroke: lb)
  X-arc(3, 0, 30, mk: arw)
  X-t(X-pt(4.6, 13), $30°$)
})

// 图 7·7（p.427）：圆 ρ = 10
#let fig-X-7-7() = X-canvas(15, {
  import cetz.draw: *
  let R = 15
  X-grid(R, ticks: ((1, [1]), (10, [10])))
  circle((0, 0), radius: 10, stroke: lb)
})

// 图 7·8（p.429）：外圆 ρ = 10；圆 ρ = 10 cos θ（圆心 C(5, 0)），P 为 θ = 30° 时的点
#let fig-X-7-8() = X-canvas(10, {
  import cetz.draw: *
  let R = 10
  X-grid(R, ticks: ((5, [5]), (10, [10])))
  circle((5, 0), radius: 5, stroke: lb)
  let P = X-pt(10 * calc.cos(X-rad(30)), 30)
  line((0, 0), P, stroke: lb)
  X-ring(R, P)
  X-dot(R, (10, 0))
  X-dot(R, (5, 0), r: 0.035)
  X-t(X-pt(4.6, 37), $ρ$)
  X-arc(1.2, 0, 30, mk: arw)
  X-t(X-pt(1.75, 17), $θ$)
  X-t((10.55, 0.7), $A$)
  X-t((5.6, -1.1), $C$)
})

// 图 7·9（p.430）：心脏线 ρ = 5(1 + cos θ)，按方程算点；标出表中各点
#let fig-X-7-9() = cetz.canvas(length: 0.3cm, {
  import cetz.draw: *
  let R = 5
  line((-1.2, 0), (0, 0), stroke: dsh)
  line((0, 0), (12, 0), stroke: lt, mark: arw)
  line((0, -7.3), (0, 7.6), stroke: dsh)
  for i in range(1, 11) { line((i, 0), (i, 0.3), stroke: lt) }
  X-curve(t => 5 * (1 + calc.cos(t)), 0, 2 * calc.pi, n: 180)
  let pts = ((10, 0), (5 * (1 + calc.cos(X-rad(30))), 30), (7.5, 60), (5, 90), (5 * (1 + calc.cos(X-rad(135))), 135))
  for (r, d) in pts.slice(2, 4) { line((0, 0), X-pt(r, d), stroke: dsh) }
  line((0, 0), X-pt(pts.at(1).at(0), 30), stroke: dsh)
  for (r, d) in pts { circle(X-pt(r, d), radius: 0.22, fill: black, stroke: none) }
  X-t((12.7, 0), $x$)
  X-t((-0.6, -0.6), $O$)
  X-t((1, -0.7), [1])
  X-t((5, -0.7), [5])
  X-t((10.4, -0.75), [10])
  X-t((-0.55, 2.8), [5])
  X-t((-0.55, -2.8), [5])
  X-t((X-pt(5, 90).at(0) - 1.6, X-pt(5, 90).at(1) + 0.8), $(5, 90°)$)
  X-t((X-pt(7.5, 60).at(0), X-pt(7.5, 60).at(1) + 0.9), $(7.5, 60°)$)
  X-t((X-pt(9.33, 30).at(0) + 0.4, X-pt(9.33, 30).at(1) + 0.2), $(9.3, 30°)$, anc: "west")
})

// 图 7·10（p.431）：双纽线 ρ = ±10 √(cos 2θ)；外圆约 ρ = 15
#let fig-X-7-10() = X-canvas(15, {
  import cetz.draw: *
  let R = 15
  X-grid(R, labs: X-deg30 + ((45, $45°$), (135, $135°$), (225, $225°$), (315, $315°$)),
    dots: X-dot15.filter(d => calc.rem(d, 45) != 0), ticks: ((10, [10]),))
  let f = t => { let c = calc.cos(2 * t); if c < 0 { none } else { 10 * calc.sqrt(c) } }
  X-curve(f, -calc.pi / 4, calc.pi / 4, n: 120, st: lb)
  X-curve(f, 3 * calc.pi / 4, 5 * calc.pi / 4, n: 120, st: lb)
  X-t((5, 0.8), $a$)
  X-t((-5, 0.8), $a$)
})

// 图 7·11（p.432）：抛物线 ρ = 2 / (1 − sin θ)；外圆 ρ = 15
#let fig-X-7-11() = X-canvas(15, {
  import cetz.draw: *
  let R = 15
  X-grid(R, ticks: ((2, [2]),))
  X-curve(t => 2 / (1 - calc.sin(t)), X-rad(90 + 29), X-rad(360 + 90 - 29), n: 200, lim: R * 1.12, st: lb)
})

// 图 7·12（p.433）：阿基米德螺线 ρ = 3θ；实线 θ ≥ 0，虚线 θ ≤ 0；外圆 ρ = 15，射线标弧度
#let fig-X-7-12() = X-canvas(15, {
  import cetz.draw: *
  let R = 15
  let rl = (
    (30, $π/6$), (60, $π/3$), (90, $π/2$), (120, $(2π)/3$), (150, $(5π)/6$), (180, $π$),
    (210, $(7π)/6$), (240, $(4π)/3$), (270, $(3π)/2$), (300, $(5π)/3$), (330, $(11π)/6$),
  )
  X-grid(R, labs: rl)
  X-curve(t => 3 * t, 0, 2 * calc.pi + 0.3, n: 260, st: lb)
  X-curve(t => 3 * t, -(2 * calc.pi + 0.3), 0, n: 260, st: (paint: black, thickness: 1.1pt, dash: "dashed"))
})

// ───── 习题 7·1~7·2 的小图（不编号）─────
#let X-sm = 0.7cm   // 小图：1 个单位（a）的长度

// 第 1(8) 题（p.434）：心脏线 ρ = a(1 − cos θ)
#let fig-X-q1-8() = cetz.canvas(length: X-sm, {
  import cetz.draw: *
  line((-2.5, 0), (0, 0), stroke: dsh)
  line((0, 0), (1.5, 0), stroke: lt, mark: arw)
  line((0, -1.95), (0, 2.0), stroke: dsh)
  X-curve(t => 1 - calc.cos(t), 0, 2 * calc.pi, n: 160)
  X-t((1.75, 0), $x$)
  X-t((0, 2.3), $90°$)
  X-t((-0.2, -0.25), $O$)
  X-t((-1.15, -0.25), $2a$)
})

// 第 1(10) 题（p.435）：蚌线 ρ = a(csc θ + 1)；直线 y = a 上的 A、D，OP 交直线于 D
#let fig-X-q1-10() = cetz.canvas(length: X-sm, {
  import cetz.draw: *
  let X = 2.1
  line((-X, 1), (X, 1), stroke: lt)
  line((0, 0), (X + 0.3, 0), stroke: lt, mark: arw)
  line((0, 0), (0, 2.6), stroke: dsh)
  // 上支：θ ∈ (0, π)，下支：θ ∈ (π, 2π)；只画 |x| ≤ X 的部分
  let f = t => { let s = calc.sin(t); if calc.abs(s) < 0.05 { none } else { 1 / s + 1 } }
  let up = range(0, 201).map(i => 0.1 + (calc.pi - 0.2) * i / 200).map(t => (f(t) * calc.cos(t), f(t) * calc.sin(t))).filter(q => calc.abs(q.at(0)) <= X)
  line(..up, stroke: lw)
  let lo = range(0, 201).map(i => calc.pi + 0.1 + (calc.pi - 0.2) * i / 200).map(t => (f(t) * calc.cos(t), f(t) * calc.sin(t))).filter(q => calc.abs(q.at(0)) <= X)
  line(..lo, stroke: lw)
  // OP：θ = 125°
  let t = X-rad(125)
  let P = (f(t) * calc.cos(t), f(t) * calc.sin(t))
  line((0, 0), (P.at(0) * 1.12, P.at(1) * 1.12), stroke: lt)
  X-t((X + 0.55, 0), $x$)
  X-t((0, 2.85), $90°$)
  X-t((-0.2, -0.25), $O$)
  X-t((P.at(0) + 0.05, P.at(1) + 0.3), $P$)
  X-t((1 / calc.tan(t) - 0.2, 1.25), $D$)
  X-t((0.2, 1.25), $A$)
  X-t((0.2, 0.55), $a$)
  X-t((0.2, 1.5), $a$)
})

// 第 1(11) 题（p.435）：双纽线 ρ² = a² sin 2θ
#let fig-X-q1-11() = cetz.canvas(length: 1.5 * X-sm, {
  import cetz.draw: *
  line((-1.0, 0), (0, 0), stroke: (paint: black, thickness: 0.9pt, dash: "dashed"))
  line((0, 0), (1.15, 0), stroke: lt, mark: arw)
  line((0, -0.95), (0, 1.0), stroke: dsh)
  let f = t => { let s = calc.sin(2 * t); if s < 0 { none } else { calc.sqrt(s) } }
  X-curve(f, 0, calc.pi / 2, n: 120)
  X-curve(f, calc.pi, 3 * calc.pi / 2, n: 120)
  line(X-pt(1, 225), X-pt(1, 45), stroke: lt)
  X-t((1.3, 0), $x$)
  X-t((0, 1.15), $90°$)
  X-t((0.1, -0.15), $O$)
  X-t((0.35, 0.5), $a$)
  X-t((-0.35, -0.2), $a$)
})

// 第 1(12) 题（p.435）：双曲螺线 ρ = π/θ；渐近线 LK 为 y = π；实线 θ > 0，虚线 θ < 0
#let fig-X-q1-12() = cetz.canvas(length: 0.5cm, {
  import cetz.draw: *
  let X = 4.0
  line((-X, calc.pi), (X, calc.pi), stroke: dsh)
  line((0, 0), (2.2, 0), stroke: lt, mark: arw)
  let f = t => calc.pi / t
  let br = (s, st) => {
    let pts = range(0, 301).map(i => 0.6 + (4 * calc.pi - 0.6) * i / 300).map(t => (s * f(t) * calc.cos(t), f(t) * calc.sin(t))).filter(q => calc.abs(q.at(0)) <= X - 0.1)
    line(..pts, stroke: st)
  }
  br(1, lw)
  br(-1, (paint: black, thickness: 0.9pt, dash: "dashed"))
  X-t((2.45, 0), $x$)
  X-t((-0.55, -0.5), $O$)
  X-t((-X, calc.pi + 0.4), $L$)
  X-t((X - 0.1, calc.pi + 0.4), $K$)
})

// 第 2(1)–2(4) 题（p.436）：玫瑰线；虚线为各标注角度的射线，叶中细线标 a
#let X-rose(f, labs, leaves, n: 360) = cetz.canvas(length: 1.4 * X-sm, {
  import cetz.draw: *
  let L = 1.5
  for (d, body) in labs {
    if d != 0 { line((0, 0), X-pt(L, d), stroke: dsh) }
    X-t(X-pt(L + 0.28, d), body)
  }
  line((-L, 0), (0, 0), stroke: dsh)
  line((0, 0), (L + 0.2, 0), stroke: lt, mark: arw)
  X-t((L + 0.4, 0), $x$)
  X-curve(f, 0, 2 * calc.pi, n: n)
  for (d, ld) in leaves {
    line((0, 0), X-pt(1, d), stroke: lt)
    X-t(X-pt(0.55, d + ld), $a$)
  }
  X-t((-0.12, -0.15), $O$)
})
#let X-lab(..ds) = ds.pos().map(d => (d, [$#d°$]))
#let fig-X-q2-1() = X-rose(t => calc.cos(3 * t), X-lab(30, 60, 90, 120, 150, 180, 210, 240, 270, 300, 330), ((0, 12), (120, 12), (240, 12)))
#let fig-X-q2-2() = X-rose(t => calc.sin(3 * t), X-lab(30, 90, 150, 180, 210, 270, 330), ((30, 12), (150, 12), (270, 12)))
#let fig-X-q2-3() = X-rose(t => calc.sin(2 * t), X-lab(45, 90, 135, 225, 315) + ((270, []),), ((45, 12), (135, 12), (225, 12), (315, 12)))
#let fig-X-q2-4() = X-rose(t => calc.cos(2 * t), X-lab(45, 90, 135, 225, 315) + ((270, []),), ((0, 10), (90, 10), (180, 10), (270, 10)))

// 第 2(5) 题（p.437）：ρ = a cos(2θ/3)，θ 从 0 到 6π（1080°）；各点按方程计算
#let fig-X-q2-5() = cetz.canvas(length: 2cm, {
  import cetz.draw: *
  line((-1.35, 0), (0, 0), stroke: dsh)
  line((0, 0), (1.5, 0), stroke: lt, mark: arw)
  line((0, -1.35), (0, 1.3), stroke: dsh)
  line((0, 0), X-pt(1.5, 45), stroke: dsh)
  line((0, 0), X-pt(1.5, 135), stroke: dsh)
  X-curve(t => calc.cos(2 * t / 3), 0, 6 * calc.pi, n: 720)
  X-t((1.7, 0), $x$)
  X-t((0, 1.45), $90°$)
  X-t(X-pt(1.62, 45), $45°$)
  X-t(X-pt(1.62, 135), $135°$)
  X-t((1.1, -0.12), $A$)
  X-t((0.1, 0.62), $B$)
  X-t((0.1, -0.62), $B'$)
  X-t((0.47, -0.12), $C$)
  X-t((0.1, 1.08), $D$)
  X-t((0.12, -1.1), $D'$)
  X-t((-0.47, -0.12), $E$)
  X-t((-1.08, 0.1), $F$)
  X-t((-0.1, -0.1), $O$)
})
