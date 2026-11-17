// 图 4·10（原书 p.236）研究感应电动势用图（CeTZ 重绘）
#import "fig4-lib.typ": *

#let fig-4-10(width: 7.6cm) = px-canvas(690, 455, origin: (180, 1595), width: width, (p, u) => {
  import cetz.draw: *
  for x in (205, 284, 363, 441, 520, 597, 676, 756, 835) {
    for y in (1618, 1700, 1780, 1858, 1938, 2016) {
      line(p(x - 5, y - 5), p(x + 5, y + 5), stroke: 0.9pt)
      line(p(x - 5, y + 5), p(x + 5, y - 5), stroke: 0.9pt)
    }
  }
  let thick = 2.4pt
  line(p(248, 1660), p(792, 1660), stroke: thick)
  line(p(248, 1975), p(792, 1975), stroke: thick)
  line(p(248, 1660), p(248, 1975), stroke: thick)
  line(p(568, 1637), p(568, 1993), stroke: thick)
  line(p(715, 1637), p(715, 1990), stroke: (thickness: 1.6pt, dash: "dashed"))
  line(p(551, 1840), p(551, 1762), mark: arrow-mark, stroke: 1pt)
  line(p(550, 1815), p(470, 1815), mark: arrow-mark, stroke: 0.8pt)
  line(p(575, 1815), p(668, 1815), mark: arrow-mark, stroke: 0.8pt)
  tx(p, 550, 1640, $a$); tx(p, 698, 1637, $a'$); tx(p, 232, 1655, $d$); tx(p, 228, 1978, $c$)
  tx(p, 551, 2000, $b$); tx(p, 698, 1998, $b'$); tx(p, 551, 1733, $I$); tx(p, 448, 1815, $F$); tx(p, 686, 1815, $M$)
})
