// 习题答案（AA 段：原书 p.478–490）里的不编号插图：习题 1·6 第 8 题，习题 2·4 第 1–3 题，复习题二第 14 题。
// 这些都是函数图像，按方程用数学坐标采样画出（不描页面像素）；每单位长度 sx、sy（cm）参照原图大致比例取，
// 刻度只标原图标出的数字。原图是示意草图，个别曲线与刻度的比例不准（如第 1(9)、1(10) 题），这里一律按方程画。
#import "/common/geo.typ": *

// 坐标图：x 轴从 x0 到 x1，y 轴从 y0 到 y1（数学坐标），sx、sy 为每单位长度的厘米数。
// xt、yt：刻度，元素为数值（标签自动）或 (数值, 标签)，标签为 none 时只画刻度。
// draw 是 P => { import cetz.draw: *; … }，P(x, y) 把数学坐标换成画布坐标。
#let AA-plot(x0, x1, y0, y1, sx: 0.25, sy: none, xt: (), yt: (), o: true, draw) = {
  let sy = if sy == none { sx } else { sy }
  let P(x, y) = (x * sx, y * sy)
  let lab(v) = if v < 0 [−#(-v)] else [#v]
  set par(first-line-indent: 0em, justify: false, leading: 0.4em)
  cetz.canvas(length: 1cm, {
    import cetz.draw: *
    line(P(x0, 0), P(x1, 0), stroke: lt, mark: arw)
    line(P(0, y0), P(0, y1), stroke: lt, mark: arw)
    content((x1 * sx + 0.06, 0), tsm($x$), anchor: "west")
    content((0, y1 * sy + 0.04), tsm($y$), anchor: "south")
    if o { content((-0.03, -0.03), tsm($O$), anchor: "north-east") }
    for t in xt {
      let (v, l) = if type(t) == array { t } else { (t, lab(t)) }
      line(P(v, 0), (v * sx, 0.07), stroke: lt)
      if l != none { content((v * sx, -0.04), tsm(l), anchor: "north") }
    }
    for t in yt {
      let (v, l) = if type(t) == array { t } else { (t, lab(t)) }
      line(P(0, v), (0.07, v * sy), stroke: lt)
      if l != none { content((-0.04, v * sy), tsm(l), anchor: "east") }
    }
    draw(P)
  })
}
// y = f(x)，x 从 a 到 b
#let AA-f(P, f, a, b, n: 80, s: lw) = {
  import cetz.draw: *
  line(..range(n + 1).map(i => { let x = a + (b - a) * i / n; P(x, f(x)) }), stroke: s)
}
// 参数曲线 (fx(t), fy(t))，t 从 a 到 b
#let AA-c(P, fx, fy, a, b, n: 100, s: lw) = {
  import cetz.draw: *
  line(..range(n + 1).map(i => { let t = a + (b - a) * i / n; P(fx(t), fy(t)) }), stroke: s)
}
#let AA-ell(P, a, b) = AA-c(P, t => a * calc.cos(t), t => b * calc.sin(t), 0, 2 * calc.pi)
// 焦点在 x 轴上的双曲线 x²/a² − y²/b² = 1，参数 t 从 −T 到 T
#let AA-hx(P, a, b, T) = {
  AA-c(P, t => a * calc.cosh(t), t => b * calc.sinh(t), -T, T)
  AA-c(P, t => -a * calc.cosh(t), t => b * calc.sinh(t), -T, T)
}
// 焦点在 y 轴上的双曲线 y²/a² − x²/b² = 1
#let AA-hy(P, a, b, T) = {
  AA-c(P, t => b * calc.sinh(t), t => a * calc.cosh(t), -T, T)
  AA-c(P, t => b * calc.sinh(t), t => -a * calc.cosh(t), -T, T)
}
// 过原点、斜率 ±k 的两条细线（渐近线），x 从 −X 到 X
#let AA-asym(P, k, X, s: lt) = {
  import cetz.draw: *
  line(P(-X, -k * X), P(X, k * X), stroke: s)
  line(P(-X, k * X), P(X, -k * X), stroke: s)
}
#let AA-dot(P, x, y) = { import cetz.draw: *; circle(P(x, y), radius: 0.045, fill: black, stroke: none) }
#let AA-ring(P, x, y) = { import cetz.draw: *; circle(P(x, y), radius: 0.045, fill: white, stroke: lt) }

