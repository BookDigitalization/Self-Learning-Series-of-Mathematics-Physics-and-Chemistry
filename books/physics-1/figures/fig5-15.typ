// 图 5·15 竖直上抛运动的 v-t 图（原书 p.152，例 11 的速度图线）
// 坐标图，按原图重绘。坐标取自 200 dpi 页面图的“显示图”坐标（宽 1568），画布原点取 (400, 100)。
#import "/common/series.typ": *

#let fig-5-15(width: 9cm) = px-canvas(880, 660, origin: (400, 100), width: width, (p, u) => {
  import cetz.draw: *
  let mk = (end: "stealth", fill: black, scale: 0.45)
  let (x0, y0) = (487, 382)
  let ux = 113.2
  let uy = 11
  let px(t) = x0 + t * ux
  let py(v) = y0 - v * uy
  let lab(x, y, body) = content(p(x, y), anchor: "center", text(size: 9pt, body))
  let dsh = (thickness: 0.7pt, dash: "dashed")
  line(p(430, y0), p(1238, y0), stroke: 0.9pt, mark: mk)
  line(p(x0, 730), p(x0, 125), stroke: 0.9pt, mark: mk)
  for t in range(1, 7) { line(p(px(t), y0), p(px(t), y0 - 7), stroke: 0.6pt); lab(px(t), y0 + 22, str(t)) }
  for v in (-30, -25, -20, -15, -10, -5, 5, 10, 15, 20) {
    line(p(x0, py(v)), p(x0 + 7, py(v)), stroke: 0.6pt)
    lab(x0 - 24, py(v), if v < 0 { $-#str(-v)$ } else { str(v) })
  }
  lab(x0 - 17, y0 + 22, $0$)
  lab(560, 140, text(font: fonts.song, size: 8.5pt)[$v$（米/秒）])
  lab(1215, y0 + 24, text(font: fonts.song, size: 8.5pt)[$t$（秒）])
  // 图线 A→F
  line(p(x0, py(20)), p(px(5), py(-30)), stroke: 1.5pt)
  // 虚线
  line(p(x0, py(10)), p(px(1), py(10)), stroke: dsh)
  line(p(px(1), y0), p(px(1), py(10)), stroke: dsh)
  line(p(x0, py(-10)), p(px(3), py(-10)), stroke: dsh)
  line(p(px(3), y0), p(px(3), py(-10)), stroke: dsh)
  line(p(x0, py(-20)), p(px(4), py(-20)), stroke: dsh)
  line(p(px(4), y0), p(px(4), py(-20)), stroke: (thickness: 1.3pt, dash: "dashed"))
  line(p(x0, py(-30)), p(px(5), py(-30)), stroke: dsh)
  line(p(px(5), y0), p(px(5), py(-30)), stroke: (thickness: 1.3pt, dash: "dashed"))
  for (t, v) in ((0, 20), (1, 10), (2, 0), (3, -10), (4, -20), (5, -30)) {
    circle(p(px(t), py(v)), radius: 3, stroke: 0.7pt, fill: white)
  }
  lab(502, 175, $A$); lab(610, 260, $B$); lab(718, 360, $C$)
  lab(843, 485, $D$); lab(958, 596, $E$); lab(1072, 715, $F$)
})
