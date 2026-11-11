// 段 c2a（三角 第 2 章 §2·1–§2·7，原书 p.41–66）插图共用的小工具。所有 c2a-*.typ 图文件都 import 本文件。
// 坐标取自 render-pages.py --dpi 200 --grid 100 的页面图（页宽约 1271 像素），网格数字为整页真实像素。
#import "/common/geo.typ": *

#let k = 0.012cm   // 1 像素 ≈ 0.012 cm（页宽 1271 px，与几何册 1000 px × 0.0152 cm 的比例相当）

// 极坐标点：以 o 为中心、半径 r（像素）、数学角 deg（度，逆时针为正）。页面 y 向下。
#let c2a-pol(o, r, deg) = (o.at(0) + r * calc.cos(deg * 1deg), o.at(1) - r * calc.sin(deg * 1deg))

// 坐标轴：x 轴从页面横坐标 x0 画到 x1（带箭头），y 轴从页面纵坐标 y0（下端）画到 y1（上端，带箭头）。
// 标注 x、y、O；xl / yl / ol 为 none 时不标。
#let c2a-axes(p, o, x0, x1, y0, y1, xl: $x$, yl: $y$, ol: $O$, odir: "se", od: 11, st: lw) = {
  import cetz.draw: *
  line(p(x0, o.at(1)), p(x1, o.at(1)), stroke: st, mark: arw)
  line(p(o.at(0), y0), p(o.at(0), y1), stroke: st, mark: arw)
  if xl != none { lbl(p, (x1, o.at(1)), xl, dir: "e", d: 10) }
  if yl != none { lbl(p, (o.at(0), y1), yl, dir: "n", d: 10) }
  if ol != none { lbl(p, o, ol, dir: odir, d: od) }
}

// 坐标轴上的刻度短线：水平轴上画竖短线（h: true），竖直轴上画横短线
#let c2a-tick(p, pt, h: true, s: 4) = {
  import cetz.draw: *
  if h { line(p(pt.at(0), pt.at(1) - s), p(pt.at(0), pt.at(1) + s), stroke: lt) }
  else { line(p(pt.at(0) - s, pt.at(1)), p(pt.at(0) + s, pt.at(1)), stroke: lt) }
}

// 角弧：以 o 为顶点，从数学角 a0 转到 a1（度；a1 > a0 为逆时针，a1 < a0 为顺时针），半径 r；arrow: true 在终点加箭头
#let c2a-arc(p, o, r, a0, a1, arrow: false, st: lt) = {
  import cetz.draw: *
  if arrow {
    arc(p(..o), start: a0 * 1deg, stop: a1 * 1deg, radius: r, anchor: "origin", stroke: st, mark: arw)
  } else {
    arc(p(..o), start: a0 * 1deg, stop: a1 * 1deg, radius: r, anchor: "origin", stroke: st)
  }
}

// 阿基米德螺线（表示射线旋转了几周）：中心 o，从角 a0 转到 a1（度），半径从 r0 线性变到 r1；终点加箭头
#let c2a-spiral(p, o, a0, a1, r0, r1, n: 240, st: lw) = {
  import cetz.draw: *
  let pts = range(n + 1).map(i => {
    let t = i / n
    p(..c2a-pol(o, r0 + (r1 - r0) * t, a0 + (a1 - a0) * t))
  })
  line(..pts, stroke: st, mark: (end: "stealth", fill: black, scale: 0.6))
}

// 实心小点（坐标图里的点）
#let c2a-dot(p, c, r: 3) = pdot(p, c, r: r)

// 线段（可指定线宽；geo.typ 的 seg 已带 stroke，不能再传）
#let c2a-seg(p, a, b, st: lw) = {
  import cetz.draw: *
  line(p(..a), p(..b), stroke: st)
}

// 两点的中点
#let c2a-mid(a, b) = ((a.at(0) + b.at(0)) / 2, (a.at(1) + b.at(1)) / 2)