// ---------------------------------------------------------------- 习题 1·6 第 8 题（p.479）
// 平行四边形 ABCD，AB = 8，AD = 5，∠A = 60°，A 为原点、AB 在 x 轴上的四种放法
#let fig-AA-1-6-8() = {
  let s = 0.3
  let h = 5 * calc.sqrt(3) / 2
  let P(x, y) = (x * s, y * s)
  set par(first-line-indent: 0em, justify: false, leading: 0.4em)
  let L(body) = text(size: 7pt, body)
  cetz.canvas(length: 1cm, {
    import cetz.draw: *
    line(P(-12, 0), P(12.5, 0), stroke: lt, mark: arw)
    line(P(0, -6.2), P(0, 7.5), stroke: lt, mark: arw)
    content(P(12.7, 0), tsm($x$), anchor: "west")
    content(P(0, 7.6), tsm($y$), anchor: "south")
    for (sx, sy) in ((1, 1), (-1, 1), (-1, -1), (1, -1)) {
      line(P(0, 0), P(sx * 8, 0), P(sx * 10.5, sy * h), P(sx * 2.5, sy * h), close: true, stroke: lw)
    }
    let H = $(5 sqrt(3))/2$
    content(P(10.6, h), L($C_1 (21/2, #H)$), anchor: "west")
    content(P(2.3, h + 0.3), L($D_1 (5/2, #H)$), anchor: "south-west")
    content(P(-2.3, h + 0.3), L($D_2 (-5/2, #H)$), anchor: "south-east")
    content(P(-10.6, h), L($C_2 (-21/2, #H)$), anchor: "east")
    content(P(-8.9, -0.12), L($B_2 (-8, 0)$), anchor: "north-east")
    content(P(1.4, 0.12), L($A (0, 0)$), anchor: "south-west")
    content(P(8.9, -0.12), L($B_1 (8, 0)$), anchor: "north-west")
    content(P(-10.6, -h), L($C_3 (-21/2, -#H)$), anchor: "east")
    content(P(-2.4, -h - 0.3), L($D_3 (-5/2, -#H)$), anchor: "north-east")
    content(P(2.4, -h - 0.3), L($D_4 (5/2, -#H)$), anchor: "north-west")
    content(P(10.6, -h), L($C_4 (21/2, -#H)$), anchor: "west")
  })
}

// ---------------------------------------------------------------- 习题 2·4 第 1 题（p.482–484）
#let fig-AA-2-4-1-1a() = AA-plot(-2.5, 8, -5.5, 5.5, sx: 0.22, xt: (1, 2), yt: (1, 2), P => {
  AA-c(P, t => t * t / 4, t => t, -4.5, 4.5)                       // y² = 4x
})
#let fig-AA-2-4-1-1b() = AA-plot(-5.5, 5.5, -2.5, 6, sx: 0.22, xt: (1, 2), yt: (1, 2), P => {
  AA-f(P, x => x * x / 4, -4.4, 4.4)                              // x² = 4y
})
#let fig-AA-2-4-1-2a() = AA-plot(-4.5, 5, -3.5, 3.5, sx: 0.3, xt: (1, 2, 3), yt: (1, 2), P => {
  AA-ell(P, 3, 2)                                                 // 4x² + 9y² = 36
})
#let fig-AA-2-4-1-2b() = AA-plot(-3.5, 4.5, -4.5, 4.5, sx: 0.3, xt: (1, 2), yt: (1, 2, 3), P => {
  AA-ell(P, 2, 3)                                                 // 9x² + 4y² = 36
})
#let fig-AA-2-4-1-3a() = AA-plot(-7, 7, -5, 5, sx: 0.22, xt: (1, 2, 3), yt: (1, 2, 3), P => {
  AA-asym(P, 2 / 3, 6.5)
  AA-hx(P, 3, 2, 1.45)                                            // 4x² − 9y² − 36 = 0
})
#let fig-AA-2-4-1-3b() = AA-plot(-5.5, 5.5, -7, 7, sx: 0.22, xt: (1, 2), yt: (1, 2, 3), P => {
  AA-asym(P, 1.5, 4.5)
  AA-hx(P, 2, 3, 1.5)                                             // 9x² − 4y² − 36 = 0
})
#let fig-AA-2-4-1-4a() = AA-plot(-6.5, 6.5, -5, 5, sx: 0.25, xt: (1,), yt: (1,), P => {
  AA-asym(P, 2 / 3, 6)
  AA-hy(P, 2, 3, 1.25)                                            // 4x² − 9y² + 36 = 0
})
#let fig-AA-2-4-1-4b() = AA-plot(-5, 5, -7, 7, sx: 0.25, xt: (1,), yt: (1, 2, 3), P => {
  AA-asym(P, 1.5, 4.2)
  AA-hy(P, 3, 2, 1.1)                                             // 9x² − 4y² + 36 = 0
})
#let fig-AA-2-4-1-5() = AA-plot(-3, 5, -2, 18.5, sx: 0.25, sy: 0.12, xt: ((1, none), (2, none)),
  yt: range(2, 17, step: 2).map(v => (v, none)), P => {
  import cetz.draw: *
  AA-f(P, x => calc.pow(x, 4), -2.08, 2.08)                       // y = x⁴
  AA-dot(P, -2, 16)
  AA-dot(P, 2, 16)
  content(P(2.25, 16), tsm($(2, 16)$), anchor: "west")
  content(P(2.0, 8), tsm($y = x^4$), anchor: "west")
})
#let fig-AA-2-4-1-6() = AA-plot(-3, 3.5, -7, 7, sx: 0.25, xt: (1, 2), yt: (1, 2), P => {
  AA-f(P, x => -x * x * x, -1.9, 1.9)                             // y = −x³
})
#let fig-AA-2-4-1-7() = AA-plot(-6.5, 6.5, -4.5, 4.5, sx: 0.25, xt: (1, 2), yt: (1, 2), P => {
  AA-f(P, x => calc.pow(calc.abs(x), 2 / 3), -5.5, 5.5, n: 120)   // y³ = x²
})
#let fig-AA-2-4-1-8() = AA-plot(-3.5, 10, -7, 5.5, sx: 0.22, xt: (1, 2, 3), yt: (1, 2, (3, none)), P => {
  import cetz.draw: *
  circle(P(3, -1), radius: 5 * 0.22, stroke: lw)                  // x² + y² − 6x + 2y − 15 = 0
  AA-dot(P, 0, 3)
  AA-ring(P, 0, -5)
  content(P(-0.2, 3.3), tsm[3], anchor: "south-east")
  content(P(-0.45, -5), tsm[−5], anchor: "east")
  content(P(3 + calc.sqrt(24) + 0.1, -0.1), tsm[8], anchor: "north-west")
  content(P(3.3, -1.3), tsm($(3, -1)$), anchor: "north")
})
#let fig-AA-2-4-1-9() = AA-plot(-10.5, 11, -10.5, 11, sx: 0.2, xt: (1, 2), yt: (1, 2), P => {
  AA-f(P, x => 12 / x, 1.2, 10)                                   // xy = 12
  AA-f(P, x => 12 / x, -10, -1.2)
})
#let fig-AA-2-4-1-10() = AA-plot(-9.5, 2.2, -3, 9, sx: 0.25, xt: (-3, -2, -1).map(v => (v, none)) + (1,), yt: (1, 2), P => {
  import cetz.draw: *
  line(P(-9.5, 3), P(2, 3), stroke: lt)                           // y = 3
  line(P(-4, 0), P(-4, 8.6), stroke: lt)                          // x = −4
  AA-f(P, x => 3 + 2 / (x + 4), -3.63, 1.5)                       // xy − 3x + 4y − 14 = 0
  AA-f(P, x => 3 + 2 / (x + 4), -9.5, -4.36)
  AA-dot(P, -4, 0)
  AA-dot(P, 0, 3)
  content(P(-3.9, -0.15), tsm[−4], anchor: "north-west")
  content(P(-14 / 3 - 0.1, -0.2), tsm($-14/3$), anchor: "north-east")
  content(P(-0.15, 3), tsm[3], anchor: "east")
  content(P(0.15, 3.5), tsm[3.5], anchor: "south-west")
})
#let fig-AA-2-4-1-11() = AA-plot(-5, 5.2, -5, 5, sx: 0.27, xt: (1, 2, 3), yt: (1, 2, 3), P => {
  let (a, b, r) = (calc.sqrt(18), calc.sqrt(6), calc.sqrt(2))
  AA-asym(P, 1, 4.3)
  AA-c(P, t => (a * calc.cos(t) - b * calc.sin(t)) / r,           // x² − xy + y² = 9
    t => (a * calc.cos(t) + b * calc.sin(t)) / r, 0, 2 * calc.pi)
})
#let fig-AA-2-4-1-12() = AA-plot(-1.2, 5.8, -1.5, 5.5, sx: 0.3, xt: (1, 2, 3, 4), yt: (1, 2, 3, 4), P => {
  AA-c(P, t => t * t, t => (2 - t) * (2 - t), 0, 2)               // √x + √y = 2
})
#let fig-AA-2-4-1-13a() = AA-plot(-3, 3.3, -4.4, 4.4, sx: 0.42, sy: 0.3, xt: (-2, -1, 1, 2), yt: (1,), P => {
  AA-f(P, x => x * (x * x - 4), -2.35, 2.35)                      // y = x(x² − 4)
})
#let fig-AA-2-4-1-13b() = AA-plot(-1.3, 4.2, -3.2, 4.6, sx: 0.35, sy: 0.3, xt: (1, 2, 3), yt: (1, 2), P => {
  AA-f(P, x => x * (x - 2) * (x - 2), -0.45, 3.15)                // y = x(x − 2)²
})
#let fig-AA-2-4-1-13c() = AA-plot(-0.8, 5, -5.2, 5.2, sx: 0.35, sy: 0.3, xt: (1, 2, 3, 4), yt: (1,), P => {
  AA-f(P, x => calc.pow(x - 2, 3), 0.3, 3.7)                      // y = (x − 2)³
})

