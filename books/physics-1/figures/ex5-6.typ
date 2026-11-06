// 习题 5·6 第 1、2 题附图（原书 p.143）
// 坐标图，按原图重绘。坐标取自 200 dpi 页面图的“显示图”坐标（宽 1568）。
#import "/common/series.typ": *

// 第 1 题：甲、乙、丙、丁四个物体的 v-t 图线（原点取 (340, 670)）
#let fig-ex-5-6-1(width: 5.8cm) = px-canvas(500, 420, origin: (340, 670), width: width, (p, u) => {
  import cetz.draw: *
  let mk = (end: "stealth", fill: black, scale: 0.45)
  let lab(x, y, body) = content(p(x, y), anchor: "center", text(size: 9pt, body))
  let cn(x, y, body) = content(p(x, y), anchor: "center", text(font: fonts.song, size: 9pt, body))
  line(p(360, 1025), p(815, 1025), stroke: 0.9pt, mark: mk)
  line(p(392, 1070), p(392, 690), stroke: 0.9pt, mark: mk)
  let o = (392, 828)
  line(p(..o), p(640, 740), stroke: 1.4pt)
  line(p(..o), p(685, 828), stroke: 1.4pt)
  line(p(..o), p(665, 925), stroke: 1.4pt)
  line(p(..o), p(578, 985), stroke: 1.4pt)
  cn(655, 720, [丙]); cn(702, 826, [乙]); cn(672, 933, [甲]); cn(592, 997, [丁])
  lab(372, 1047, $O$)
  lab(803, 1047, $t$)
  lab(407, 692, $v$)
  lab(372, 830, $v_0$)
})

// 第 2 题：一个物体的 v-t 图线（原点取 (860, 690)）
#let fig-ex-5-6-2(width: 6cm) = px-canvas(520, 420, origin: (860, 690), width: width, (p, u) => {
  import cetz.draw: *
  let mk = (end: "stealth", fill: black, scale: 0.45)
  let lab(x, y, body) = content(p(x, y), anchor: "center", text(size: 9pt, body))
  let (x0, y0) = (893, 1032)
  let px(t) = x0 + t * 28.3
  line(p(865, y0), p(1362, y0), stroke: 0.9pt, mark: mk)
  line(p(x0, y0), p(x0, 712), stroke: 0.9pt, mark: mk)
  for t in (2, 4, 6, 8, 10, 12, 14) { line(p(px(t), y0), p(px(t), y0 - 7), stroke: 0.6pt); lab(px(t), y0 + 20, str(t)) }
  line(p(x0, 918), p(px(4), 803), p(px(10), 803), p(px(12), 915), stroke: 1.6pt)
  line(p(x0, 918), p(px(12), 918), stroke: (thickness: 0.7pt, dash: "dash-dotted"))
  line(p(px(4), y0), p(px(4), 803), stroke: (thickness: 1pt, dash: "dashed"))
  line(p(px(10), y0), p(px(10), 803), stroke: (thickness: 1pt, dash: "dashed"))
  line(p(px(12), y0), p(px(12), 918), stroke: (thickness: 1pt, dash: "dashed"))
  line(p(x0 - 4, 803), p(x0 + 4, 803), stroke: 0.6pt)
  lab(905, 872, $A$); lab(1008, 783, $B$); lab(1178, 783, $C$); lab(1246, 912, $D$)
  lab(878, 1050, $O$); lab(908, 718, $v$)
  lab(1345, y0 + 22, text(font: fonts.song, size: 8.5pt)[$t$（秒）])
})
