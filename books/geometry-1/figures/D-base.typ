// 段 D 图的共用小工具（几何第一册 p.50–68，§1·11、§1·12）。所有图文件都 import 本文件。
// 页面渲染 dpi：200（坐标取自 build/pages/g1/p*.png 及 crop-view 放大图，网格数字为真实像素）。
#import "/common/geo.typ": *

#let k = 0.0152cm   // 1 像素 ≈ 0.0152 cm

// 字母标注：D-T(p, x, y, $A$)，(x, y) 是文字中心的页面坐标
#let D-T(p, x, y, body) = {
  import cetz.draw: *
  content(p(x, y), tt(body))
}
// 角号数字标注（小字号）
#let D-N(p, x, y, body) = {
  import cetz.draw: *
  content(p(x, y), tsm(body))
}
// 带白底的标注（压在网格线上时用）
#let D-W(p, x, y, body) = {
  import cetz.draw: *
  content(p(x, y), tt(body), frame: "rect", fill: white, stroke: none, padding: 1.2pt)
}
// 两直线交点（a1a2 与 b1b2 所在直线）
#let D-meet(a1, a2, b1, b2) = {
  let (x1, y1) = a1
  let (x2, y2) = a2
  let (x3, y3) = b1
  let (x4, y4) = b2
  let d = (x1 - x2) * (y3 - y4) - (y1 - y2) * (x3 - x4)
  let t = ((x1 - x3) * (y3 - y4) - (y1 - y3) * (x3 - x4)) / d
  (x1 + t * (x2 - x1), y1 + t * (y2 - y1))
}
// 直线 a→b 上纵坐标为 y 的点
#let D-aty(a, b, y) = (a.at(0) + (b.at(0) - a.at(0)) * (y - a.at(1)) / (b.at(1) - a.at(1)), y)
// 直线 a→b 上横坐标为 x 的点
#let D-atx(a, b, x) = (x, a.at(1) + (b.at(1) - a.at(1)) * (x - a.at(0)) / (b.at(0) - a.at(0)))
// 角弧：n = 1 单弧，n = 2 双弧
#let D-arc(p, v, a, b, r, n: 1) = {
  anglearc(p, v, a, b, r)
  if n == 2 { anglearc(p, v, a, b, r + 3.5) }
}
// 在凸多边形 pts 内画斜纹（dir 为纹的方向，页面坐标，dx 不为 0），间隔 step 像素
#let D-hatch(p, pts, step: 7, dir: (1, 1), st: lt) = {
  import cetz.draw: *
  let n = pts.len()
  let area = 0
  for i in range(n) {
    let a = pts.at(i)
    let b = pts.at(calc.rem(i + 1, n))
    area += a.at(0) * b.at(1) - b.at(0) * a.at(1)
  }
  let s = if area >= 0 { 1 } else { -1 }
  let (dx, dy) = dir
  let qs = pts.map(v => dx * v.at(1) - dy * v.at(0))
  let q0 = calc.min(..qs)
  let q1 = calc.max(..qs)
  let m = calc.floor((q1 - q0) / step)
  for j in range(1, m + 1) {
    let q = q0 + j * step - (q1 - q0 - m * step) / 2
    let (px, py) = (0, q / dx)
    let tmin = -1e9
    let tmax = 1e9
    let ok = true
    for i in range(n) {
      let a = pts.at(i)
      let b = pts.at(calc.rem(i + 1, n))
      let e = (b.at(0) - a.at(0), b.at(1) - a.at(1))
      let num = s * (e.at(0) * (py - a.at(1)) - e.at(1) * (px - a.at(0)))
      let den = s * (e.at(0) * dy - e.at(1) * dx)
      if calc.abs(den) < 1e-9 {
        if num < 0 { ok = false }
      } else if den > 0 {
        tmin = calc.max(tmin, -num / den)
      } else {
        tmax = calc.min(tmax, -num / den)
      }
    }
    if ok and tmax > tmin {
      line(p(px + tmin * dx, py + tmin * dy), p(px + tmax * dx, py + tmax * dy), stroke: st)
    }
  }
}
// 平行于坐标轴的细长矩形（纸条）：x0..x1，中线 yc，高 h
#let D-rect(p, x0, x1, yc, h, ..style) = {
  import cetz.draw: *
  rect(p(x0, yc - h / 2), p(x1, yc + h / 2), stroke: lw, ..style)
}
// 斜放的窄条（轴线 a→b，宽 w），不填充
#let D-strip(p, a, b, w) = {
  import cetz.draw: *
  let (dx, dy) = (b.at(0) - a.at(0), b.at(1) - a.at(1))
  let l = calc.sqrt(dx * dx + dy * dy)
  let (nx, ny) = (-dy / l * w / 2, dx / l * w / 2)
  line(p(a.at(0) + nx, a.at(1) + ny), p(b.at(0) + nx, b.at(1) + ny), stroke: lw)
  line(p(a.at(0) - nx, a.at(1) - ny), p(b.at(0) - nx, b.at(1) - ny), stroke: lw)
  line(p(a.at(0) + nx, a.at(1) + ny), p(a.at(0) - nx, a.at(1) - ny), stroke: lw)
  line(p(b.at(0) + nx, b.at(1) + ny), p(b.at(0) - nx, b.at(1) - ny), stroke: lw)
}
