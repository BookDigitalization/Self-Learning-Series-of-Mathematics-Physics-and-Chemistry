// 图 11·19 自由落体的路程（原书 p.355）
// 示意图，按原图重绘。坐标是 render-pages.py --dpi 200 显示图（宽 1568）上的像素坐标。
// 刻度位置按 s = ½gt²（0、1、4、9、16、25 的比例）排布，与原图刻度位置吻合；刻度数字 0–5 照原图。
#import "/common/series.typ": *

#let fig-11-19(width: 2.6cm) = px-canvas(130, 680, origin: (1270, 425), width: width, (p, u) => {
  import cetz.draw: *
  let lab(x, y, body) = content(p(x, y), anchor: "center", text(size: 9pt, body))
  let y0 = 438
  let yt(t) = y0 + 20.7 * t * t
  line(p(1321, y0), p(1318, 1078), stroke: 2pt, mark: (end: "stealth", fill: black, scale: 0.5))
  circle(p(1322, y0), radius: 4 * u, fill: black, stroke: none)
  for t in range(0, 6) {
    line(p(1308, yt(t)), p(1321, yt(t)), stroke: 0.9pt)
    lab(1297, yt(t) - 2, str(t))
  }
  lab(1350, 452, $s_1$)
  lab(1350, 503, $s_2$)
  lab(1350, 590, $s_3$)
  lab(1350, 703, $s_4$)
  lab(1350, 862, $s_5$)
})
