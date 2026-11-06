// 图 10·16 杠杆的组合（原书 p.311）与 图 10·17 受力图（原书 p.312）
// （a）图是简笔画，沿用原扫描裁剪（fig10-16a.png，无字母）；（b）（c）及图 10·17 用 CeTZ 重绘。
// 坐标是 render-pages.py --dpi 200 显示图（宽 1568）上的像素坐标。
#import "/common/series.typ": *

#let fig-10-16(width: 12cm) = px-canvas(780, 860, origin: (535, 1065), width: width, (p, u) => {
  import cetz.draw: *
  let lab(x, y, body) = content(p(x, y), anchor: "center", text(size: 8.5pt, body))
  let cap(x, y, c) = content(p(x, y), anchor: "center", text(size: 8.5pt)[（$#c$）])
  let arr = (end: "stealth", fill: black, scale: 0.45)
  let tri(x, y) = line(p(x - 8, y + 14), p(x, y), p(x + 8, y + 14), close: true, stroke: 0.8pt, fill: white)
  let hatch(x0, x1, y) = {
    line(p(x0, y), p(x1, y), stroke: 0.8pt)
    for x in range(x0, x1, step: 8) { line(p(x, y), p(x + 6, y - 7), stroke: 0.5pt) }
  }
  // (a) 简笔画：扫描图（原页 545,1112 起，400 dpi 裁剪 → 换算 ×2.1314）
  content(p(545, 1112), anchor: "north-west", image("fig10-16a.png", width: 245 * u))
  cap(640, 1392, $a$)

  // (b) 制动装置示意
  line(p(1175, 1127), p(1262, 1212), stroke: 1.4pt)          // A→O
  line(p(1262, 1212), p(1262, 1275), stroke: 1.4pt)          // O→B
  line(p(1262, 1275), p(1068, 1275), stroke: 1.4pt)          // B→D
  line(p(1068, 1275), p(1068, 1425), stroke: 1.4pt)          // D→O'
  hatch(1268, 1290, 1205)
  line(p(1268, 1196), p(1268, 1218), stroke: 0.8pt)
  circle(p(1112, 1352), radius: 42 * u, stroke: 1pt)
  circle(p(1110, 1352), radius: 2.5 * u, fill: black, stroke: none)
  line(p(1035, 1348), p(1068, 1348), stroke: 1pt, mark: arr)
  tri(1068, 1426)
  line(p(1255, 1082), p(1213, 1122), stroke: 1pt, mark: arr)
  line(p(1190, 1112), p(1215, 1130), stroke: 0.8pt)
  lab(1238, 1082, $F$); lab(1222, 1128, $A$); lab(1243, 1232, $O$); lab(1278, 1284, $B$)
  lab(1052, 1275, $D$); lab(1166, 1348, $C$); lab(1090, 1340, $E$); lab(1035, 1330, $N$)
  lab(1032, 1421, $O'$)
  cap(1197, 1416, $b$)

  // (c) 磅秤示意
  line(p(585, 1650), p(865, 1650), stroke: 1.4pt)
  tri(625, 1652); hatch(598, 654, 1678)
  rect(p(720, 1634), p(748, 1650), fill: black, stroke: none)
  line(p(864, 1650), p(852, 1666), p(876, 1666), close: true, stroke: 0.8pt, fill: black)
  lab(585, 1636, $O$); lab(766, 1636, $B$); lab(880, 1637, $A$)
  line(p(733, 1650), p(733, 1905), stroke: 1pt, mark: arr); lab(750, 1895, $G$)
  line(p(810, 1685), p(1037, 1685), stroke: 1.4pt)
  tri(810, 1687); hatch(792, 830, 1714)
  line(p(862, 1685), p(862, 1770), stroke: 1pt, mark: arr)
  lab(782, 1708, $O'$); lab(880, 1706, $B'$); lab(880, 1761, $G'$); lab(1050, 1710, $A'$)
  line(p(1037, 1685), p(1037, 1565), stroke: 1.4pt)
  line(p(1037, 1585), p(1240, 1585), stroke: 1.4pt)
  circle(p(1037, 1585), radius: 2.5 * u, fill: black, stroke: none)
  tri(1085, 1587)
  rect(p(1190, 1585), p(1215, 1608), fill: white, stroke: 0.8pt)
  line(p(1203, 1608), p(1198, 1648), stroke: 1pt, mark: arr)
  line(p(1037, 1585), p(1037, 1650), stroke: 1pt, mark: arr)
  lab(1038, 1556, $B''$); lab(1097, 1556, $O''$); lab(1240, 1557, $A''$)
  lab(1060, 1636, $G''$); lab(1208, 1648, $F$)
  cap(800, 1862, $c$)
})

#let fig-10-17(width: 12cm) = px-canvas(1040, 340, origin: (290, 155), width: width, (p, u) => {
  import cetz.draw: *
  let lab(x, y, body) = content(p(x, y), anchor: "center", text(size: 8.5pt, body))
  let cap(x, y, c) = content(p(x, y), anchor: "center", text(size: 8.5pt)[（$#c$）])
  let arr = (end: "stealth", fill: black, scale: 0.45)
  let tri(x, y) = line(p(x - 8, y + 14), p(x, y), p(x + 8, y + 14), close: true, stroke: 0.8pt, fill: white)
  // (a)
  line(p(305, 255), p(515, 255), stroke: 1.4pt)
  tri(320, 258)
  line(p(515, 255), p(515, 172), stroke: 1pt, mark: arr)
  line(p(415, 255), p(415, 430), stroke: 1pt, mark: arr)
  lab(320, 238, $O$); lab(412, 237, $B$); lab(527, 262, $A$)
  lab(540, 176, $F_1$); lab(434, 410, $G$)
  cap(443, 457, $a$)
  // (b)
  line(p(690, 265), p(920, 265), stroke: 1.4pt)
  tri(700, 268)
  line(p(918, 265), p(918, 200), stroke: 1pt, mark: arr)
  line(p(750, 265), p(750, 360), stroke: 1pt, mark: arr)
  lab(697, 250, $O'$); lab(757, 248, $B'$); lab(936, 262, $A'$)
  lab(928, 208, $F_2$); lab(772, 350, $G'$)
  cap(762, 443, $b$)
  // (c)
  line(p(1082, 265), p(1305, 265), stroke: 1.4pt)
  tri(1141, 268)
  line(p(1083, 265), p(1083, 330), stroke: 1pt, mark: arr)
  line(p(1290, 270), p(1290, 320), stroke: 1pt, mark: arr)
  lab(1087, 248, $B''$); lab(1143, 248, $O''$); lab(1299, 243, $A''$)
  lab(1097, 330, $G''$); lab(1299, 302, $F$)
  cap(1138, 443, $c$)
})
