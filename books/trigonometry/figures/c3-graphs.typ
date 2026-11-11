// 三角第 3 章：函数图像（图 3·7、3·8、3·10–3·13、3·15、3·16、3·18–3·25）。
// 曲线一律用真实函数采样；画布坐标是自定的像素坐标（原点左上，y 向下），不是扫描页坐标。
// 原图来源：原书 p.104–111、p.124–128。
#import "/common/geo.typ": *
#let c3k = 0.0152cm
#let c3-pi = calc.pi

// 坐标轴（箭头在 x 轴右端、y 轴上端）；(ox, oy) 为原点；l、r、d、u 为各方向长度
#let c3-axes(p, ox, oy, l, r, d, u, ylab: $y$, xlab: $x$, o: true) = {
  import cetz.draw: *
  line(p(ox - l, oy), p(ox + r, oy), stroke: lt, mark: arw)
  line(p(ox, oy + d), p(ox, oy - u), stroke: lt, mark: arw)
  lbl(p, (ox + r + 8, oy + 2), xlab, dir: "c", d: 0)
  lbl(p, (ox + 7, oy - u - 4), ylab, dir: "c", d: 0)
  if o { lbl(p, (ox - 7, oy + 9), $O$, dir: "c", d: 0) }
}
// 曲线：f 在 [x0, x1] 上取样
#let c3-curve(p, ox, oy, sx, sy, f, x0, x1, n: 160, st: 1.2pt, ..style) = {
  import cetz.draw: *
  let pts = range(n + 1).map(i => {
    let x = x0 + (x1 - x0) * i / n
    p(ox + sx * x, oy - sy * f(x))
  })
  line(..pts, stroke: st, ..style)
}
// 只取 |f| <= ym 的部分（正切、余切在渐近线附近）
#let c3-curve-clip(p, ox, oy, sx, sy, f, x0, x1, ym, n: 400, st: 1.2pt) = {
  import cetz.draw: *
  let pts = range(n + 1).map(i => x0 + (x1 - x0) * i / n).filter(x => calc.abs(f(x)) <= ym).map(x => p(ox + sx * x, oy - sy * f(x)))
  line(..pts, stroke: st)
}
// 竖直虚线：从轴到曲线上的点
#let c3-drop(p, ox, oy, sx, sy, f, x) = {
  import cetz.draw: *
  line(p(ox + sx * x, oy), p(ox + sx * x, oy - sy * f(x)), stroke: dsh)
}
// 整条竖直虚线（渐近线）
#let c3-vline(p, ox, oy, sx, x, d, u) = {
  import cetz.draw: *
  line(p(ox + sx * x, oy + d), p(ox + sx * x, oy - u), stroke: dsh)
}
// x 轴上的标注：k 个 π/2 等，用数学文字，dy > 0 在轴下方
#let c3-xl(p, ox, oy, sx, x, body, dy) = lbl(p, (ox + sx * x, oy + dy), body, dir: "c", d: 0)

#let c3-sin = x => calc.sin(x)
#let c3-cos = x => calc.cos(x)
#let c3-tan = x => calc.tan(x)
#let c3-cot = x => 1 / calc.tan(x)

// 图 3·7：y = sin x，0 ≤ x ≤ 2π
#let fig-c3-7(width: 330 * 1.45 * c3k) = px-canvas(330, 170, width: width, (p, u) => {
  import cetz.draw: *
  let (ox, oy, s) = (45, 85, 38)
  c3-axes(p, ox, oy, 25, 2 * c3-pi * s + 35, 60, 60)
  for i in range(1, 12) {
    if i != 6 { c3-drop(p, ox, oy, s, s, c3-sin, i * c3-pi / 6) }
  }
  c3-curve(p, ox, oy, s, s, c3-sin, 0, 2 * c3-pi)
  c3-xl(p, ox, oy, s, c3-pi / 2, $pi/2$, 20)
  c3-xl(p, ox, oy, s, c3-pi, $pi$, 9)
  c3-xl(p, ox, oy, s, 3 * c3-pi / 2, $(3 pi)/2$, -24)
  c3-xl(p, ox, oy, s, 2 * c3-pi, $2 pi$, -10)
})

