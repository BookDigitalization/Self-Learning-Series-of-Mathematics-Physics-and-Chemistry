// 复习题十二第 7 题附图：斜抛小球在最高点与另一小球碰撞（原书 p.415）
// 线条图，按原图重绘。坐标取自 p.415 的“显示图”坐标（宽 1568），内部乘 1.0657 换成真实像素。
#import "/common/series.typ": *

#let fig-rev-12-7(width: 9cm) = px-canvas(720, 290, origin: (525, 740), width: width, (p0, u) => {
  import cetz.draw: *
  let k = 1.0657
  let p = (x, y) => p0(x * k, y * k)
  let th = 0.9pt
  let txt(x, y, body) = content(p(x, y), anchor: "center", text(size: 8pt, body))
  // 地面
  line(p(595, 985), p(1180, 985), stroke: th)
  let x = 598
  while x < 1170 {
    line(p(x + 12, 985), p(x, 997), stroke: 0.5pt)
    x += 17
  }
  line(p(540, 985), p(590, 985), stroke: 1.5pt, mark: (end: "stealth", fill: black, scale: 0.5))
  // 上升轨迹（实线）与下降轨迹（虚线）
  bezier(p(620, 976), p(905, 764), p(690, 840), p(800, 765), stroke: 1.2pt)
  bezier(p(925, 765), p(1052, 983), p(995, 755), p(1035, 860), stroke: (thickness: 1.2pt, dash: "dashed"))
  circle(p(620, 976), radius: 5 * k * u, stroke: th, fill: white)
  circle(p(905, 764), radius: 5 * k * u, stroke: th, fill: white)
  circle(p(925, 766), radius: 5 * k * u, stroke: th, fill: white)
  circle(p(1052, 983), radius: 5 * k * u, stroke: th, fill: white)
  // 初速度 v0 与抛射角 60°
  line(p(650, 930), p(692, 845), stroke: 1.2pt, mark: (end: "stealth", fill: black, scale: 0.5))
  txt(642, 872, $v_0$)
  arc(p(620, 976), start: 0deg, stop: 60deg, radius: 62 * k * u, stroke: 0.6pt)
  txt(722, 943, $60°$)
  // 高度 h
  line(p(905, 770), p(905, 985), stroke: (thickness: 1pt, dash: "dashed"))
  txt(920, 880, $h$)
})
