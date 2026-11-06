// 图 4·14 小船的“横渡”（原书 p.108）
// 示意图 CeTZ 重绘：河岸、水纹为示意性的点线/虚线，箭头、字母和文字标注按原图位置。
// 坐标取自 200 dpi 页面图的显示坐标（原点 (500,590)）。
#import "/common/series.typ": *
#import "fig4-13.typ": water

#let fig-4-14(width: 11cm) = px-canvas(700, 400, origin: (500, 590), width: width, (p, u) => {
  import cetz.draw: *
  let lab(x, y, body, ang: 0deg) = content(p(x, y), anchor: "center",
    std.rotate(ang, text(size: 8.5pt, body)))
  let mk = (end: "stealth", fill: black, scale: 0.6)
  line(p(515, 632), p(1175, 632), stroke: (thickness: 2.5pt, dash: "dotted"))
  line(p(515, 925), p(1175, 925), stroke: (thickness: 2.5pt, dash: "dotted"))
  water(p, 520, 1170, range(660, 915, step: 28))
  let (ax, ay) = (833, 910)
  let (bx, by) = (838, 650)
  let (dx, dy) = (657, 648)
  let (ex, ey) = (1010, 910)
  // s1：划行，指向对岸靠上游的 D 点
  line(p(ax, ay), p(dx, dy), stroke: 0.9pt, mark: mk)
  // s：合运动，垂直于河岸，到 B 点
  line(p(ax, ay), p(bx, by), stroke: 1.1pt, mark: mk)
  // s2：水流带动，平行于河岸
  line(p(ax, ay + 4), p(ex, ay + 4), stroke: 0.9pt, mark: mk)
  // 虚线 B→(ex)
  line(p(bx, by), p(ex, ey), stroke: 0.7pt, dash: "dashed")
  for (x, y) in ((ax, ay), (bx, by), (dx, dy)) { circle(p(x, y), radius: 3 * u, stroke: 0.6pt, fill: white) }
  lab(655, 617, $D$)
  lab(838, 617, $B$)
  lab(833, 945, $A$)
  lab(740, 800, $s_1$)
  lab(856, 778, $s$)
  lab(912, 890, $s_2$)
  lab(700, 820, [划行方向], ang: 56deg)
  lab(800, 760, [合运动方向], ang: -90deg)
  line(p(1010, 773), p(1085, 773), stroke: 0.9pt, mark: mk)
  lab(1048, 800, [水流方向])
})
