// 图 10·21、图 10·22（原书 p.315）
// CeTZ 重绘。坐标是 render-pages.py --dpi 200 显示图（宽 1568）上的像素坐标。
// 图 10·22（差动滑轮）中绳子的弯曲走向为近似重绘，原图手绘的圈绳形状不完全一致（见待核对清单）。
#import "/common/series.typ": *

#let fig-10-21(width: 6.6cm) = px-canvas(440, 580, origin: (460, 650), width: width, (p, u) => {
  import cetz.draw: *
  let lab(x, y, body) = content(p(x, y), anchor: "center", text(size: 8.5pt, body))
  let arr = (end: "stealth", fill: black, scale: 0.45)
  let up = (start: "stealth", fill: black, scale: 0.45)
  // 天花板与吊杆
  line(p(520, 662), p(610, 662), stroke: 0.8pt)
  for x in range(522, 610, step: 10) { line(p(x, 662), p(x + 7, 652), stroke: 0.5pt) }
  line(p(575, 662), p(575, 748), stroke: 1.4pt)
  // 三根杠杆
  line(p(487, 1020), p(487, 748), p(658, 748), stroke: 1.6pt)
  line(p(577, 1020), p(577, 815), p(750, 815), stroke: 1.6pt)
  line(p(660, 1020), p(660, 862), p(840, 862), stroke: 1.6pt)
  line(p(658, 748), p(658, 815), stroke: 1.6pt)
  line(p(750, 815), p(750, 862), stroke: 1.6pt)
  line(p(477, 1020), p(680, 1020), stroke: 3pt)
  // 力
  line(p(487, 905), p(487, 960), stroke: 1pt, mark: arr)
  line(p(577, 960), p(577, 900), stroke: 1pt, mark: arr)
  line(p(660, 960), p(660, 900), stroke: 1pt, mark: arr)
  line(p(840, 862), p(840, 940), stroke: 1pt, mark: arr)
  line(p(577, 1020), p(577, 1190), stroke: 1pt, mark: arr)
  lab(682, 770, $T_2$); lab(770, 840, $T_1$)
  lab(514, 933, $T'_2$); lab(603, 907, $T'_1$); lab(688, 938, $F'$)
  lab(866, 921, $F$); lab(601, 1160, $G$)
})

#let fig-10-22(width: 6.6cm) = px-canvas(330, 720, origin: (1030, 495), width: width, (p, u) => {
  import cetz.draw: *
  let lab(x, y, body) = content(p(x, y), anchor: "center", text(size: 8.5pt, body))
  let arr = (end: "stealth", fill: black, scale: 0.45)
  // 天花板与吊杆
  line(p(1175, 505), p(1290, 505), stroke: 0.8pt)
  for x in range(1177, 1290, step: 10) { line(p(x, 505), p(x + 7, 495), stroke: 0.5pt) }
  line(p(1232, 508), p(1232, 630), stroke: 1.6pt)
  // 轮轴：大轮 A、小轮 B
  circle(p(1232, 637), radius: 88 * u, stroke: 1pt)
  circle(p(1233, 632), radius: 45 * u, stroke: 1pt)
  lab(1118, 610, $A$); lab(1183, 598, $B$)
  // 动滑轮
  circle(p(1275, 1020), radius: 40 * u, stroke: 1pt)
  line(p(1320, 625), p(1316, 955), stroke: 1pt)
  line(p(1190, 632), p(1272, 982), stroke: 1pt)
  line(p(1278, 640), p(1238, 985), stroke: 1pt)
  // 手拉的绳圈
  bezier(p(1148, 645), p(1040, 935), p(1130, 780), p(1060, 860), stroke: 1pt)
  bezier(p(1040, 935), p(1075, 982), p(1030, 972), p(1050, 988), stroke: 1pt)
  bezier(p(1075, 982), p(1219, 850), p(1150, 988), p(1200, 905), stroke: 1pt)
  line(p(1106, 750), p(1112, 790), stroke: 1pt, mark: arr)
  lab(1084, 773, $F$)
  // 重物
  line(p(1275, 1060), p(1275, 1082), stroke: 1.6pt)
  rect(p(1255, 1082), p(1305, 1125), stroke: 1pt)
  line(p(1280, 1125), p(1280, 1195), stroke: 1pt, mark: arr)
  lab(1306, 1160, $G$)
})