// ---------------------------------------------------------------- 习题 2·4 第 2、3 题（p.485–486）
#let fig-AA-2-4-2-1() = AA-plot(-3, 5, -3, 3.2, sx: 0.3, xt: (1, 2), yt: (1, 2), P => {
  import cetz.draw: *
  circle(P(0, 0), radius: 2 * 0.3, stroke: lw)                    // x² + y² − 4 = 0
  AA-f(P, x => (4 - x) / 3, -3.5, 4.8, n: 2)                      // x + 3y − 4 = 0
})
#let fig-AA-2-4-2-2() = AA-plot(-3, 4.5, -1.3, 6, sx: 0.3, xt: (1, 2), yt: (1, 2), P => {
  AA-f(P, x => x * x, -2.3, 2.3)                                  // x² − y = 0
})
#let fig-AA-2-4-3-1() = AA-plot(-3.5, 4, -4, 3, sx: 0.35, xt: ((-1.5, [−1.5]), (1.5, [1.5])), yt: ((-3, [−3]),), P => {
  import cetz.draw: *
  line(P(-2.6, 2.2), P(0, -3), P(2.6, 2.2), stroke: lw)           // y = 2|x| − 3
})
#let fig-AA-2-4-3-2() = AA-plot(-2.5, 5, -1.2, 6.8, sx: 0.3, xt: (1, 2), yt: (1, 2), P => {
  import cetz.draw: *
  line(P(-1.6, 5.2), P(0, 2), P(2, 2), P(4, 6), stroke: lw)       // y = |x| + |x − 2|
})
#let fig-AA-2-4-3-3() = AA-plot(-4.6, 4.8, -6.3, 7, sx: 0.3, xt: (1,), yt: (1, -1, -2, -3, -4), P => {
  import cetz.draw: *
  line(P(-1, -6.1), P(-1, 6.6), stroke: dsh)
  line(P(1, -6.1), P(1, 6.6), stroke: dsh)
  AA-f(P, x => 4 / (x * x - 1), 1.3, 4.4)                         // y = 4/(x² − 1)
  AA-f(P, x => 4 / (x * x - 1), -4.4, -1.3)
  AA-f(P, x => 4 / (x * x - 1), -0.56, 0.56)
})
#let fig-AA-2-4-3-4() = AA-plot(-4, 4.3, -4.8, 4.8, sx: 0.3, P => {
  import cetz.draw: *
  line(P(-4, -4), P(4, 4), stroke: dsh)                           // y − x = 0
  content(P(2.3, 2.3), tsm($y - x = 0$), angle: 45deg, anchor: "north", padding: 0.05)
  AA-f(P, x => x + 1 / x, 0.24, 3.4)                              // y = x + 1/x
  AA-f(P, x => x + 1 / x, -3.4, -0.24)
})

