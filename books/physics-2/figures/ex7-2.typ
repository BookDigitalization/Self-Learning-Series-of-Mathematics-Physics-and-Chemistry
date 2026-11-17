// 习题 7·2 第 1 题附图：硫代硫酸钠熔化和凝固的温度—时间曲线（原书 p.226，CeTZ 重绘）
// 坐标取自 200 dpi 带网格的页面图。横轴：t = 0 在 x = 268，每分 15.9 px；纵轴：0°C 在 y = 775，每 10°C 25.4 px。
#import "/common/series.typ": *

#let fig-ex-7-2-1(width: 9.4cm) = px-canvas(660, 310, origin: (200, 540), width: width, (p, u) => {
  import cetz.draw: *
  let lw = 0.6pt
  set-style(stroke: lw)
  let tx(pt, body, anchor) = content(pt, anchor: anchor, text(size: 8pt, body))
  let X(t) = 268 + 15.9 * t
  let Y(v) = 775 - 2.54 * v
  line(p(268, 775), p(268, 550), mark: (end: ">", fill: black, scale: 0.5))
  line(p(268, 775), p(850, 775), mark: (end: ">", fill: black, scale: 0.5))
  for v in (10, 20, 30, 40, 50, 60, 70) {
    line(p(268, Y(v)), p(274, Y(v)))
    tx(p(264, Y(v)), [#v], "east")
  }
  for t in range(0, 31, step: 2) {
    if t > 0 { line(p(X(t), 775), p(X(t), 770)) }
    tx(p(X(t), 784), [#t], "north")
  }
  tx(p(222, 672), std.rotate(-90deg, [温度（°C）]), "center")
  tx(p(595, 815), [时间（分）], "center")
  tx(p(352, 642), [48°], "center")
  line(p(268, 712), p(348, 655), p(412, 655), p(462, 616), p(528, 657), p(655, 657), p(737, 684), stroke: 1.5pt)
})
