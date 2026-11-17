// 图 2·17 简单的量热器（原书 p.53）
// 线条图，按原图重绘。坐标是 200 dpi 页面图裁出的局部（原页坐标 725,565–960,880 放大 2.5 倍，588×788）的像素坐标。
#import "/common/series.typ": *

#let fig-2-17(width: 4.4cm) = px-canvas(588, 788, width: width, (p, u) => {
  import cetz.draw: *
  let T = 2.2pt
  let hatch(x0, y0, x1, y1, step: 14) = {
    rect(p(x0, y0), p(x1, y1), stroke: 1.4pt, fill: white)
    let h = y1 - y0
    // 两组 45° 斜线，截在矩形内
    for dir in (1, -1) {
      let k = x0 - h
      while k < x1 {
        let ax = k
        let bx = k + h
        let (sx0, sy0, sx1, sy1) = if dir == 1 { (ax, y1, bx, y0) } else { (ax, y0, bx, y1) }
        // 裁剪到 [x0, x1]
        let t0 = 0.0
        let t1 = 1.0
        if sx0 < x0 { t0 = (x0 - sx0) / (sx1 - sx0) }
        if sx1 > x1 { t1 = (x1 - sx0) / (sx1 - sx0) }
        if t0 < t1 and sx1 > x0 and sx0 < x1 {
          line(p(sx0 + (sx1 - sx0) * t0, sy0 + (sy1 - sy0) * t0),
               p(sx0 + (sx1 - sx0) * t1, sy0 + (sy1 - sy0) * t1), stroke: 0.6pt)
        }
        k += step
      }
    }
  }
  // 外杯 B（带盖）
  line(p(50, 195), p(50, 723), p(520, 723), p(520, 195), stroke: T)
  // 盖与软木塞
  hatch(35, 155, 548, 195)
  hatch(148, 195, 415, 230)
  // 内杯 A
  line(p(150, 230), p(150, 685), p(415, 685), p(415, 230), stroke: 1.6pt)
  // 水面
  line(p(150, 292), p(415, 292), stroke: 1.2pt)
  // 水：短横线
  let row = 0
  let y = 312
  while y < 668 {
    let off = calc.rem(row * 37, 61)
    let x = 158 + off * 0.6
    while x < 405 {
      let len = 34 + calc.rem(row * 13 + x, 23)
      let x1 = calc.min(x + len, 408)
      // 避开温度计和搅拌器所在的竖线：只画落在空档里的部分
      for (a, b) in ((158, 280), (306, 366), (384, 408)) {
        let lo = calc.max(x, a)
        let hi = calc.min(x1, b)
        if hi - lo > 8 { line(p(lo, y), p(hi, y), stroke: 0.7pt) }
      }
      x += len + 9 + calc.rem(row * 7 + x, 11)
    }
    row += 1
    y += 21.5
  }
  // 支撑
  for cx in (205, 362) {
    line(p(cx - 22, 723), p(cx, 692), p(cx + 22, 723), close: true, fill: black, stroke: 1pt)
  }
  // 温度计 T：玻璃管
  rect(p(286, 120), p(300, 540), stroke: 1pt, fill: white)
  line(p(286, 540), p(293, 562), p(300, 540), stroke: 1pt, fill: white)
  rect(p(290, 430), p(297, 530), stroke: none, fill: black)
  circle(p(293, 108), radius: 12 * u, stroke: 1.2pt, fill: white)
  // 搅拌器 C
  line(p(375, 38), p(375, 545), stroke: 1.4pt)
  bezier(p(375, 545), p(330, 583), p(375, 575), p(355, 583), stroke: 1.4pt)
  line(p(330, 583), p(272, 572), stroke: 1.4pt)
  // 标注
  let lab(x, y, body) = content(p(x, y), anchor: "center", text(size: 9pt, style: "italic", body))
  lab(262, 88, $T$)
  lab(400, 75, $C$)
  lab(440, 535, $A$)
  lab(548, 535, $B$)
})
