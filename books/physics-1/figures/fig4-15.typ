// 图 4·15 “横渡”变成了“斜渡”（原书 p.109）
// 示意图 CeTZ 重绘：河岸、水纹为示意性的点线/虚线，箭头、字母和文字标注按原图位置；原图中的小船图案未画。
// 坐标取自 200 dpi 页面图的显示坐标（原点 (520,630)）。
#import "/common/series.typ": *
#import "fig4-13.typ": water

#let fig-4-15(width: 11cm) = px-canvas(700, 400, origin: (520, 630), width: width, (p, u) => {
  import cetz.draw: *
  let lab(x, y, body, ang: 0deg) = content(p(x, y), anchor: "center",
    std.rotate(ang, text(size: 8.5pt, body)))
  let mk = (end: "stealth", fill: black, scale: 0.6)
  line(p(535, 668), p(1200, 668), stroke: (thickness: 2.5pt, dash: "dotted"))
  line(p(535, 967), p(1200, 967), stroke: (thickness: 2.5pt, dash: "dotted"))
  water(p, 540, 1195, range(700, 950, step: 28))
  let (ax, ay) = (648, 958)
  let (bx, by) = (648, 672)
  let (cx, cy) = (1060, 672)
  let (dx, dy) = (1060, 958)
  line(p(ax, ay), p(bx, by), stroke: 0.9pt, mark: mk)
  line(p(ax, ay), p(cx, cy), stroke: 1.1pt, mark: mk)
  line(p(ax, ay + 5), p(dx, dy + 5), stroke: 0.7pt)
  line(p(cx, cy), p(dx, dy), stroke: 0.7pt, dash: "dashed")
  line(p(bx, by), p(cx, cy), stroke: 0.7pt, dash: "dashed")
  for (x, y) in ((ax, ay), (bx, by), (cx, cy), (dx, dy)) { circle(p(x, y), radius: 3 * u, stroke: 0.6pt, fill: white) }
  lab(648, 645, $B$)
  lab(1058, 645, $C$)
  lab(646, 995, $A$)
  lab(1060, 990, $D$)
  lab(580, 830, [划行方向], ang: -90deg)
  lab(822, 782, [合运动方向], ang: -35deg)
  line(p(1075, 838), p(1190, 838), stroke: 0.9pt, mark: mk)
  lab(1130, 812, [水流方向])
})
