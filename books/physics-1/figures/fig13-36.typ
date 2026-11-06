// 图 13·36 例 16 离心节速器的受力（原书 p.460）
// 示意图，按原图重绘：竖直转轴 AB（斜线填充），两根棒各带一个重球，右球受重力 mg、棒的拉力 T，合力 F，夹角 θ。
// 坐标是页面显示图（宽 1568）上的像素坐标；位置为目测。
#import "/common/series.typ": *

#let fig-13-36(width: 8.6cm) = px-canvas(600, 520, origin: (340, 1200), width: width, (p, u) => {
  import cetz.draw: *
  let arr = (end: "stealth", fill: black, scale: 0.55)
  let lab(x, y, body) = content(p(x, y), anchor: "center", text(size: 9pt, body))
  let dsh = (thickness: 0.8pt, dash: "dashed")
  // 转轴 AB
  rect(p(623, 1215), p(647, 1700), stroke: 1pt, fill: luma(210))
  for k in range(0, 24) {
    let y = 1225 + k * 20
    line(p(623, y + 12), p(647, y), stroke: 0.5pt)
  }
  // 棒与重球
  line(p(623, 1235), p(380, 1378), stroke: 2pt)
  line(p(647, 1238), p(880, 1390), stroke: 2pt)
  circle(p(362, 1388), radius: 18 * u, fill: white, stroke: 1.4pt)
  circle(p(895, 1397), radius: 18 * u, fill: white, stroke: 1.4pt)
  // 右球的力
  line(p(880, 1390), p(738, 1300), stroke: 2.2pt, mark: arr)
  line(p(722, 1308), p(722, 1423), stroke: dsh)
  line(p(880, 1423), p(722, 1423), stroke: 2.2pt, mark: arr)
  line(p(722, 1423), p(895, 1500), stroke: dsh)
  line(p(895, 1415), p(895, 1500), stroke: 2.2pt, mark: arr)
  lab(612, 1213, $A$)
  lab(607, 1697, $B$)
  lab(732, 1272, $T$)
  lab(668, 1305, $theta$)
  lab(700, 1428, $F$)
  lab(880, 1460, $theta$)
  lab(897, 1355, $m$)
  lab(895, 1520, $m g$)
})
