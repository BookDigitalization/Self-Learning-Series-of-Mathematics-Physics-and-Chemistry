// 段 G 图的共用小工具（几何第一册 p.109–125）。所有图文件都 import 本文件。
// 页面渲染 dpi：200（坐标取自 build/pages/g1G/p*-grid.png，网格数字为真实像素）。
#import "/common/geo.typ": *

#let k = 0.0152cm   // 1 像素 ≈ 0.0152 cm

// 带宽度的“纸条/木条”：中线 a→b，宽 w，白底；hatch 为斜纹（原图里画了阴影线的纸条）。
#let G-bar(p, a, b, w, hatch: false, hstep: 9, bg: white) = {
  import cetz.draw: *
  let (dx, dy) = (b.at(0) - a.at(0), b.at(1) - a.at(1))
  let l = calc.sqrt(dx * dx + dy * dy)
  let (ux, uy) = (dx / l, dy / l)
  let (nx, ny) = (-uy * w / 2, ux * w / 2)
  let c1 = (a.at(0) + nx, a.at(1) + ny)
  let c2 = (b.at(0) + nx, b.at(1) + ny)
  let c3 = (b.at(0) - nx, b.at(1) - ny)
  let c4 = (a.at(0) - nx, a.at(1) - ny)
  line(p(..c1), p(..c2), p(..c3), p(..c4), close: true, stroke: lw, fill: bg)
  if hatch {
    let n = calc.floor(l / hstep)
    for i in range(1, n) {
      let t = i * hstep
      let sx = a.at(0) + ux * t
      let sy = a.at(1) + uy * t
      // 斜纹：横向穿过纸条，并沿纸条方向偏 w/2
      line(p(sx + nx * 0.95 - ux * w * 0.25, sy + ny * 0.95 - uy * w * 0.25),
        p(sx - nx * 0.95 + ux * w * 0.25, sy - ny * 0.95 + uy * w * 0.25), stroke: lt)
    }
  }
}

// 纸条上的小孔
#let G-hole(p, c, r: 3.2) = {
  import cetz.draw: *
  circle(p(..c), radius: r, stroke: lt, fill: white)
}

// 两直线交点（点 a1→a2 与 b1→b2 所在直线）
#let G-meet(a1, a2, b1, b2) = {
  let (x1, y1) = a1
  let (x2, y2) = a2
  let (x3, y3) = b1
  let (x4, y4) = b2
  let d = (x1 - x2) * (y3 - y4) - (y1 - y2) * (x3 - x4)
  let t = ((x1 - x3) * (y3 - y4) - (y1 - y3) * (x3 - x4)) / d
  (x1 + t * (x2 - x1), y1 + t * (y2 - y1))
}

// 点 a 向 b 方向走 d 像素
#let G-go(a, b, d) = {
  let (dx, dy) = (b.at(0) - a.at(0), b.at(1) - a.at(1))
  let l = calc.sqrt(dx * dx + dy * dy)
  (a.at(0) + dx / l * d, a.at(1) + dy / l * d)
}

// 线段上的点：a + t (b - a)
#let G-at(a, b, t) = (a.at(0) + t * (b.at(0) - a.at(0)), a.at(1) + t * (b.at(1) - a.at(1)))

// 数字标注（角 1、2…）：直接放在页面坐标处
#let G-num(p, x, y, body) = {
  import cetz.draw: *
  content(p(x, y), tsm(body))
}
