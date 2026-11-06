// 单元检查题（第 11～13 章）附图（原书 p.471–473）：第 3、7、8、10、11、12 题。
// 线条图，按原图重绘；坐标是页面显示图（宽 1568）上的像素坐标，位置为目测，曲线为示意。
#import "/common/series.typ": *

#let arr5 = (end: "stealth", fill: black, scale: 0.5)
#let dsh = (thickness: 0.8pt, dash: "dashed")

// 第 3 题：斜面上的 A 与自由下落的 B
#let fig-u-3(width: 8cm) = px-canvas(500, 330, origin: (900, 1000), width: width, (p, u) => {
  import cetz.draw: *
  let lab(x, y, body) = content(p(x, y), anchor: "center", text(size: 8pt, body))
  line(p(910, 1232), p(1385, 1232), stroke: 1.4pt)
  for k in range(0, 24) {
    let x = 920 + k * 20
    line(p(x, 1233), p(x - 10, 1246), stroke: 0.5pt)
  }
  line(p(940, 1230), p(1318, 1050), stroke: 1.4pt)
  line(p(1330, 1050), p(1330, 1230), stroke: 1.8pt)
  line(p(1318, 1050), p(1330, 1050), stroke: 1.4pt)
  arc(p(1005, 1230), start: 0deg, stop: 25deg, radius: 65 * u, stroke: 0.7pt)
  lab(1032, 1216, $alpha$)
  // A
  rect(p(1285, 1052), p(1315, 1078), stroke: 1pt, fill: white)
  line(p(1292, 1080), p(1250, 1096), stroke: 1.4pt, mark: arr5)
  lab(1310, 1028, $A$)
  // B
  rect(p(1355, 1043), p(1388, 1075), stroke: 1pt, fill: white)
  line(p(1371, 1078), p(1371, 1108), stroke: 1.4pt, mark: arr5)
  lab(1380, 1022, $B$)
})

// 第 7 题：单摆与水平钢板
#let fig-u-7(width: 7cm) = px-canvas(430, 280, origin: (340, 600), width: width, (p, u) => {
  import cetz.draw: *
  let lab(x, y, body) = content(p(x, y), anchor: "center", text(size: 9pt, body))
  line(p(385, 638), p(668, 638), stroke: 1.2pt)
  circle(p(680, 638), radius: 10 * u, fill: white, stroke: 1.2pt)
  line(p(385, 640), p(632, 770), stroke: dsh)
  circle(p(640, 775), radius: 10 * u, fill: white, stroke: 1.2pt)
  line(p(358, 640), p(358, 790), stroke: 1.4pt)
  rect(p(345, 788), p(748, 800), stroke: 1.2pt, fill: luma(200))
  arc(p(385 + 80, 638), start: 0deg, stop: -25deg, radius: 80 * u, stroke: 0.7pt)
  lab(383, 612, $O$)
  lab(531, 622, $l$)
  lab(378, 720, $display(1 / 2) l$)
  lab(462, 655, $alpha$)
})

// 第 8 题：光滑平面上的劈与小球
#let fig-u-8(width: 8cm) = px-canvas(530, 340, origin: (830, 550), width: width, (p, u) => {
  import cetz.draw: *
  let lab(x, y, body) = content(p(x, y), anchor: "center", text(size: 9pt, body))
  line(p(838, 775), p(1310, 775), stroke: 1.4pt)
  for k in range(0, 24) {
    let x = 850 + k * 20
    line(p(x, 776), p(x - 10, 790), stroke: 0.5pt)
  }
  line(p(935, 775), p(1232, 567), p(1232, 775), close: true, stroke: 1.8pt)
  circle(p(938, 677), radius: 5 * u, fill: white, stroke: 1pt)
  line(p(945, 677), p(1030, 677), stroke: 1.4pt, mark: arr5)
  line(p(1075, 652), p(1075, 572), stroke: dsh, mark: arr5)
  line(p(1232, 680), p(1335, 680), stroke: 1.8pt, mark: arr5)
  lab(940, 655, $m$)
  lab(1005, 655, $v_1$)
  lab(1135, 713, $M$)
  lab(1092, 572, $v_1'$)
  lab(1318, 658, $v$)
})