// 图 3·8：y = sin x，-2π ≤ x ≤ 4π
#let fig-c3-8(width: 360 * 1.85 * c3k) = px-canvas(360, 110, width: width, (p, u) => {
  import cetz.draw: *
  let (ox, oy, s) = (135, 55, 16)
  c3-axes(p, ox, oy, 110, 4 * c3-pi * s + 15, 30, 45)
  c3-curve(p, ox, oy, s, s, c3-sin, -2 * c3-pi, 4 * c3-pi, n: 240)
  c3-xl(p, ox, oy, s, -2 * c3-pi, $-2 pi$, 9)
  c3-xl(p, ox, oy, s, 2 * c3-pi, $2 pi$, 9)
  c3-xl(p, ox, oy, s, 4 * c3-pi, $4 pi$, 9)
})

// 图 3·10：y = cos x，0 ≤ x ≤ 2π
#let fig-c3-10(width: 300 * 1.45 * c3k) = px-canvas(300, 150, width: width, (p, u) => {
  import cetz.draw: *
  let (ox, oy, s) = (45, 70, 34)
  c3-axes(p, ox, oy, 20, 2 * c3-pi * s + 35, 55, 60)
  for i in range(1, 12) {
    if i != 3 and i != 9 { c3-drop(p, ox, oy, s, s, c3-cos, i * c3-pi / 6) }
  }
  c3-drop(p, ox, oy, s, s, c3-cos, 2 * c3-pi)
  c3-curve(p, ox, oy, s, s, c3-cos, 0, 2 * c3-pi)
  c3-xl(p, ox, oy, s, c3-pi / 2, $pi/2$, 20)
  c3-xl(p, ox, oy, s, c3-pi, $pi$, -10)
  c3-xl(p, ox, oy, s, 3 * c3-pi / 2, $(3 pi)/2$, 20)
  c3-xl(p, ox, oy, s, 2 * c3-pi, $2 pi$, 10)
})

// 图 3·11：y = cos x，-2π ≤ x ≤ 4π
#let fig-c3-11(width: 360 * 1.85 * c3k) = px-canvas(360, 110, width: width, (p, u) => {
  import cetz.draw: *
  let (ox, oy, s) = (135, 55, 16)
  c3-axes(p, ox, oy, 110, 4 * c3-pi * s + 15, 30, 45)
  for x in (-2, -1, 1, 3, 4) { c3-drop(p, ox, oy, s, s, c3-cos, x * c3-pi) }
  c3-curve(p, ox, oy, s, s, c3-cos, -2 * c3-pi, 4 * c3-pi, n: 240)
  c3-xl(p, ox, oy, s, -2 * c3-pi, $-2 pi$, 9)
  c3-xl(p, ox, oy, s, 2 * c3-pi, $2 pi$, 9)
  c3-xl(p, ox, oy, s, 4 * c3-pi, $4 pi$, 9)
})

#let c3-tan-pieces(p, ox, oy, sx, sy, ym, ks) = {
  for k in ks {
    c3-curve-clip(p, ox, oy, sx, sy, c3-tan, k * c3-pi - c3-pi / 2 + 0.0005, k * c3-pi + c3-pi / 2 - 0.0005, ym)
  }
}

