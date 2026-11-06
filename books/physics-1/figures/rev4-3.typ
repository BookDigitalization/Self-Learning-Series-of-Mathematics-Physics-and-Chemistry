// 复习题四 第 3 题附图：物体的轨迹（原书 p.116）
// 坐标图 CeTZ 重绘；坐标取自 200 dpi 页面图的显示坐标（原点 (795,1612)，每 1 千米约 30 像素）。
// 原图刻度数字标在轴的一侧：北、西、南、东方向各标 2、4、6、8（东向只到 6），未标负号。
#import "/common/series.typ": *

#let fig-rev-4-3(width: 7.5cm) = px-canvas(660, 560, origin: (500, 1330), width: width, (p, u) => {
  import cetz.draw: *
  let lab(x, y, body) = content(p(x, y), anchor: "center", text(size: 8.5pt, body))
  let mk = (end: "stealth", fill: black, scale: 0.5)
  let (ox, oy) = (795, 1612)
  let k = 29.8
  // 坐标轴：北向（上）、东向（右）；南、西两个方向没有箭头
  line(p(ox, 1860), p(ox, 1340), stroke: 0.9pt, mark: mk)
  line(p(510, oy), p(1085, oy), stroke: 0.9pt, mark: mk)
  for n in (2, 4, 6, 8) {
    line(p(ox, oy - n * k), p(ox + 6, oy - n * k), stroke: 0.6pt)
    line(p(ox, oy + n * k), p(ox + 6, oy + n * k), stroke: 0.6pt)
    line(p(ox + n * k, oy), p(ox + n * k, oy - 6), stroke: 0.6pt)
    line(p(ox - n * k, oy), p(ox - n * k, oy - 6), stroke: 0.6pt)
    lab(ox - 24, oy - n * k, str(n))
    lab(ox - 24, oy + n * k, str(n))
    lab(ox - n * k, oy + 24, str(n))
    if n < 8 { lab(ox + n * k, oy + 24, str(n)) }
  }
  lab(ox - 20, oy - 14, [0])
  lab(855, 1352, [北（千米）])
  lab(1075, 1632, [东（千米）])
  // 轨迹：O → 向南 → 向东
  line(p(ox, oy), p(ox, 1727), p(1008, 1727), stroke: 1.5pt)
  line(p(1008, 1727), p(1008, oy), stroke: 0.7pt, dash: "dashed")
})
