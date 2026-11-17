// 习题 5·3 第 3 题附图（原书 p.271）。坐标取自原书页面 150 dpi 像素；灯泡画成圆内交叉符号。
#import "/common/series.typ": *

#let fig-ex-5-3-3(width: 11.4cm) = px-canvas(660, 360, origin: (310, 730), width: width, (p, u) => {
  import cetz.draw: *
  let tx(x, y, body) = content(p(x, y), anchor: "center", text(size: 9pt, body))
  let w(..pts) = line(..pts.pos().map(q => p(..q)), stroke: 0.8pt)
  let d(x, y) = circle(p(x, y), radius: 3 * u, fill: black, stroke: none)
  let lamp(x, y) = {
    circle(p(x, y), radius: 16 * u, stroke: 0.8pt, fill: white)
    line(p(x - 11, y - 11), p(x + 11, y + 11), stroke: 0.7pt)
    line(p(x - 11, y + 11), p(x + 11, y - 11), stroke: 0.7pt)
  }
  // 一组并联灯：左竖线 xl 接线 wl，右竖线 xr 接线 wr
  let unit(xl, wl, xr, wr, cx, ys) = {
    let yl = ys.last()
    w((xl, wl), (xl, yl)); w((xr, wr), (xr, yl))
    for y in ys {
      w((xl, y), (cx - 16, y)); w((cx + 16, y), (xr, y))
      lamp(cx, y); d(xl, y); d(xr, y)
    }
    d(xl, wl); d(xr, wr)
  }
  // (a)
  for y in (742, 772, 800) { w((318, y), (632, y)) }
  unit(340, 742, 415, 772, 378, (858, 908))
  unit(443, 772, 525, 800, 483, (858, 908))
  unit(545, 800, 625, 742, 583, (858, 908))
  tx(480, 1022, $(a)$)
  // (b)
  for y in (747, 775, 803, 830) { w((655, y), (960, y)) }
  unit(668, 775, 738, 747, 703, (882,))
  unit(760, 803, 840, 747, 800, (885, 935, 985))
  unit(868, 830, 945, 775, 905, (885, 935))
  tx(798, 1022, $(b)$)
})
