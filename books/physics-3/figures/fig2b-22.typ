// 图 2·22、2·24–2·29（§2·5 有关部分电路的讨论；原书 p.103、107、109、112、114）
// CeTZ 重绘；坐标是原书页面（110 dpi 渲染）的像素坐标，各图的画布范围写在 px-canvas 参数里。
#import "/common/series.typ": *
#import "fig2b-lib.typ": *

// 图 2·22 串联导体组（p.103）
#let fig-2-22(width: pxw(405)) = px-canvas(405, 117, origin: (385, 1058), width: width, (p, u) => {
  import cetz.draw: *
  set-style(stroke: 0.8pt)
  let y = 1081
  line(p(393, y), p(441, y))
  resistor(p(441, y), p(579, y), zl: 40, amp: 4, teeth: 5, at: 0.47)
  resistor(p(579, y), p(738, y), zl: 77, amp: 4, teeth: 8, at: 0.525)
  arrow(p(738, y), p(779, y))
  for x in (441, 579, 738) { node(p(x, y)) }
  line(p(441, y), p(441, 1166), stroke: 0.6pt)
  line(p(579, y), p(579, 1118), stroke: 0.6pt)
  line(p(738, y), p(738, 1162), stroke: 0.6pt)
  dim(p(441, 1115), p(579, 1115), body: $V_1$)
  dim(p(579, 1115), p(738, 1115), body: $V_2$)
  dim(p(441, 1154), p(738, 1154), body: $V$)
  lb(p(441, 1070), $A$)
  lb(p(579, 1070), $B$)
  lb(p(738, 1070), $C$)
  lb(p(506, 1067), $R_1$)
  lb(p(662, 1067), $R_2$)
  lb(p(418, 1091), $I$)
  lb(p(760, 1090), $I$)
})

// 图 2·24 并联导体组（p.107）
#let fig-2-24(width: pxw(330)) = px-canvas(330, 168, origin: (470, 522), width: width, (p, u) => {
  import cetz.draw: *
  set-style(stroke: 0.8pt)
  let A = (534.6, 588)
  let B = (738, 587)
  line(p(479, 588), p(A.at(0) - 4, 588), mark: (end: ">", fill: black, scale: 0.5))
  line(p(..B), p(795, 587))
  line(p(..A), p(574, 556))
  resistor(p(574, 556), p(697, 556), zl: 66, amp: 5, teeth: 6)
  line(p(697, 556), p(..B))
  line(p(..A), p(578, 621))
  resistor(p(578, 621), p(699, 621), zl: 70, amp: 5, teeth: 6)
  line(p(699, 621), p(..B))
  mid-arrow(p(..A), p(574, 556), t: 0.6, len: 7)
  mid-arrow(p(..A), p(578, 621), t: 0.6, len: 7)
  node(p(..A), r: 4)
  node(p(..B), r: 4)
  line(p(536, 588), p(536, 676), stroke: 0.6pt)
  line(p(739, 587), p(739, 676), stroke: 0.6pt)
  dim(p(536, 662), p(739, 662), body: $V$)
  lb(p(493, 573), $I$)
  lb(p(527, 577), $A$)
  lb(p(551, 553), $I_1$)
  lb(p(567, 598), $I_2$)
  lb(p(632, 536), $R_1$)
  lb(p(634, 603), $R_2$)
  lb(p(748, 572), $B$)
})

// 图 2·25 例 3 附图（一）（p.109）
#let fig-2-25(width: pxw(295)) = px-canvas(295, 215, origin: (110, 590), width: width, (p, u) => {
  import cetz.draw: *
  set-style(stroke: 0.8pt)
  // 电源两根引线（粗）
  line(p(132, 596), p(132, 662), stroke: 2.2pt)
  line(p(173, 596), p(173, 661), stroke: 2.2pt)
  // 上方导线 B…H…G…F
  line(p(173, 661), p(393, 658))
  // 下方导线 A…C…D…E
  line(p(132, 662), p(132, 698), p(332, 695))
  arrow(p(132, 698), p(158, 698))
  // 三盏弧光灯
  let ys = 761
  for (cx, lx, rx, ex, hx) in ((225, 191, 246, 191, 246), (294, 265, 319, 265, 319), (363, 332, 393, 332, 393)) {
    line(p(lx, 698), p(lx, ys), p(cx - 20, ys))
    line(p(rx, 659), p(rx, ys), p(cx + 20, ys))
    lamp(p(cx, ys), r: 20)
  }
  for (x, y) in ((132, 662), (173, 661), (246, 660), (319, 659), (393, 658), (191, 698), (265, 697), (332, 695)) { node(p(x, y)) }
  lb(p(122, 659), $A$, anchor: "east")
  lb(p(161, 660), $B$, anchor: "east")
  lb(p(246, 648), $H$)
  lb(p(319, 646), $G$)
  lb(p(393, 644), $F$)
  lb(p(191, 685), $C$)
  lb(p(263, 685), $D$)
  lb(p(334, 683), $E$)
  lb(p(154, 712), $I$)
  lb(p(225, 790), $R_1$)
  lb(p(294, 791), $R_2$)
  lb(p(363, 790), $R_3$)
})

