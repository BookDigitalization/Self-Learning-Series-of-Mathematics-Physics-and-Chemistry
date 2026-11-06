// 图 9·35（原书 p.273）例 12：靠在光滑墙上的梯子。CeTZ 重绘。坐标取自页面显示图，原点 (990,100)。
// 原图 F 箭头的箭头画在靠近 B 的一端，这里照原图画。
#import "/common/series.typ": *

#let fig-9-35(width: 6.4cm) = px-canvas(460, 580, origin: (990, 100), width: width, (p, u) => {
  import cetz.draw: *
  let arrow(a, b, th: 1.3pt) = line(p(..a), p(..b), stroke: th, mark: (end: "stealth", fill: black, scale: 0.5))
  let lab(x, y, body, size: 9pt) = content(p(x, y), anchor: "center", text(size: size, body))
  // 墙与地板
  rect(p(1030, 110), p(1048, 600), stroke: 0.6pt)
  for y in range(120, 600, step: 14) { line(p(1030, y + 14), p(1048, y), stroke: 0.4pt) }
  line(p(1030, 600), p(1425, 600), stroke: 1pt)
  for x in range(1030, 1425, step: 14) { line(p(x, 614), p(x + 14, 600), stroke: 0.4pt) }
  // 梯子
  line(p(1048, 210), p(1330, 596), stroke: 1.6pt)
  line(p(1058, 206), p(1340, 590), stroke: 1.6pt)
  arrow((1048, 210), (1178, 210))
  arrow((1148, 345), (1148, 505), th: 1.8pt)
  arrow((1330, 596), (1330, 470), th: 1.8pt)
  arrow((1165, 583), (1320, 583))
  // 尺寸
  line(p(1015, 210), p(1015, 600), stroke: 0.6pt, mark: (start: "stealth", end: "stealth", fill: black, scale: 0.35))
  line(p(1048, 640), p(1330, 640), stroke: 0.6pt, mark: (start: "stealth", end: "stealth", fill: black, scale: 0.35))
  lab(1003, 405, text(size: 9pt, [2.4 米]))
  lab(1190, 640, text(size: 9pt, [1.8 米]))
  lab(1215, 395, text(size: 9pt, [3 米]))
  lab(1215, 475, text(size: 9pt, [2 米]))
  lab(1055, 190, $A$); lab(1155, 318, $D$); lab(1340, 617, $B$); lab(1032, 617, $C$)
  lab(1195, 208, $N_1$); lab(1332, 452, $N_2$); lab(1180, 570, $F$); lab(1160, 502, $G$)
})
