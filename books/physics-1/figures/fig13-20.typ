// 图 13·20 半径的位置由与基线 Ox 的夹角表示（原书 p.439）
// 示意图，按原图重绘：圆，半径 OA（夹角 θ_1）、OB（夹角 θ_2），基线 Ox。
// 坐标是页面显示图（宽 1568）上的像素坐标；位置为目测。
#import "/common/series.typ": *

#let fig-13-20(width: 5.6cm) = px-canvas(420, 340, origin: (970, 170), width: width, (p, u) => {
  import cetz.draw: *
  let arr = (end: "stealth", fill: black, scale: 0.55)
  let lab(x, y, body) = content(p(x, y), anchor: "center", text(size: 9pt, body))
  let (cx, cy, r) = (1139, 347, 152)
  circle(p(cx, cy), radius: r * u, stroke: 1.6pt)
  line(p(cx, cy), p(1375, cy), stroke: 1.2pt, mark: arr)
  line(p(cx, cy), p(cx + r * calc.cos(22deg), cy - r * calc.sin(22deg)), stroke: 1.2pt)
  line(p(cx, cy), p(cx + r * calc.cos(63deg), cy - r * calc.sin(63deg)), stroke: 1.2pt)
  arc(p(cx + 70, cy), start: 0deg, stop: 22deg, radius: 70 * u, stroke: 0.8pt)
  arc(p(cx + 100, cy), start: 0deg, stop: 63deg, radius: 100 * u, stroke: 0.8pt)
  lab(1115, 362, $O$)
  lab(1297, 268, $A$)
  lab(1213, 190, $B$)
  lab(1207, 332, $theta_1$)
  lab(1215, 268, $theta_2$)
  lab(1382, 347, $x$)
})
