// 图 7·2 升降机的 F-t 图（原书 p.196，CeTZ 重绘）
// 坐标取自 200 dpi 看图工具的显示图（宽 1568），不是真实像素；画布左上角在显示图 (440, 220)。
// 横轴：t = 0 在 x = 538，每秒 44.5；纵轴：F = 0 在 y = 498，每 100 牛 45。
#import "/common/series.typ": *

#let fig-7-2(width: 9cm) = px-canvas(810, 610, origin: (440, 220), width: width, (p, u) => {
  import cetz.draw: *
  let X(t) = 538 + 44.5 * t
  let Y(f) = 498 - 0.45 * f
  let lw = 0.6pt
  set-style(stroke: lw)
  let tx(pt, body, anchor) = content(pt, anchor: anchor, text(size: 8pt, body))
  // 坐标轴
  line(p(538, 815), p(538, 232), mark: (end: ">", fill: black, scale: 0.5))
  line(p(500, 498), p(1215, 498), mark: (end: ">", fill: black, scale: 0.5))
  tx(p(548, 240), [$F$（牛）], "west")
  tx(p(1165, 515), [$t$（秒）], "west")
  tx(p(526, 518), [0], "east")
  for t in (2, 4, 6, 8, 10, 12, 14) {
    line(p(X(t), 498), p(X(t), 504))
    tx(p(X(t), 520), [#t], "north")
  }
  for f in (100, 200, 300, 400) {
    line(p(538, Y(f)), p(544, Y(f)))
    tx(p(528, Y(f)), [#f], "east")
  }
  for f in (-100, -200, -300, -400, -500) {
    line(p(538, Y(f)), p(544, Y(f)))
    tx(p(528, Y(f)), [#sym.minus#calc.abs(f)], "east")
  }
  // F-t 图线
  line(p(538, Y(250)), p(X(6), Y(250)), stroke: 1.8pt)
  line(p(X(6), Y(0)), p(X(11), Y(0)), stroke: 1.8pt)
  line(p(X(11), Y(-500)), p(X(14), Y(-500)), stroke: 1.8pt)
  // 虚线
  let dash = (dash: "dashed")
  line(p(X(6), Y(250)), p(X(6), Y(0)), stroke: (paint: black, thickness: lw, dash: "dashed"))
  line(p(X(11), Y(0)), p(X(11), Y(-500)), stroke: (paint: black, thickness: lw, dash: "dashed"))
  line(p(X(14), Y(0)), p(X(14), Y(-500)), stroke: (paint: black, thickness: lw, dash: "dashed"))
  line(p(538, Y(-500)), p(X(11), Y(-500)), stroke: (paint: black, thickness: lw, dash: "dashed"))
})
