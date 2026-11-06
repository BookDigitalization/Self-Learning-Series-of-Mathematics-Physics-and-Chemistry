// 图 10·20 滑轮组归结为杠杆的组合（原书 p.314）
// CeTZ 重绘。坐标是 render-pages.py --dpi 200 显示图（宽 1568）上的像素坐标。
#import "/common/series.typ": *

#let fig-10-20(width: 6.4cm) = px-canvas(460, 500, origin: (310, 190), width: width, (p, u) => {
  import cetz.draw: *
  let lab(x, y, body) = content(p(x, y), anchor: "center", text(size: 8.5pt, body))
  let arr = (end: "stealth", fill: black, scale: 0.45)
  // 天花板
  line(p(320, 205), p(575, 205), stroke: 0.8pt)
  for x in range(322, 575, step: 11) { line(p(x, 205), p(x + 8, 195), stroke: 0.5pt) }
  // 杠杆 3、2、1
  line(p(372, 205), p(372, 510), p(548, 510), stroke: 1.6pt)
  line(p(458, 205), p(458, 430), p(635, 430), stroke: 1.6pt)
  line(p(548, 205), p(548, 350), p(722, 350), stroke: 1.6pt)
  // 连杆
  line(p(548, 430), p(548, 510), stroke: 1.6pt)
  line(p(635, 350), p(635, 430), stroke: 1.6pt)
  // 力
  line(p(722, 350), p(722, 300), stroke: 1pt, mark: arr)
  line(p(458, 510), p(458, 672), stroke: 1.6pt, mark: arr)
  lab(740, 315, $F$); lab(482, 662, $G$)
  lab(527, 352, $O_1$); lab(438, 432, $O_2$); lab(350, 512, $O_3$)
  lab(678, 380, $1$); lab(592, 454, $2$); lab(500, 533, $3$)
})
