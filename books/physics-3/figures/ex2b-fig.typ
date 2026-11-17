// 习题 2·5(2)、2·5(3)、2·7(3) 的附图（原书 p.111、116、117、138）
// CeTZ 重绘；坐标是原书页面（110 dpi 渲染）的像素坐标。
#import "/common/series.typ": *
#import "fig2b-lib.typ": *

// 习题 2·5(2) 第 4 题（p.111）：两组并联的灯泡
#let fig-ex-2-5-2-4(width: pxw(335)) = px-canvas(335, 260, origin: (455, 445), width: width, (p, u) => {
  import cetz.draw: *
  set-style(stroke: 1.2pt)
  line(p(491, 466), p(779, 467))
  line(p(491, 499), p(779, 500))
  // 左组：4 只灯泡
  line(p(525, 499), p(525, 638))
  line(p(598, 466), p(598, 639))
  for y in (542, 575, 608, 638) {
    line(p(525, y), p(550, y))
    line(p(576, y), p(598, y))
    lamp(p(563, y), r: 12.5)
  }
  for y in (542, 575, 608) { node(p(525, y), r: 3); node(p(598, y), r: 3) }
  // 右组：6 只灯泡
  line(p(680, 499), p(680, 683))
  line(p(747, 466), p(747, 680))
  for y in (525, 556, 586, 618, 650, 683) {
    line(p(680, y), p(701, y))
    line(p(727, y), p(747, y))
    lamp(p(714, y), r: 12.5)
  }
  for y in (525, 556, 586, 618, 650) { node(p(680, y), r: 3); node(p(747, y), r: 3) }
  for pt in ((491, 466), (598, 466), (747, 466), (491, 499), (525, 499), (680, 499)) { node(p(..pt), r: 3.6) }
  lb(p(481, 467), $A$, anchor: "east", size: 9pt)
  lb(p(481, 499), $B$, anchor: "east", size: 9pt)
})

// 习题 2·5(3) 第 3 题（p.116）
#let fig-ex-2-5-3-3(width: pxw(440)) = px-canvas(440, 132, origin: (222, 980), width: width, (p, u) => {
  import cetz.draw: *
  set-style(stroke: 1.1pt)
  let P = (367.7, 1071.6)
  let Q = (565.8, 1069.8)
  line(p(242.7, 1071.6), p(285, 1071.6))
  resistor(p(242.7, 1071.6), p(..P), zl: 56, amp: 5, teeth: 6, at: 0.5)
  line(p(..P), p(404, 1040.5))
  resistor(p(404, 1040.5), p(532, 1040.5), zl: 55, amp: 5, teeth: 6, at: 0.5)
  line(p(532, 1040.5), p(..Q))
  line(p(..P), p(407, 1098.4))
  resistor(p(407, 1098.4), p(534, 1098.4), zl: 55, amp: 5, teeth: 6, at: 0.5)
  line(p(534, 1098.4), p(..Q))
  // 电压尺寸线
  line(p(242.7, 1071.6), p(242.7, 1007), stroke: 1pt)
  line(p(607.3, 1069.8), p(607.3, 987.4), stroke: 1.4pt)
  line(p(242.7, 1007.6), p(607.3, 1007.6), mark: (start: ">", end: ">", fill: black, scale: 0.5))
  lb(p(425.6, 1007), [12 伏特], size: 8pt, bg: true)
  // 右端输入线与箭头
  line(p(607.3, 1069.8), p(..Q), stroke: 1.4pt, mark: (end: ">", fill: black, scale: 0.6))
  node(p(242.7, 1071.6), r: 3.4)
  node(p(..P), r: 3.4)
  node(p(..Q), r: 3.4)
  node(p(607.3, 1069.8), r: 3.4)
  lb(p(312.8, 1055), [4 欧姆], size: 7.5pt)
  lb(p(468, 1026), [3 欧姆], size: 7.5pt)
  lb(p(474, 1083), $R$, size: 8pt)
  lb(p(598, 1086), [$I = 2$ 安培], size: 7.5pt)
})

// 习题 2·5(3) 第 4 题（p.117）
#let fig-ex-2-5-3-4(width: pxw(430)) = px-canvas(430, 150, origin: (250, 165), width: width, (p, u) => {
  import cetz.draw: *
  set-style(stroke: 1.1pt)
  let L1 = (277.8, 183.9)
  let L2 = (277.8, 301.6)
  line(p(..L1), p(605.9, 183.9), p(605.9, 220))
  line(p(..L2), p(605.9, 301), stroke: 1.1pt)
  line(p(605.9, 301), p(605.9, 262))
  line(p(443, 183.9), p(443, 224))
  line(p(443, 257), p(443, 301.6))
  lamp(p(443, 240.6), r: 17)
  line(p(605.9, 220), p(605.9, 224))
  lamp(p(605.9, 240.6), r: 17)
  line(p(605.9, 257), p(605.9, 262))
  // 电压箭头
  line(p(277.8, 188), p(277.8, 297), mark: (start: ">", end: ">", fill: black, scale: 0.5), stroke: 1.4pt)
  node(p(..L1), r: 3.6)
  node(p(..L2), r: 3.6)
  node(p(443, 183.9), r: 3.6)
  node(p(443, 301.6), r: 3.6)
  lb(p(368, 184), [0.5 欧姆], size: 7.5pt, bg: true)
  lb(p(543, 183), [0.5 欧姆], size: 7.5pt, bg: true)
  lb(p(368, 302), [0.5 欧姆], size: 7.5pt, bg: true)
  lb(p(530, 301), [0.5 欧姆], size: 7.5pt, bg: true)
  lb(p(298, 247), [4 伏特], size: 8pt)
  lb(p(467, 241), [12 欧姆], size: 7.5pt, anchor: "west")
  lb(p(630, 241), [12 欧姆], size: 7.5pt, anchor: "west")
  lb(p(433, 172), $A$, size: 9pt)
  lb(p(445, 314), $B$, size: 9pt)
  lb(p(617, 184), $C$, size: 9pt, anchor: "west")
  lb(p(617, 301), $D$, size: 9pt, anchor: "west")
})

