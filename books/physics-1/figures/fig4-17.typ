// 图 4·17 互成角度的速度合成（原书 p.112）
// 示意图 CeTZ 重绘：河岸、水纹为示意性的点线/虚线，箭头、字母和文字标注按原图位置。
// 坐标取自 200 dpi 页面图的显示坐标（原点 (500,1520)）。
#import "/common/series.typ": *
#import "fig4-13.typ": water

#let fig-4-17(width: 10cm) = px-canvas(660, 360, origin: (500, 1520), width: width, (p, u) => {
  import cetz.draw: *
  let lab(x, y, body, ang: 0deg) = content(p(x, y), anchor: "center",
    std.rotate(ang, text(size: 8.5pt, body)))
  let mk = (end: "stealth", fill: black, scale: 0.6)
  line(p(520, 1548), p(1145, 1548), stroke: (thickness: 2.5pt, dash: "dotted"))
  line(p(520, 1842), p(1145, 1842), stroke: (thickness: 2.5pt, dash: "dotted"))
  water(p, 525, 1140, range(1580, 1830, step: 28))
  let (ox, oy) = (645, 1830)
  let (ax, ay) = (645, 1722)
  let (cx, cy) = (762, 1717)
  let (bx, by) = (762, 1830)
  // 虚线：OC 延长到对岸，OA 延长到对岸，CB，AC
  line(p(cx, cy), p(905, 1553), stroke: 0.7pt, dash: "dashed")
  line(p(ox, ay), p(ox, 1553), stroke: 0.7pt, dash: "dashed")
  line(p(cx, cy), p(bx, by), stroke: 0.7pt, dash: "dashed")
  line(p(ax, ay), p(cx, cy), stroke: 0.7pt, dash: "dashed")
  // v1、v
  line(p(ox, oy), p(ax, ay), stroke: 1.5pt, mark: mk)
  line(p(ox, oy), p(cx, cy), stroke: 1.5pt, mark: mk)
  // 水流方向
  line(p(940, 1797), p(1030, 1797), stroke: 0.9pt, mark: mk)
  lab(985, 1727, [水流方向])
  lab(575, 1760, [划行方向], ang: -90deg)
  lab(625, 1707, $A$)
  lab(778, 1708, $C$)
  lab(762, 1862, $B$)
  lab(640, 1860, $O$)
  lab(625, 1797, $v_1$)
  lab(716, 1808, $v$)
})
