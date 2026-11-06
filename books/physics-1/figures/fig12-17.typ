// 图 12·17 反冲运动的实例（原书 p.405）
// （a）、（b）是写实插画，保留原扫描裁剪的二值化 PNG（fig12-17a.png、fig12-17b.png，图中无文字）；
// （c）原子核放出粒子的示意图用 CeTZ 重绘。坐标取自 p.405 的“显示图”坐标（宽 1568），内部乘 1.0657 换成真实像素。
#import "/common/series.typ": *

#let fig-12-17c(width: 4.4cm) = px-canvas(380, 440, origin: (1020, 1190), width: width, (p0, u) => {
  import cetz.draw: *
  let k = 1.0657
  let p = (x, y) => p0(x * k, y * k)
  let txt(x, y, body, anchor: "center") = content(p(x, y), anchor: anchor, text(size: 8pt, body))
  let hatch(cx, cy, r, d: 8) = {
    circle(p(cx, cy), radius: r * k * u, stroke: 0.9pt)
    // 斜线填充（裁在圆内）
    let c = -2 * r
    while c < 2 * r {
      // 直线 x - y(向上) = c，与圆的交点
      let a = 1
      let disc = 2 * r * r - c * c
      if disc > 0 {
        let s = calc.sqrt(disc)
        let x0 = (c - s) / 2
        let x1 = (c + s) / 2
        line(p(cx + x0, cy + x0 - c), p(cx + x1, cy + x1 - c), stroke: 0.5pt)
      }
      c += d
    }
  }
  // 上：原子核（质量 M + m）
  hatch(1190, 1272, 33)
  txt(1180, 1210, $M + m$)
  txt(1272, 1262, [原子核])
  // 下：放出的粒子 m 与剩下的核 M
  hatch(1195, 1417, 28)
  line(p(1115, 1418), p(1050, 1418), stroke: 1.2pt, mark: (end: "stealth", fill: black, scale: 0.5))
  circle(p(1123, 1418), radius: 6 * k * u, stroke: 0.9pt)
  txt(1097, 1393, $m$)
  txt(1240, 1383, $M$)
  line(p(1228, 1416), p(1290, 1416), stroke: 1.2pt, mark: (end: "stealth", fill: black, scale: 0.5))
  txt(1296, 1406, $v'$)
})