// 图 2·26 例 3 附图（二）（p.109）
#let fig-2-26(width: pxw(330)) = px-canvas(330, 195, origin: (475, 595), width: width, (p, u) => {
  import cetz.draw: *
  set-style(stroke: 0.8pt)
  let A = (533, 675)
  let B = (749, 675)
  line(p(481, 675), p(A.at(0) - 4, 675), mark: (end: ">", fill: black, scale: 0.5))
  line(p(..B), p(799, 675), mark: (end: ">", fill: black, scale: 0.5))
  line(p(..A), p(576, 621))
  resistor(p(576, 621), p(704, 621), zl: 52, amp: 6, teeth: 6)
  line(p(704, 621), p(..B))
  resistor(p(..A), p(..B), zl: 58, amp: 6, teeth: 6, at: 0.5)
  line(p(..A), p(579, 726))
  resistor(p(579, 726), p(707, 726), zl: 55, amp: 6, teeth: 6)
  line(p(707, 726), p(..B))
  mid-arrow(p(..A), p(576, 621), t: 0.6, len: 7)
  mid-arrow(p(..A), p(579, 726), t: 0.6, len: 7)
  mid-arrow(p(..A), p(600, 675), t: 0.9, len: 8)
  node(p(..A), r: 4)
  node(p(..B), r: 4)
  line(p(533, 675), p(533, 781), stroke: 0.6pt)
  line(p(749, 675), p(749, 781), stroke: 0.6pt)
  dim(p(533, 764), p(749, 764), body: $V$)
  lb(p(502, 690), $I$)
  lb(p(527, 662), $A$)
  lb(p(566, 654), $I_1$)
  lb(p(570, 686), $I_2$)
  lb(p(548, 713), $I_3$)
  lb(p(640, 604), $R_1$)
  lb(p(640, 656), $R_2$)
  lb(p(640, 707), $R_3$)
  lb(p(757, 656), $B$)
})

// 图 2·27 例 4 附图（一）（p.112）
#let fig-2-27(width: pxw(200)) = px-canvas(200, 190, origin: (110, 440), width: width, (p, u) => {
  import cetz.draw: *
  set-style(stroke: 1.2pt)
  line(p(128, 453), p(288, 454), p(288, 614), p(128, 613), close: true)
  line(p(128, 453), p(288, 614))
  lb(p(122, 450), $A$, anchor: "east")
  lb(p(296, 456), $D$, anchor: "west")
  lb(p(120, 616), $B$, anchor: "east")
  lb(p(296, 617), $C$, anchor: "west")
})

// 图 2·28 例 4 附图（二）（p.112）
#let fig-2-28(width: pxw(445)) = px-canvas(445, 153, origin: (345, 462), width: width, (p, u) => {
  import cetz.draw: *
  set-style(stroke: 0.8pt)
  let A = (395, 491)
  let D = (742, 490)
  let C = (632, 539)
  // 第一分路 A–D（2 欧姆）
  line(p(351, 491), p(..A))
  line(p(..A), p(..D))
  resistor(p(..A), p(..D), zl: 58, amp: 5, teeth: 6, at: 0.47)
  line(p(..D), p(783, 490), mark: (end: ">", fill: black, scale: 0.5))
  // 进入 A 的箭头
  line(p(360, 491), p(383, 491), mark: (end: ">", fill: black, scale: 0.5))
  line(p(412, 491), p(432, 491), mark: (end: ">", fill: black, scale: 0.5))
  line(p(686, 491), p(706, 491), mark: (end: ">", fill: black, scale: 0.5))
  // 第二分路：A–（2√2 欧姆）–C–（2 欧姆）–D
  line(p(..A), p(395, 540))
  mid-arrow(p(395, 491), p(395, 540), t: 0.55, len: 9)
  line(p(395, 540), p(..C))
  resistor(p(395, 540), p(..C), zl: 85, amp: 5, teeth: 9, at: 0.55)
  line(p(432, 540), p(445, 540), mark: (end: ">", fill: black, scale: 0.5))
  resistor(p(..C), p(744, 540), zl: 58, amp: 5, teeth: 6, at: 0.5)
  line(p(744, 540), p(..D))
  mid-arrow(p(744, 540), p(744, 491), t: 0.55, len: 9)
  // 第三分路：A–（2 欧姆）–B–（2 欧姆）–C
  line(p(395, 540), p(395, 590))
  resistor(p(395, 590), p(515, 590), zl: 62, amp: 5, teeth: 6, at: 0.5)
  resistor(p(515, 590), p(632, 590), zl: 60, amp: 5, teeth: 6, at: 0.5)
  line(p(632, 590), p(..C))
  line(p(412, 590), p(430, 590), mark: (end: ">", fill: black, scale: 0.5))
  for pt in (A, D, C, (395, 540), (515, 590)) { node(p(..pt), r: 3.2) }
  lb(p(368, 476), $I$)
  lb(p(396, 474), $A$, anchor: "east")
  lb(p(429, 478), $I_1$)
  lb(p(384, 517), $I_2$)
  lb(p(435, 528), $i_1$)
  lb(p(413, 573), $i_2$)
  lb(p(563, 472), [2 欧姆], size: 7.5pt)
  lb(p(517, 525), [$2 sqrt(2)$ 欧姆], size: 7.5pt)
  lb(p(691, 521), [2 欧姆], size: 7.5pt)
  lb(p(463, 573), [2 欧姆], size: 7.5pt)
  lb(p(574, 573), [2 欧姆], size: 7.5pt)
  lb(p(517, 604), $B$)
  lb(p(632, 525), $C$)
  lb(p(740, 474), $D$)
  lb(p(713, 477), $I_1$)
  lb(p(762, 474), $I$)
  lb(p(756, 512), $I_2$)
})

