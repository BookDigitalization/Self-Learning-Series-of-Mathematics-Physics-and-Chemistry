// 图 3·9 液体内部压强的计算（原书 p.54）
// 线条图，按原图重绘：烧杯中的液体，液面下 h 处水平面 AB 上方的液柱，AB 面向下的压强箭头，侧壁处向外的压强箭头。
// 坐标是裁剪图（原页显示图 (925,715) 起，×2.1314，896×747）的像素坐标。
// 原图液体里的横短线（表示水）未画；右侧壁处向外的箭头方向按"侧壁压强"理解画成向右，扫描里箭头很小。
#import "/common/series.typ": *

#let fig-3-9(width: 6.2cm) = px-canvas(896, 747, width: width, (p, u) => {
  import cetz.draw: *
  let st = 1.1pt
  // 烧杯
  line(p(35, 30), p(40, 660), (p(55, 690)), p(735, 690), p(750, 660), p(752, 30), stroke: 1.6pt)
  line(p(55, 30), p(58, 650), p(75, 672), p(715, 672), p(730, 650), p(733, 30), stroke: 0.8pt)
  // 液面（虚线）
  line(p(50, 78), p(722, 78), stroke: (thickness: 0.6pt, dash: "dashed"))
  // 液柱的两条竖线
  line(p(178, 78), p(178, 497), stroke: 0.9pt)
  line(p(455, 78), p(455, 497), stroke: (thickness: 0.9pt, dash: "dashed"))
  // 水平面 AB
  line(p(178, 497), p(455, 497), stroke: 0.9pt)
  // 深度 h（双向箭头）
  line(p(250, 90), p(250, 485), stroke: 0.9pt,
    mark: (start: "stealth", end: "stealth", fill: black, scale: 0.5))
  // 向下的压强箭头
  line(p(322, 497), p(322, 692), stroke: 0.9pt, mark: (end: "stealth", fill: black, scale: 0.5))
  // 侧壁处向外的压强箭头
  line(p(760, 490), p(880, 490), stroke: (thickness: 0.9pt, dash: "dotted"),
    mark: (end: "stealth", fill: black, scale: 0.5))
  content(p(232, 300), anchor: "center", text(size: 9pt, $h$))
  content(p(170, 548), anchor: "center", text(size: 10pt, $A$))
  content(p(445, 543), anchor: "center", text(size: 10pt, $B$))
})
