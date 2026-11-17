// 图 5·15 水银在毛细管中下降（原书 p.174）
// 线条图，按原图重绘。坐标取自原页 200 dpi 页面像素坐标（1130×1662），原点取画布左上角 (620, 1110)。
#import "/common/series.typ": *

#let fig-5-15(width: 6cm) = px-canvas(280, 220, origin: (620, 1110), width: width, (p, u) => {
  import cetz.draw: *
  let lab(x, y, body, a: "center") = content(p(x, y), anchor: a, text(size: 8.5pt, body))
  // 容器壁
  line(p(629, 1184), p(629, 1312), p(834, 1312), p(834, 1184), stroke: 1.1pt)
  // 水银（带圆顶的上表面）
  merge-path(close: true, fill: black, stroke: none, {
    line(p(629, 1312), p(629, 1210), p(634, 1204), p(648, 1201), p(662, 1204), p(668, 1212))
    line(p(668, 1212), p(696, 1212), p(702, 1206), p(716, 1202), p(731, 1206), p(733, 1212))
    line(p(733, 1212), p(757, 1212), p(763, 1206), p(777, 1202), p(790, 1206), p(792, 1212))
    line(p(792, 1212), p(800, 1212), p(806, 1206), p(820, 1202), p(830, 1206), p(834, 1212), p(834, 1312))
  })
  // 毛细管：外壁 xl–xr，顶 1121，底 1289；管内水银面 yw
  let cap(xl, xr, yw) = {
    let t = if xr - xl > 25 { 5 } else { 3.5 }
    rect(p(xl, 1121), p(xr, 1289), stroke: 1pt, fill: white)
    line(p(xl + t, 1121), p(xl + t, 1289), stroke: 0.9pt)
    line(p(xr - t, 1121), p(xr - t, 1289), stroke: 0.9pt)
    rect(p(xl + t + 0.5, yw), p(xr - t - 0.5, 1288), stroke: none, fill: black)
    rect(p(xl, 1289), p(xr, 1312), stroke: none, fill: black)
    line(p(xl, 1289), p(xl, 1312), stroke: none)
  }
  cap(668, 696, 1223)
  cap(732, 757, 1234)
  cap(784, 799, 1248)
  lab(862, 1205, [水银])
  line(p(850, 1210), p(825, 1234), stroke: 0.6pt)
})
