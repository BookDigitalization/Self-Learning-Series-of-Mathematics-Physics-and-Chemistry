// 复习题六附图（原书 p.188–189）：第 3 题（火车速度图线）、第 6 题（两种拉力方向）
// 示意图，按原图用 CeTZ 重绘；坐标取自 200 dpi 页面显示图（宽 1568），内部乘 1.0657 换成真实像素。
#import "/common/series.typ": *

#let fig-rev-6-3(width: 7.6cm) = px-canvas(520, 380, width: width, origin: (610 * 1.0657, 1020 * 1.0657), (p, u) => {
  import cetz.draw: *
  let q(x, y) = p(x * 1.0657, y * 1.0657)
  let lab(x, y, body) = content(q(x, y), anchor: "center", text(size: 8pt, body))
  line(q(645, 1352), q(645, 1035), stroke: 1pt, mark: (end: "stealth", fill: black, scale: 0.5))
  line(q(645, 1355), q(1090, 1355), stroke: 1pt, mark: (end: "stealth", fill: black, scale: 0.5))
  let pts = ((645, 1350), (692, 1190), (740, 1190), (786, 1112), (835, 1152), (930, 1152), (975, 1232))
  line(..pts.map(a => q(..a)), stroke: 1.6pt)
  for a in pts.slice(1) { circle(q(..a), radius: 3, fill: white, stroke: 0.8pt) }
  lab(637, 1372, $O$); lab(698, 1168, $A$); lab(743, 1214, $B$); lab(788, 1090, $C$)
  lab(830, 1172, $D$); lab(933, 1133, $E$); lab(996, 1240, $F$)
  lab(642, 1030, $v$); lab(1092, 1340, $t$)
})

#let fig-rev-6-6(width: 10cm) = px-canvas(780, 330, width: width, origin: (525 * 1.0657, 100 * 1.0657), (p, u) => {
  import cetz.draw: *
  let q(x, y) = p(x * 1.0657, y * 1.0657)
  let arr(a, b, w: 0.9pt) = line(q(..a), q(..b), stroke: w, mark: (end: "stealth", fill: black, scale: 0.5))
  let lab(x, y, body) = content(q(x, y), anchor: "center", text(size: 8pt, body))
  let ground(x0, x1) = {
    line(q(x0, 312), q(x1, 312), stroke: 1pt)
    for x in range(0, int((x1 - x0) / 14)) { line(q(x0 + x * 14, 312), q(x0 + x * 14 + 14, 350), stroke: 0.5pt) }
  }
  // （a）
  ground(535, 850)
  line(q(580, 300), q(580, 168), q(815, 168), q(815, 312), stroke: 1pt)
  arr((730, 218), (890, 128))
  line(q(815, 168), q(905, 168), stroke: (thickness: 0.5pt, dash: "dashed"))
  lab(885, 155, [$30°$]); lab(690, 378, $(a)$)
  // （b）
  ground(965, 1280)
  line(q(1008, 312), q(1008, 175), q(1240, 175), q(1240, 312), stroke: 1pt)
  arr((930, 122), (1090, 220))
  line(q(930, 172), q(1008, 172), stroke: (thickness: 0.5pt, dash: "dashed"))
  lab(1082, 188, [$30°$]); lab(1130, 378, $(b)$)
})
