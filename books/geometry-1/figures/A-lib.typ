// 段 A（绪论、第 1 章 §1·1–§1·4）插图的共用小工具。坐标一律为原书页面像素（200 dpi，宽约 1000，y 向下）。
#import "/common/geo.typ": *

#let k = 0.0152cm

// 线段 a→b 的单位法向
#let A-nrm(a, b) = {
  let dx = b.at(0) - a.at(0)
  let dy = b.at(1) - a.at(1)
  let l = calc.sqrt(dx * dx + dy * dy)
  (-dy / l, dx / l)
}
// 在线段 a→b 上的点 pt 处画垂直于线段的短横（半长 s）
#let A-tick(p, a, b, pt, s: 5) = {
  import cetz.draw: *
  let n = A-nrm(a, b)
  line(p(pt.at(0) - n.at(0) * s, pt.at(1) - n.at(1) * s), p(pt.at(0) + n.at(0) * s, pt.at(1) + n.at(1) * s), stroke: lw)
}
// 两端带短横的线段（原书用来表示线段的端点）
#let A-pseg(p, a, b, s: 5, ..style) = {
  seg(p, a, b, ..style)
  A-tick(p, a, b, a, s: s)
  A-tick(p, a, b, b, s: s)
}
// 竖线（尺寸界线）
#let A-vl(p, x, y0, y1) = {
  import cetz.draw: *
  line(p(x, y0), p(x, y1), stroke: lw)
}
// 水平尺寸线：两端箭头；lab 不为空时在 labx 处断开放文字
#let A-dim(p, x0, x1, y, lab: none, labx: auto, gapw: 26) = {
  import cetz.draw: *
  if lab == none {
    line(p(x0, y), p(x1, y), stroke: lt, mark: arw2)
  } else {
    let m = if labx == auto { (x0 + x1) / 2 } else { labx }
    line(p(x0, y), p(m - gapw / 2, y), stroke: lt, mark: (start: "stealth", fill: black, scale: 0.45))
    line(p(m + gapw / 2, y), p(x1, y), stroke: lt, mark: (end: "stealth", fill: black, scale: 0.45))
    lbl(p, (m, y), lab, dir: "c", d: 0)
  }
}
// 放置 PNG：box = (x0, y0, x1, y1) 为它在页面上的像素范围
#let A-img(p, u, path, box) = {
  import cetz.draw: *
  let (x0, y0, x1, y1) = box
  content(p(x0, y0), image(path, width: (x1 - x0) * u), anchor: "north-west")
}
// 文字（中心对齐）
#let A-t(p, pt, body) = lbl(p, pt, body, dir: "c", d: 0)
// 小圆圈（空心点）
#let A-ring(p, c, r: 3) = {
  import cetz.draw: *
  circle(p(..c), radius: r, fill: white, stroke: lw)
}
// 刻度尺（毫米刻度）：从 x0 起每 unit 像素一厘米，刻度线自上沿 ytop 向下；i 取 [i0, i1]
#let A-ticks(p, x0, unit, ytop, i0, i1, lm: 8, lh: 12, lc: 16) = {
  import cetz.draw: *
  for i in range(i0, i1 + 1) {
    let l = if calc.rem(i, 10) == 0 { lc } else if calc.rem(i, 5) == 0 { lh } else { lm }
    let x = x0 + i * unit / 10
    line(p(x, ytop), p(x, ytop + l), stroke: lt)
  }
}
// 虚线段
#let A-dash(p, a, b) = {
  import cetz.draw: *
  line(p(..a), p(..b), stroke: dsh)
}
