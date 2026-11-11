// 第八章 三角方程的插图。
// 图 8·1（原书 p.297）、图 8·3（p.299）、图 8·4（p.300）：函数图像，按函数值真实采样绘制，
//   坐标网格与刻度照原图（200 dpi 页面上量得：图 8·1 一个单位约 105 像素，图 8·3 约 140 像素，图 8·4 约 49 像素）。
// 图 8·2（p.298）：弓形，200 dpi 页面坐标描图（圆心 (588, 403)，半径约 119，∠AOB 按 2.3 弧度画）。
#import "/common/geo.typ": *

// 在单位坐标里画函数图像的画布：s 为一个单位的长度。
#let c8-canvas(s, body) = {
  set par(first-line-indent: 0em, justify: false, leading: 0.4em)
  cetz.canvas(length: s, body)
}

// 取样：f 在 [a, b] 上取 n 段
#let c8-samples(f, a, b, n: 120) = range(n + 1).map(i => {
  let t = a + (b - a) * i / n
  (t, f(t))
})

// 图中刻度数字：白底，免得压在网格线上
#let c8-l(body) = box(fill: white, inset: 0.8pt, tsm(body))

#let c8-grid-stroke = 0.5pt + luma(90)

// 坐标网格：x 方向在 xs 处画竖线（从 y0 到 y1），y 方向在 ys 处画横线（从 x0 到 x1）
#let c8-grid(xs, ys, x0, x1, y0, y1) = {
  import cetz.draw: *
  for x in xs { line((x, y0), (x, y1), stroke: c8-grid-stroke) }
  for y in ys { line((x0, y), (x1, y), stroke: c8-grid-stroke) }
}

#let c8-axes(x0, x1, y0, y1, xl: $x$, yl: $y$) = {
  import cetz.draw: *
  line((x0, 0), (x1, 0), stroke: lw, mark: arw)
  line((0, y0), (0, y1), stroke: lw, mark: arw)
  content((x1, 0), tt(xl), anchor: "west", padding: 0.08)
  content((0, y1), tt(yl), anchor: "south", padding: 0.08)
}

#let c8-steps(a, b, h) = range(int(calc.round((b - a) / h)) + 1).map(i => a + i * h)

// 图 8·1 y = sin 2x 与 y = sin x（−π ≤ x ≤ π）
#let fig-c8-1(width: 9.6cm) = c8-canvas(width / 8.4, {
  import cetz.draw: *
  c8-grid(c8-steps(-3.5, 3.5, 0.5).filter(x => x != 0), c8-steps(-1.5, 1.5, 0.5).filter(y => y != 0),
    -3.85, 3.85, -1.8, 1.8)
  c8-axes(-3.95, 4.3, -1.95, 2.35)
  line(..c8-samples(t => calc.sin(t), -calc.pi, calc.pi), stroke: lw)
  line(..c8-samples(t => calc.sin(2 * t), -calc.pi, calc.pi, n: 200), stroke: lw)
  for (v, s) in ((-3, $-3.0$), (-2, $-2.0$), (-1, $-1.0$), (1, $1.0$), (2, $2.0$), (3, $3.0$)) {
    content((v + 0.04, -0.03), c8-l(s), anchor: "north-west")
  }
  content((0.04, -0.03), c8-l($O$), anchor: "north-west")
  content((-0.05, 1), c8-l($1.0$), anchor: "south-east")
  content((-0.05, 0.5), c8-l($0.5$), anchor: "south-east")
})

