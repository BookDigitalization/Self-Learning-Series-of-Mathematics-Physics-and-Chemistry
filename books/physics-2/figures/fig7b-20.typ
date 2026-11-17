// 图 7·20 水的沸点距离海平面的高度的关系（原书 p.250）
// CeTZ 重绘，坐标是原页局部放大图（400 dpi 裁剪）的像素坐标，y 向下。
#import "/common/series.typ": *

#let fig-7-20(width: 6.2cm) = px-canvas(800, 700, width: width, (p, u) => {
  import cetz.draw: *
  // 网格：横向每 5°C（91.5 px）一格，纵向每 1000 米（93.3 px）一格
  let x0 = 97
  let y80 = 592
  for i in range(0, 7) {
    line(p(x0 + 93.3 * i, y80), p(x0 + 93.3 * i, 130), stroke: 1.1 * u)
  }
  for j in range(0, 6) {
    line(p(x0, y80 - 92.8 * j), p(x0 + 93.3 * 6, y80 - 92.8 * j), stroke: 1.1 * u)
  }
  // 坐标轴
  line(p(x0 - 2, y80 + 3), p(x0 - 2, 62), stroke: 1.6 * u, mark: (end: ">", fill: black, scale: 0.7))
  line(p(x0 - 2, y80 + 3), p(722, y80 + 8), stroke: 1.6 * u, mark: (end: ">", fill: black, scale: 0.7))
  // 沸点曲线（直线）
  line(p(x0, 228), p(632, 588), stroke: 7 * u)
  let t(x, y, body, anchor: "center") = content(p(x, y), anchor: anchor, text(size: 38 * u, body))
  for (v, y) in ((100, 228), (95, 318), (90, 410), (85, 500), (80, 592)) {
    t(65, y, str(v))
  }
  t(100, 628, [0])
  for (v, x) in ((1000, 188), (2000, 283), (3000, 376), (4000, 470), (5000, 563)) {
    t(x, 628, str(v))
  }
  t(632, 628, [6000], anchor: "center")
  t(722, 632, [(米)], anchor: "west")
  content(p(22, 360), anchor: "center", angle: 90deg, text(size: 38 * u)[沸点(°C)])
})
