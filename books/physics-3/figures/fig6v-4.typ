// 图 6·4 变化电场和变化磁场传播过程的示意图（原书 p.310）。CeTZ 重绘；
// 坐标取自 250 dpi 的局部裁图（原点为裁图左上角，裁图左上角在 150 dpi 页面像素 (160,800)）。
#import "/common/series.typ": *

#let fig-6v-4(width: 12cm) = px-canvas(1480, 440, origin: (0, 0), width: width, (p, u) => {
  import cetz.draw: *
  let lab(x, y, body) = content(p(x, y), anchor: "center", text(size: 9pt, body))
  let arr(a, b) = line(p(..a), p(..b), stroke: 0.7pt, mark: (end: ">", fill: black, scale: 0.55))
  // 天线 A
  line(p(665, 47), p(765, 47), stroke: 0.9pt)
  line(p(670, 50), p(712, 95), p(756, 50), stroke: 0.7pt)
  line(p(712, 95), p(712, 412), stroke: 0.9pt)
  lab(748, 105, $A$)
  // 磁场 H：实线椭圆
  for (cx, cy, ry) in ((135, 225, 40), (425, 228, 40), (712, 232, 40), (1000, 232, 40), (1290, 250, 35)) {
    circle(p(cx, cy), radius: (95, ry), stroke: 1.2pt)
  }
  for (x, y) in ((205, 261), (493, 264), (780, 268), (1068, 270), (1355, 282)) {
    arr((x - 14, y - 2), (x + 8, y))
  }
  // 电场 E：虚线椭圆
  for cx in (275, 560, 855, 1148) {
    circle(p(cx, 240), radius: (105, 120), stroke: (thickness: 0.8pt, dash: (5pt, 3pt)))
  }
  arr((197, 158), (213, 135))
  arr((483, 158), (500, 135))
  arr((920, 130), (900, 122))
  arr((1215, 133), (1190, 124))
  // 标注
  for x in (270, 562, 857, 1150) { lab(x, 85, $E$) }
  for (x, y) in ((213, 282), (510, 290), (803, 290), (1095, 294), (1380, 302)) { lab(x, y, $H$) }
})
