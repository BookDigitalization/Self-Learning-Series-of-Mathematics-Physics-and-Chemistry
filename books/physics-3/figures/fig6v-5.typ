// 图 6·5 电磁波传播示意图（原书 p.311）。CeTZ 重绘；
// 坐标取自 250 dpi 的局部裁图（原点为裁图左上角，裁图左上角在 150 dpi 页面像素 (320,170)）。
#import "/common/series.typ": *

#let fig-6v-5(width: 8.5cm) = px-canvas(1050, 570, origin: (0, 0), width: width, (p, u) => {
  import cetz.draw: *
  let lab(x, y, body) = content(p(x, y), anchor: "center", text(size: 9pt, body))
  let arr(a, b, s: 0.55, th: 0.8pt) = line(p(..a), p(..b), stroke: th, mark: (end: ">", fill: black, scale: s))
  let (x0, x1, y0, y1) = (240, 845, 165, 527)
  // 竖直面（电场所在面）：斜线阴影
  rect(p(x0, y0), p(x1, y1), stroke: 0.9pt)
  let h = y1 - y0
  let d = 24
  for k in range(-16, 40) {
    // 直线 x = a + (y1 - y) * 0.62，a = x0 + k*d ，与矩形求交
    let a = x0 + k * d
    let ya = y1
    let yb = y0
    let xa = a
    let xb = a + h * 0.62
    // 裁到 [x0, x1]
    let ta = 0.0
    let tb = 1.0
    if xb - xa != 0 {
      let t0 = (x0 - xa) / (xb - xa)
      let t1 = (x1 - xa) / (xb - xa)
      ta = calc.max(0.0, calc.min(t0, t1))
      tb = calc.min(1.0, calc.max(t0, t1))
    }
    if tb > ta {
      line(p(xa + (xb - xa) * ta, ya + (yb - ya) * ta), p(xa + (xb - xa) * tb, ya + (yb - ya) * tb), stroke: 0.35pt + gray)
    }
  }
  // 磁场所在的水平面（平行四边形）
  line(p(145, 420), p(760, 420), p(940, 283), stroke: 1.0pt)
  line(p(395, 283), p(940, 283), stroke: (thickness: 0.8pt, dash: (6pt, 4pt)))
  line(p(240, 350), p(395, 283), stroke: (thickness: 0.8pt, dash: (6pt, 4pt)))
  // 轴线
  arr((240, 360), (243, 62), s: 0.7, th: 1.0pt)
  arr((240, 350), (985, 350), s: 0.7, th: 1.0pt)
  arr((240, 350), (85, 456), s: 0.7, th: 1.0pt)
  line(p(145, 420), p(240, 350), stroke: 1.0pt)
  // 电场 E 的正弦曲线：正半波实线，负半波虚线；半波内竖线阴影
  let wave(xs, sign: 1, dash: false) = {
    let n = 40
    let pts = range(0, n + 1).map(i => {
      let t = i / n
      (xs + 140 * t, 350 - sign * 135 * calc.sin(calc.pi * t))
    })
    line(..pts.map(q => p(..q)), stroke: if dash { (thickness: 1pt, dash: (5pt, 3pt)) } else { 1.6pt })
    for i in range(1, 17) {
      let t = i / 17
      let x = xs + 140 * t
      line(p(x, 350), p(x, 350 - sign * 135 * calc.sin(calc.pi * t)), stroke: 0.35pt)
    }
  }
  wave(240, sign: 1)
  wave(380, sign: -1, dash: true)
  wave(495, sign: 1)
  wave(635, sign: -1, dash: true)
  arr((312, 262), (312, 232), s: 0.5)
  arr((587, 262), (587, 232), s: 0.5)
  // 磁场 H：沿水平面的箭头
  for xs in (240, 495) {
    arr((xs + 148, 350), (xs + 15, 408), s: 0.6, th: 1.4pt)
    bezier(p(xs, 350), p(xs + 18, 406), p(xs - 18, 365), p(xs - 8, 408), stroke: 1.4pt)
  }
  // 标注
  lab(243, 50, $E$)
  lab(220, 330, $O$)
  lab(1002, 352, $t$)
  lab(62, 466, $H$)
})
