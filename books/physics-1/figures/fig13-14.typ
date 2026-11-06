// 图 13·14 射程相同的两条抛物线（原书 p.432）
// 示意图，按原图重绘：从 O 出发、初速 v_0 相同、投射角互余的两条抛物线 I、II，交 Ox 于 D。
// 坐标是页面显示图（宽 1568）上的像素坐标；位置为目测，抛物线取标准形状。
#import "/common/series.typ": *

#let fig-13-14(width: 9.6cm) = px-canvas(600, 300, origin: (555, 140), width: width, (p, u) => {
  import cetz.draw: *
  let arr = (end: "stealth", fill: black, scale: 0.5)
  let lab(x, y, body) = content(p(x, y), anchor: "center", text(size: 9pt, body))
  let (ox, oy, dx) = (580, 388, 1070)
  line(p(ox, oy), p(ox, 148), stroke: 1.4pt, mark: arr)
  line(p(ox, oy), p(1140, 386), stroke: 1.4pt, mark: arr)
  lab(596, 155, $y$)
  lab(1126, 407, $x$)
  lab(578, 408, $O$)
  lab(1075, 408, $D$)
  // 两条抛物线
  let L = dx - ox
  let par(h) = line(..range(0, 50).map(k => {
    let x = ox + k * L / 49
    p(x, oy - 4 * h * (x - ox) * (dx - x) / (L * L))
  }), stroke: 1.4pt)
  par(80)
  par(160)
  lab(893, 292, text(size: 9pt, [I]))
  lab(910, 215, text(size: 9pt, [II]))
  // 初速度
  line(p(ox, oy), p(662, 248), stroke: 1.6pt, mark: arr)
  lab(672, 222, $v_0$)
  line(p(ox, oy), p(742, 292), stroke: 1.6pt, mark: arr)
  lab(750, 292, $v_0$)
  // 角
  arc(p(ox + 62, oy), start: 0deg, stop: 33deg, radius: 62 * u, stroke: 0.7pt)
  lab(643, 376, $theta$)
  arc(p(ox + 85, oy), start: 0deg, stop: 55deg, radius: 85 * u, stroke: 0.7pt)
  lab(740, 363, $theta' = display(pi / 2) - theta$)
})
