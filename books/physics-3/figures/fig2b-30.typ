// 图 2·30–2·38（§2·6、§2·7 电源、电动势、全电路；原书 p.118–136）
// CeTZ 重绘；坐标是原书页面（110 dpi 渲染）的像素坐标。
#import "/common/series.typ": *
#import "fig2b-lib.typ": *

// 斜线阴影的电极（矩形内 45° 斜线）
#let hatch(p, x0, y0, x1, y1, step: 7) = {
  import cetz.draw: *
  rect(p(x0, y0), p(x1, y1), stroke: 1.4pt, fill: white)
  let h = y1 - y0
  let k = x0 - h
  while k < x1 {
    let (sx0, sy0, sx1, sy1) = (k, y1, k + h, y0)
    let t0 = if sx0 < x0 { (x0 - sx0) / (sx1 - sx0) } else { 0.0 }
    let t1 = if sx1 > x1 { (x1 - sx0) / (sx1 - sx0) } else { 1.0 }
    if t0 < t1 {
      line(p(sx0 + (sx1 - sx0) * t0, sy0 + (sy1 - sy0) * t0), p(sx0 + (sx1 - sx0) * t1, sy0 + (sy1 - sy0) * t1), stroke: 0.6pt)
    }
    k += step
  }
}
// 圈内一个减号加箭头：表示电子流动方向
#let electron-arrow(p, cx, cy, x2) = {
  import cetz.draw: *
  circle(p(cx, cy), radius: 8, fill: white)
  line(p(cx - 4.5, cy), p(cx + 4.5, cy))
  arrow(p(cx + 10, cy), p(x2, cy), stroke: 1.6pt)
}
#let plus-sign(pt) = lb(pt, text(weight: "bold")[+], size: 10pt)
#let minus-sign(pt) = lb(pt, text(weight: "bold")[#sym.dash.en], size: 10pt)

// 图 2·30 电池电源图（p.118）
#let fig-2-30(width: pxw(310)) = px-canvas(310, 137, origin: (90, 698), width: width, (p, u) => {
  import cetz.draw: *
  set-style(stroke: 1pt)
  line(p(100, 803), p(100, 724))
  resistor(p(100, 724), p(390.5, 724), zl: 118, amp: 5, teeth: 8, at: 0.494)
  line(p(390.5, 724), p(390.5, 803))
  cell(p(100, 803), p(390.5, 803), at: 0.4355, gap: 6, long: 27, short: 10)
  mid-arrow(p(100, 803), p(100, 724), t: 0.55, len: 8)
  lb(p(245.6, 706), $R$)
  lb(p(112, 770), $I$)
  plus-sign(p(207.6, 792))
  minus-sign(p(243, 791))
  electron-arrow(p, 271.6, 818, 316)
})

// 图 2·31 发电机电源图（p.118）
#let fig-2-31(width: pxw(315)) = px-canvas(315, 150, origin: (455, 685), width: width, (p, u) => {
  import cetz.draw: *
  set-style(stroke: 1pt)
  line(p(464.6, 800.6), p(464.6, 713))
  resistor(p(464.6, 713), p(754.7, 713), zl: 118, amp: 5, teeth: 8, at: 0.488)
  line(p(754.7, 713), p(754.7, 800.6))
  line(p(464.6, 800.6), p(575, 800.6))
  line(p(621, 800.6), p(754.7, 800.6))
  circle(p(596, 800.6), radius: 17, fill: white)
  line(p(575, 800.6), p(607, 774))
  line(p(586, 827), p(621, 800.6))
  lb(p(596, 802), $G$)
  mid-arrow(p(464.6, 800.6), p(464.6, 713), t: 0.55, len: 8)
  lb(p(606, 700), $R$)
  lb(p(475, 770), $I$)
  plus-sign(p(562, 790))
  minus-sign(p(635, 791))
  electron-arrow(p, 667.7, 821, 707)
})

// 图 2·32 电源示意图（p.119）
#let fig-2-32(width: pxw(213)) = px-canvas(213, 150, origin: (562, 1030), width: width, (p, u) => {
  import cetz.draw: *
  hatch(p, 569, 1054, 601, 1172)
  hatch(p, 735, 1054, 769, 1172)
  line(p(601, 1071), p(735, 1071), stroke: 1.4pt)
  line(p(601, 1172), p(735, 1172), stroke: 1.4pt)
  circle(p(689.6, 1121), radius: 8, fill: white)
  line(p(685.5, 1121), p(693.7, 1121))
  line(p(689.6, 1117), p(689.6, 1125))
  line(p(681, 1121), p(637, 1121), mark: (end: ">", fill: black, scale: 0.5))
  plus-sign(p(581.5, 1041))
  minus-sign(p(750.5, 1043))
  lb(p(585, 1115), $A$, bg: true)
  lb(p(753, 1115), $B$, bg: true)
})

