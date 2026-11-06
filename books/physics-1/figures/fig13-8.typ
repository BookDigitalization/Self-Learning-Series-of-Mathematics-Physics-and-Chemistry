// 图 13·8 平抛运动（原书 p.422）
// 手、桌子、小球是写实插画，用原扫描裁剪（fig13-8.png，仅 505–910 一段，原图 y 1400–1775）；
// 水平箭头、轨迹虚线和三个小圆圈用 CeTZ 补画（位置按原图目测，轨迹为示意）。
// 坐标是页面显示图（宽 1568）上的像素坐标。
#import "/common/series.typ": *

#let fig-13-8(width: 10cm) = px-canvas(740, 450, origin: (505, 1400), width: width, (p, u) => {
  import cetz.draw: *
  let arr = (end: "stealth", fill: black, scale: 0.55)
  content(p(505, 1400), anchor: "north-west", image("fig13-8.png", width: 405 * u))
  let dsh = (thickness: 1pt, dash: "dashed")
  line(p(905, 1503), p(998, 1503), stroke: 0.9pt, mark: arr)
  catmull(p(800, 1505), p(860, 1510), p(925, 1530), p(1000, 1568), p(1058, 1610), p(1130, 1690), p(1185, 1752), p(1228, 1826),
    tension: 0.5, stroke: dsh, mark: (end: "stealth", fill: black, scale: 0.4))
  for (x, y, r) in ((925, 1530, 18), (1058, 1610, 21), (1185, 1752, 23)) {
    circle(p(x, y), radius: r * u, stroke: (thickness: 0.8pt, dash: "dashed"), fill: white)
  }
})
