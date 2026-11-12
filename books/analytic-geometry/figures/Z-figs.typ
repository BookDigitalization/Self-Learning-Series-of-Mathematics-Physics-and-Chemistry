// Z 段插图：附录“经验公式”的附图 1–4（p.458、460、464、467），总复习题第 20(2)、20(3)、40、49(1)、49(2) 题图（p.471、474、476、477）。
// 读图：render-pages.py --offset 3 --dpi 200 --grid 100（build/pages-Z/g/），坐标为 200 dpi 页面像素（y 向下）。
// 附图是数据图：坐标轴的原点和刻度间距按原图量取，数据点按原书表中数据描，直线、曲线按原书求得的经验公式算点，
// 不照抄手绘的偏差。总复习题的曲线（椭圆、余摆线）按题中关系算点。
#import "/common/geo.typ": *
#let k = 0.0145cm

#let Z-t(p, pt, body, ..args) = { import cetz.draw: *; content(p(..pt), tt(body), ..args) }
#let Z-ln(p, a, b, st: lw, ..style) = { import cetz.draw: *; line(p(..a), p(..b), stroke: st, ..style) }
#let Z-curve(p, f, t0, t1, n: 90, st: lw) = {
  import cetz.draw: *
  line(..range(n + 1).map(i => p(..f(t0 + (t1 - t0) * i / n))), stroke: st)
}
// 竖轴上的刻度（向右的小短线）与横轴上的刻度（向上的小短线）
#let Z-vtick(p, x, y, s: 5) = Z-ln(p, (x, y), (x + s, y), st: lt)
#let Z-htick(p, x, y, s: 5) = Z-ln(p, (x, y), (x, y - s), st: lt)