// 图 2·29 例 5 附图（p.114）
#let fig-2-29(width: pxw(445)) = px-canvas(445, 225, origin: (225, 797), width: width, (p, u) => {
  import cetz.draw: *
  set-style(stroke: 0.9pt)
  let xs = (461, 522, 583)
  // 左侧、上、下的导线
  line(p(237, 827), p(522, 827), p(522, 851))
  line(p(237, 827), p(237, 1003), p(522, 1003), p(522, 978))
  // 电压箭头与文字
  arrow(p(237, 996), p(237, 858), stroke: 1.4pt)
  lb(p(238, 912), box(fill: white, inset: (y: 1pt), std.rotate(-90deg, reflow: true, text(size: 8pt)[110 伏特])), size: 8pt)
  // 上、下汇流线
  line(p(461, 851), p(583, 851))
  line(p(461, 978), p(583, 978))
  for x in xs {
    // 刀闸：上面一段导线、断开的刀片、下面到电炉
    line(p(x, 851), p(x, 869))
    line(p(x, 899), p(x + 20, 874))
    line(p(x + 20, 874), p(x + 23, 871))
    line(p(x, 899), p(x, 920))
    furnace(p(x, 938), r: 18)
    line(p(x, 956), p(x, 978))
  }
  node(p(522, 851), r: 3.5)
  node(p(522, 978), r: 3.5)
  node(p(237, 827), r: 3.5)
  lb(p(233, 815), $A$, anchor: "east")
  lb(p(532, 840), $C$, anchor: "west")
  lb(p(533, 990), $D$, anchor: "west")
  lb(p(233, 1015), $B$, anchor: "east")
  lb(p(378, 816), [1 欧姆], size: 7.5pt)
  lb(p(378, 993), [1 欧姆], size: 7.5pt)
  lb(p(609, 936), [27 欧姆], anchor: "west", size: 7.5pt)
})

// 图 2·23 例 2 附图（p.105）
#let fig-2-23(width: pxw(320)) = px-canvas(320, 235, origin: (470, 470), width: width, (p, u) => {
  import cetz.draw: *
  set-style(stroke: 1pt)
  line(p(590, 482), p(590, 540), stroke: 2.2pt)
  line(p(628, 485), p(628, 538), stroke: 2.2pt)
  line(p(590, 540), p(484, 540))
  mid-arrow(p(590, 540), p(484, 540), t: 0.55, len: 9)
  resistor(p(484, 540), p(484, 673), zl: 58, amp: 5, teeth: 6, at: 0.53)
  line(p(484, 673), p(530, 673))
  resistor(p(484, 673), p(612, 673), zl: 80, amp: 5, teeth: 8, at: 0.67)
  line(p(578, 642), p(578, 672))
  line(p(578, 642), p(646, 642))
  lamp(p(672, 642), r: 26)
  line(p(698, 642), p(764, 642))
  resistor(p(764, 642), p(764, 538), zl: 70, amp: 5, teeth: 7, at: 0.5)
  line(p(764, 538), p(628, 538))
  for pt in ((590, 540), (628, 538), (484, 673), (578, 642), (764, 642)) { node(p(..pt), r: 3.6) }
  lb(p(588, 553), $A$, anchor: "east")
  lb(p(632, 553), $E$, anchor: "west")
  lb(p(479, 689), $B$, anchor: "east")
  lb(p(578, 629), $C$)
  lb(p(773, 656), $D$, anchor: "west")
  lb(p(535, 527), $I$)
  lb(p(492, 600), [0.5 欧姆], size: 7.5pt, anchor: "west")
  lb(p(752, 598), [0.5 欧姆], size: 7.5pt, anchor: "east")
  lb(p(580, 691), [2.5 欧姆], size: 7.5pt)
  lb(p(672, 681), [1.5 欧姆], size: 7.5pt)
})
