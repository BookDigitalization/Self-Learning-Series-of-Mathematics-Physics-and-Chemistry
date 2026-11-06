// 图 11·3 功的计算（原书 p.331）
// 示意图，按原图重绘。坐标是 render-pages.py --dpi 200 显示图（宽 1568）上的像素坐标。
// 原图物体上带点状阴影，这里略去；地面斜线用等距斜线重绘。
#import "/common/series.typ": *

#let fig-11-3(width: 8.6cm) = px-canvas(700, 230, origin: (545, 100), width: width, (p, u) => {
  import cetz.draw: *
  let lab(x, y, body) = content(p(x, y), anchor: "center", text(size: 10pt, body))
  // 地面
  line(p(558, 285), p(1228, 285), stroke: 1pt)
  for k in range(0, 56) {
    let x = 558 + k * 12
    line(p(x + 12, 285), p(x, 325), stroke: 0.4pt)
  }
  line(p(558, 325), p(1228, 325), stroke: 0.4pt)
  // 初位置物体
  line(p(612, 280), p(612, 183), p(777, 183), p(777, 280), stroke: 1pt)
  circle(p(692, 232), radius: 5 * u, stroke: 0.8pt)
  line(p(697, 232), p(855, 232), stroke: 1pt, mark: (end: "stealth", fill: black, scale: 0.5))
  lab(880, 232, $F$)
  // 末位置物体（虚线）
  line(p(918, 280), p(918, 183), p(1082, 183), p(1082, 280), stroke: (paint: black, thickness: 0.8pt, dash: "dashed"))
  line(p(1082, 183), p(1082, 280), stroke: (paint: black, thickness: 0.8pt, dash: "dashed"))
  circle(p(997, 232), radius: 5 * u, stroke: 0.8pt)
  line(p(1002, 232), p(1165, 232), stroke: (paint: black, thickness: 0.8pt, dash: "dashed"), mark: (end: "stealth", fill: black, scale: 0.5))
  lab(1182, 232, $F$)
  // 路程 s
  line(p(692, 118), p(692, 228), stroke: 0.6pt)
  line(p(1000, 118), p(1000, 228), stroke: 0.6pt)
  line(p(692, 145), p(838, 145), stroke: 0.7pt, mark: (start: "stealth", fill: black, scale: 0.4))
  line(p(868, 145), p(1000, 145), stroke: 0.7pt, mark: (end: "stealth", fill: black, scale: 0.4))
  lab(853, 145, $s$)
})
