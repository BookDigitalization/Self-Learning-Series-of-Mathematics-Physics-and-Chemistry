// 图 4·4（原书 p.227）切割磁力线获得感应电流的方向（CeTZ 重绘）
#import "fig4-lib.typ": *

#let fig-4-4(width: 12.5cm) = px-canvas(1140, 335, origin: (260, 870), width: width, (p, u) => {
  import cetz.draw: *
  set-style(stroke: 0.7pt)
  let field(xs, down) = for x in xs {
    if down { line(p(x, 888), p(x, 1102), mark: arrow-mark) } else { line(p(x, 1102), p(x, 888), mark: arrow-mark) }
  }
  let cplus(x, y) = {
    circle(p(x, y), radius: 17, fill: white)
    line(p(x - 12, y), p(x + 12, y))
    line(p(x, y - 12), p(x, y + 12))
  }
  let cdot(x, y) = {
    circle(p(x, y), radius: 17, fill: white)
    circle(p(x, y), radius: 4, fill: black)
  }
  // (a)
  field((283, 325, 366, 405, 445, 483), true)
  cplus(383, 997)
  line(p(400, 997), p(476, 997), mark: arrow-mark)
  tx(p, 383, 958, $A$); tx(p, 530, 990, $M$); tx(p, 380, 1120, $H$); tx(p, 381, 1180, $(a)$)
  // (b)
  field((580, 618, 657, 698, 738, 778), true)
  cdot(680, 997)
  line(p(662, 997), p(610, 997), mark: arrow-mark)
  tx(p, 680, 958, $A$); tx(p, 678, 1118, $H$); tx(p, 664, 1180, $(b)$)
  // (c)
  field((872, 910, 950, 990, 1028, 1068), false)
  cdot(968, 997)
  line(p(986, 997), p(1056, 997), mark: arrow-mark)
  tx(p, 970, 955, $A$); tx(p, 1112, 992, $M$); tx(p, 970, 1118, $H$); tx(p, 950, 1180, $(c)$)
  // (d)
  field((1165, 1205, 1243, 1285, 1325, 1365), false)
  cplus(1262, 997)
  line(p(1244, 997), p(1195, 997), mark: arrow-mark)
  tx(p, 1263, 950, $A$); tx(p, 1260, 1115, $H$); tx(p, 1250, 1180, $(d)$)
})
