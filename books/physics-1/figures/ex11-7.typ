// 习题 11·7 第 2 题附图（原书 p.360）
// 示意图，按原图重绘。坐标是 render-pages.py --dpi 200 显示图（宽 1568）上的像素坐标。
#import "/common/series.typ": *

#let fig-ex-11-7-2(width: 4.4cm) = px-canvas(290, 290, origin: (1075, 262), width: width, (p, u) => {
  import cetz.draw: *
  let lab(x, y, body) = content(p(x, y), anchor: "center", text(size: 9pt, body))
  let dash = (paint: black, thickness: 1pt, dash: "dashed")
  line(p(1090, 297), p(1090, 545), p(1330, 545), stroke: 1pt)
  line(p(1090, 297), p(1330, 297), stroke: dash)
  line(p(1330, 297), p(1330, 520), stroke: dash)
  line(p(1330, 520), p(1330, 545), stroke: 1pt)
  // 四分之一圆弧：圆心 (1330, 305)，半径 200
  arc(p(1130, 305), start: 180deg, stop: 270deg, radius: 200 * u, anchor: "origin", name: "a", stroke: 1.1pt)
  rect(p(1131, 297), p(1146, 312), fill: black, stroke: none)
  lab(1122, 272, $A$)
  lab(1350, 388, $R$)
  lab(1347, 512, $B$)
})
