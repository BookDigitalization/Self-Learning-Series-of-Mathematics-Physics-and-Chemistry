// 段 F 图的共用小工具（几何第一册 p.89–108，§2·4–§2·7）。所有 F-*.typ 都 import 本文件。
// 页面渲染 dpi：200（页面宽约 1003 像素，坐标取自 build/pages/g1/p*.png）。
#import "/common/geo.typ": *

#let k = 0.0152cm   // 1 像素 ≈ 0.0152 cm

// 放置 PNG（路径相对于本文件所在的 figures/）
#let F-img(p, u, path, box) = {
  import cetz.draw: *
  let (x0, y0, x1, y1) = box
  content(p(x0, y0), image(path, width: (x1 - x0) * u), anchor: "north-west")
}

// 两直线交点（点 a1→a2 与 b1→b2 所在直线）
#let F-meet(a1, a2, b1, b2) = {
  let (x1, y1) = a1
  let (x2, y2) = a2
  let (x3, y3) = b1
  let (x4, y4) = b2
  let d = (x1 - x2) * (y3 - y4) - (y1 - y2) * (x3 - x4)
  let t = ((x1 - x3) * (y3 - y4) - (y1 - y3) * (x3 - x4)) / d
  (x1 + t * (x2 - x1), y1 + t * (y2 - y1))
}

// 点 pt 到直线 a-b 的垂足
#let F-foot(pt, a, b) = {
  let (dx, dy) = (b.at(0) - a.at(0), b.at(1) - a.at(1))
  let t = ((pt.at(0) - a.at(0)) * dx + (pt.at(1) - a.at(1)) * dy) / (dx * dx + dy * dy)
  (a.at(0) + t * dx, a.at(1) + t * dy)
}

// 线段上的点：a + t (b - a)
#let F-at(a, b, t) = (a.at(0) + t * (b.at(0) - a.at(0)), a.at(1) + t * (b.at(1) - a.at(1)))

// 两点距离
#let F-dist(a, b) = calc.sqrt(calc.pow(a.at(0) - b.at(0), 2) + calc.pow(a.at(1) - b.at(1), 2))

// 两圆交点（圆心 c1、c2，半径 r1、r2）：返回 (上交点, 下交点)（页面 y 向下，“上”指 y 较小者）
#let F-cc(c1, r1, c2, r2) = {
  let d = F-dist(c1, c2)
  let a = (r1 * r1 - r2 * r2 + d * d) / (2 * d)
  let h = calc.sqrt(r1 * r1 - a * a)
  let (ux, uy) = ((c2.at(0) - c1.at(0)) / d, (c2.at(1) - c1.at(1)) / d)
  let m = (c1.at(0) + a * ux, c1.at(1) + a * uy)
  let q1 = (m.at(0) - h * uy, m.at(1) + h * ux)
  let q2 = (m.at(0) + h * uy, m.at(1) - h * ux)
  if q1.at(1) < q2.at(1) { (q1, q2) } else { (q2, q1) }
}

// 圆弧：圆心 c（页面坐标），半径 r（像素），起止角为“看图的”逆时针角度（度），可传 stroke
#let F-arc(p, c, r, a0, a1, st: lt) = {
  import cetz.draw: *
  arc(p(..c), start: a0 * 1deg, stop: a1 * 1deg, radius: r, anchor: "origin", stroke: st)
}

// 过点 pt 的小弧，圆心 c，两侧各 half 度（作图痕迹）
#let F-cross(p, c, pt, half: 9, st: lt) = {
  let a = dirang(pt.at(0) - c.at(0), pt.at(1) - c.at(1)) / 1deg
  F-arc(p, c, F-dist(c, pt), a - half, a + half, st: st)
}

// 带宽度的槽/条：中线 a→b，宽 w，hatch 为斜纹
#let F-bar(p, a, b, w, hatch: false, hstep: 7) = {
  import cetz.draw: *
  let (dx, dy) = (b.at(0) - a.at(0), b.at(1) - a.at(1))
  let l = calc.sqrt(dx * dx + dy * dy)
  let (ux, uy) = (dx / l, dy / l)
  let (nx, ny) = (-uy * w / 2, ux * w / 2)
  let c1 = (a.at(0) + nx, a.at(1) + ny)
  let c2 = (b.at(0) + nx, b.at(1) + ny)
  let c3 = (b.at(0) - nx, b.at(1) - ny)
  let c4 = (a.at(0) - nx, a.at(1) - ny)
  line(p(..c1), p(..c2), p(..c3), p(..c4), close: true, stroke: lw, fill: white)
  if hatch {
    let n = calc.floor(l / hstep)
    for i in range(1, n) {
      let t = i * hstep
      let sx = a.at(0) + ux * t
      let sy = a.at(1) + uy * t
      line(p(sx + nx - ux * w * 0.4, sy + ny - uy * w * 0.4),
        p(sx - nx + ux * w * 0.4, sy - ny + uy * w * 0.4), stroke: lt)
    }
  }
}

// 数字标注（角 1、2…）
#let F-num(p, x, y, body) = {
  import cetz.draw: *
  content(p(x, y), tsm(body))
}
