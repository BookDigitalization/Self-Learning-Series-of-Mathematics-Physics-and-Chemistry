// 三角 第 7 章 反三角函数 插图：图 7·1–图 7·13（原书 p.242–260）。
// 都是函数图像，用真实函数采样绘制（不按扫描像素描图）；坐标轴范围、虚线、标注按原图，
// 比例取自 200 dpi 扫描上量得的单位长度（见各图注释）。
#import "/common/series.typ": *

#let c7-lw = 1.1pt                                            // 曲线
#let c7-ax = 0.6pt                                            // 坐标轴
#let c7-dsh = (paint: black, thickness: 0.6pt, dash: "dashed") // 虚线
#let c7-arw = (end: "stealth", fill: black, scale: 0.5)
#let c7-t(b) = text(size: 8pt, b)

// 采样：f 在 [a, b] 上取 n + 1 个点
#let c7-samp(f, a, b, n: 80) = range(n + 1).map(i => { let x = a + (b - a) * i / n; (x, f(x)) })

// 画布：sx、sy 为每单位长度对应的厘米数；draw 是 (P) => { import cetz.draw: *; … }，P(x, y) 把函数坐标换成画布坐标
#let c7-canvas(sx, sy, draw) = {
  set par(first-line-indent: 0em, justify: false, leading: 0.4em)
  let P = (x, y) => (x * sx, y * sy)
  cetz.canvas(length: 1cm, draw(P))
}

// 坐标轴（带箭头）与 x、y、O 标注
#let c7-axes(P, x0, x1, y0, y1, o: "north-east") = {
  import cetz.draw: *
  line(P(x0, 0), P(x1, 0), stroke: c7-ax, mark: c7-arw)
  line(P(0, y0), P(0, y1), stroke: c7-ax, mark: c7-arw)
  content(P(x1, 0), c7-t($x$), anchor: "west", padding: 0.1)
  content(P(0, y1), c7-t($y$), anchor: "south", padding: 0.08)
  if o != none { content(P(0, 0), c7-t($O$), anchor: o, padding: 0.06) }
}
#let c7-curve(P, f, a, b, n: 80) = {
  import cetz.draw: *
  line(..c7-samp(f, a, b, n: n).map(((x, y)) => P(x, y)), stroke: c7-lw)
}
#let c7-dline(P, a, b) = {
  import cetz.draw: *
  line(P(..a), P(..b), stroke: c7-dsh)
}
#let c7-lab(P, pt, body, at: "north", pad: 0.06) = {
  import cetz.draw: *
  content(P(..pt), c7-t(body), anchor: at, padding: pad)
}

#let c7pi = calc.pi
#let c7-cot(x) = 1 / calc.tan(x)
#let c7-acot(x) = c7pi / 2 - calc.atan(x).rad()   // (0, π) 内的反余切

// 图 7·1（p.242）：y = x²（x ≥ 0），点 (√m, m) 取 m = 1
#let fig-7-1() = c7-canvas(0.8, 1.25, P => {
  import cetz.draw: *
  c7-axes(P, -1.6, 2.6, -0.5, 3.1)
  for i in range(-3, 5) { if i != 0 { line(P(i / 2, 0), P(i / 2, 0.07), stroke: c7-ax) } }
  for i in range(1, 12) { line(P(0, i / 4), P(0.07, i / 4), stroke: c7-ax) }
  c7-curve(P, x => x * x, 0, 1.5)
  c7-dline(P, (0, 1), (1, 1))
  line(P(1, 0), P(1, 1), stroke: c7-ax)
  c7-lab(P, (1, 1), $(sqrt(m), m)$, at: "west", pad: 0.08)
})

// 图 7·2（p.244）：y = sin x 与直线 y = 1/2，x 从 -3π/2 到 5π/2
#let fig-7-2() = c7-canvas(0.62, 0.75, P => {
  import cetz.draw: *
  c7-axes(P, -3 * c7pi / 2 - 0.5, 5 * c7pi / 2 + 0.9, -2.1, 2.2, o: "north-east")
  for k in (-3, -1, 1, 3, 5) { c7-dline(P, (k * c7pi / 2, -2), (k * c7pi / 2, 1.9)) }
  c7-curve(P, x => calc.sin(x), -3 * c7pi / 2, 5 * c7pi / 2, n: 160)
  c7-dline(P, (-3 * c7pi / 2, 0.5), (5 * c7pi / 2, 0.5))
  for x in (-7 * c7pi / 6, c7pi / 6, 5 * c7pi / 6, 13 * c7pi / 6) { c7-dline(P, (x, 0), (x, 0.5)) }
  for (x, l) in ((-3 * c7pi / 2, $-(3pi)/2$), (-c7pi / 2, $-pi/2$), (c7pi / 6, $pi/6$), (c7pi / 2, $pi/2$),
    (5 * c7pi / 6, $(5pi)/6$), (3 * c7pi / 2, $(3pi)/2$), (5 * c7pi / 2, $(5pi)/2$)) {
    c7-lab(P, (x, 0), l, at: if calc.rem(calc.round(x / c7pi * 6), 3) == 0 { "north-west" } else { "north" })
  }
})