// 图 3·12：y = tan x，0 ≤ x ≤ 2π
#let fig-c3-12(width: 280 * 1.45 * c3k) = px-canvas(280, 240, width: width, (p, u) => {
  import cetz.draw: *
  let (ox, oy, s) = (40, 125, 28)
  c3-axes(p, ox, oy, 15, 2 * c3-pi * s + 35, 110, 112)
  for k in (1, 3) { c3-vline(p, ox, oy, s, k * c3-pi / 2, 105, 105) }
  for k in (2, 4, 5, 7, 8, 10, 11, 13, 14, 16, 17, 19, 20, 22, 23) {
    let x = k * c3-pi / 12
    if calc.abs(c3-tan(x)) <= 3.8 { c3-drop(p, ox, oy, s, s, c3-tan, x) }
  }
  c3-curve-clip(p, ox, oy, s, s, c3-tan, 0, c3-pi / 2 - 0.0005, 3.8)
  c3-curve-clip(p, ox, oy, s, s, c3-tan, c3-pi / 2 + 0.0005, 3 * c3-pi / 2 - 0.0005, 3.8)
  c3-curve-clip(p, ox, oy, s, s, c3-tan, 3 * c3-pi / 2 + 0.0005, 2 * c3-pi, 3.8)
  c3-xl(p, ox, oy, s, c3-pi / 2 + 0.2, $pi/2$, -20)
  c3-xl(p, ox, oy, s, c3-pi, $pi$, 9)
  c3-xl(p, ox, oy, s, 3 * c3-pi / 2 + 0.3, $(3 pi)/2$, -20)
  c3-xl(p, ox, oy, s, 2 * c3-pi, $2 pi$, 9)
})

// 图 3·13：y = tan x，-2π ≤ x ≤ 4π
#let fig-c3-13(width: 380 * 1.85 * c3k) = px-canvas(380, 140, width: width, (p, u) => {
  import cetz.draw: *
  let (ox, oy, s) = (135, 70, 16)
  c3-axes(p, ox, oy, 110, 4 * c3-pi * s + 22, 60, 62)
  for k in range(-3, 8, step: 2) { c3-vline(p, ox, oy, s, k * c3-pi / 2, 58, 58) }
  c3-curve-clip(p, ox, oy, s, s, c3-tan, -2 * c3-pi, -3 * c3-pi / 2 - 0.0005, 3.7)
  for k in range(-1, 4) {
    c3-curve-clip(p, ox, oy, s, s, c3-tan, k * c3-pi - c3-pi / 2 + 0.0005, k * c3-pi + c3-pi / 2 - 0.0005, 3.7)
  }
  c3-curve-clip(p, ox, oy, s, s, c3-tan, 7 * c3-pi / 2 + 0.0005, 4 * c3-pi, 3.7)
  for (k, b) in ((-3, $-(3 pi)/2$), (-1, $-pi/2$), (1, $pi/2$), (3, $(3 pi)/2$), (5, $(5 pi)/2$), (7, $(7 pi)/2$)) {
    c3-xl(p, ox, oy, s, k * c3-pi / 2 + 0.25, text(size: 6pt, b), -12)
  }
  for (k, b) in ((-2, $-2 pi$), (-1, $-pi$), (1, $pi$), (2, $2 pi$), (3, $3 pi$), (4, $4 pi$)) {
    c3-xl(p, ox, oy, s, k * c3-pi, b, 8)
  }
})

// 图 3·15：y = cot x，0 < x < 2π
#let fig-c3-15(width: 280 * 1.45 * c3k) = px-canvas(280, 240, width: width, (p, u) => {
  import cetz.draw: *
  let (ox, oy, s) = (40, 125, 28)
  c3-axes(p, ox, oy, 15, 2 * c3-pi * s + 35, 105, 112)
  for k in (1, 2) { c3-vline(p, ox, oy, s, k * c3-pi, 105, 105) }
  for k in (1, 2, 4, 5, 7, 8, 10, 11, 13, 14, 16, 17, 19, 20, 22, 23) {
    let x = k * c3-pi / 12
    if calc.abs(c3-cot(x)) <= 3.8 { c3-drop(p, ox, oy, s, s, c3-cot, x) }
  }
  c3-curve-clip(p, ox, oy, s, s, c3-cot, 0.0005, c3-pi - 0.0005, 3.8)
  c3-curve-clip(p, ox, oy, s, s, c3-cot, c3-pi + 0.0005, 2 * c3-pi - 0.0005, 3.8)
  c3-xl(p, ox, oy, s, c3-pi / 2, $pi/2$, 20)
  c3-xl(p, ox, oy, s, c3-pi - 0.15, $pi$, -9)
  c3-xl(p, ox, oy, s, 3 * c3-pi / 2, $(3 pi)/2$, 20)
  c3-xl(p, ox, oy, s, 2 * c3-pi - 0.15, $2 pi$, -9)
})

