// 图 2·1 瞬时电流、图 2·2 持续电流（原书 p.78）、图 2·3 电流的方向（原书 p.80）
// 示意图，CeTZ 重绘。坐标是原页 130 dpi 渲染图（宽 1068）的像素坐标。
// 导体球原图是点状阴影，这里用浅灰填充代替；电子符号（圆圈里一个负号）画成 ⊖。
#import "/common/series.typ": *

// 带标记的导体球
#let ball(p, x, y, r, label) = {
  import cetz.draw: *
  circle(p(x, y), radius: r, fill: luma(210), stroke: 1.1pt)
  if label != none {
    content(p(x, y), anchor: "center", text(size: 8.5pt, label))
  }
}
// 球里的 + / − 号：白底圆里画符号
#let ball-sign(p, x, y, r, sign) = {
  import cetz.draw: *
  circle(p(x, y), radius: r, fill: luma(215), stroke: 1.1pt)
  circle(p(x, y), radius: r * 0.55, fill: white, stroke: 0.9pt)
  line(p(x - r * 0.3, y), p(x + r * 0.3, y), stroke: 1pt)
  if sign == "+" { line(p(x, y - r * 0.3), p(x, y + r * 0.3), stroke: 1pt) }
}
// 电子符号 ⊖
#let elec(p, x, y, r: 11) = {
  import cetz.draw: *
  circle(p(x, y), radius: r, fill: white, stroke: 1pt)
  line(p(x - r * 0.55, y), p(x + r * 0.55, y), stroke: 1pt)
}
#let earth(p, x, y) = {
  import cetz.draw: *
  line(p(x - 13, y), p(x + 13, y), stroke: 1pt)
  line(p(x - 9, y + 6), p(x + 9, y + 6), stroke: 1pt)
  line(p(x - 5, y + 12), p(x + 5, y + 12), stroke: 1pt)
}
#let arr(p, a, b) = {
  import cetz.draw: *
  line(p(a.at(0), a.at(1)), p(b.at(0), b.at(1)), stroke: 1pt, mark: (end: "stealth", fill: black, scale: 0.45))
}

#let fig-2-1(width: 6cm) = px-canvas(340, 330, origin: (100, 960), width: width, (p, u) => {
  import cetz.draw: *
  // 上左：正电球接地
  line(p(176, 1005), p(205, 1005), p(205, 1085), stroke: 1pt)
  ball-sign(p, 150, 1010, 28, "+")
  earth(p, 205, 1085)
  arr(p, (222, 1036), (222, 1012))
  elec(p, 222, 1048)
  // 上右：负电球接地
  line(p(384, 1002), p(412, 1002), p(412, 1085), stroke: 1pt)
  ball-sign(p, 358, 1006, 28, "-")
  earth(p, 412, 1085)
  elec(p, 415, 1030)
  arr(p, (417, 1043), (417, 1064))
  // 下：两个电势不等的导体用导线连接
  bezier(p(188, 1195), p(346, 1192), p(215, 1172), p(320, 1168), stroke: 1pt)
  ball(p, 168, 1222, 30, $U_1$)
  ball(p, 362, 1217, 30, $U_2$)
  arr(p, (268, 1155), (232, 1155))
  elec(p, 276, 1153)
  content(p(268, 1250), anchor: "center", text(size: 8.5pt, $U_1 > U_2$))
})

#let fig-2-2(width: 7cm) = px-canvas(360, 300, origin: (530, 960), width: width, (p, u) => {
  import cetz.draw: *
  // 回路（椭圆），下端被电源 C 遮住
  circle(p(695, 1115), radius: (115, 108), stroke: 1pt)
  ball(p, 581, 1087, 40, $A$)
  ball(p, 809, 1087, 40, $B$)
  content(p(584, 1043), anchor: "center", text(size: 8pt, $U_1$))
  content(p(816, 1040), anchor: "center", text(size: 8pt, $U_2$))
  // 电源 C：斜线填充的方块
  rect(p(662, 1198), p(736, 1242), fill: luma(220), stroke: 1pt)
  content(p(699, 1220), anchor: "center", text(size: 8.5pt, $C$))
  content(p(700, 1163), anchor: "center", text(size: 8.5pt, $U_1 > U_2$))
  // 自由电子的流动方向
  arr(p, (722, 1004), (668, 1004))
  elec(p, 736, 1001)
  elec(p, 578, 1181)
  arr(p, (590, 1196), (622, 1218))
  elec(p, 765, 1224)
  arr(p, (780, 1214), (806, 1190))
})

#let fig-2-3(width: 6cm) = px-canvas(340, 280, origin: (95, 540), width: width, (p, u) => {
  import cetz.draw: *
  circle(p(257, 667), radius: (113, 101), stroke: 1pt)
  ball(p, 143, 640, 40, $A$)
  ball(p, 370, 640, 40, $B$)
  content(p(140, 588), anchor: "center", text(size: 8pt, $U_1$))
  content(p(373, 585), anchor: "center", text(size: 8pt, $U_2$))
  rect(p(222, 746), p(296, 790), fill: luma(220), stroke: 1pt)
  content(p(259, 768), anchor: "center", text(size: 8.5pt, $C$))
  content(p(258, 716), anchor: "center", text(size: 8.5pt, $U_1 > U_2$))
  content(p(262, 546), anchor: "center", text(size: 8pt, $I$))
  // 电流方向的箭头
  arr(p, (248, 566), (275, 566))
  arr(p, (352, 722), (362, 742))
  arr(p, (186, 748), (176, 728))
})