// 图 7·3（p.246）：y = sin x，-π/2 ≤ x ≤ π/2
#let fig-7-3() = c7-canvas(0.93, 0.75, P => {
  import cetz.draw: *
  c7-axes(P, -2.3, 2.6, -1.6, 2.1)
  c7-curve(P, x => calc.sin(x), -c7pi / 2, c7pi / 2)
  c7-dline(P, (c7pi / 2, 0), (c7pi / 2, 1))
  c7-dline(P, (-c7pi / 2, 0), (-c7pi / 2, -1))
  let x0 = 0.87
  c7-dline(P, (0, calc.sin(x0)), (x0, calc.sin(x0)))
  c7-dline(P, (x0, 0), (x0, calc.sin(x0)))
  c7-lab(P, (c7pi / 2, 0), $pi/2$, at: "north")
  c7-lab(P, (-c7pi / 2, 0), $-pi/2$, at: "south-east")
})

// 图 7·4（p.248）：y = arcsin x
#let fig-7-4() = c7-canvas(1.0, 0.75, P => {
  import cetz.draw: *
  c7-axes(P, -1.8, 2.0, -2.3, 3.1)
  c7-curve(P, x => calc.asin(x).rad(), -1, 1)
  c7-dline(P, (0, c7pi / 2), (1, c7pi / 2))
  c7-dline(P, (1, 0), (1, c7pi / 2))
  c7-dline(P, (0, -c7pi / 2), (-1, -c7pi / 2))
  c7-dline(P, (-1, 0), (-1, -c7pi / 2))
  c7-lab(P, (1, 0), $1$, at: "north")
  c7-lab(P, (-1, 0), $-1$, at: "north-east")
  c7-lab(P, (0, c7pi / 2), $pi/2$, at: "east")
  c7-lab(P, (0, -c7pi / 2), $-pi/2$, at: "west")
})

// 图 7·5（p.250）：y = cos x 与直线 y = 1/2，x 从 -2π 到 2π
#let fig-7-5() = c7-canvas(0.7, 0.7, P => {
  import cetz.draw: *
  c7-axes(P, -2 * c7pi - 0.4, 2 * c7pi + 1.2, -2.3, 2.6, o: "north-west")
  for k in (-2, -1, 1, 2) { c7-dline(P, (k * c7pi, -2.2), (k * c7pi, 2.0)) }
  c7-curve(P, x => calc.cos(x), -2 * c7pi, 2 * c7pi, n: 160)
  c7-dline(P, (-2 * c7pi, 0.5), (2 * c7pi, 0.5))
  for x in (-5 * c7pi / 3, -c7pi / 3, c7pi / 3, 5 * c7pi / 3) { c7-dline(P, (x, 0), (x, 0.5)) }
  for (x, l) in ((-2 * c7pi, $-2pi$), (-c7pi, $-pi$), (c7pi / 3, $pi/3$), (c7pi, $pi$), (2 * c7pi, $2pi$)) {
    c7-lab(P, (x, 0), l, at: "north-west")
  }
})

// 图 7·6（p.252）：y = cos x，0 ≤ x ≤ π
#let fig-7-6() = c7-canvas(0.95, 0.95, P => {
  import cetz.draw: *
  c7-axes(P, -0.5, c7pi + 1.2, -1.6, 2.1, o: "north-east")
  c7-curve(P, x => calc.cos(x), 0, c7pi)
  c7-dline(P, (c7pi, 0), (c7pi, -1))
  let x0 = 0.63
  c7-dline(P, (0, calc.cos(x0)), (x0, calc.cos(x0)))
  c7-dline(P, (x0, 0), (x0, calc.cos(x0)))
  c7-lab(P, (c7pi, 0), $pi$, at: "south-west")
})

// 图 7·7（p.252）：y = arccos x
#let fig-7-7() = c7-canvas(0.98, 0.94, P => {
  import cetz.draw: *
  c7-axes(P, -1.9, 2.5, -0.6, 4.1, o: "north-west")
  c7-curve(P, x => calc.acos(x).rad(), -1, 1)
  c7-dline(P, (-1, c7pi), (0, c7pi))
  c7-dline(P, (-1, 0), (-1, c7pi))
  c7-lab(P, (0, c7pi), $pi$, at: "west")
  c7-lab(P, (-1, 0), $-1$, at: "north")
  c7-lab(P, (1, 0), $1$, at: "north")
})

