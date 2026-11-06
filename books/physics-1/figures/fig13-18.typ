// 图 13·18 例 8 悬崖上斜向下抛物（原书 p.436）
// 示意图，按原图重绘：悬崖（山峰）顶点 A，坐标轴 Ox、Oy，B 为落地点，B′ 在 A 的水平线上，高 h。
// 山的轮廓是写实线条，这里用几条曲线示意。坐标是页面显示图（宽 1568）上的像素坐标；位置为目测。
#import "/common/series.typ": *

#let fig-13-18(width: 8.4cm) = px-canvas(600, 340, origin: (780, 215), width: width, (p, u) => {
  import cetz.draw: *
  let arr = (end: "stealth", fill: black, scale: 0.5)
  let lab(x, y, body) = content(p(x, y), anchor: "center", text(size: 9pt, body))
  let dsh = (thickness: 0.8pt, dash: "dashed")
  let (ax, ay) = (857, 325)
  // 地面
  line(p(845, 510), p(1350, 510), stroke: 1.2pt, mark: arr)
  // 山
  catmull(p(ax, ay + 3), p(835, 370), p(815, 440), p(795, 505), stroke: 1.4pt)
  catmull(p(ax, ay + 3), p(845, 385), p(832, 450), p(826, 508), stroke: 0.8pt)
  catmull(p(ax, ay + 3), p(872, 400), p(888, 460), p(905, 508), stroke: 1.2pt)
  catmull(p(ax, ay + 3), p(866, 420), p(876, 470), p(884, 508), stroke: 0.6pt)
  // 坐标轴与辅助线
  line(p(ax, ay), p(ax, 228), stroke: 1.2pt, mark: arr)
  line(p(ax, ay), p(1222, ay), stroke: dsh, mark: arr)
  line(p(1130, ay), p(1130, 510), stroke: dsh)
  line(p(ax, ay), p(ax, 510), stroke: 0.8pt)
  // 轨迹
  let tr(x) = ay + (x - ax) * 0.268 + 0.0015 * calc.pow(x - ax, 2)
  line(..range(0, 29).map(k => { let x = ax + k * 273 / 28; p(x, tr(x)) }), stroke: 1.5pt)
  line(p(ax, ay), p(950, 352), stroke: 1.6pt, mark: arr)
  circle(p(ax, ay), radius: 3 * u, fill: black, stroke: none)
  lab(868, 233, $y$)
  lab(1228, 318, $x$)
  lab(838, 312, $A$)
  lab(1135, 303, $B'$)
  lab(1130, 527, $B$)
  lab(848, 527, $O$)
  lab(1350, 525, $x$)
  lab(857, 438, $h$)
  lab(915, 297, $theta$)
  lab(973, 343, $v_0$)
})