// 图 3·16：y = cot x，-2π ≤ x ≤ 4π
#let fig-c3-16(width: 360 * 1.85 * c3k) = px-canvas(360, 140, width: width, (p, u) => {
  import cetz.draw: *
  let (ox, oy, s) = (135, 70, 16)
  c3-axes(p, ox, oy, 110, 4 * c3-pi * s + 22, 60, 62)
  for k in (-2, -1, 1, 2, 3, 4) { c3-vline(p, ox, oy, s, k * c3-pi, 58, 58) }
  for k in range(-2, 4) {
    c3-curve-clip(p, ox, oy, s, s, c3-cot, k * c3-pi + 0.0005, (k + 1) * c3-pi - 0.0005, 3.7)
  }
  c3-xl(p, ox, oy, s, -2 * c3-pi + 0.4, $-2 pi$, 8)
  c3-xl(p, ox, oy, s, 2 * c3-pi + 0.4, $2 pi$, 8)
  c3-xl(p, ox, oy, s, 4 * c3-pi - 0.4, $4 pi$, 8)
})

// 图 3·18–3·25：振幅、周期、相位变换（粗线为变换后的曲线）
#let c3-thick = 1.7pt
#let c3-thin = 0.9pt

// 图 3·18：y = sin x（细）与 y = 2 sin x（粗）
#let fig-c3-18(width: 330 * 1.45 * c3k) = px-canvas(330, 190, width: width, (p, u) => {
  import cetz.draw: *
  let (ox, oy, sx, sy) = (165, 95, 36, 27)
  c3-axes(p, ox, oy, 150, 150, 90, 85)
  c3-curve(p, ox, oy, sx, sy, c3-sin, -3.5, 3.5, st: c3-thin)
  c3-curve(p, ox, oy, sx, sy, x => 2 * calc.sin(x), -3.5, 3.5, st: c3-thick)
})
// 图 3·19：y = sin x（粗）与 y = ½ sin x（细）
#let fig-c3-19(width: 330 * 1.45 * c3k) = px-canvas(330, 170, width: width, (p, u) => {
  import cetz.draw: *
  let (ox, oy, sx, sy) = (165, 85, 36, 27)
  c3-axes(p, ox, oy, 150, 150, 75, 70)
  c3-curve(p, ox, oy, sx, sy, x => calc.sin(x) / 2, -3.5, 3.5, st: c3-thin)
  c3-curve(p, ox, oy, sx, sy, c3-sin, -3.5, 3.5, st: c3-thick)
})
// 图 3·20：y = sin x（细）与 y = sin 2x（粗）
#let fig-c3-20(width: 340 * 1.45 * c3k) = px-canvas(340, 130, width: width, (p, u) => {
  import cetz.draw: *
  let (ox, oy, sx, sy) = (170, 65, 46, 40)
  c3-axes(p, ox, oy, 160, 160, 52, 55)
  c3-curve(p, ox, oy, sx, sy, c3-sin, -3.5, 3.5, st: c3-thin)
  c3-curve(p, ox, oy, sx, sy, x => calc.sin(2 * x), -3.5, 3.5, st: c3-thick)
})
// 图 3·21：y = sin x（细）与 y = sin ½x（粗）
#let fig-c3-21(width: 340 * 1.45 * c3k) = px-canvas(340, 120, width: width, (p, u) => {
  import cetz.draw: *
  let (ox, oy, sx, sy) = (170, 60, 24, 36)
  c3-axes(p, ox, oy, 160, 160, 48, 52)
  c3-curve(p, ox, oy, sx, sy, c3-sin, -6.6, 6.6, st: c3-thin, n: 240)
  c3-curve(p, ox, oy, sx, sy, x => calc.sin(x / 2), -6.6, 6.6, st: c3-thick, n: 240)
})

