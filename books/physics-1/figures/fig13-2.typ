// 图 13·2 各种曲线运动（原书 p.417）
// 示意图，按原图重绘：（a）斜抛　（b）电子偏转　（c）α 粒子散射　（d）飞船绕过月球。
// 坐标是页面显示图（宽 1568）上的像素坐标，不是真实坐标；重绘位置为目测，曲线形状为示意。
// 原图 v、F、α 的下标在扫描里很模糊，（c）（d）里 F、v 的下标按 1、2、3 顺序补。
#import "/common/series.typ": *

#let fig-13-2(width: 13.5cm) = px-canvas(1040, 830, origin: (375, 1150), width: width, (p, u) => {
  import cetz.draw: *
  let st = 0.9pt
  let arr = (end: "stealth", fill: black, scale: 0.55)
  let lab(x, y, body) = content(p(x, y), anchor: "center", text(size: 9pt, body))
  let vec(a, b, w: 1.3pt) = line(p(..a), p(..b), stroke: w, mark: arr)
  let dsh = (paint: black, thickness: 0.8pt, dash: "dashed")
  let dd = (paint: black, thickness: 0.8pt, dash: "dash-dotted")

  // ---------- （a）
  // 地面
  line(p(390, 1307), p(775, 1307), stroke: st)
  for k in range(0, 20) {
    let x = 400 + k * 19
    line(p(x, 1308), p(x - 9, 1318), stroke: 0.5pt)
  }
  let par(x) = 1190 + 0.0029 * calc.pow(x - 595, 2)
  line(..range(0, 38).map(k => { let x = 403 + k * 9.5; p(x, par(x)) }), stroke: dsh)
  vec((403, 1307), (460, 1232))
  lab(455, 1216, $v_1$)
  lab(437, 1295, $alpha_1$)
  vec((403, 1310), (403, 1366))
  lab(397, 1378, $G$)
  // 最高点附近
  vec((550, 1193), (520, 1196))
  lab(568, 1172, $v_2$)
  line(p(503, 1213), p(503, 1263), stroke: st, mark: arr)
  lab(503, 1275, $G$)
  lab(538, 1222, $alpha_2$)
  // 下降段
  vec((673, 1215), (718, 1244))
  lab(713, 1218, $v_3$)
  line(p(673, 1215), p(673, 1263), stroke: st, mark: arr)
  lab(673, 1275, $G$)
  lab(690, 1240, $alpha_3$)
  lab(525, 1420, $(a)$)

  // ---------- （b）
  lab(888, 1190, $A$)
  lab(893, 1342, $B$)
  line(p(925, 1188), p(1145, 1188), stroke: (thickness: 1.6pt, dash: "dashed"))
  line(p(915, 1340), p(1170, 1340), stroke: st)
  for k in range(0, 7) {
    lab(925 + k * 40, 1356, text(size: 9pt, [+]))
  }
  for k in range(0, 6) {
    lab(935 + k * 36, 1192, text(size: 9pt, [#sym.minus]))
  }
  line(p(1348, 1110), p(1348, 1475), stroke: 1.6pt)
  lab(1362, 1118, $M$)
  lab(1362, 1255, $O$)
  lab(1362, 1460, $P$)
  line(p(925, 1252), p(1348, 1252), stroke: dsh)
  rect(p(917, 1245), p(931, 1259), stroke: st)
  vec((960, 1252), (1000, 1252))
  lab(968, 1232, $v_1$)
  // 偏转曲线 到 Q
  let bq(x) = 1252 + 88 * calc.pow((x - 925) / 245, 2)
  line(..range(0, 26).map(k => { let x = 925 + k * 9.8; p(x, bq(x)) }), stroke: dsh)
  line(p(1170, 1340), p(1348, 1455), stroke: (thickness: 1.2pt, dash: "dashed"))
  lab(1172, 1326, $Q$)
  vec((925, 1257), (925, 1285))
  lab(907, 1280, $F$)
  vec((1020, 1290), (1020, 1318))
  lab(1033, 1313, $F$)
  vec((1085, 1305), (1130, 1328))
  lab(1148, 1300, $v_2$)
  lab(1048, 1425, $(b)$)

  // ---------- （c）
  let N = (667, 1773)
  circle(p(..N), radius: 9 * u, stroke: st)
  lab(667, 1773, text(size: 8pt, [+]))
  let P1 = (448, 1773)
  let P2 = (594, 1692)
  let P3 = (667, 1545)
  catmull(..(p(..P1), p(520, 1738), p(..P2), p(645, 1620), p(..P3), p(685, 1490)), tension: 0.5, stroke: dsh)
  line(p(..P1), p(..N), stroke: dd)
  line(p(..P2), p(..N), stroke: dd)
  line(p(..P3), p(..N), stroke: dsh)
  circle(p(..P1), radius: 3.5 * u, stroke: st)
  circle(p(..P2), radius: 3.5 * u, stroke: st)
  circle(p(..P3), radius: 3.5 * u, stroke: st)
  vec((445, 1773), (400, 1773))
  lab(405, 1752, $F_1$)
  vec((470, 1766), (520, 1749))
  lab(548, 1757, $v_1$)
  vec((594, 1692), (556, 1644))
  lab(547, 1620, $F_2$)
  vec((602, 1686), (640, 1650))
  lab(645, 1680, $v_2$)
  vec((667, 1545), (667, 1500))
  lab(640, 1600, $F_3$)
  vec((672, 1520), (690, 1468))
  lab(712, 1455, $v_3$)
  lab(572, 1830, $(c)$)

  // ---------- （d）
  let M = (1210, 1662)
  circle(p(..M), radius: 11 * u, stroke: st)
  lab(1210, 1662, text(font: fonts.kai, size: 8pt, [月]))
  let Q1 = (1020, 1573)
  let Q2 = (1210, 1603)
  let Q3 = (1198, 1750)
  catmull(..(p(985, 1575), p(..Q1), p(1100, 1561), p(..Q2), p(1262, 1670), p(1240, 1730), p(..Q3), p(1112, 1795)), tension: 0.5, stroke: dsh)
  line(p(..Q1), p(..M), stroke: dd)
  line(p(..Q2), p(..M), stroke: dsh)
  line(p(..Q3), p(..M), stroke: dd)
  circle(p(..Q1), radius: 3.5 * u, stroke: st)
  circle(p(..Q2), radius: 3.5 * u, stroke: st)
  circle(p(..Q3), radius: 3.5 * u, stroke: st)
  vec((1060, 1566), (1100, 1560))
  lab(1075, 1536, $v_1$)
  lab(1043, 1608, $F_1$)
  vec((1210, 1603), (1295, 1650))
  lab(1296, 1625, $v_2$)
  lab(1182, 1612, $F_2$)
  lab(1180, 1700, $F_3$)
  vec((1170, 1768), (1130, 1788))
  lab(1152, 1803, $v_3$)
  lab(1238, 1815, $(d)$)
})

