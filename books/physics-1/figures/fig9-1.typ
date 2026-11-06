// 图 9·1 共点力（原书 p.239）
// 三幅：受 2 个、3 个、4 个共点力的物体。坐标取自页面显示图（原点 (360,480)），示意图不要求精确。
#import "/common/series.typ": *

#let fig-9-1(width: 12cm) = px-canvas(900, 480, origin: (360, 480), width: width, (p, u) => {
  import cetz.draw: *
  let arrow(a, b) = line(p(..a), p(..b), stroke: 1.3pt, mark: (end: "stealth", fill: black, scale: 0.5))
  let lab(x, y, body) = content(p(x, y), anchor: "center", text(size: 9pt, body))
  let dot(c) = circle(p(..c), radius: 4 * u, stroke: 0.6pt, fill: white)
  // （1）
  catmull(p(450, 605), p(520, 625), p(550, 690), p(552, 790), p(520, 840), p(470, 850), p(410, 835), p(385, 790), p(368, 720), p(400, 650), close: true, tension: 0.5, stroke: 0.8pt)
  arrow((458, 722), (565, 600))
  arrow((458, 722), (470, 935))
  dot((458, 722))
  lab(588, 580, $F_1$)
  lab(465, 950, $F_2$)
  // （2）
  catmull(p(720, 600), p(800, 600), p(850, 680), p(855, 770), p(820, 820), p(760, 825), p(700, 790), p(660, 720), p(680, 650), close: true, tension: 0.5, stroke: 0.8pt)
  arrow((760, 708), (830, 555))
  arrow((760, 708), (612, 714))
  arrow((760, 708), (878, 870))
  dot((760, 708))
  lab(838, 522, $F_1$)
  lab(576, 714, $F_2$)
  lab(892, 892, $F_3$)
  // （3）
  catmull(p(1010, 580), p(1090, 570), p(1150, 640), p(1160, 740), p(1115, 800), p(1050, 805), p(985, 760), p(960, 690), p(985, 620), close: true, tension: 0.5, stroke: 0.8pt)
  arrow((1060, 688), (1140, 530))
  arrow((1060, 688), (1198, 632))
  arrow((1060, 688), (1205, 868))
  arrow((1060, 688), (912, 752))
  dot((1060, 688))
  lab(1142, 497, $F_4$)
  lab(1225, 628, $F_3$)
  lab(1215, 892, $F_2$)
  lab(878, 765, $F_1$)
})
