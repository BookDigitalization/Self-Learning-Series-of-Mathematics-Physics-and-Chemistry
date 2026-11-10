// §1·8 例 4 注（原书 p.27，无图号）：直线 l 上的 A、B、C、D 四点，l 外的 E、F 两点，线段 AE。
// 坐标取自 150 dpi 页面图的显示图（宽约 802，y 向下），未用网格精量，只保证相对位置：
// A (497,771) B (541,750) C (612,732) D (660,705)，l 的右端 (690,692)，E (560,678)，F (665,771)。
#import "/common/series.typ": *

#let fig-points(width: 4.6cm) = px-canvas(250, 125, origin: (460, 655), width: width, (p, u) => {
  import cetz.draw: *
  let lw = 0.7pt
  let dot(pt) = circle(pt, radius: 3.2, fill: black, stroke: none)
  let lab(x, y, s) = content(p(x, y), text(font: fonts.song, size: 8pt, style: "italic", s))
  line(p(468, 777), p(690, 692), stroke: lw)
  line(p(497, 771), p(560, 678), stroke: lw)
  dot(p(497, 771))
  dot(p(541, 750))
  dot(p(612, 732))
  dot(p(660, 705))
  dot(p(560, 678))
  dot(p(665, 771))
  lab(497, 786, [A])
  lab(547, 763, [B])
  lab(614, 748, [C])
  lab(661, 692, [D])
  lab(571, 672, [E])
  lab(678, 771, [F])
  lab(695, 681, [l])
})
