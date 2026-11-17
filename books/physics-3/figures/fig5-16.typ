// 图 5·16 定子线圈中的三相交流电图线（原书 p.275）
// 坐标取自原书页面 200 dpi 网格图（按图上显示像素量取）；曲线按 I_A = I_m sin ωt、I_B = I_m sin(ωt − 120°)、I_C = I_m sin(ωt − 240°) 重画。
#import "/common/series.typ": *

#let fig-5-16(width: 10cm) = px-canvas(960, 400, origin: (330, 1330), width: width, (p, u) => {
  import cetz.draw: *
  let tx(x, y, body, sz: 8pt) = content(p(x, y), anchor: "center", text(size: sz, body))
  let ax = 1527
  let x0 = 412
  let tt = 758
  let amp = 109
  line(p(408, ax), p(1245, ax), mark: (end: ">", fill: black), stroke: 0.8pt)
  line(p(x0, 1665), p(x0, 1375), mark: (end: ">", fill: black), stroke: 0.8pt)
  tx(405, 1345, $I$)
  tx(1265, 1523, $t$)
  tx(392, 1540, $O$)
  let curve(shift, dash) = {
    let pts = range(0, 91).map(i => {
      let x = x0 + tt * i / 90
      p(x, ax - amp * calc.sin(2 * calc.pi * (x - x0) / tt - shift / 180 * calc.pi))
    })
    line(..pts, stroke: (thickness: 1.3pt, dash: dash))
  }
  curve(0, none)
  curve(120, "dashed")
  curve(240, "dash-dotted")
  for k in range(1, 7) {
    let x = x0 + tt * k / 6
    line(p(x, 1440), p(x, 1665), stroke: (thickness: 0.6pt, dash: "dash-dotted"))
  }
  tx(602, 1395, $I_A$)
  tx(862, 1388, $I_B$)
  tx(1100, 1388, $I_C$)
  for k in range(0, 6) { tx(x0 + tt * k / 6 + 2, 1683, $t_#k$) }
  tx(1215, 1672, $t_6 = T + t_0$)
  circle(p(368, 1483), radius: 11 * u, stroke: 0.7pt)
  content(p(368, 1483), text(size: 8pt)[×])
  circle(p(370, 1605), radius: 11 * u, stroke: 0.7pt)
  circle(p(370, 1605), radius: 2.5 * u, fill: black, stroke: none)
})
