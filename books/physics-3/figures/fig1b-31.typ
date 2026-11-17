// 图 1·31–1·33（原书 p.59–61）。1·31、1·32 为 CeTZ 重绘（坐标取自 150 dpi 页面图），1·33 为位图加真文字。
#import "fig1b-lib.typ": *

// 带电金属板（圆角长条）和板上的符号
#let plate(p, x0, x1, y0, y1, signs, cols) = {
  import cetz.draw: *
  rect(p(x0, y0), p(x1, y1), radius: 8, stroke: 1pt)
  let n = 9
  for i in range(n) {
    let y = y0 + 14 + (y1 - y0 - 28) / (n - 1) * i
    for (j, c) in cols.enumerate() {
      lab(p, c, y, signs.at(j), size: 6.5pt)
    }
  }
}

// 静电计（用小圆圈和“Y”形箔示意）
#let electrometer(p, u, cx, cy) = {
  import cetz.draw: *
  circle(p(cx, cy), radius: 26 * u, stroke: 1pt)
  line(p(cx, cy - 14), p(cx, cy), stroke: 0.9pt)
  line(p(cx, cy), p(cx - 9, cy + 15), stroke: 0.9pt)
  line(p(cx, cy), p(cx + 9, cy + 15), stroke: 0.9pt)
  // 接地线
  line(p(cx - 28, cy + 10), p(cx - 32, cy + 10), p(cx - 32, cy + 75), stroke: 1pt)
  ground(p, cx - 32, cy + 75, w: 24)
}

#let fig-1-31(width: 12cm) = px-canvas(900, 400, origin: (190, 540), width: width, (p, u) => {
  import cetz.draw: *
  let minus = [$-$]
  let plus = [$+$]
  // (a)
  plate(p, 315, 365, 565, 805, (plus, plus), (328, 352))
  electrometer(p, u, 250, 740)
  line(p(252, 714), p(252, 680), p(315, 680), stroke: 1pt)
  lab(p, 340, 553, [$A$], size: 8pt)
  lab(p, 297, 868, [$(a)$], size: 8pt)
  // (b)
  plate(p, 512, 558, 565, 805, (plus, plus), (524, 546))
  plate(p, 607, 655, 565, 805, (minus, plus), (620, 643))
  electrometer(p, u, 445, 740)
  line(p(447, 714), p(447, 680), p(512, 680), stroke: 1pt)
  lab(p, 534, 553, [$A$], size: 8pt)
  lab(p, 628, 553, [$B$], size: 8pt)
  lab(p, 556, 868, [$(b)$], size: 8pt)
  // (c)
  plate(p, 852, 897, 565, 805, (plus, plus), (863, 885))
  plate(p, 945, 990, 565, 805, (minus, minus), (957, 977))
  electrometer(p, u, 755, 740)
  line(p(757, 714), p(757, 680), p(852, 680), stroke: 1pt)
  line(p(990, 760), p(1048, 760), p(1048, 825), stroke: 1pt)
  ground(p, 1048, 828, w: 24)
  lab(p, 874, 553, [$A$], size: 8pt)
  lab(p, 965, 553, [$B$], size: 8pt)
  lab(p, 872, 868, [$(c)$], size: 8pt)
})

#let fig-1-32(width: 6cm) = px-canvas(380, 540, origin: (130, 330), width: width, (p, u) => {
  import cetz.draw: *
  let sig(x0, x1, y, s) = {
    let n = 11
    for i in range(n) { lab(p, x0 + (x1 - x0) / (n - 1) * i, y, s, size: 7pt) }
  }
  // (a)
  hatch(p, 143, 340, 488, 368, d: 8)
  sig(150, 482, 378, [$+$])
  sig(150, 482, 413, [$-$])
  hatch(p, 143, 428, 488, 453, d: 8)
  line(p(318, 453), p(318, 495), stroke: 1pt)
  ground(p, 318, 495, w: 24)
  lab(p, 318, 562, [$(a)$], size: 8pt)
  // (b)
  hatch(p, 143, 630, 488, 655, d: 8)
  sig(150, 482, 672, [$-$])
  sig(150, 482, 708, [$+$])
  hatch(p, 143, 725, 488, 750, d: 8)
  line(p(318, 750), p(318, 795), stroke: 1pt)
  ground(p, 318, 795, w: 24)
  lab(p, 318, 858, [$(b)$], size: 8pt)
})

// 图 1·33 研究电容器的电容（p.61，裁剪自 (396,304)–(1293,814)，位图 1794×1020）
#let fig-1-33(width: 9cm) = bm("fig1b-33.png", 1794, 1020, width,
  ((310, 156, $-$), (630, 160, $+$), (1614, 40, $A$), (1756, 444, $K$)))
