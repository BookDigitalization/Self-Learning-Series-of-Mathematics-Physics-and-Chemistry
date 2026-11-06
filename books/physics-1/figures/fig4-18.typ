// 图 4·18 飞机的两个分速度（原书 p.113）
// 线条图 CeTZ 重绘；坐标取自 200 dpi 页面图的显示坐标（原点 (1100,640)）。
// 原图左下角有一小幅量角器/圆规之类的示意图案，未画（见 checklist/ch04.md）。
#import "/common/series.typ": *

#let fig-4-18(width: 5cm) = px-canvas(330, 420, origin: (1100, 640), width: width, (p, u) => {
  import cetz.draw: *
  let lab(x, y, body) = content(p(x, y), anchor: "center", text(size: 9pt, body))
  let mk = (end: "stealth", fill: black, scale: 0.55)
  let (ox, oy) = (1148, 1015)
  let (ax, ay) = (1370, 1015)
  let (bx, by) = (1360, 685)
  let (cx, cy) = (1165, 682)
  line(p(ox, oy), p(ax, ay), stroke: 1.5pt, mark: mk)
  line(p(ox, oy), p(ox, cy), stroke: 1.5pt, mark: mk)
  line(p(ox, oy), p(bx, by), stroke: 1.5pt, mark: mk)
  line(p(ox, cy), p(bx, cy), stroke: 0.8pt, dash: "dashed")
  line(p(bx, cy), p(bx, ay), stroke: 0.8pt, dash: "dashed")
  lab(1150, 676, $C$)
  lab(1378, 682, $B$)
  lab(1140, 1022, $O$)
  lab(1380, 1018, $A$)
  lab(1220, 992, [$60°$])
})