// 带虚线 y' 轴的相位变换图：曲线 f 对 y' 轴（在 x = xs 处）是 sin；y 轴在原点
#let c3-phase(p, ox, oy, sx, sy, xs, lo, hi, f, ya) = {
  import cetz.draw: *
  line(p(ox + sx * xs, oy + 50), p(ox + sx * xs, oy - ya), stroke: dsh, mark: arw)
  line(p(ox - 120, oy), p(ox + 160, oy), stroke: lt, mark: arw)
  line(p(ox, oy + 50), p(ox, oy - ya), stroke: lt, mark: arw)
  lbl(p, (ox + 168, oy + 2), $x$, dir: "c", d: 0)
  lbl(p, (ox + 7, oy + 10), $O$, dir: "c", d: 0)
  c3-curve(p, ox, oy, sx, sy, f, lo, hi, st: 1.3pt)
}
// 图 3·22：y = sin(x + π/4)
#let fig-c3-22(width: 300 * 1.45 * c3k) = px-canvas(300, 130, width: width, (p, u) => {
  import cetz.draw: *
  let (ox, oy, sx, sy) = (150, 70, 34, 34)
  c3-phase(p, ox, oy, sx, sy, -c3-pi / 4, -c3-pi - c3-pi / 4 - 0.2, c3-pi - c3-pi / 4 + 0.2, x => calc.sin(x + c3-pi / 4), 55)
  lbl(p, (ox + sx * (-c3-pi / 4) - 7, oy - 60), $y'$, dir: "c", d: 0)
  lbl(p, (ox + 7, oy - 60), $y$, dir: "c", d: 0)
})
// 图 3·23：y = sin(x - π/3)
#let fig-c3-23(width: 300 * 1.45 * c3k) = px-canvas(300, 130, width: width, (p, u) => {
  import cetz.draw: *
  let (ox, oy, sx, sy) = (130, 70, 34, 34)
  c3-phase(p, ox, oy, sx, sy, c3-pi / 3, c3-pi / 3 - c3-pi - 0.2, c3-pi / 3 + c3-pi + 0.2, x => calc.sin(x - c3-pi / 3), 55)
  lbl(p, (ox - 7, oy - 60), $y$, dir: "c", d: 0)
  lbl(p, (ox + sx * (c3-pi / 3) + 7, oy - 60), $y'$, dir: "c", d: 0)
})
// 图 3·24：y = sin x（细）与 y = 2 sin 3x（粗）
#let fig-c3-24(width: 380 * 1.85 * c3k) = px-canvas(380, 200, width: width, (p, u) => {
  import cetz.draw: *
  let (ox, oy, sx, sy) = (190, 105, 46, 30)
  c3-axes(p, ox, oy, 175, 175, 85, 90)
  c3-curve(p, ox, oy, sx, sy, c3-sin, -3.5, 3.5, st: c3-thin)
  c3-curve(p, ox, oy, sx, sy, x => 2 * calc.sin(3 * x), -3.7, 3.7, st: c3-thick, n: 300)
})
// 图 3·25：y = 2 sin(3x + π)，对 y' 轴（x = -π/3）是 y = 2 sin 3x
#let fig-c3-25(width: 380 * 1.85 * c3k) = px-canvas(380, 200, width: width, (p, u) => {
  import cetz.draw: *
  let (ox, oy, sx, sy) = (205, 100, 46, 30)
  let xs = -c3-pi / 3
  line(p(ox + sx * xs, oy + 80), p(ox + sx * xs, oy - 95), stroke: dsh, mark: arw)
  line(p(ox, oy + 80), p(ox, oy - 95), stroke: lt, mark: arw)
  line(p(ox - 200, oy), p(ox + 170, oy), stroke: lt, mark: arw)
  lbl(p, (ox + 178, oy + 2), $x$, dir: "c", d: 0)
  lbl(p, (ox + 8, oy + 9), $O$, dir: "c", d: 0)
  lbl(p, (ox + sx * xs - 8, oy - 100), $y'$, dir: "c", d: 0)
  lbl(p, (ox + 8, oy - 100), $y$, dir: "c", d: 0)
  c3-curve(p, ox, oy, sx, sy, x => 2 * calc.sin(3 * x + c3-pi), -4.2, 3.4, st: c3-thick, n: 300)
})