// 图 8·2 弓形 ACB
#let fig-c8-2(width: 240 * 0.012cm) = px-canvas(260, 270, origin: (460, 265), width: width, (p, u) => {
  import cetz.draw: *
  let O = (588, 403)
  let r = 119
  let pt(deg) = (O.at(0) + r * calc.cos(deg * 1deg), O.at(1) - r * calc.sin(deg * 1deg))
  let A = pt(5)
  let B = pt(5 + 2.3 / calc.pi * 180)
  circ(p, O, r)
  seg(p, O, A)
  seg(p, O, B)
  seg(p, A, B)
  anglearc(p, O, A, B, 14)
  lbl(p, A, $A$, dir: "e", d: 12)
  lbl(p, B, $B$, dir: "nw", d: 13)
  lbl(p, pt(72), $C$, dir: "ne", d: 13)
  lbl(p, O, $O$, dir: "s", d: 11)
  lbl(p, (648, 403), $R$, dir: "s", d: 22)
})

// 图 8·3 y = sin x 与 y = x − π/2
#let fig-c8-3(width: 7.2cm) = c8-canvas(width / 5.5, {
  import cetz.draw: *
  c8-grid(c8-steps(-1, 3.5, 0.5).filter(x => x != 0), c8-steps(-2, 1.5, 0.5).filter(y => y != 0),
    -1.2, 3.8, -2.2, 1.75)
  c8-axes(-1.25, 4.2, -2.25, 2.05)
  line(..c8-samples(t => calc.sin(t), 0, calc.pi), stroke: lw)
  line((-0.15, -0.15 - calc.pi / 2), (2.85, 2.85 - calc.pi / 2), stroke: lw)
  for (v, s) in ((0.5, $0.5$), (1, $1.0$), (1.5, $1.5$), (2, $2.0$), (2.5, $2.5$), (3, $3.0$)) {
    content((v, -0.04), c8-l(s), anchor: "north")
  }
  content((-0.04, -0.04), c8-l($O$), anchor: "north-east")
  for (v, s) in ((1, $1.0$), (0.5, $0.5$), (-0.5, $-0.5$), (-1, $-1.0$), (-1.5, $-1.5$)) {
    content((-0.05, v), c8-l(s), anchor: "east")
  }
})

// 图 8·4 y = x 与 y = tan x
#let fig-c8-4(width: 8.4cm) = c8-canvas(width / 16.6, {
  import cetz.draw: *
  let PI = calc.pi
  // 网格（每格一个单位）和外框
  c8-grid(c8-steps(-5, 8, 1).filter(x => x != 0), c8-steps(-7, 8, 1).filter(y => y != 0), -6, 9, -8, 9)
  rect((-6, -8), (9, 9), stroke: lw)
  c8-axes(-6.7, 10, -8.5, 10.3)
  // 渐近线 x = (2k+1)π/2
  for k in (-2, -1, 0, 1, 2) {
    let a = (2 * k + 1) * PI / 2
    line((a, -8), (a, 9), stroke: (paint: black, thickness: 0.6pt, dash: "dashed"))
  }
  // y = tan x 的各支（截在 −8 ≤ y ≤ 9 内），按角度均匀取样
  for c in (-PI, 0, PI, 2 * PI) {
    let u0 = calc.atan(-8).rad()
    let u1 = calc.atan(9).rad()
    line(..range(101).map(i => {
      let u = u0 + (u1 - u0) * i / 100
      (c + u, calc.tan(u))
    }), stroke: lw)
  }
  line((-5.6, -5.6), (8.7, 8.7), stroke: lw)
  // 刻度标注
  content((-3 * PI / 2 + 0.1, -0.1), c8-l($-(3 pi)/2$), anchor: "north-west")
  content((-PI + 0.1, -0.1), c8-l($-pi$), anchor: "north-west")
  content((-PI / 2 + 0.1, -0.1), c8-l($-pi/2$), anchor: "north-west")
  content((0.1, -0.1), c8-l($O$), anchor: "north-west")
  content((PI / 2 + 0.1, -0.1), c8-l($pi/2$), anchor: "north-west")
  content((PI + 0.1, -0.1), c8-l($pi$), anchor: "north-west")
  content((3 * PI / 2 + 0.1, -0.1), c8-l($(3 pi)/2$), anchor: "north-west")
  content((2 * PI + 0.1, -0.1), c8-l($2 pi$), anchor: "north-west")
})
