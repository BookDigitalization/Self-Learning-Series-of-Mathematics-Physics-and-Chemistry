// 图 14·5（原书 p.485）在地面附近水平抛出的物体：初速 v₀ 越大落地点越远。
// 线条图，按原图重绘。坐标取 200 dpi 页面图的“显示图”像素（宽 1568）。
#import "/common/series.typ": *

#let fig-14-5(width: 8cm) = px-canvas(520, 240, origin: (890, 1300), width: width, (p, u) => {
  import cetz.draw: *
  let O = (942, 1388)
  // 地面与斜线
  line(p(900, 1510), p(1395, 1510), stroke: 1pt)
  for k in range(0, 34) {
    let x = 905 + k * 14.6
    line(p(x + 9, 1510), p(x, 1522), stroke: 0.6pt)
  }
  // 竖直轴
  line(p(942, 1320), p(942, 1510), stroke: 0.9pt)
  // 轨迹：抛物线，落地点 1058、1105、1168、1345
  for xe in (1058, 1105, 1168, 1345) {
    let L = xe - O.at(0)
    let pts = range(0, 41).map(i => {
      let t = i / 40
      p(O.at(0) + L * t, O.at(1) + (1510 - O.at(1)) * t * t)
    })
    line(..pts, stroke: 1.2pt)
    circle(p(xe, 1510), radius: 3, fill: black, stroke: none)
  }
  circle(p(..O), radius: 5, fill: black, stroke: none)
  // v₀
  line(p(..O), p(1105, 1384), stroke: 1pt, mark: (end: "stealth", fill: black, scale: 0.4))
  content(p(1128, 1366), anchor: "center", text(size: 9.5pt, $v_0$))
})