// 习题 2·5(3) 第 6 题（p.117）
#let fig-ex-2-5-3-6(width: pxw(350)) = px-canvas(350, 130, origin: (305, 655), width: width, (p, u) => {
  import cetz.draw: *
  set-style(stroke: 1.1pt)
  line(p(325.7, 668.8), p(365, 668.8))
  resistor(p(325.7, 668.8), p(461, 668.8), zl: 56, amp: 5, teeth: 6, at: 0.5)
  resistor(p(461, 668.8), p(618.4, 668.8), zl: 56, amp: 5, teeth: 6, at: 0.5)
  line(p(618.4, 668.8), p(618.4, 783.4))
  line(p(618.4, 783.4), p(325.7, 783.4))
  line(p(599, 668.8), p(599, 654))
  resistor(p(461, 668.8), p(461, 783.4), zl: 56, amp: 5, teeth: 6, at: 0.5)
  line(p(325.7, 668.8), p(325.7, 783.4), mark: (start: ">", end: ">", fill: black, scale: 0.5), stroke: 1.2pt)
  lb(p(325.7, 726), $V$, bg: true)
  node(p(325.7, 668.8), r: 3.4)
  node(p(325.7, 783.4), r: 3.4)
  node(p(461, 668.8), r: 3.4)
  node(p(461, 783.4), r: 3.4)
  lb(p(391, 687), $R_1$)
  lb(p(542, 686), $R_3$)
  lb(p(481, 724), $R_2$)
})

// 习题 2·7(3) 第 1 题（p.138）
#let fig-ex-2-7-3-1(width: pxw(335)) = px-canvas(335, 150, origin: (90, 335), width: width, (p, u) => {
  import cetz.draw: *
  set-style(stroke: 1.1pt)
  let y = 394.4
  line(p(98, y), p(130, y))
  resistor(p(130, y), p(233.7, y), zl: 54, amp: 5, teeth: 6, at: 0.54)
  cell(p(233.7, y), p(274, y), at: 0.59, gap: 7, long: 24, short: 12)
  resistor(p(274, y), p(381.8, y), zl: 58, amp: 5, teeth: 6, at: 0.505)
  line(p(381.8, y), p(418, y), stroke: (dash: "dashed", thickness: 1.4pt))
  for x in (130, 233.7, 274, 381.8) { node(p(x, y), r: 3.4) }
  // 电流方向
  line(p(213, 442), p(298, 442), mark: (end: ">", fill: black, scale: 0.5), stroke: 1.4pt)
  line(p(298, 462), p(217, 462), mark: (end: ">", fill: black, scale: 0.5), stroke: (dash: "dashed", thickness: 1.4pt, paint: black))
  lb(p(188.5, 378), $R_1$)
  lb(p(330, 374), $R_2$)
  lb(p(130, 410), $A$)
  lb(p(232, 410), $B$)
  lb(p(276, 410), $C$)
  lb(p(381, 410), $D$)
  lb(p(258, 347), $cal(E)$)
  lb(p(258, 368), $r$)
  lb(p(207, 444), $I$)
  lb(p(307, 463), $I$)
})

// 习题 2·7(3) 第 3 题（p.138）
#let fig-ex-2-7-3-3(width: pxw(310)) = px-canvas(310, 110, origin: (470, 350), width: width, (p, u) => {
  import cetz.draw: *
  set-style(stroke: 1.1pt)
  let y = 394
  line(p(473, y), p(513.4, y))
  resistor(p(513.4, y), p(640, y), zl: 54, amp: 5, teeth: 6, at: 0.613)
  // 长极板（正极）在右（靠 B），与扫描及书末答案（V_AB = 8 伏）一致
  cell(p(735, y), p(640, y), at: 0.6, gap: 6, long: 24, short: 12)
  line(p(735, y), p(760, y), mark: (end: ">", fill: black, scale: 0.6), stroke: 1.4pt)
  node(p(513.4, y), r: 3.4)
  node(p(735, y), r: 3.4)
  lb(p(509.4, 411), $A$)
  lb(p(590, 414), $R$)
  lb(p(676, 427), $cal(E), r$)
  lb(p(735, 412), $B$)
})
