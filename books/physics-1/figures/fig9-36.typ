// 图 9·36、9·37（原书 p.276）三个平行力的平衡。坐标取自页面显示图。
#import "/common/series.typ": *

#let _arrow(p, a, b, th: 1.5pt) = cetz.draw.line(p(..a), p(..b), stroke: th, mark: (end: "stealth", fill: black, scale: 0.5))
#let _lab(p, x, y, body, size: 9pt) = cetz.draw.content(p(x, y), anchor: "center", text(size: size, body))

#let fig-9-36(width: 8.5cm) = px-canvas(600, 580, origin: (320, 580), width: width, (p, u) => {
  import cetz.draw: *
  line(p(355, 858), p(880, 855), stroke: 1.6pt)
  _arrow(p, (440, 858), (443, 952))
  _arrow(p, (783, 858), (783, 1035))
  _arrow(p, (667, 858), (667, 595), th: 1.8pt)
  line(p(667, 858), p(667, 1128), stroke: (thickness: 1.4pt, dash: "dashed"), mark: (end: "stealth", fill: black, scale: 0.5))
  _lab(p, 340, 858, $O$); _lab(p, 445, 840, $a$); _lab(p, 683, 840, $c$); _lab(p, 785, 838, $b$)
  _lab(p, 468, 940, $F_1$); _lab(p, 815, 1015, $F_2$); _lab(p, 690, 603, $F_3$); _lab(p, 688, 1112, $R$)
})

#let fig-9-37(width: 8.5cm) = px-canvas(600, 580, origin: (770, 1360), width: width, (p, u) => {
  import cetz.draw: *
  line(p(790, 1635), p(1320, 1645), stroke: 1.6pt)
  _arrow(p, (868, 1642), (868, 1732))
  _arrow(p, (1218, 1642), (1218, 1917))
  _arrow(p, (1100, 1640), (1100, 1380), th: 1.8pt)
  line(p(1218, 1640), p(1220, 1462), stroke: (thickness: 1.4pt, dash: "dashed"), mark: (end: "stealth", fill: black, scale: 0.5))
  _lab(p, 795, 1635, $O$); _lab(p, 872, 1623, $a$); _lab(p, 1115, 1625, $c$); _lab(p, 1233, 1620, $b$)
  _lab(p, 895, 1712, $F_1$); _lab(p, 1135, 1405, $F_3$); _lab(p, 1240, 1900, $F_2$); _lab(p, 1237, 1478, $Q$)
})
