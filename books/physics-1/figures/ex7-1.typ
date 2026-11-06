// 习题 7·1 第 9 题附图：某一物体作直线运动的 v-t 图（原书 p.197，CeTZ 重绘）
// 坐标取自 200 dpi 看图工具的显示图（宽 1568），不是真实像素；画布左上角在显示图 (570, 150)。
#import "/common/series.typ": *

#let fig-ex-7-1-9(width: 6.5cm) = px-canvas(640, 570, origin: (570, 150), width: width, (p, u) => {
  import cetz.draw: *
  let X(t) = 637 + 38 * t
  let Y(v) = 458 - 60 * v
  let lw = 0.6pt
  set-style(stroke: lw)
  let tx(pt, body, anchor) = content(pt, anchor: anchor, text(size: 8pt, body))
  let dashed = (paint: black, thickness: lw, dash: "dashed")
  line(p(637, 510), p(637, 170), mark: (end: ">", fill: black, scale: 0.5))
  line(p(590, 458), p(1185, 458), mark: (end: ">", fill: black, scale: 0.5))
  tx(p(647, 178), [$v$（米/秒）], "west")
  tx(p(1120, 478), [$t$（秒）], "west")
  tx(p(626, 475), [0], "east")
  for v in (1, 2, 3, 4) {
    line(p(637, Y(v)), p(643, Y(v)))
    tx(p(628, Y(v)), [#v], "east")
  }
  for t in (1, 3, 5, 7, 9, 11) {
    line(p(X(t), 458), p(X(t), 464))
    tx(p(X(t), 470), [#t], "north")
  }
  // 图线：(1,0) → (5,4) → 在 t = 9 处最低
  line(p(X(1), 458), p(X(5), Y(4)), p(X(9), 668), stroke: 1.5pt)
  line(p(637, Y(4)), p(X(5), Y(4)), stroke: dashed)
  line(p(X(5), Y(4)), p(X(5), 458), stroke: dashed)
  line(p(X(9), 458), p(X(9), 668), stroke: dashed)
})