// 附图 1（p.458）：圆周长 C 与直径 D。原点 (170, 1307)；D 每 10 约 40.4 像素，C 每 20 约 40.3 像素。
// 数据点照例 1 的表；直线按 C = 3.142D。
#let fig-Z-a1(width: 450 * k) = px-canvas(380, 500, origin: (125, 840), width: width, (p, u) => {
  import cetz.draw: *
  let m(d, c) = (170 + 4.04 * d, 1307 - 2.015 * c)
  Z-ln(p, (170, 1307), (490, 1307), st: lt, mark: arw)
  Z-ln(p, (170, 1307), (170, 850), st: lt, mark: arw)
  Z-t(p, (502, 1307), $D$)
  Z-t(p, (170, 838), $C$)
  Z-t(p, (152, 1322), $0$)
  for d in (10, 20, 30, 40, 50, 60) {
    let (x, y) = m(d, 0)
    Z-htick(p, x, y)
    Z-t(p, (x, y + 14), tsm[#d])
  }
  for c in range(20, 201, step: 20) {
    let (x, y) = m(0, c)
    Z-vtick(p, x, y)
    Z-t(p, (x - 4, y), tsm[#c], anchor: "east")
  }
  Z-ln(p, m(7, 3.142 * 7), m(64, 3.142 * 64))
  for (d, c) in ((10, 31.43), (20, 62.78), (30, 94.21), (40, 125.72), (50, 157.13), (60, 188.57)) {
    pdot(p, m(d, c), r: 3.6)
  }
})

// 附图 2（p.460）：溶解量 W 与温度 T。原点 (165, 770)，W 轴在 0 与 130 之间折断；T 每 10 约 40 像素，W 每 10 约 82.4 像素。
// 数据点照例 2 的表；直线按 W = 0.79T + 128.4。
#let fig-Z-a2(width: 400 * k) = px-canvas(360, 560, origin: (125, 250), width: width, (p, u) => {
  import cetz.draw: *
  let m(t, w) = (165 + 4 * t, 742 - 8.24 * (w - 130))
  Z-ln(p, (165, 770), (470, 770), st: lt, mark: arw)
  // 竖轴：0 到 130 之间画折断记号
  Z-ln(p, (165, 770), (165, 761), st: lt)
  Z-ln(p, (165, 751), (165, 265), st: lt, mark: arw)
  Z-ln(p, (159, 763), (171, 759), st: lt)
  Z-ln(p, (159, 753), (171, 749), st: lt)
  Z-t(p, (482, 770), $T$)
  Z-t(p, (165, 253), $W$)
  Z-t(p, (150, 784), $0$)
  for t in (10, 20, 30, 40, 50, 60) {
    let (x, y) = m(t, 130)
    Z-htick(p, x, 770)
    Z-t(p, (x, 784), tsm[#t])
  }
  for w in (130, 140, 150, 160, 170, 180) {
    let (x, y) = m(0, w)
    Z-vtick(p, x, y)
    Z-t(p, (x - 4, y), tsm[#w], anchor: "east")
  }
  Z-ln(p, m(8, 0.79 * 8 + 128.4), m(63, 0.79 * 63 + 128.4))
  for (t, w) in ((10, 136.3), (20, 144.2), (30, 152.2), (40, 160.0), (50, 168.2), (60, 176.3)) {
    pdot(p, m(t, w), r: 3.6)
  }
})

// 附图 3（p.464）：容积 V 与压强 P（同一横轴上也标 x = 1/P）。原点 (300, 875)；P 每 1 约 34.2 像素（x 每 0.1 约 68.4 像素），V 每 1 约 69.5 像素。
// 曲线 V = 14.5/P，直线 V = 14.5x；数据点照例 4 的表（直线上的点取 x = 0.33、0.20、0.14、0.11、0.10）。
#let fig-Z-a3(width: 470 * k) = px-canvas(470, 510, origin: (245, 440), width: width, (p, u) => {
  import cetz.draw: *
  let m(pp, v) = (300 + 34.2 * pp, 875 - 69.5 * v)
  Z-ln(p, (262, 875), (692, 875), st: lt, mark: arw)
  Z-ln(p, (300, 930), (300, 452), st: lt, mark: arw)
  Z-t(p, (702, 862), $P$)
  Z-t(p, (702, 888), $x$)
  Z-t(p, (300, 443), $V$)
  Z-t(p, (288, 891), $0$)
  Z-t(p, (350, 468), $x = 1/P$)
  for (i, pp) in (2, 4, 6, 8, 10).enumerate() {
    let (x, y) = m(pp, 0)
    Z-htick(p, x, y)
    Z-t(p, (x, y - 14), tsm[#pp])
    Z-t(p, (x, y + 13), tsm[#("0.10", "0.20", "0.30", "0.40", "0.50").at(i)])
  }
  for v in (1, 2, 3, 4, 5) {
    let (x, y) = m(0, v)
    Z-vtick(p, x, y)
    Z-t(p, (x - 4, y), tsm[#(str(v) + ".0")], anchor: "east")
  }
  Z-curve(p, t => m(t, 14.5 / t), 2.7, 11)
  Z-ln(p, m(1.2, 0.725 * 1.2), m(7.4, 0.725 * 7.4))
  for (pp, v) in ((3, 4.85), (5, 2.95), (7, 2.10), (9, 1.62), (10, 1.46)) {
    pdot(p, m(pp, v), r: 3.6)
  }
  for (xx, v) in ((0.33, 4.85), (0.20, 2.95), (0.14, 2.10), (0.11, 1.62), (0.10, 1.46)) {
    pdot(p, m(20 * xx, v), r: 3.6)
  }
  // 直线、曲线旁的方程（沿线斜排）
  let (lx, ly) = m(4.6, 0.725 * 4.6)
  content(p(lx - 16, ly - 8), tsm[$V = 14.5 x$], angle: 55.8deg)
  let (cx, cy) = m(8.4, 14.5 / 8.4)
  content(p(cx + 12, cy - 20), tsm[$V = 14.5 / P$], angle: -18deg)
})

// 附图 4（p.467）：行星距离 D 与周期 T。原点 (370, 572)，两轴每 1 单位约 137 像素。
// 线 (1)：T = D^(3/2)，点取表中 D ≤ 1.52 的四组；线 (2)：T' = 3/2 D'，点取 D'、T' 表的八组。
#let fig-Z-a4(width: 520 * k) = px-canvas(520, 470, origin: (285, 235), width: width, (p, u) => {
  import cetz.draw: *
  let s = 137
  let m(d, t) = (370 + s * d, 572 - s * t)
  Z-ln(p, m(-0.62, 0), m(2.85, 0), st: lt, mark: arw)
  Z-ln(p, m(0, -0.68), m(0, 2.45), st: lt, mark: arw)
  Z-t(p, m(2.95, 0), $D$)
  Z-t(p, m(0, 2.53), $T$)
  Z-t(p, (381, 586), $0$)
  for (d, lab) in ((-0.5, $-0.5$), (0.5, [0.5]), (1.0, [1.0]), (1.5, [1.5]), (2.0, [2.0]), (2.5, [2.5])) {
    let (x, y) = m(d, 0)
    Z-htick(p, x, y)
    Z-t(p, (x, y + 14), tsm(lab))
  }
  for (t, lab) in ((0.5, [0.5]), (1.0, [1.0]), (1.5, [1.5]), (2.0, [2.0])) {
    let (x, y) = m(0, t)
    Z-vtick(p, x, y)
    Z-t(p, (x - 4, y), tsm(lab), anchor: "east")
  }
  Z-t(p, (390, 268), tsm[$T' = lg T$], anchor: "west")
  Z-t(p, (390, 290), tsm[$D' = lg D$], anchor: "west")
  // 线 (2)
  Z-ln(p, m(-0.6, -0.9), m(1.57, 2.355))
  for (d, t) in ((-0.41, -0.62), (-0.14, -0.21), (0, 0), (0.18, 0.27), (0.72, 1.07), (0.98, 1.47), (1.28, 1.92), (1.48, 2.22)) {
    pdot(p, m(d, t), r: 3.6)
  }
  // 线 (1)
  Z-curve(p, d => m(d, calc.pow(d, 1.5)), 0.2, 1.56)
  for (d, t) in ((0.387, 0.24), (0.723, 0.615), (1.00, 1.00), (1.52, 1.88)) {
    pdot(p, m(d, t), r: 3.6)
  }
  Z-t(p, m(1.22, 2.42), tsm[线(2)])
  Z-t(p, m(1.78, 2.15), tsm[线(1)])
  let (ax, ay) = m(0.62, 0.93)
  content(p(ax - 18, ay - 6), tsm[$T' = 3/2 D'$], angle: 56deg)
  let (bx, by) = m(1.08, 1.12)
  content(p(bx + 16, by - 14), tsm[$T = D^(3/2)$], angle: 62deg)
})

// 总复习题第 20(2) 题图（p.471）：圆 x² + y² = a² 上的点 P′ 与同横坐标的点 P。圆心 (195, 830)，半径 106 像素。
#let fig-Z-20b(width: 340 * k) = px-canvas(340, 380, origin: (35, 645), width: width, (p, u) => {
  import cetz.draw: *
  let o = (195, 830)
  let r = 106
  Z-ln(p, (40, 830), (365, 830), st: lt, mark: arw)
  Z-ln(p, (195, 985), (195, 655), st: lt, mark: arw)
  Z-t(p, (374, 830), $x$)
  Z-t(p, (195, 647), $y$)
  Z-t(p, (183, 846), $O$)
  circ(p, o, r)
  let xp = 243
  let yq = 830 - calc.sqrt(r * r - (xp - 195) * (xp - 195))
  let yp = 830 - 0.55 * (830 - yq)
  Z-ln(p, (xp, yq), (xp, 830), st: lt)
  pdot(p, (xp, yq), r: 2.6)
  pdot(p, (xp, yp), r: 2.6)
  Z-t(p, (250, yq - 10), $P'(x', y')$, anchor: "west")
  Z-ln(p, (xp + 2, yp - 4), (282, 770), st: lt)
  Z-t(p, (284, 766), $P(x, y)$, anchor: "west")
})

// 总复习题第 20(3) 题图（p.471）：圆与椭圆（长轴相同）及横坐标相同的各点所作的一系列矩形（上半）。圆心 (623, 830)，a = 106、b = 53 像素。
#let fig-Z-20c(width: 340 * k) = px-canvas(340, 380, origin: (455, 645), width: width, (p, u) => {
  import cetz.draw: *
  let o = (623, 830)
  let a = 106
  let b = 53
  Z-ln(p, (460, 830), (785, 830), st: lt, mark: arw)
  Z-ln(p, (623, 985), (623, 655), st: lt, mark: arw)
  Z-t(p, (794, 830), $x$)
  Z-t(p, (623, 647), $y$)
  Z-t(p, (611, 846), $O$)
  circ(p, o, a)
  Z-curve(p, t => (623 + a * calc.cos(t), 830 - b * calc.sin(t)), 0, 2 * calc.pi, n: 120)
  let w = 21
  for i in range(8) {
    let x0 = -84 + i * w
    let x1 = x0 + w
    let e = calc.max(calc.abs(x0), calc.abs(x1))
    let hc = calc.sqrt(a * a - e * e)
    let he = b / a * hc
    rect(p(623 + x0, 830), p(623 + x1, 830 - hc), stroke: 0.4pt)
    Z-ln(p, (623 + x0, 830 - he), (623 + x1, 830 - he), st: 0.4pt)
  }
})

// 总复习题第 40 题图（p.474）：椭圆、长轴两端的切线与过 P₁ 的切线。中心 (296, 1150)，a = 113、b = 78 像素，P₁ 取离心角 67°。
#let fig-Z-40(width: 400 * k) = px-canvas(400, 330, origin: (120, 980), width: width, (p, u) => {
  import cetz.draw: *
  let (cx, cy) = (296, 1150)
  let a = 113
  let b = 78
  Z-ln(p, (125, cy), (500, cy), st: lt, mark: arw)
  Z-ln(p, (cx, 1305), (cx, 990), st: lt, mark: arw)
  Z-t(p, (510, cy), $x$)
  Z-t(p, (cx, 983), $y$)
  Z-t(p, (cx - 13, cy + 15), $O$)
  Z-curve(p, t => (cx + a * calc.cos(t), cy - b * calc.sin(t)), 0, 2 * calc.pi, n: 120)
  Z-ln(p, (cx - a, 1000), (cx - a, 1260), st: lt)
  Z-ln(p, (cx + a, 1055), (cx + a, 1260), st: lt)
  let th = 67deg
  let P1 = (cx + a * calc.cos(th), cy - b * calc.sin(th))
  let Qp = (cx - a, cy - b * (1 + calc.cos(th)) / calc.sin(th))
  let Q = (cx + a, cy - b * (1 - calc.cos(th)) / calc.sin(th))
  // 切线向两边延长
  let dx = Q.at(0) - Qp.at(0)
  let dy = Q.at(1) - Qp.at(1)
  Z-ln(p, (Qp.at(0) - 0.25 * dx, Qp.at(1) - 0.25 * dy), (Q.at(0) + 0.2 * dx, Q.at(1) + 0.2 * dy), st: lt)
  pdot(p, P1, r: 2.6)
  ring(p, Qp, r: 2.8)
  ring(p, Q, r: 2.8)
  ring(p, (cx - a, cy), r: 2.8)
  ring(p, (cx + a, cy), r: 2.8)
  Z-t(p, (Qp.at(0) + 14, Qp.at(1) - 8), $Q'$)
  Z-t(p, (P1.at(0) + 2, P1.at(1) - 16), $P_1$)
  Z-t(p, (Q.at(0) + 12, Q.at(1) - 14), $Q$)
  Z-t(p, (cx - a - 13, cy + 15), $A'$)
  Z-t(p, (cx + a + 13, cy + 15), $A$)
})

// 余摆线：半径 r 的圆沿直线（页面 y = base）滚动，圆上（或半径延长线上）离圆心 a 的点 P 的轨迹；θ = 0 时圆心横坐标为 x0，P 在圆心正下方。
#let Z-troch(p, x0, base, r, a, t0, t1, circles) = {
  import cetz.draw: *
  let pt(t) = (x0 + r * t - a * calc.sin(t), base - r + a * calc.cos(t))
  Z-curve(p, pt, t0, t1, n: 160)
  for t in circles {
    let c = (x0 + r * t, base - r)
    circ(p, c, r)
    Z-ln(p, c, pt(t), st: lt)
    pdot(p, c, r: 2.2)
    pdot(p, pt(t), r: 2.2)
  }
}

// 总复习题第 49(1) 题图（p.476）：a < r，取 r = 41、a = 35 像素；直线在 y = 1375。
#let fig-Z-49a(width: 620 * k) = px-canvas(620, 135, origin: (175, 1265), width: width, (p, u) => {
  import cetz.draw: *
  Z-ln(p, (180, 1375), (790, 1375))
  Z-troch(p, 228, 1375, 41, 35, -1.6, 4 * calc.pi + 1.6, (0, 2.54, 2 * calc.pi, 2 * calc.pi + 4.0, 4 * calc.pi))
  Z-t(p, (240, 1367), $P$)
})

// 总复习题第 49(2) 题图（p.477）：a > r，取 r = 49、a = 66 像素；直线在 y = 478。
#let fig-Z-49b(width: 520 * k) = px-canvas(520, 175, origin: (275, 340), width: width, (p, u) => {
  import cetz.draw: *
  Z-ln(p, (285, 478), (780, 478))
  Z-troch(p, 378, 478, 49, 66, -2.3, 2 * calc.pi + 2.3, (-0.4, 2.0, 2 * calc.pi - 2.0, 2 * calc.pi + 0.4))
})
