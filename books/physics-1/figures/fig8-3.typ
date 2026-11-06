// 图 8·3 两辆小车上的作用力（原书 p.213）
// 线条图沿用原扫描裁剪（fig8-3.png，已涂去 F′、F 及“向右运动”“向左运动”）；字母和文字用 CeTZ 补回，
// 左边的箭头（“向左运动”上方）因扫描残缺，重画。
// 坐标是 fig8-3.png 的像素坐标（2250×459）：(显示图 x-370)×2.1314，(y-985)×2.1314。
#import "/common/series.typ": *

#let fig-8-3(width: 14cm) = px-canvas(2250, 459, width: width, (p, u) => {
  import cetz.draw: *
  content(p(0, 0), anchor: "north-west", image("fig8-3.png", width: 2250 * u))
  let lab(x, y, body) = content(p(x, y), anchor: "center",
    text(font: fonts.hei, size: 8pt, weight: "medium", body))
  rect(p(1590, 322), p(1860, 360), fill: white, stroke: none)
  line(p(1830, 342), p(1618, 342), stroke: 0.7pt, mark: (end: "stealth", fill: black, scale: 0.5))
  content(p(980, 38), anchor: "center", text(size: 10pt, $F'$))
  content(p(1496, 34), anchor: "center", text(size: 10pt, $F$))
  lab(490, 405, [向右运动])
  lab(1726, 405, [向左运动])
})
