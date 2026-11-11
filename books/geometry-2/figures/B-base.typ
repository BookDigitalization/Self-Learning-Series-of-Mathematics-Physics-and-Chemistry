// 段 B 图的共用小工具（几何第二册 p.19–38）。所有 B-*.typ 图文件都 import 本文件。
// 页面渲染 dpi：120（坐标取自 build/pages/B/*.png，由 scripts/crop-view.py 按 --dpi 120 叠网格得到，网格数字为整页真实像素）。
#import "/common/geo.typ": *

#let k = 0.0152cm   // 1 像素 ≈ 0.0152 cm

// 线性插值：a 到 b 的 t 处
#let B-lerp(a, b, t) = (a.at(0) + (b.at(0) - a.at(0)) * t, a.at(1) + (b.at(1) - a.at(1)) * t)

// 多边形在水平线 y 上的交点横坐标（升序）
#let B-xs(pts, y) = {
  let xs = ()
  let n = pts.len()
  for i in range(n) {
    let (x1, y1) = pts.at(i)
    let (x2, y2) = pts.at(calc.rem(i + 1, n))
    if (y1 <= y and y2 > y) or (y2 <= y and y1 > y) {
      xs.push(x1 + (y - y1) * (x2 - x1) / (y2 - y1))
    }
  }
  xs.sorted()
}

// 在多边形内画水平虚线阴影：y 从 y0 到 y1，间距 step
#let B-hatch(p, pts, y0, y1, step, style: dsh) = {
  import cetz.draw: *
  let y = y0
  while y <= y1 {
    let xs = B-xs(pts, y)
    let i = 0
    while i + 1 < xs.len() {
      line(p(xs.at(i), y), p(xs.at(i + 1), y), stroke: style)
      i += 2
    }
    y += step
  }
}

// 带两端竖线的线段（原书表示已知线段）：上方居中写字母
#let B-bar(p, x0, x1, y, name, s: 4, d: 9) = {
  import cetz.draw: *
  line(p(x0, y), p(x1, y), stroke: lb)
  line(p(x0, y - s), p(x0, y + s), stroke: lw)
  line(p(x1, y - s), p(x1, y + s), stroke: lw)
  lbl(p, ((x0 + x1) / 2, y), name, dir: "n", d: d)
}
