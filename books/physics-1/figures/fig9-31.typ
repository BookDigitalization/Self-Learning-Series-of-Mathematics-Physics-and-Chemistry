// 图 9·31（原书 p.267）例 9：插在墙里的直棒（a）及受力图（b）。CeTZ 重绘，墙的斜线阴影仅示意。
// 坐标取自页面显示图，原点 (360,690)。
#import "/common/series.typ": *

#let fig-9-31(width: 12cm) = px-canvas(1030, 400, origin: (360, 690), width: width, (p, u) => {
  import cetz.draw: *
  let arrow(a, b, th: 1.4pt) = line(p(..a), p(..b), stroke: th, mark: (end: "stealth", fill: black, scale: 0.5))
  let lab(x, y, body, size: 9pt) = content(p(x, y), anchor: "center", text(size: size, body))
  // （a）墙
  line(p(712, 725), p(712, 1020), stroke: 2pt)
  rect(p(712, 725), p(746, 1020), stroke: 0.6pt)
  rect(p(746, 820), p(845, 905), stroke: 0.6pt)
  for y in range(735, 1015, step: 14) { line(p(712, y), p(746, y - 14), stroke: 0.4pt) }
  for x in range(750, 845, step: 12) { line(p(x, 905), p(x + 12, 820), stroke: 0.4pt) }
  // 直棒
  rect(p(415, 848), p(810, 873), stroke: 1.2pt, fill: white)
  circle(p(614, 860), radius: 3 * u, fill: black)
  line(p(415, 873), p(415, 985), stroke: 1.2pt)
  rect(p(378, 985), p(452, 1035), stroke: 1pt, fill: luma(200))
  lab(395, 866, $C$); lab(614, 830, $O$); lab(690, 898, $A$); lab(808, 823, $B$); lab(415, 1050, [150], size: 8pt)
  lab(627, 1077, $(a)$)
  // （b）
  line(p(945, 895), p(1335, 893), stroke: 1.6pt)
  arrow((1237, 893), (1237, 737), th: 1.6pt)
  arrow((942, 895), (942, 955), th: 1.6pt)
  arrow((1137, 893), (1137, 955), th: 1.6pt)
  arrow((1335, 893), (1335, 1002), th: 1.6pt)
  for x in (945, 1137, 1237, 1335) { circle(p(x, 894), radius: 3 * u, fill: black) }
  lab(1237, 713, $F_1$); lab(937, 965, [150], size: 8pt); lab(1135, 967, [150], size: 8pt); lab(1335, 1018, $F_2$)
  lab(918, 897, $C$); lab(1137, 872, $O$); lab(1235, 920, $A$); lab(1337, 872, $B$)
  lab(1143, 1052, $(b)$)
})
