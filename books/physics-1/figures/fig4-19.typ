// 图 4·19 小船的合速度（原书 p.114）
// 线条图 CeTZ 重绘；坐标取自 200 dpi 页面图的显示坐标（原点 (300,460)）。
#import "/common/series.typ": *

#let fig-4-19(width: 6.5cm) = px-canvas(420, 470, origin: (300, 460), width: width, (p, u) => {
  import cetz.draw: *
  let lab(x, y, body, ang: 0deg) = content(p(x, y), anchor: "center",
    std.rotate(ang, text(size: 8.5pt, body)))
  let mk = (end: "stealth", fill: black, scale: 0.55)
  let (ox, oy) = (360, 860)
  let (vx, vy) = (632, 510)   // 合速度 v 的端点
  line(p(ox, oy), p(ox, vy), stroke: 1.5pt, mark: mk)       // v1：竖直，4 厘米
  line(p(ox, oy), p(vx, oy + 5), stroke: 1.5pt, mark: mk)   // v2：水平，3 厘米
  line(p(ox, oy), p(vx, vy), stroke: 1.5pt, mark: mk)       // v：5 厘米
  line(p(ox, vy - 4), p(vx, vy - 4), stroke: 0.8pt, dash: "dashed")
  line(p(vx, vy), p(vx, oy), stroke: 0.8pt, dash: "dashed")
  lab(368, 483, $v_1$)
  lab(645, 877, $v_2$)
  lab(648, 498, $v$)
  lab(350, 880, $O$)
  lab(338, 690, [（4 厘米）], ang: -90deg)
  lab(505, 690, [（5 厘米）], ang: -52deg)
  lab(490, 893, [（3 厘米）])
  lab(425, 838, [$51°$])
})
