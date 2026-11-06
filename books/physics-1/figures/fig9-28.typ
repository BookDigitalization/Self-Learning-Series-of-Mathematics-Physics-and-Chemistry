// 图 9·28（原书 p.262）例 7 的横杆：（上）实物示意，（中）以 A 为转轴的受力图，（下）以 B 为转轴的受力图。
// 坐标取自页面显示图，原点 (320,230)。
#import "/common/series.typ": *

#let fig-9-28(width: 5.6cm) = px-canvas(460, 770, origin: (320, 230), width: width, (p, u) => {
  import cetz.draw: *
  let arrow(a, b, th: 1.4pt) = line(p(..a), p(..b), stroke: th, mark: (end: "stealth", fill: black, scale: 0.5))
  let lab(x, y, body) = content(p(x, y), anchor: "center", text(size: 9pt, body))
  // 上
  line(p(355, 393), p(728, 397), stroke: 2pt)
  line(p(340, 375), p(340, 410), stroke: 1.2pt)
  for y in range(378, 410, step: 8) { line(p(340, y), p(328, y + 6), stroke: 0.6pt) }
  line(p(585, 395), p(585, 250), stroke: 2.4pt)
  line(p(728, 400), p(728, 462), stroke: 1pt)
  rect(p(698, 462), p(748, 512), stroke: 1pt, fill: luma(225))
  lab(350, 425, $A$); lab(582, 422, $B$); lab(722, 382, $C$)
  // 中
  circle(p(350, 603), radius: 6 * u, stroke: 1pt, fill: white)
  line(p(356, 604), p(722, 609), stroke: 1.8pt)
  line(p(722, 609), p(722, 680), stroke: 1.8pt)
  arrow((722, 680), (722, 705), th: 1.6pt)
  arrow((583, 605), (583, 470), th: 1.4pt)
  lab(348, 632, $A$)
  lab(605, 513, $F_1$); lab(583, 628, $B$); lab(722, 590, $C$); lab(722, 718, $G$)
  // 下
  line(p(352, 850), p(722, 855), stroke: 1.8pt)
  line(p(722, 855), p(722, 925), stroke: 1.8pt)
  arrow((722, 925), (722, 948), th: 1.6pt)
  line(p(583, 850), p(583, 745), stroke: 2.4pt)
  arrow((352, 850), (352, 905), th: 1.6pt)
  lab(352, 830, $A$); lab(375, 900, $F_2$); lab(578, 877, $B$); lab(715, 840, $C$); lab(720, 962, $G$)
})
