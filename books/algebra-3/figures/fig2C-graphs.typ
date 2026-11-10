// 图 2·11、2·12、2·13（原书 p.103、p.104、p.104）：描点法作图的三幅例图。
// 坐标取自原书页面的 400 dpi 局部裁图（像素，y 向下；裁剪区在 200 dpi 页面像素中分别为
// 图 2·11：p.103 (560,520)–(1240,1280)；图 2·12：p.104 (520,260)–(1260,1010)；图 2·13：p.104 (600,1580)–(1300,2200)）。
// 图 2·11 的曲线按 y = x² 画，图 2·12 的两支按 y = 6/x 画（原书是手绘，端点位置按扫描量取）；
// 图 2·13 是书中有意画错的折线，各顶点按扫描上圆圈的位置量取，不是 y = x² 的真实点。
#import "/common/series.typ": *

#let arr = (end: "stealth", fill: black, scale: 0.5)

// 坐标轴上的短刻度（horizontal 轴上的竖短线 / 纵轴上的横短线）
#let xtick(p, x, y, h: 10) = cetz.draw.line(p(x, y - h), p(x, y + h), stroke: 0.6pt)
#let ytick(p, x, y, h: 10) = cetz.draw.line(p(x - h, y), p(x + h, y), stroke: 0.6pt)
#let lab(p, x, y, body) = cetz.draw.content(p(x, y), text(font: fonts.song, size: 8.5pt, body))
#let ocirc(p, u, x, y) = cetz.draw.circle(p(x, y), radius: 11 * u, fill: white, stroke: 0.7pt)

// 图 2·11：y = x² 的图像
#let fig-2-11(width: 6.1cm) = px-canvas(1360, 1520, width: width, (p, u) => {
  import cetz.draw: *
  let (ox, oy, ux, uy) = (497, 1145, 110, 113)
  line(p(45, oy), p(1125, oy), stroke: 0.6pt, mark: arr)
  line(p(ox, 1435), p(ox, 105), stroke: 0.6pt, mark: arr)
  for k in (-3, -2, -1, 1, 2, 3) { xtick(p, ox + k * ux, oy) }
  for k in range(1, 8) { ytick(p, ox, oy - k * uy) }
  lab(p, 508, 55, $y$)
  lab(p, 1172, 1160, $x$)
  lab(p, 462, 1172, $O$)
  // 曲线
  let pts = range(-121, 122).map(i => {
    let x = i / 50
    p(ox + x * ux, oy - x * x * uy)
  })
  line(..pts, stroke: 1.6pt)
  // 描出的点：x = ±1/2、±1、±3/2、±2
  for x in (-2, -1.5, -1, -0.5, 0.5, 1, 1.5, 2) { ocirc(p, u, ox + x * ux, oy - x * x * uy) }
})

// 图 2·12：y = 6/x 的图像（双曲线的两支）
#let fig-2-12(width: 6.7cm) = px-canvas(1480, 1500, width: width, (p, u) => {
  import cetz.draw: *
  let (ox, oy, ux, uy) = (668, 845, 76, 78)
  line(p(55, oy), p(1315, oy), stroke: 0.6pt, mark: arr)
  line(p(ox, 1420), p(ox, 100), stroke: 0.6pt, mark: arr)
  for k in (-6, -5, -4, -3, -2, -1, 1, 2, 3, 4, 5, 6) { xtick(p, ox + k * ux, oy) }
  for k in (-6, -5, -4, -3, -2, -1, 1, 2, 3, 4, 5, 6) { ytick(p, ox, oy - k * uy) }
  lab(p, 665, 45, $y$)
  lab(p, 1362, 855, $x$)
  lab(p, 635, 875, $O$)
  let branch(a, b) = {
    let n = 80
    let pts = range(n + 1).map(i => {
      let x = a + (b - a) * i / n
      p(ox + x * ux, oy - 6 / x * uy)
    })
    line(..pts, stroke: 1.3pt)
  }
  branch(0.89, 6.5)
  branch(-7.2, -0.96)
  // 描出的点：x = ±1…±5 的对应点（表里的数）
  for x in (1, 2, 3, 4, 5, -1, -2, -3, -4, -5) { ocirc(p, u, ox + x * ux, oy - 6 / x * uy) }
})

// 图 2·13：错误的折线画法
#let fig-2-13(width: 6.3cm) = px-canvas(1400, 1240, width: width, (p, u) => {
  import cetz.draw: *
  let (ox, oy) = (530, 960)
  line(p(118, oy), p(1085, oy), stroke: 0.6pt, mark: arr)
  line(p(ox, 1115), p(ox, 120), stroke: 0.6pt, mark: arr)
  for x in (218, 298, 378, 452, 605, 683, 755, 838) { xtick(p, x, oy) }
  for y in (880, 805, 728, 650, 572, 495, 415, 340) { ytick(p, ox, y) }
  lab(p, 537, 55, $y$)
  lab(p, 1135, 970, $x$)
  lab(p, 505, 992, $O$)
  let left = ((262, 372), (305, 497), (343, 655), (385, 730), (458, 885))
  let right = ((611, 883), (686, 730), (722, 650), (764, 497), (795, 375))
  line(..left.map(q => p(..q)), p(ox, oy), ..right.map(q => p(..q)), stroke: 1.6pt)
  for q in left.slice(1) + right.slice(0, 4) { ocirc(p, u, ..q) }
})