// 图 7·8（p.255）：y = tan x 与直线 y = m（取 m = 1.2）
#let fig-7-8() = c7-canvas(0.6, 0.6, P => {
  import cetz.draw: *
  let ym = 3.2
  c7-axes(P, -3 * c7pi / 2 - 0.5, 5 * c7pi / 2 + 1.0, -3.4, 3.9, o: "north-west")
  for k in (-3, -1, 1, 3, 5) { c7-dline(P, (k * c7pi / 2, -ym), (k * c7pi / 2, ym)) }
  let a = calc.atan(ym).rad()
  for c in (-c7pi, 0, c7pi, 2 * c7pi) { c7-curve(P, x => calc.tan(x - c), c - a, c + a) }
  let m = 1.2
  let x0 = calc.atan(m).rad()
  c7-dline(P, (-3 * c7pi / 2, m), (5 * c7pi / 2, m))
  for c in (-c7pi, 0, c7pi, 2 * c7pi) { c7-dline(P, (c + x0, 0), (c + x0, m)) }
  for (x, l) in ((-3 * c7pi / 2, $-(3pi)/2$), (-c7pi / 2, $-pi/2$), (c7pi / 2, $pi/2$), (3 * c7pi / 2, $(3pi)/2$), (5 * c7pi / 2, $(5pi)/2$)) {
    c7-lab(P, (x, 0), l, at: "north-east")
  }
})

// 图 7·9（p.256）：y = tan x，-π/2 < x < π/2
#let fig-7-9() = c7-canvas(0.83, 0.64, P => {
  import cetz.draw: *
  let ym = 4.1
  c7-axes(P, -2.6, 2.7, -ym - 0.2, ym + 1.0, o: "north-west")
  c7-dline(P, (-c7pi / 2, -ym), (-c7pi / 2, ym))
  c7-dline(P, (c7pi / 2, -ym), (c7pi / 2, ym))
  let a = calc.atan(ym).rad()
  c7-curve(P, x => calc.tan(x), -a, a)
  let x0 = 1.11
  c7-dline(P, (0, calc.tan(x0)), (x0, calc.tan(x0)))
  c7-dline(P, (x0, 0), (x0, calc.tan(x0)))
  c7-lab(P, (c7pi / 2, 0), $pi/2$, at: "north-west")
  c7-lab(P, (-c7pi / 2, 0), $-pi/2$, at: "north-west")
})

// 图 7·10（p.257）：y = arctan x
#let fig-7-10() = c7-canvas(0.45, 0.87, P => {
  import cetz.draw: *
  c7-axes(P, -6.8, 7.0, -2.6, 2.8, o: "north-west")
  c7-dline(P, (-6, c7pi / 2), (6, c7pi / 2))
  c7-dline(P, (-6, -c7pi / 2), (6, -c7pi / 2))
  c7-curve(P, x => calc.atan(x).rad(), -6, 6)
  c7-lab(P, (0, c7pi / 2), $pi/2$, at: "south-west")
  c7-lab(P, (0, -c7pi / 2), $-pi/2$, at: "south-west")
})

// 图 7·11（p.259）：y = cot x 与直线 y = m（取 m = 1）
#let fig-7-11() = c7-canvas(0.63, 0.6, P => {
  import cetz.draw: *
  let ym = 3.3
  c7-axes(P, -c7pi - 0.5, 3 * c7pi + 1.0, -ym - 0.2, ym + 0.9, o: "north-west")
  for k in (-1, 1, 2, 3) { c7-dline(P, (k * c7pi, -ym), (k * c7pi, ym)) }
  let a = c7-acot(ym)
  for c in (-c7pi, 0, c7pi, 2 * c7pi) { c7-curve(P, x => c7-cot(x - c), c + a, c + c7pi - a) }
  let m = 1
  let x0 = c7-acot(m)
  c7-dline(P, (-c7pi, m), (3 * c7pi, m))
  for c in (-c7pi, 0, c7pi, 2 * c7pi) { c7-dline(P, (c + x0, 0), (c + x0, m)) }
  for (x, l) in ((-c7pi, $-pi$), (c7pi, $pi$), (2 * c7pi, $2pi$), (3 * c7pi, $3pi$)) {
    c7-lab(P, (x, 0), l, at: "north-west")
  }
})

// 图 7·12（p.260）：y = cot x，0 < x < π
#let fig-7-12() = c7-canvas(0.91, 0.48, P => {
  import cetz.draw: *
  let ym = 3.6
  c7-axes(P, -0.4, c7pi + 1.0, -ym - 0.3, ym + 1.0, o: "north-east")
  c7-dline(P, (c7pi, -ym), (c7pi, ym + 0.5))
  let a = c7-acot(ym)
  c7-curve(P, x => c7-cot(x), a, c7pi - a)
  let x0 = 0.51
  c7-dline(P, (0, c7-cot(x0)), (x0, c7-cot(x0)))
  c7-dline(P, (x0, 0), (x0, c7-cot(x0)))
  c7-lab(P, (c7pi, 0), $pi$, at: "north-west")
})

// 图 7·13（p.260）：y = arccot x
#let fig-7-13() = c7-canvas(0.6, 0.6, P => {
  import cetz.draw: *
  c7-axes(P, -4.2, 5.4, -0.5, 4.2, o: "north-east")
  c7-dline(P, (-3.5, c7pi), (4.6, c7pi))
  c7-curve(P, x => c7-acot(x), -3.5, 4.6)
  c7-lab(P, (0, c7pi), $pi$, at: "south-west")
})
