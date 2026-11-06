// 图 4·13 小船的“斜渡”（原书 p.107）
// 示意图 CeTZ 重绘：河岸、水纹为示意性的点线/虚线，箭头、字母和文字标注按原图位置。
// 坐标取自 200 dpi 页面图的显示坐标（原点 (540,1510)）。
#import "/common/series.typ": *

#let water(p, x0, x1, ys) = {
  import cetz.draw: *
  for (i, y) in ys.enumerate() {
    let off = calc.rem(i * 37, 90)
    line(p(x0 + off, y), p(x1 - 40, y), stroke: (thickness: 0.4pt, paint: luma(110), dash: (6pt, 4pt)))
  }
}

#let fig-4-13(width: 11cm) = px-canvas(700, 380, origin: (540, 1510), width: width, (p, u) => {
  import cetz.draw: *
  let lab(x, y, body, ang: 0deg) = content(p(x, y), anchor: "center",
    std.rotate(ang, text(size: 8.5pt, body)))
  let mk = (end: "stealth", fill: black, scale: 0.6)
  // 河岸与水纹
  line(p(555, 1542), p(1215, 1542), stroke: (thickness: 2.5pt, dash: "dotted"))
  line(p(555, 1838), p(1215, 1838), stroke: (thickness: 2.5pt, dash: "dotted"))
  water(p, 560, 1210, range(1580, 1830, step: 28))
  // 点
  let (ax, ay) = (800, 1818)
  let (bx, by) = (797, 1560)
  let (cx, cy) = (973, 1560)
  // s1：划行（垂直于河岸）
  line(p(ax, ay), p(bx, by), stroke: 0.9pt, mark: mk)
  // s2：水流带动（平行于河岸）
  line(p(ax, ay + 5), p(cx, ay + 5), stroke: 0.9pt, mark: mk)
  // s：合运动
  line(p(ax, ay), p(cx, cy), stroke: 1.1pt, mark: mk)
  // 虚线 BC、C 到岸
  line(p(bx, by), p(cx, cy), stroke: 0.7pt, dash: "dashed")
  line(p(cx, cy), p(cx, ay + 5), stroke: 0.7pt, dash: "dashed")
  for (x, y) in ((ax, ay), (bx, by), (cx, cy)) { circle(p(x, y), radius: 3 * u, stroke: 0.6pt, fill: white) }
  lab(795, 1527, $B$)
  lab(972, 1527, $C$)
  lab(793, 1862, $A$)
  lab(783, 1700, $s_1$)
  lab(912, 1687, $s$)
  lab(890, 1798, $s_2$)
  lab(735, 1745, [划行方向], ang: -90deg)
  lab(845, 1700, [合运动方向], ang: -56deg)
  // 水流方向
  line(p(1030, 1688), p(1110, 1688), stroke: 0.9pt, mark: mk)
  lab(1070, 1712, [水流方向])
})