// 图 2·33 闭合电路图（p.123）
#let fig-2-33(width: pxw(295)) = px-canvas(295, 220, origin: (500, 180), width: width, (p, u) => {
  import cetz.draw: *
  set-style(stroke: 1pt)
  line(p(509, 326), p(509, 188))
  resistor(p(509, 188), p(786, 188), zl: 114, amp: 5, teeth: 8, at: 0.486)
  line(p(786, 188), p(786, 327))
  line(p(509, 326), p(603, 326))
  line(p(698, 327), p(786, 327))
  hatch(p, 603, 320, 622, 393)
  hatch(p, 680, 320, 698, 393)
  line(p(622, 334), p(680, 334), stroke: 0.8pt)
  line(p(622, 393), p(680, 393), stroke: 1.4pt)
  mid-arrow(p(509, 326), p(509, 188), t: 0.5, len: 8)
  mid-arrow(p(786, 188), p(786, 327), t: 0.42, len: 8)
  line(p(665, 360), p(637, 360), mark: (end: ">", fill: black, scale: 0.5))
  lb(p(648, 204), $R$)
  lb(p(518, 261), $I$, anchor: "west")
  lb(p(778, 251), $I$, anchor: "east")
  plus-sign(p(610, 307))
  minus-sign(p(689, 306))
  lb(p(653, 309), $r$)
  lb(p(591, 358), $U_1$)
  lb(p(716, 358), $U_2$)
  lb(p(651, 374), $I$)
})

// 图 2·34 例 7 附图（p.126）
#let fig-2-34(width: pxw(335)) = px-canvas(335, 155, origin: (245, 455), width: width, (p, u) => {
  import cetz.draw: *
  set-style(stroke: 1pt)
  let A = (392, 497.8)
  let B = (527.6, 497.8)
  // 左上：1.8 欧姆，到 A
  line(p(252.6, 603.3), p(252.6, 497.8))
  resistor(p(252.6, 497.8), p(..A), zl: 85, amp: 5, teeth: 9, at: 0.515)
  // 并联部分
  line(p(392, 463), p(392, 537.4))
  resistor(p(392, 463), p(527.6, 463), zl: 82, amp: 5, teeth: 8, at: 0.5)
  resistor(p(392, 537.4), p(527.6, 537.4), zl: 85, amp: 5, teeth: 9, at: 0.49)
  line(p(527.6, 463), p(527.6, 537.4))
  line(p(..B), p(574.5, 497.8), p(574.5, 603.3))
  // 电池组
  cellpack(p(574.5, 603.3), p(252.6, 603.3), left: (0.382,), right: (0.532,), gap: 7, long: 18, short: 10)
  mid-arrow(p(252.6, 603.3), p(252.6, 497.8), t: 0.5, len: 8)
  mid-arrow(p(392, 497.8), p(392, 463), t: 0.6, len: 8)
  mid-arrow(p(392, 497.8), p(392, 537.4), t: 0.7, len: 8)
  node(p(..A), r: 4)
  node(p(..B), r: 4)
  lb(p(331, 477), [1.8 欧姆], size: 7.5pt)
  lb(p(462, 481), [2 欧姆], size: 7.5pt)
  lb(p(456, 521), [3 欧姆], size: 7.5pt)
  lb(p(262, 558), $I$, anchor: "west")
  lb(p(404, 478), $I_1$, anchor: "west")
  lb(p(404, 517), $I_2$, anchor: "west")
  lb(p(381, 509), $A$, anchor: "east")
  lb(p(536, 508), $B$, anchor: "west")
  lb(p(395, 576), $cal(E), r$)
})

// 图 2·35 串联电池组（p.130）
#let fig-2-35(width: pxw(335)) = px-canvas(335, 162, origin: (85, 528), width: width, (p, u) => {
  import cetz.draw: *
  set-style(stroke: 1pt)
  line(p(93.5, 650), p(93.5, 537))
  resistor(p(93.5, 537), p(404.5, 537), zl: 119, amp: 5, teeth: 9, at: 0.495)
  line(p(404.5, 537), p(404.5, 650))
  cellpack(p(93.5, 650), p(404.5, 650), left: (0.219, 0.291), right: (0.702, 0.763), gap: 7, long: 18, short: 10)
  mid-arrow(p(93.5, 650), p(93.5, 537), t: 0.55, len: 8)
  lb(p(250, 553), $R$)
  lb(p(103, 602), $I$, anchor: "west")
  lb(p(185, 617), $cal(E), r$)
  plus-sign(p(154.5, 673))
  minus-sign(p(335.6, 665))
})

