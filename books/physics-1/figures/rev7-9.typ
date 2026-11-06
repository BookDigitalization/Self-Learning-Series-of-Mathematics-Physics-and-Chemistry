// 复习题七 第 9 题附图：起重机吊起重物的 v-t 图（原书 p.211，CeTZ 重绘）
// 坐标取自 200 dpi 看图工具的显示图（宽 1568），不是真实像素；画布左上角在显示图 (540, 1225)。
// 横轴 t：0 在 x = 607，每秒约 55；纵轴 v：0 在 y = 1590，每单位约 38。
#import "/common/series.typ": *

#let fig-rev-7-9(width: 7.5cm) = px-canvas(720, 570, origin: (540, 1225), width: width, (p, u) => {
  import cetz.draw: *
  let lw = 0.6pt
  set-style(stroke: lw, mark: (fill: black, scale: 0.5))
  let tx(pt, body, anchor) = content(pt, anchor: anchor, text(size: 8pt, body))
  let dashed = (paint: black, thickness: lw, dash: "dashed")
  let X(t) = 607 + 55 * t
  let Y(v) = 1590 - 38 * v
  line(p(607, 1795), p(607, 1235), mark: (end: ">"))
  line(p(560, 1590), p(1230, 1590), mark: (end: ">"))
  tx(p(622, 1252), [$v$（米/秒）], "west")
  tx(p(1182, 1640), [$t$（秒）], "west")
  tx(p(597, 1605), [0], "east")
  for v in (2, 4, 6) {
    line(p(607, Y(v)), p(613, Y(v)))
    tx(p(598, Y(v)), [#v], "east")
  }
  for t in (2, 4, 6, 8, 10) {
    line(p(X(t), 1590), p(X(t), 1596))
    tx(p(X(t) - (if t == 10 { 8 } else { 0 }), 1606), [#t], "north")
  }
  // v-t 图线（按原图像素位置）：(0,0) → (2,6) → (6,5.5) → (8,1.8)
  line(p(607, 1590), p(722, 1365), p(943, 1378), p(1052, 1527), stroke: 1.5pt)
  // 虚线
  line(p(607, 1362), p(722, 1362), stroke: dashed)
  line(p(722, 1365), p(722, 1590), stroke: dashed)
  line(p(943, 1378), p(943, 1590), stroke: dashed)
  line(p(1052, 1527), p(1052, 1590), stroke: dashed)
  line(p(607, 1520), p(1052, 1524), stroke: dashed)
})
