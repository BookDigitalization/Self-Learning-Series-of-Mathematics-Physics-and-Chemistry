// 图 10·27 斜面类简单机械（原书 p.319）、图 10·29 斜面上推物体（原书 p.319）
// 图 10·27：（a）（c）用 CeTZ 重绘，（b）劈入圆木是写实插画，沿用原扫描裁剪（fig10-27b.png，已涂去 F）。
//   坐标是 render-pages.py --dpi 200 显示图（宽 1568）上的像素坐标；fig10-27b.png 为 336×683，
//   原页显示坐标换算 (x-715)×2.1314, (y-105)×2.1314。
// 图 10·29：fig10-29.png（1056×811，已涂去字母），换算 (x-905)×2.1314, (y-1185)×2.1314。
// 图 10·28（卡车与跳板）是写实插画，直接用 fig10-28.png，无字母。
#import "/common/series.typ": *

#let fig-10-27(width: 13cm) = px-canvas(1000, 360, origin: (350, 120), width: width, (p, u) => {
  import cetz.draw: *
  let lab(x, y, body) = content(p(x, y), anchor: "center", text(size: 8.5pt, body))
  let cap(x, y, c) = content(p(x, y), anchor: "center", text(size: 8.5pt)[（$#c$）])
  let arr = (end: "stealth", fill: black, scale: 0.45)
  // (a) 斜面
  line(p(372, 328), p(618, 215), p(618, 325), p(372, 328), stroke: 1.2pt)
  line(p(480, 282), p(504, 244), p(527, 258), p(503, 296), close: true, stroke: 0.9pt)
  line(p(492, 262), p(450, 152), stroke: 0.9pt, mark: arr)
  lab(432, 157, $N$)
  line(p(425, 303), p(485, 276), stroke: 0.9pt, mark: arr)
  lab(422, 284, $F$)
  line(p(500, 285), p(500, 376), stroke: (thickness: 0.8pt, dash: "dashed"), mark: arr)
  lab(518, 373, $G$)
  lab(412, 318, $theta$)
  cap(490, 437, $a$)
  // (b) 劈
  content(p(715, 105), anchor: "north-west", image("fig10-27b.png", width: 336 * u))
  cap(790, 437, $b$)
  lab(803, 128, $F$)
  // (c) 螺旋（展开成斜面）
  line(p(922, 397), p(1285, 222), stroke: 1pt)
  line(p(922, 397), p(1328, 392), stroke: 1.2pt)
  rect(p(1285, 152), p(1328, 392), stroke: 1.2pt)
  for k in range(0, 7) {
    line(p(1285, 232 + k * 22), p(1328, 218 + k * 22), stroke: 0.9pt)
  }
  line(p(970, 372), p(1285, 372), stroke: (thickness: 0.6pt, dash: "dashed"))
  lab(976, 383, $theta$)
  cap(1138, 445, $c$)
})

#let fig-10-29(width: 7cm) = px-canvas(1056, 811, width: width, (p, u) => {
  import cetz.draw: *
  content(p(0, 0), anchor: "north-west", image("fig10-29.png", width: 1056 * u))
  let d(x, y) = ((x - 905) * 2.1314, (y - 1185) * 2.1314)
  let lab(x, y, body) = content(p(..d(x, y)), anchor: "center", text(size: 9pt, body))
  lab(1113, 1315, $L$)
  lab(1241, 1303, $F$)
  lab(1376, 1382, $h$)
  lab(1020, 1471, $theta$)
  lab(1130, 1546, $G$)
})