// 图 2·36 并联电池组（p.131）
#let fig-2-36(width: pxw(328)) = px-canvas(328, 205, origin: (462, 385), width: width, (p, u) => {
  import cetz.draw: *
  set-style(stroke: 1pt)
  let P = (537.5, 543.8)
  let N = (724.7, 543.8)
  line(p(472.4, 543.8), p(472.4, 413))
  resistor(p(472.4, 413), p(781.6, 413), zl: 120, amp: 5, teeth: 9, at: 0.507)
  line(p(781.6, 413), p(781.6, 543.8))
  line(p(472.4, 543.8), p(..P))
  line(p(..N), p(781.6, 543.8))
  cell(p(..P), p(..N), at: 0.473, gap: 6, long: 22, short: 12)
  line(p(..P), p(569.5, 507))
  cell(p(569.5, 507), p(691.6, 507), at: 0.463, gap: 6, long: 22, short: 12)
  line(p(691.6, 507), p(..N))
  line(p(..P), p(569.5, 579.4))
  cell(p(569.5, 579.4), p(691.6, 579.4), at: 0.463, gap: 6, long: 22, short: 12)
  line(p(691.6, 579.4), p(..N))
  node(p(..P), r: 4)
  node(p(..N), r: 4)
  mid-arrow(p(472.4, 543.8), p(472.4, 413), t: 0.5, len: 8)
  lb(p(629, 393), $R$)
  lb(p(484, 486), $I$, anchor: "west")
  lb(p(623, 478), $cal(E), r$)
  plus-sign(p(537.5, 561))
  minus-sign(p(724.7, 559))
})

// 图 2·37 例 8 附图（p.134）
#let fig-2-37(width: pxw(270)) = px-canvas(270, 200, origin: (125, 600), width: width, (p, u) => {
  import cetz.draw: *
  set-style(stroke: 1pt)
  let B = (224.5, 641.9)
  line(p(149.2, 754.2), p(149.2, 641.9))
  cell(p(149.2, 641.9), p(..B), at: 0.4356, gap: 6.6, long: 19, short: 10)
  resistor(p(..B), p(364.4, 641.9), zl: 72, amp: 5, teeth: 7, at: 0.415)
  line(p(364.4, 641.9), p(364.4, 754.2))
  cell(p(149.2, 754.2), p(364.4, 754.2), at: 0.2505, gap: 5, long: 29, short: 16)
  mid-arrow(p(149.2, 754.2), p(149.2, 641.9), t: 0.45, len: 8)
  node(p(..B), r: 3.6)
  node(p(149.2, 754.2), r: 3.6)
  node(p(364.4, 754.2), r: 3.6)
  lb(p(181, 614), $cal(E)_1, r_1$)
  lb(p(223, 660), $B$)
  lb(p(278, 661), $R$)
  lb(p(158, 711), $I$, anchor: "west")
  lb(p(135, 755), $A$, anchor: "east")
  lb(p(373, 755), $C$, anchor: "west")
  lb(p(186, 787), $cal(E)_2, r_2$)
})

// 图 2·38 例 9 附图（p.136）
#let fig-2-38(width: pxw(365)) = px-canvas(365, 225, origin: (265, 455), width: width, (p, u) => {
  import cetz.draw: *
  set-style(stroke: 1pt)
  let A = (336.6, 532.7)
  let B = (558, 532.7)
  // 上支路
  line(p(..A), p(336.6, 496))
  cell(p(336.6, 496), p(440.9, 496), at: 0.483, gap: 8, long: 22, short: 12)
  resistor(p(440.9, 496), p(558, 496), zl: 72.5, amp: 5, teeth: 7, at: 0.31)
  line(p(558, 496), p(..B))
  // 中支路
  line(p(..A), p(336.6, 565))
  cell(p(336.6, 565), p(438, 565), at: 0.507, gap: 8, long: 22, short: 12)
  resistor(p(438, 565), p(558, 565), zl: 71, amp: 5, teeth: 7, at: 0.32)
  line(p(558, 565), p(..B))
  // 外面一圈（R3）
  line(p(..A), p(274.4, 532.7), p(274.4, 656.5))
  resistor(p(274.4, 656.5), p(617.7, 656.5), zl: 122, amp: 5, teeth: 10, at: 0.506)
  line(p(617.7, 656.5), p(617.7, 532.7), p(..B))
  mid-arrow(p(274.4, 532.7), p(274.4, 656.5), t: 0.55, len: 8)
  mid-arrow(p(617.7, 656.5), p(617.7, 532.7), t: 0.55, len: 8)
  line(p(372, 496), p(352, 496), mark: (end: ">", fill: black, scale: 0.5))
  line(p(370, 565), p(350, 565), mark: (end: ">", fill: black, scale: 0.5))
  node(p(..A), r: 4)
  node(p(..B), r: 4)
  lb(p(387, 465), $cal(E)_1, r_1$)
  lb(p(357, 510), $I_1$)
  lb(p(355, 551), $I_2$)
  lb(p(476, 478), $R_1$)
  lb(p(476, 545), $R_2$)
  lb(p(381, 592), $cal(E)_2, r_2$)
  lb(p(326, 547), $A$, anchor: "east")
  lb(p(566, 547), $B$, anchor: "west")
  lb(p(280, 596), $I$, anchor: "west")
  lb(p(610, 593), $I$, anchor: "east")
  lb(p(445, 637), $R_3$)
})
