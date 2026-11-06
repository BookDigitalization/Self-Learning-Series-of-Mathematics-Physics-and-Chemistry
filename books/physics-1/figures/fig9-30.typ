// 图 9·30（原书 p.265）平行力平衡的实验：（a）弹簧测力计与直尺，（b）受力图。
// 坐标取自页面显示图，原点 (760,1030)。（a）中被测力计遮住的刻度“3”按位置补出（见待核对清单）。
#import "/common/series.typ": *

#let fig-9-30(width: 9cm) = px-canvas(640, 650, origin: (760, 1030), width: width, (p, u) => {
  import cetz.draw: *
  let arrow(a, b, th: 1.4pt) = line(p(..a), p(..b), stroke: th, mark: (end: "stealth", fill: black, scale: 0.5))
  let lab(x, y, body, size: 9pt) = content(p(x, y), anchor: "center", text(size: size, body))
  // （a）直尺
  rect(p(780, 1213), p(1370, 1233), stroke: 1pt)
  rect(p(1345, 1213), p(1372, 1235), stroke: 1pt)
  let xs = (815, 862, 905, 947, 993, 1037, 1084, 1128, 1170, 1213, 1256, 1302, 1350)
  for (i, x) in xs.enumerate() {
    line(p(x, 1213), p(x, 1226), stroke: 0.5pt)
    if i != 3 { lab(x, 1190, str(i), size: 8pt) }
  }
  // 弹簧测力计 S
  line(p(930, 1050), p(965, 1050), stroke: 1.2pt)
  line(p(947, 1050), p(947, 1062), stroke: 1pt)
  rect(p(935, 1062), p(960, 1178), stroke: 1pt, fill: luma(240))
  line(p(947, 1178), p(947, 1213), stroke: 1pt)
  lab(982, 1127, $S$)
  // 砝码
  line(p(815, 1233), p(815, 1268), stroke: 1pt)
  rect(p(790, 1280), p(838, 1340), stroke: 1pt)
  rect(p(800, 1268), p(828, 1280), stroke: 1pt)
  line(p(1213, 1233), p(1213, 1272), stroke: 1pt)
  rect(p(1182, 1284), p(1232, 1335), stroke: 1pt)
  rect(p(1192, 1272), p(1222, 1284), stroke: 1pt)
  lab(815, 1310, $G_1$, size: 8pt); lab(1208, 1308, $G_2$, size: 8pt)
  lab(1337, 1352, $(a)$)
  // （b）
  line(p(780, 1520), p(1365, 1525), stroke: 1pt)
  arrow((947, 1520), (947, 1320))
  arrow((810, 1520), (808, 1655))
  arrow((1210, 1520), (1210, 1597))
  lab(810, 1500, $A$); lab(1212, 1502, $B$); lab(945, 1540, $C$)
  lab(975, 1412, $R$); lab(835, 1620, $G_1$); lab(1235, 1585, $G_2$)
  lab(1318, 1650, $(b)$)
})
