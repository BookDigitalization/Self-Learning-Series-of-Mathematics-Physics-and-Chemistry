// 图 9·38、9·39（原书 p.278）、图 9·40（原书 p.279）平行力的合成。坐标取自页面显示图。
#import "/common/series.typ": *

#let _arrow(p, a, b, th: 1.5pt) = cetz.draw.line(p(..a), p(..b), stroke: th, mark: (end: "stealth", fill: black, scale: 0.5))
#let _lab(p, x, y, body, size: 9pt) = cetz.draw.content(p(x, y), anchor: "center", text(size: size, body))
#let _dashed(p, a, b) = cetz.draw.line(p(..a), p(..b), stroke: (thickness: 1.4pt, dash: "dashed"), mark: (end: "stealth", fill: black, scale: 0.5))

#let fig-9-38(width: 7.4cm) = px-canvas(520, 520, origin: (330, 520), width: width, (p, u) => {
  import cetz.draw: *
  line(p(383, 763), p(632, 585), stroke: 1pt)
  line(p(470, 703), p(770, 703), stroke: 1.4pt)
  for q in ((383, 763), (632, 585), (770, 703)) { circle(p(..q), radius: 4 * u, stroke: 0.8pt, fill: white) }
  _arrow(p, (383, 767), (379, 880), th: 1.8pt)
  _arrow(p, (470, 703), (470, 862))
  _arrow(p, (632, 589), (632, 652))
  _arrow(p, (615, 703), (612, 1002), th: 1.8pt)
  _arrow(p, (770, 707), (768, 857))
  _lab(p, 357, 750, $A$); _lab(p, 460, 683, $D$); _lab(p, 632, 555, $B$); _lab(p, 618, 683, $O$); _lab(p, 772, 672, $C$)
  _lab(p, 405, 860, $F_1$); _lab(p, 492, 845, $R'$); _lab(p, 668, 625, $F_2$); _lab(p, 640, 935, $R$); _lab(p, 795, 842, $F_3$)
})

#let fig-9-39(width: 8cm) = px-canvas(560, 400, origin: (790, 1170), width: width, (p, u) => {
  import cetz.draw: *
  rect(p(825, 1218), p(1318, 1235), stroke: 1pt)
  _arrow(p, (823, 1235), (823, 1422), th: 2.4pt)
  _dashed(p, (1003, 1235), (1003, 1512))
  _arrow(p, (1070, 1235), (1070, 1342))
  _arrow(p, (1318, 1235), (1318, 1318))
  _lab(p, 830, 1200, $A$); _lab(p, 1005, 1198, $D$); _lab(p, 1070, 1198, $B$); _lab(p, 1318, 1198, $C$)
  _lab(p, 826, 1440, $G_1$); _lab(p, 1003, 1530, $R$); _lab(p, 1072, 1368, $G_2$); _lab(p, 1312, 1342, $G_3$)
})

#let fig-9-40(width: 8cm) = px-canvas(560, 520, origin: (850, 350), width: width, (p, u) => {
  import cetz.draw: *
  rect(p(880, 580), p(1365, 596), stroke: 1pt)
  _arrow(p, (977, 583), (977, 378), th: 1.8pt)
  _arrow(p, (880, 596), (880, 748), th: 2.4pt)
  _arrow(p, (1127, 596), (1127, 702))
  _arrow(p, (1365, 596), (1365, 702), th: 2.2pt)
  line(p(1175, 596), p(1175, 802), stroke: (thickness: 1.4pt, dash: "dashed"), mark: (end: "stealth", fill: black, scale: 0.5))
  _lab(p, 882, 562, $A$); _lab(p, 1130, 563, $B$); _lab(p, 1180, 563, $E$); _lab(p, 1362, 563, $C$); _lab(p, 975, 612, $D$)
  _lab(p, 980, 372, $F$); _lab(p, 880, 793, $F_1$); _lab(p, 1125, 728, $F_2$); _lab(p, 1360, 728, $F_3$); _lab(p, 1173, 818, $R$)
})
