// 习题 4·2 附图（原书 p.232–233）
#import "fig4-lib.typ": *

// 第 1 题（p.232）：线圈、磁棒、磁针位图，字母补真文字
#let fig-ex-4-2-1(width: auto) = bitmap-fig("ex4-2-1.png", (455, 1155, 1075, 1465), (
  (748, 1201, $N$), (933, 1201, $S$), (706, 1367, $N$), (894, 1367, $S$),
), width: width)

// 第 7 题（p.233）：两个线路（CeTZ 重绘）
#let fig-ex-4-2-7(width: 6cm) = px-canvas(580, 340, origin: (240, 790), width: width, (p, u) => {
  import cetz.draw: *
  set-style(stroke: 1.8pt)
  line(p(283, 845), p(405, 845))
  battery(p, 405, 542, 845)
  line(p(542, 845), p(600, 845))
  key-switch(p, 600, 650, 845)
  line(p(650, 845), p(762, 845))
  line(p(283, 845), p(283, 930), p(762, 930), p(762, 845))
  line(p(283, 983), p(283, 1070), p(486, 1070))
  line(p(558, 1070), p(762, 1070), p(762, 983), p(283, 983))
  line(p(700, 983), p(742, 983), mark: arrow-mark)
  meter(p, 522, 1068, 36, $G$)
  tx(p, 391, 822, [#sym.minus]); tx(p, 546, 818, [+]); tx(p, 625, 861, $K$)
  tx(p, 262, 985, $A$); tx(p, 785, 975, $B$)
})

// 第 8、9 题（p.233）：矩形金属框在磁场中
#let fig-ex-4-2-8(width: 5.2cm) = px-canvas(490, 315, origin: (930, 790), width: width, (p, u) => {
  import cetz.draw: *
  for y in (815, 855, 900, 945, 992, 1035, 1082) {
    line(p(950, y), p(1085, y), stroke: 0.9pt)
    line(p(1272, y), p(1395, y), stroke: 0.9pt, mark: arrow-mark)
  }
  rect(p(1085, 828), p(1272, 1055), stroke: 1.8pt)
  tx(p, 1067, 833, $A$); tx(p, 1290, 831, $B$); tx(p, 1065, 1060, $C$); tx(p, 1287, 1057, $D$)
})

// 第 10 题（p.233）：原线圈、副线圈与软铁棒位图，字母补真文字
#let fig-ex-4-2-10(width: auto) = bitmap-fig("ex4-2-10.png", (690, 1600, 1440, 2062), (
  (822, 1641, $P$), (1055, 1620, $S$), (1418, 1712, $R$), (1067, 1898, $G$),
), width: width)