// 第 10 题：转盘边缘悬挂的小球
#let fig-u-10(width: 7.4cm) = px-canvas(460, 280, origin: (900, 1480), width: width, (p, u) => {
  import cetz.draw: *
  let lab(x, y, body) = content(p(x, y), anchor: "center", text(size: 9pt, body))
  rect(p(915, 1558), p(1225, 1572), stroke: 1.4pt, fill: luma(210))
  line(p(1068, 1572), p(1068, 1690), stroke: 2.2pt)
  line(p(1225, 1500), p(1225, 1700), stroke: dsh)
  line(p(1068, 1500), p(1068, 1558), stroke: 0.6pt)
  line(p(1068, 1510), p(1225, 1510), stroke: 0.8pt, mark: (start: "stealth", end: "stealth", fill: black, scale: 0.4))
  line(p(1225, 1572), p(1335, 1665), stroke: 1.4pt)
  circle(p(1335, 1665), radius: 6 * u, fill: black)
  arc(p(1030, 1625), start: 150deg, stop: 330deg, radius: 45 * u, stroke: 0.9pt, mark: (end: "stealth", fill: black, scale: 0.4))
  lab(1145, 1497, $d$)
  lab(1085, 1672, $omega$)
  lab(1242, 1610, $alpha$)
  lab(1300, 1605, $l$)
})

// 第 11 题：三个四分之一圆槽
#let fig-u-11(width: 9.6cm) = px-canvas(660, 590, origin: (370, 470), width: width, (p, u) => {
  import cetz.draw: *
  let lab(x, y, body) = content(p(x, y), anchor: "center", text(size: 9pt, body))
  let (cx, cy) = (645, 495)
  for r in (85, 168, 253) {
    line(..range(0, 19).map(k => {
      let t = 180 + k * 5.0
      p(cx + r * calc.cos(t * 1deg), cy - r * calc.sin(t * 1deg))
    }), stroke: 1.6pt)
  }
  line(p(385, 495), p(cx, 495), stroke: dsh)
  line(p(cx, 495), p(cx, 1000), stroke: 2pt)
  line(p(cx, 1000), p(1020, 1000), stroke: 2pt)
  for (y, n) in ((580, "A'"), (663, "B'"), (748, "C'")) {
    line(p(cx, y), p(695, y), stroke: 1.2pt, mark: arr5)
  }
  line(..range(0, 29).map(k => {
    let x = 650 + k * 9.3
    p(x, 580 + 0.0062 * calc.pow(x - 650, 2))
  }), stroke: (thickness: 1pt, dash: "dashed"))
  lab(378, 490, $C$)
  lab(460, 492, $B$)
  lab(545, 492, $A$)
  lab(658, 483, $O'$)
  lab(625, 598, $A'$)
  lab(625, 682, $B'$)
  lab(620, 772, $C'$)
  lab(680, 553, $v_1$)
  lab(680, 640, $v_2$)
  lab(680, 722, $v_3$)
  lab(637, 1045, $O$)
})

// 第 12 题：光滑水平平板 P、小球与重物 M
#let fig-u-12(width: 7.4cm) = px-canvas(430, 360, origin: (980, 680), width: width, (p, u) => {
  import cetz.draw: *
  let lab(x, y, body) = content(p(x, y), anchor: "center", text(size: 9pt, body))
  line(p(1110, 692), p(1405, 693), p(1290, 868), p(988, 866), close: true, stroke: 1.6pt)
  circle(p(1210, 790), radius: (105 * u, 38 * u), stroke: dsh)
  line(p(1197, 790), p(1197, 910), stroke: 3pt)
  line(p(1197, 910), p(1197, 962), stroke: 1pt)
  rect(p(1165, 962), p(1228, 1025), stroke: 1.8pt, fill: white)
  line(p(1197, 790), p(1300, 755), stroke: 1.4pt, mark: arr5)
  circle(p(1305, 755), radius: 5 * u, fill: black)
  lab(1060, 826, $P$)
  lab(1228, 750, $R$)
  lab(1322, 742, $m$)
  lab(1248, 995, $M$)
})
