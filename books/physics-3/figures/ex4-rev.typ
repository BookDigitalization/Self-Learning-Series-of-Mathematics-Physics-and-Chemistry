// 复习题四附图（原书 p.250–252）
#import "fig4-lib.typ": *

// 第 1 题（p.250）
#let fig-rev-4-1(width: 9cm) = px-canvas(680, 400, origin: (480, 270), width: width, (p, u) => {
  import cetz.draw: *
  set-style(stroke: 0.9pt)
  let fl(x0, y0, x1, y1) = line(p(x0, y0), p(x1, y1), mark: arrow-mark, stroke: 1.2pt)
  fl(523, 290, 518, 572); fl(588, 290, 584, 572); fl(655, 293, 651, 572); fl(725, 292, 720, 575)
  fl(927, 298, 920, 577); fl(993, 298, 988, 582); fl(1062, 298, 1056, 582); fl(1128, 298, 1121, 584)
  circle(p(615, 432), radius: 15, stroke: 1pt)
  line(p(630, 432), p(700, 432), mark: arrow-mark)
  circle(p(1024, 441), radius: 19, stroke: 1pt)
  circle(p(1024, 441), radius: 4.5, fill: black)
  tx(p, 702, 410, $v$); tx(p, 612, 600, $H$); tx(p, 614, 648, $(a)$)
  tx(p, 1018, 600, $H$); tx(p, 1017, 646, $(b)$)
})

// 第 2 题（p.250）：磁针 I、II 与线圈 L₁（位图，字母补真文字）
#let fig-rev-4-2(width: auto) = bitmap-fig("rev4-2.png", (385, 970, 1135, 1355), (
  (495, 1000, $S$), (497, 1100, $N$), (415, 1227, $L_1$), (689, 1163, [I]), (1043, 1017, [II]),
  (617, 1213, $N$), (762, 1212, $S$), (990, 1093, $N$), (1103, 1093, $S$),
), width: width)

// 第 3 题（p.250）：变压器式装置（位图，字母补真文字）
#let fig-rev-4-3(width: auto) = bitmap-fig("rev4-3.png", (455, 1690, 1090, 1965), (
  (581, 1754, $A$), (531, 1936, $K$), (630, 1947, $R$), (915, 1890, $N$), (1035, 1890, $S$),
), width: width)

// 第 6 题（p.251）：垂直纸面的磁场（点表示磁力线指向读者）与金属框
#let fig-rev-4-6(width: 4.3cm) = px-canvas(400, 365, origin: (200, 1065), width: width, (p, u) => {
  import cetz.draw: *
  for x in (228, 298, 365, 431, 503, 570) {
    for y in (1087, 1163, 1240, 1325, 1400) {
      circle(p(x, y), radius: 7.5, fill: black, stroke: none)
    }
  }
  line(p(275, 1370), p(275, 1125), p(530, 1125), p(530, 1370), stroke: 1.5pt)
  line(p(275, 1267), p(530, 1267), stroke: 1.5pt)
  circle(p(275, 1267), radius: 5, fill: black, stroke: none)
  circle(p(530, 1267), radius: 5, fill: black, stroke: none)
  line(p(398, 1270), p(398, 1325), mark: arrow-mark, stroke: 1pt)
  tx(p, 252, 1267, $A$); tx(p, 553, 1267, $B$)
})

// 第 7 题（p.251）：两个铝环（位图，字母补真文字）
#let fig-rev-4-7(width: auto) = bitmap-fig("rev4-7.png", (715, 1090, 1400, 1415), (
  (857, 1236, $A$), (1315, 1238, $B$), (801, 1326, $N$),
), width: width)

// 第 10 题（p.252）：手摇断续器、氖管与自感线圈（位图，字母补真文字）
#let fig-rev-4-10(width: auto) = bitmap-fig("rev4-10.png", (540, 525, 990, 820), (
  (710, 543, $K$), (877, 553, $C$), (865, 655, $L$),
), width: width)