// ---------------------------------------------------------------- 复习题二第 14 题（p.487）
#let fig-AA-r2-14() = {
  let s = 0.3
  grid(columns: 4, column-gutter: 0.6em, align: bottom,
    AA-plot(-4.2, 3.5, -3, 3.5, sx: s, xt: ((-1, none),), yt: (1,), P => {
      import cetz.draw: *
      content(P(-1.15, -0.1), tsm[−1], anchor: "north-east")
      line(P(-1, -3), P(-1, 3.5), stroke: dsh)
      AA-f(P, x => 1 / (x + 1), -0.7, 3.3)                        // y = 1/(x + 1)
      AA-f(P, x => 1 / (x + 1), -4.2, -1.35)
    }),
    AA-plot(-3.5, 3.5, -2.5, 2, sx: s, xt: (1,), yt: (1,), P => {
      AA-f(P, x => 1 / (x * x + 1), -3.3, 3.3)                    // y = 1/(x² + 1)
    }),
    AA-plot(-3.5, 3.5, -2.5, 2, sx: s, xt: (1,), yt: (1,), P => {
      AA-f(P, x => 1 / (calc.abs(x) + 1), -3.3, 0)                // y = 1/(|x| + 1)
      AA-f(P, x => 1 / (calc.abs(x) + 1), 0, 3.3)
    }),
    AA-plot(-4.2, 3.5, -2.5, 3.5, sx: s, xt: ((-1, none),), yt: (1,), P => {
      import cetz.draw: *
      content(P(-1.15, -0.1), tsm[−1], anchor: "north-east")
      line(P(-1, -2.5), P(-1, 3.5), stroke: dsh)
      AA-f(P, x => 1 / (x + 1), -0.7, 3.3)                        // y = 1/|x + 1|
      AA-f(P, x => -1 / (x + 1), -4.2, -1.3)
    }),
  )
}
