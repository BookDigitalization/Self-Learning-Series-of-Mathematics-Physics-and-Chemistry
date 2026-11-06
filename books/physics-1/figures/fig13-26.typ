// 图 13·26 火车转弯（原书 p.447）
// （a）车厢后视图：写实插画，保留原扫描裁剪（fig13-26a.png，已涂去字母 Q、F、O、G，用 CeTZ 补回；
//   图上的竖直受力线保留在位图里）；（b）受力分析图，用 CeTZ 重绘：倾斜的轨道、重力 G、轨道的支持力 Q、合力 F。
// 坐标是页面显示图（宽 1568）上的像素坐标；位置为目测。
#import "/common/series.typ": *

#let fig-13-26(width: 14cm) = px-canvas(960, 650, origin: (385, 1262), width: width, (p, u) => {
  import cetz.draw: *
  let arr = (end: "stealth", fill: black, scale: 0.55)
  let lab(x, y, body) = content(p(x, y), anchor: "center", text(size: 9pt, body))
  let dsh = (thickness: 0.8pt, dash: "dashed")
  // （a）
  content(p(385, 1325), anchor: "north-west", image("fig13-26a.png", width: 510 * u))
  lab(703, 1277, $Q$)
  lab(657, 1515, $O$)
  lab(692, 1495, $F$)
  lab(676, 1760, $G$)
  lab(643, 1868, $(a)$)
  // （b）倾斜的轨道（斜线填充）
  line(p(930, 1650), p(1318, 1740), p(1318, 1785), p(930, 1695), close: true, stroke: 1pt)
  for k in range(0, 18) {
    let x = 945 + k * 21
    line(p(x, 1696 + (x - 930) * 0.232), p(x + 14, 1670 + (x - 930) * 0.232), stroke: 0.5pt)
  }
  line(p(1002, 1615), p(1265, 1695), stroke: dsh)
  line(p(1005, 1765), p(1262, 1765), stroke: dsh)
  circle(p(1000, 1600), radius: 10 * u, fill: black)
  circle(p(1270, 1725), radius: 10 * u, fill: black)
  lab(1005, 1560, $C$)
  lab(1008, 1775, $A$)
  lab(1270, 1735, $B$)
  // 力
  line(p(1152, 1530), p(1230, 1290), stroke: 2.2pt, mark: arr)
  line(p(1230, 1290), p(1230, 1530), stroke: dsh)
  line(p(1152, 1530), p(1230, 1530), stroke: 2pt, mark: arr)
  line(p(1230, 1290), p(1150, 1905), stroke: 0.9pt)
  line(p(1152, 1530), p(1150, 1900), stroke: 2.2pt, mark: arr)
  lab(1232, 1272, $Q$)
  lab(1140, 1530, $O$)
  lab(1245, 1530, $F$)
  lab(1152, 1918, $G$)
  lab(1170, 1868, $(b)$)
})
