// 几何册（平面几何、立体几何、三角、解析几何）插图共用的小工具。
// 用法：figures/figX-Y.typ 里 `#import "/common/geo.typ": *`，在 `px-canvas(w, h, origin: …, width: …, (p, u) => { import cetz.draw: *; … })`
// 里画图。坐标一律取扫描页面像素（y 向下，`p(x, y)` 转成画布坐标），所有半径、边长也以像素计。
//
// 约定：
//  - 点用 (x, y) 数组；`p` 是 px-canvas 传进来的坐标转换函数，每个工具的第一个参数都是它。
//  - 图中字母用 `$A$` 这样的斜体数学字母；`lbl` 把字母放在点的某个方位（"n" "ne" "e" "se" "s" "sw" "w" "nw"）。
//  - 线宽：`lw`（图形的轮廓线，约 0.9pt）、`lt`（细线 0.6pt）、`dsh`（虚线）。
#import "/common/series.typ": *

#let lw = 0.9pt                                            // 图形轮廓线
#let lt = 0.6pt                                            // 细线（辅助线、角弧）
#let lb = 1.3pt                                            // 加粗线（原图里描粗的线）
#let dsh = (paint: black, thickness: 0.6pt, dash: "dashed") // 虚线
#let dot = (paint: black, thickness: 0.6pt, dash: "dotted")
#let tt(body) = text(font: fonts.song, size: 8pt, body)
#let tsm(body) = text(font: fonts.song, size: 7pt, body)
#let arw = (end: "stealth", fill: black, scale: 0.45)
#let arw2 = (start: "stealth", end: "stealth", fill: black, scale: 0.45)

// 页面向量 (dx, dy)（y 向下）的方向角（数学角，逆时针为正）
#let dirang(dx, dy) = calc.atan2(dx, -dy)

// 折线 / 多边形：poly(p, (a, b, c), close: true)
#let poly(p, pts, close: false, ..style) = {
  import cetz.draw: *
  let q = pts.map(t => p(..t))
  line(..q, close: close, stroke: lw, ..style)
}

// 线段：seg(p, a, b)；线段上的等分记号 ticks(p, a, b, n)
#let seg(p, a, b, ..style) = {
  import cetz.draw: *
  line(p(..a), p(..b), stroke: lw, ..style)
}

// 圆：circ(p, center, r)
#let circ(p, c, r, ..style) = {
  import cetz.draw: *
  circle(p(..c), radius: r, stroke: lw, ..style)
}

// 实心点
#let pdot(p, c, r: 2.2) = {
  import cetz.draw: *
  circle(p(..c), radius: r, fill: black, stroke: none)
}

// 字母标注：lbl(p, 点, $A$, "ne")，d 为离开点的像素距离。
#let lbl(p, pt, body, dir: "n", d: 9) = {
  import cetz.draw: *
  let (dx, dy) = (
    n: (0, -1), ne: (0.7, -0.7), e: (1, 0), se: (0.7, 0.7),
    s: (0, 1), sw: (-0.7, 0.7), w: (-1, 0), nw: (-0.7, -0.7), c: (0, 0),
  ).at(dir)
  content(p(pt.at(0) + dx * d, pt.at(1) + dy * d), tt(body))
}

// 角弧：anglearc(p, 顶点, 一边上的点, 另一边上的点, r)，沿夹角小于 180° 的一侧画；mark 可加箭头
#let anglearc(p, v, a, b, r, ..style) = {
  import cetz.draw: *
  let t1 = dirang(a.at(0) - v.at(0), a.at(1) - v.at(1))
  let t2 = dirang(b.at(0) - v.at(0), b.at(1) - v.at(1))
  let d = calc.rem(calc.rem((t2 - t1).deg(), 360) + 360, 360) * 1deg
  let (s, e) = if d <= 180deg { (t1, t1 + d) } else { (t2, t2 + (360deg - d)) }
  arc(p(..v), start: s, stop: e, radius: r, anchor: "origin", stroke: lt, ..style)
}

// 直角记号（小方块）：rtmark(p, 顶点, 一边上的点, 另一边上的点, 边长 s)
#let rtmark(p, v, a, b, s: 8) = {
  import cetz.draw: *
  let n(x, y) = { let l = calc.sqrt(x * x + y * y); (x / l, y / l) }
  let u1 = n(a.at(0) - v.at(0), a.at(1) - v.at(1))
  let u2 = n(b.at(0) - v.at(0), b.at(1) - v.at(1))
  let pa = (v.at(0) + u1.at(0) * s, v.at(1) + u1.at(1) * s)
  let pb = (v.at(0) + u2.at(0) * s, v.at(1) + u2.at(1) * s)
  let pc = (pa.at(0) + u2.at(0) * s, pa.at(1) + u2.at(1) * s)
  line(p(..pa), p(..pc), p(..pb), stroke: lt)
}

// 线段相等记号：ticks(p, a, b, 2)，在线段中点画 n 道短横线（n = 1、2、3）
#let ticks(p, a, b, n, s: 4, gap: 3) = {
  import cetz.draw: *
  let (dx, dy) = (b.at(0) - a.at(0), b.at(1) - a.at(1))
  let l = calc.sqrt(dx * dx + dy * dy)
  let (ux, uy) = (dx / l, dy / l)
  let (nx, ny) = (-uy, ux)
  let (mx, my) = ((a.at(0) + b.at(0)) / 2, (a.at(1) + b.at(1)) / 2)
  for i in range(n) {
    let o = (i - (n - 1) / 2) * gap
    let c = (mx + ux * o, my + uy * o)
    line(p(c.at(0) - nx * s, c.at(1) - ny * s), p(c.at(0) + nx * s, c.at(1) + ny * s), stroke: lt)
  }
}

// 平行记号（线段中部的小箭头）：parmark(p, a, b, n)，n 个箭头
#let parmark(p, a, b, n: 1, s: 5, gap: 6) = {
  import cetz.draw: *
  let (dx, dy) = (b.at(0) - a.at(0), b.at(1) - a.at(1))
  let l = calc.sqrt(dx * dx + dy * dy)
  let (ux, uy) = (dx / l, dy / l)
  let (nx, ny) = (-uy, ux)
  let (mx, my) = ((a.at(0) + b.at(0)) / 2, (a.at(1) + b.at(1)) / 2)
  for i in range(n) {
    let o = (i - (n - 1) / 2) * gap
    let c = (mx + ux * o, my + uy * o)
    let tip = (c.at(0) + ux * s, c.at(1) + uy * s)
    line(p(c.at(0) - ux * s + nx * s, c.at(1) - uy * s + ny * s), p(..tip),
      p(c.at(0) - ux * s - nx * s, c.at(1) - uy * s - ny * s), stroke: lt)
  }
}
