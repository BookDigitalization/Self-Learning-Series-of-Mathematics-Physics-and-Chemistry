// 图 1·21（原书 p.41）：以 −2、−1、1 为界把全体实数分成 4 个部分。
// 坐标取自 300 dpi 裁图的像素（y 向下）：数轴 y=190，上方的带箭头线 y=122，三条竖虚线 x = 450、755、1360。
#import "/common/series.typ": *

#let fig-1-21(width: 12cm) = px-canvas(1790, 270, width: width, (p, u) => {
  import cetz.draw: *
  let t(x, y, body) = content(p(x, y), text(font: fonts.song, size: 8pt, body))
  let ar = (end: "stealth", fill: black, scale: 0.5)
  let ay = 190
  line(p(145, ay), p(1700, ay), stroke: 0.6pt, mark: ar)
  t(1735, ay - 4, $x$)
  // 上方的双向箭头线
  line(p(1700, 122), p(140, 122), stroke: 0.6pt, mark: ar)
  line(p(140, 122), p(1700, 122), stroke: 0.6pt, mark: ar)
  // 分界的竖虚线
  for x in (450, 755, 1360) {
    line(p(x, 30), p(x, ay), stroke: (thickness: 0.6pt, dash: "dashed"))
    circle(p(x, ay), radius: 8 * u, fill: white, stroke: 0.6pt)
  }
  t(450, 228, [−2])
  t(755, 228, [−1])
  t(1360, 228, [1])
  // 四个部分
  t(305, 82, $x < -2$)
  t(600, 82, $-2 < x < -1$)
  t(1055, 82, $-1 < x < 1$)
  t(1505, 82, $x > 1$)
})
