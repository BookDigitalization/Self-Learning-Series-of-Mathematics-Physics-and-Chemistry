// 图 10·32、图 10·33 劈的受力与功（原书 p.321、p.322）
// CeTZ 重绘。坐标是 render-pages.py --dpi 200 显示图（宽 1568）上的像素坐标。
#import "/common/series.typ": *

#let fig-10-32(width: 8.4cm) = px-canvas(620, 540, origin: (800, 1325), width: width, (p, u) => {
  import cetz.draw: *
  let lab(x, y, body) = content(p(x, y), anchor: "center", text(size: 8.5pt, body))
  let arr = (end: "stealth", fill: black, scale: 0.45)
  let dash = (thickness: 0.7pt, dash: "dashed")
  // 劈
  line(p(818, 1580), p(1300, 1500), p(1300, 1660), close: true, stroke: 1.4pt)
  line(p(818, 1580), p(1300, 1580), stroke: dash)
  line(p(1385, 1580), p(1308, 1580), stroke: 1.6pt, mark: arr)
  lab(1395, 1580, $F$)
  lab(998, 1566, $theta$); lab(998, 1595, $theta$)
  // 上侧分力矩形
  rect(p(1073, 1335), p(1122, 1528), stroke: dash)
  line(p(1073, 1338), p(1122, 1526), stroke: 1.2pt, mark: arr)
  lab(1052, 1334, $N$); lab(1152, 1430, $N_2$); lab(1050, 1514, $N_1$)
  // 下侧分力矩形
  rect(p(1073, 1632), p(1122, 1830), stroke: dash)
  line(p(1073, 1828), p(1122, 1634), stroke: 1.2pt, mark: arr)
  lab(1052, 1832, $N$); lab(1150, 1745, $N_2$); lab(1048, 1640, $N_1$)
})

#let fig-10-33(width: 7cm) = px-canvas(620, 290, origin: (350, 280), width: width, (p, u) => {
  import cetz.draw: *
  let lab(x, y, body) = content(p(x, y), anchor: "center", text(size: 8.5pt, body))
  let arr = (end: "stealth", fill: black, scale: 0.45)
  let dash = (thickness: 0.7pt, dash: "dashed")
  line(p(370, 392), p(852, 322), p(852, 477), close: true, stroke: 1.4pt)
  line(p(370, 398), p(930, 398), stroke: dash)
  line(p(940, 398), p(862, 398), stroke: 1.2pt, mark: arr)
  lab(950, 400, $F$)
  lab(553, 380, $theta$); lab(553, 408, $theta$)
  line(p(678, 302), p(690, 344), stroke: 1pt, mark: arr); lab(664, 292, $N$)
  line(p(668, 502), p(685, 457), stroke: 1pt, mark: arr); lab(655, 500, $N$)
  lab(822, 360, $h'$); lab(828, 440, $h'$)
  // h
  line(p(370, 392), p(370, 590), stroke: 0.6pt)
  line(p(852, 477), p(852, 610), stroke: 0.6pt)
  line(p(600, 575), p(372, 575), stroke: 0.6pt, mark: arr)
  line(p(640, 575), p(850, 575), stroke: 0.6pt, mark: arr)
  lab(620, 574, $h$)
})
