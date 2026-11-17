// 图 5·14 水在毛细管中上升（原书 p.174）
// 线条图，按原图重绘。坐标取自原页 200 dpi 页面像素坐标（1130×1662），原点取画布左上角 (240, 1110)。
#import "/common/series.typ": *

#let fig-5-14(width: 6cm) = px-canvas(260, 220, origin: (240, 1110), width: width, (p, u) => {
  import cetz.draw: *
  let lab(x, y, body, a: "center") = content(p(x, y), anchor: a, text(size: 8.5pt, body))
  // 烧杯
  line(p(256, 1186), p(256, 1312), p(457, 1312), p(457, 1186), stroke: 1.1pt)
  // 水面
  line(p(257, 1239), p(456, 1239), stroke: 0.7pt)
  for (i, y) in range(1248, 1308, step: 10).enumerate() {
    for x in range(264 + calc.rem(i, 2) * 10, 450, step: 30) {
      line(p(x, y), p(x + 14, y), stroke: 0.5pt)
    }
  }
  // 三根毛细管：外壁 xl–xr，顶 1121，底 1289；管内水面 yw
  let cap(xl, xr, yw, concave: true) = {
    let t = if xr - xl > 25 { 5 } else { 3.5 }
    rect(p(xl, 1121), p(xr, 1289), stroke: 1pt, fill: white)
    line(p(xl + t, 1121), p(xl + t, 1289), stroke: 0.9pt)
    line(p(xr - t, 1121), p(xr - t, 1289), stroke: 0.9pt)
    // 管内水
    rect(p(xl + t + 0.5, yw), p(xr - t - 0.5, 1288), stroke: none, fill: white)
    line(p(xl + t, yw - 4), p(xl + t + 3, yw), p(xr - t - 3, yw), p(xr - t, yw - 4), stroke: 0.8pt)
    for y in range(int(yw) + 8, 1285, step: 9) {
      line(p(xl + t + 3, y), p(xr - t - 3, y), stroke: 0.4pt)
    }
  }
  cap(293, 323, 1217)
  cap(357, 378, 1178)
  cap(408, 423, 1137)
  lab(480, 1224, [水])
  line(p(475, 1234), p(457, 1244), stroke: 0.6pt)
})
