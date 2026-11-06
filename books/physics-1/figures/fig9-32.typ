// 图 9·32（原书 p.269）塔式起重机（a），及空载（b）、满载（c）受力图；图 9·33（原书 p.270）受力图。
// CeTZ 重绘：塔身与吊臂的桁架格数为示意，不求与原图一致。坐标取自页面显示图，原点 (430,90)。
#import "/common/series.typ": *

#let _arrow(p, a, b, th: 1.4pt) = cetz.draw.line(p(..a), p(..b), stroke: th, mark: (end: "stealth", fill: black, scale: 0.5))
#let _lab(p, x, y, body, size: 9pt) = cetz.draw.content(p(x, y), anchor: "center", text(size: size, body))
#let _tri(p, x, y) = cetz.draw.line(p(x, y), p(x - 12, y + 22), p(x + 12, y + 22), close: true, stroke: 1pt, fill: white)
#let _dim(p, a, b) = cetz.draw.line(p(..a), p(..b), stroke: 0.7pt, mark: (start: "stealth", end: "stealth", fill: black, scale: 0.35))

#let fig-9-32(width: 11cm) = px-canvas(790, 1200, origin: (430, 90), width: width, (p, u) => {
  import cetz.draw: *
  // （a）塔身
  rect(p(662, 240), p(805, 582), stroke: 1.2pt)
  line(p(662, 240), p(737, 115), p(805, 240), stroke: 1pt)
  for k in range(0, 6) {
    let y0 = 240 + k * 57
    line(p(662, y0), p(805, y0 + 57), stroke: 0.6pt)
    line(p(805, y0), p(662, y0 + 57), stroke: 0.6pt)
    line(p(662, y0), p(805, y0), stroke: 0.8pt)
  }
  // 吊臂（桁架）
  rect(p(442, 262), p(1200, 290), stroke: 1pt)
  for x in range(450, 1190, step: 38) {
    line(p(x, 290), p(x + 19, 262), stroke: 0.6pt)
    line(p(x + 19, 262), p(x + 38, 290), stroke: 0.6pt)
  }
  // 钢索
  line(p(737, 115), p(500, 262), stroke: 1pt)
  line(p(737, 115), p(1182, 262), stroke: 1pt)
  line(p(737, 115), p(737, 240), stroke: 0.6pt)
  // 配重与负荷
  rect(p(470, 228), p(540, 262), stroke: 1pt, fill: luma(225))
  line(p(1163, 290), p(1163, 378), stroke: 1pt)
  rect(p(1135, 378), p(1198, 440), stroke: 1pt)
  _lab(p, 1165, 412, $G$)
  _lab(p, 455, 238, $Q$)
  // 地面
  line(p(445, 583), p(1190, 583), stroke: 1.2pt)
  for x in range(450, 1190, step: 30) { line(p(x, 583), p(x - 14, 598), stroke: 0.6pt) }
  // 重力 W 与重心 O
  _arrow(p, (765, 395), (765, 425))
  _lab(p, 788, 415, $W$); _lab(p, 786, 345, $O$)
  _lab(p, 655, 603, $A$); _lab(p, 820, 603, $B$)
  // 尺寸线
  _dim(p, (500, 308), (660, 308)); _lab(p, 592, 311, [6], size: 8pt)
  _dim(p, (810, 308), (1163, 308)); _lab(p, 980, 311, [12], size: 8pt)
  for x in (660, 737, 765, 805) { line(p(x, 583), p(x, 735), stroke: (thickness: 0.5pt, dash: "dashed")) }
  _dim(p, (737, 640), (765, 640)); _lab(p, 752, 662, [0.5], size: 8pt)
  _dim(p, (660, 715), (737, 715)); _lab(p, 700, 714, [2], size: 8pt)
  _dim(p, (737, 715), (805, 715)); _lab(p, 772, 714, [2], size: 8pt)
  _lab(p, 843, 738, $(a)$)
  // （b）
  line(p(510, 848), p(1190, 850), stroke: 1.6pt)
  _tri(p, 680, 852)
  _arrow(p, (510, 848), (510, 907), th: 1.8pt)
  _arrow(p, (775, 848), (775, 937), th: 1.8pt)
  _lab(p, 680, 828, $A$); _lab(p, 815, 826, $B$); _lab(p, 490, 892, $Q$); _lab(p, 800, 937, $W$)
  _lab(p, 843, 978, $(b)$)
  // （c）
  line(p(513, 1118), p(1180, 1120), stroke: 1.6pt)
  _tri(p, 815, 1122)
  line(p(680, 1114), p(680, 1124), stroke: 1pt)
  _arrow(p, (513, 1120), (513, 1177), th: 1.8pt)
  _arrow(p, (775, 1120), (775, 1217), th: 1.8pt)
  _arrow(p, (1180, 1120), (1180, 1187), th: 1.8pt)
  _lab(p, 680, 1097, $A$); _lab(p, 815, 1097, $B$); _lab(p, 492, 1162, $Q$); _lab(p, 800, 1212, $W$); _lab(p, 1160, 1177, $G$)
  _lab(p, 832, 1253, $(c)$)
})

#let fig-9-33(width: 9.5cm) = px-canvas(720, 320, origin: (480, 1340), width: width, (p, u) => {
  import cetz.draw: *
  line(p(520, 1482), p(1150, 1478), stroke: 1.6pt)
  _tri(p, 672, 1485)
  _tri(p, 818, 1485)
  _arrow(p, (672, 1480), (672, 1385), th: 1.6pt)
  _arrow(p, (818, 1480), (818, 1408), th: 1.6pt)
  _arrow(p, (520, 1482), (520, 1547), th: 1.6pt)
  _arrow(p, (768, 1482), (768, 1597), th: 1.6pt)
  _arrow(p, (1145, 1480), (1145, 1537), th: 1.6pt)
  _lab(p, 672, 1366, $N_2$); _lab(p, 817, 1388, $N_1$)
  _lab(p, 655, 1462, $A$); _lab(p, 770, 1462, $O$); _lab(p, 835, 1462, $B$)
  _lab(p, 520, 1565, $Q$); _lab(p, 772, 1618, $W$); _lab(p, 1143, 1555, $G$)
})
