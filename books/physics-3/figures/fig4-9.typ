// 图 4·9（原书 p.235）感应电动势的形成：(a) 磁极与导体为位图（字母补真文字），(b) CeTZ 重绘
#import "fig4-lib.typ": *

#let fig-4-9(width: 11cm) = px-canvas(1040, 550, origin: (300, 260), width: width, (p, u) => {
  import cetz.draw: *
  content(p(315, 265), anchor: "north-west", image("fig4-9a.png", width: 485 * u))
  tx(p, 604, 406, $N$); tx(p, 826, 432, $B$); tx(p, 332, 570, $A$); tx(p, 776, 637, $M$); tx(p, 610, 669, $S$)
  tx(p, 572, 785, $(a)$)
  // (b)
  set-style(stroke: 0.7pt)
  for x in (938, 987, 1035, 1183, 1232, 1280) {
    for k in range(8) {
      let y = 343 + 49 * k
      line(p(x - 6, y - 6), p(x + 6, y + 6), stroke: 1pt)
      line(p(x - 6, y + 6), p(x + 6, y - 6), stroke: 1pt)
    }
  }
  rect(p(1062, 312), p(1152, 690), fill: white, stroke: 0.9pt)
  rect(p(1085, 296), p(1130, 311), fill: luma(110), stroke: none)
  rect(p(1066, 686), p(1148, 701), fill: luma(110), stroke: none)
  for x in (1078, 1095, 1112, 1129) { tx(p, x, 328, [+], size: 5pt) }
  for x in (1090, 1107, 1124) { tx(p, x, 340, [+], size: 5pt) }
  line(p(1074, 668), p(1142, 668), stroke: (thickness: 0.6pt, dash: "dashed"))
  line(p(1082, 678), p(1134, 678), stroke: (thickness: 0.6pt, dash: "dashed"))
  circle(p(1112, 512), radius: 13, fill: white)
  line(p(1106, 512), p(1118, 512))
  line(p(1108, 527), p(1108, 602), mark: arrow-mark)
  line(p(1154, 512), p(1252, 512), mark: arrow-mark)
  tx(p, 1105, 622, $f$); tx(p, 1282, 516, $M$)
  tx(p, 1108, 273, $B$); tx(p, 1105, 722, $A$); tx(p, 1105, 782, $(b)$)
})
