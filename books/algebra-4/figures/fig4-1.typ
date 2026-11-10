// §4·3 的图：图 4·1（p.95）、图 4·2（p.96）、图 4·3（p.98）、习题 4·3 第 2 题的无编号图（p.98）。
// 坐标取自 150 dpi 页面图（扫描原生像素，y 向下），放大裁图加网格读出。
#import "/common/series.typ": *
#import "/books/algebra-4/figures/fig4-common.typ": *

// ───────── 图 4·1：复平面上的点 M(a, b)（p.95）─────────
#let fig-4-1(width: 235 * k) = px-canvas(235, 205, origin: (505, 305), width: width, (p, u) => {
  import cetz.draw: *
  line(p(562, 500), p(562, 328), stroke: axw, mark: ar)
  line(p(521, 455), p(712, 455), stroke: axw, mark: ar)
  line(p(562, 381), p(634, 381), stroke: dash)
  line(p(634, 381), p(634, 455), stroke: dash)
  pdot(p(634, 381))
  content(p(719, 452), tt($x$))
  content(p(562, 315), tt($y$))
  content(p(552, 465), tt($O$))
  content(p(555, 381), tt($b$))
  content(p(634, 464), tt($a$))
  content(p(641, 380), anchor: "west", tt($M: z = a + b i$))
})

// ───────── 图 4·2：两个复数相等（p.96）─────────
#let fig-4-2(width: 240 * k) = px-canvas(240, 205, origin: (60, 445), width: width, (p, u) => {
  import cetz.draw: *
  line(p(116, 640), p(116, 463), stroke: axw, mark: ar)
  line(p(67, 592), p(266, 592), stroke: axw, mark: ar)
  line(p(116, 517), p(190, 517), stroke: dash)
  line(p(190, 517), p(190, 592), stroke: dash)
  pdot(p(190, 517))
  content(p(272, 591), tt($x$))
  content(p(117, 453), tt($y$))
  content(p(108, 602), tt($O$))
  content(p(94, 519), tt($b = b'$))
  content(p(188, 602), tt($a = a'$))
  content(p(200, 511), anchor: "west", tt($A = a + b i$))
  content(p(199, 529), anchor: "west", tt($A' = a' + b' i$))
})

// ───────── 图 4·3：共轭复数 z₁ = 4 + 3i、z₂ = 4 − 3i（p.98）─────────
#let fig-4-3(width: 240 * 0.026cm) = px-canvas(240, 245, origin: (70, 125), width: width, (p, u) => {
  import cetz.draw: *
  let ox = 119
  let oy = 276
  let ux = 17.2
  let uy = 16.5
  line(p(ox, 363), p(ox, 138), stroke: axw, mark: ar)
  line(p(73, oy), p(282, oy), stroke: axw, mark: ar)
  for n in (1, 2, 3, 4) {
    line(p(ox + n * ux, oy), p(ox + n * ux, oy - 4), stroke: 0.6pt)
    content(p(ox + n * ux, oy + 11), tt($#n$))
  }
  for n in (-3, -2, -1, 1, 2, 3) {
    line(p(ox, oy - n * uy), p(ox + 4, oy - n * uy), stroke: 0.6pt)
    content(p(ox - 5, oy - n * uy), anchor: "east", tt($#n$))
  }
  line(p(ox, oy - 3 * uy), p(ox + 4 * ux, oy - 3 * uy), stroke: dash)
  line(p(ox + 4 * ux, oy), p(ox + 4 * ux, oy - 3 * uy), stroke: dash)
  line(p(ox + 4 * ux, oy), p(ox + 4 * ux, oy + 3 * uy), stroke: dash)
  line(p(ox, oy + 3 * uy), p(ox + 4 * ux, oy + 3 * uy), stroke: dash)
  pdot(p(ox + 4 * ux, oy - 3 * uy))
  pdot(p(ox + 4 * ux, oy + 3 * uy))
  content(p(216, 213), tt($z_1 = 4 + 3 i$))
  content(p(216, 342), tt($z_2 = 4 - 3 i$))
  content(p(111, 277), tt($O$))
  content(p(289, 276), tt($x$))
  content(p(119, 129), tt($y$))
})

// ───────── 习题 4·3 第 2 题的图（p.98，无编号）：单位方格里的 A–L 十二个点 ─────────
// 方格 −5…5，边长 14.75 px；点的坐标取整数格点（读图：A(5,0) B(4,3) C(3,4) D(0,5) E(−3,4) F(−4,3)
// G(−5,0) H(−4,−3) I(−3,−4) J(0,−5) K(3,−4) L(4,−3)），这只是作图位置，题文不给坐标。
#let fig-ex4-3-2(width: 235 * k) = px-canvas(235, 245, origin: (425, 770), width: width, (p, u) => {
  import cetz.draw: *
  let ox = 522.3
  let oy = 902.4
  let g = 14.75
  let q = (x, y) => p(ox + x * g, oy - y * g)
  for n in range(-5, 6) {
    line(q(n, -5), q(n, 5), stroke: 0.45pt + luma(70))
    line(q(-5, n), q(5, n), stroke: 0.45pt + luma(70))
  }
  line(p(ox, 1008), p(ox, 778), stroke: axw, mark: ar)
  line(p(427, oy), p(648, oy), stroke: axw, mark: ar)
  content(p(657, 903), tt($x$))
  content(p(523, 772), tt($y$))
  content(p(515, 913), tt($O$))
  let pts = (
    ("A", 5, 0, 10, 10), ("B", 4, 3, 11, 1), ("C", 3, 4, 10, 2), ("D", 0, 5, 11, -8),
    ("E", -3, 4, 12, 2), ("F", -4, 3, 12, 1), ("G", -5, 0, 10, -8), ("H", -4, -3, 10, 0),
    ("I", -3, -4, 10, 1), ("J", 0, -5, 10, 8), ("K", 3, -4, 9, 3), ("L", 4, -3, 9, 2),
  )
  for (name, x, y, dx, dy) in pts {
    pdot(q(x, y), r: 2.6)
    content(p(ox + x * g + dx, oy - y * g + dy), tt(text(style: "italic", name)))
  }
})
