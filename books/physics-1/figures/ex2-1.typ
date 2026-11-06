// 习题 2·1 第 4 题附图（原书 p.25）：小车，A 点在右侧面
// 线条图，按原图重绘。坐标是原页显示图（render-pages.py --dpi 200，宽 1568）的像素坐标。
#import "/common/series.typ": *

#let fig-ex-2-1-4(width: 4.6cm) = px-canvas(310, 190, origin: (1095, 1300), width: width, (p, u) => {
  import cetz.draw: *
  // 车厢
  rect(p(1132, 1312), p(1370, 1432), stroke: 1.6pt)
  // 车轮
  for cx in (1180, 1320) {
    circle(p(cx, 1443), radius: 21 * u, fill: white, stroke: 1.4pt)
    circle(p(cx, 1443), radius: 8 * u, fill: white, stroke: 1.2pt)
  }
  // 地面：一条线 + 斜线
  line(p(1108, 1467), p(1395, 1467), stroke: 1.4pt)
  for k in range(0, 24) {
    let x = 1112 + k * 12.4
    line(p(x + 9, 1467), p(x, 1486), stroke: 0.7pt)
  }
  // A 点
  circle(p(1370, 1362), radius: 3.5 * u, fill: black, stroke: none)
  content(p(1388, 1362), anchor: "center", text(size: 10pt, $A$))
})
