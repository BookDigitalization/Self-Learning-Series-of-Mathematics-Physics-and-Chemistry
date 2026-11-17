// 图 8·11 气体作绝热变化时的 P-V 图线（原书 p.291）
// CeTZ 重绘，坐标为 200 dpi 页面像素（p.291，原点取 590,930）。
#import "/common/series.typ": *

#let fig-8-11(width: 8cm) = px-canvas(350, 345, width: width, origin: (590, 930), (p, u) => {
  import cetz.draw: *
  let lab(x, y, body, anchor: "center") = content(p(x, y), anchor: anchor, text(size: 9pt, body))
  let ax = (stroke: 0.8pt, mark: (end: ">", fill: black, scale: 0.6))
  line(p(614, 1248), p(614, 960), ..ax)
  line(p(614, 1248), p(900, 1248), ..ax)
  // 绝热线（实线）、等温线（虚线）
  catmull(..((673, 995), (688, 1050), (705, 1105), (735, 1155), (775, 1190), (820, 1210), (862, 1222)).map(c => p(..c)), stroke: 1.4pt, tension: 0.5)
  catmull(..((658, 990), (670, 1060), (690, 1105), (712, 1138), (745, 1170), (790, 1192), (830, 1200), (862, 1204)).map(c => p(..c)), stroke: (thickness: 1.4pt, dash: "dashed"), tension: 0.5)
  line(p(702, 1075), p(712, 1070), stroke: 0.6pt)
  line(p(793, 1185), p(805, 1160), stroke: 0.6pt)
  lab(617, 945, $P$)
  lab(916, 1251, $V$)
  lab(606, 1257, $O$)
  lab(740, 1067, [绝热线])
  lab(810, 1151, [等温线])
})
