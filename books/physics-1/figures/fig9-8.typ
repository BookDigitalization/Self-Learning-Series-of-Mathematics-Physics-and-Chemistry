// 图 9·8（原书 p.243）四力封闭四边形（折线）。坐标取自页面显示图，原点 (1050,1610)。
#import "/common/series.typ": *

#let fig-9-8(width: 4.2cm) = px-canvas(240, 280, origin: (1050, 1610), width: width, (p, u) => {
  import cetz.draw: *
  let arrow(a, b) = line(p(..a), p(..b), stroke: 1.4pt, mark: (end: "stealth", fill: black, scale: 0.5))
  let lab(x, y, body) = content(p(x, y), anchor: "center", text(size: 9pt, body))
  arrow((1075, 1655), (1258, 1655))
  arrow((1258, 1655), (1145, 1785))
  arrow((1145, 1785), (1250, 1868))
  arrow((1250, 1868), (1075, 1655))
  lab(1160, 1635, $F_1$); lab(1232, 1722, $F_2$); lab(1222, 1790, $F_3$); lab(1165, 1836, $F_4$)
})
