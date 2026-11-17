// 图 3·19 水的密度随温度的变化（原书 p.105）
// CeTZ 重绘；坐标是放大 2.5 倍的原图局部（1200×775）的像素坐标，y 向下。
// 横轴 -3～14（每格 1），纵轴 0.9990～1.0001（每格 0.0001）；曲线按原图读点，-3～0 为虚线（过冷水）。
#import "/common/series.typ": *

#let fig-3-19(width: 8.4cm) = px-canvas(1200, 775, width: width, (p, u) => {
  import cetz.draw: *
  let (x0, x1, y0, y1) = (246, 1155, 20, 632)
  let dx = (x1 - x0) / 17
  let dy = (y1 - y0) / 11
  for i in range(0, 18) {
    line(p(x0 + i * dx, y0), p(x0 + i * dx, y1), stroke: 2 * u)
  }
  for j in range(0, 12) {
    line(p(x0, y0 + j * dy), p(x1, y0 + j * dy), stroke: 2 * u)
  }
  rect(p(x0, y0), p(x1, y1), stroke: 4 * u)
  // 密度曲线：y = 77 + 4.18 (t - 4)^2（像素），t < 0 时再加 1.22 t^2 以贴合原图左端
  let yy(t) = 77 + 4.18 * calc.pow(t - 4, 2) + if t < 0 { 1.22 * t * t } else { 0 }
  let xx(t) = 410 + 53.47 * t
  let pts(a, b) = range(0, 41).map(i => { let t = a + (b - a) * i / 40; p(xx(t), yy(t)) })
  line(..pts(-3, 0), stroke: (thickness: 5 * u, dash: (14 * u, 9 * u)))
  line(..pts(0, 14), stroke: 6 * u)
  let lab(x, y, body, a: 0, anchor: "center") = content(p(x, y), anchor: anchor, angle: a * 1deg, text(size: 8.5pt, weight: "bold", body))
  for (v, y) in (("1.0000", 78), ("0.9998", 188), ("0.9996", 299), ("0.9994", 410), ("0.9992", 521), ("0.9990", 630)) {
    lab(238, y, v, anchor: "east")
  }
  for t in range(-2, 15, step: 2) {
    lab(xx(t) , 662, if t < 0 { [−#calc.abs(t)] } else { str(t) })
  }
  lab(62, 355, [水的密度], a: 90)
  lab(735, 715, [温度])
})
