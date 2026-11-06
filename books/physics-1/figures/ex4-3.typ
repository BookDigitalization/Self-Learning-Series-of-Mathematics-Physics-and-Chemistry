// 例 1 示意图（原书 p.94）：轻巡洋舰追战斗舰，不编号
// 线条图 CeTZ 重绘；坐标取自 200 dpi 页面图的显示坐标（原点 (470,1670)）。
#import "/common/series.typ": *

#let fig-ex-1(width: 11cm) = px-canvas(760, 150, origin: (470, 1670), width: width, (p, u) => {
  import cetz.draw: *
  let lab(x, y, body) = content(p(x, y), anchor: "center", text(size: 8.5pt, fill: black, box(fill: white, inset: 2pt, body)))
  let ar = (start: "stealth", end: "stealth", fill: black, scale: 0.35)
  // 竖线
  line(p(490, 1688), p(490, 1802), stroke: 0.8pt)
  line(p(798, 1688), p(798, 1730), stroke: 0.8pt)
  line(p(1202, 1688), p(1202, 1802), stroke: 0.8pt)
  // 上排：120 公里、战斗舰所走的路程
  line(p(490, 1700), p(798, 1700), stroke: 0.7pt, mark: (end: "stealth", fill: black, scale: 0.35))
  line(p(798, 1700), p(1202, 1700), stroke: 0.7pt, mark: (end: "stealth", fill: black, scale: 0.35))
  lab(630, 1700, [120 公里])
  lab(1000, 1700, [战列舰所走的路程])
  // 中间的基线
  line(p(490, 1743), p(1202, 1743), stroke: 0.8pt)
  // 下排：轻巡洋舰所走的路程
  line(p(490, 1798), p(1202, 1798), stroke: 0.7pt, mark: (end: "stealth", fill: black, scale: 0.35))
  lab(846, 1798, [轻巡洋舰所走的路程（270 公里）])
})
