// 习题 9·6 附图（原书 p.280）。CeTZ 重绘，坐标取自页面显示图。
#import "/common/series.typ": *

#let _arrow(p, a, b, th: 1.5pt) = cetz.draw.line(p(..a), p(..b), stroke: th, mark: (end: "stealth", fill: black, scale: 0.5))
#let _lab(p, x, y, body, size: 9pt) = cetz.draw.content(p(x, y), anchor: "center", text(size: size, body))

// 第 3 题：棒上的四个平行力
#let fig-ex-9-6-3(width: 8cm) = px-canvas(560, 430, origin: (790, 700), width: width, (p, u) => {
  import cetz.draw: *
  rect(p(820, 800), p(1310, 818), stroke: 1pt)
  _arrow(p, (820, 818), (820, 898), th: 2.4pt)
  _arrow(p, (920, 818), (920, 1075), th: 2.4pt)
  _arrow(p, (1070, 800), (1070, 722), th: 1.6pt)
  _arrow(p, (1310, 818), (1310, 977), th: 2.4pt)
  _lab(p, 822, 783, $A$); _lab(p, 922, 783, $B$); _lab(p, 1072, 835, $C$); _lab(p, 1302, 783, $D$)
  _lab(p, 845, 895, $F_1$); _lab(p, 947, 1058, $F_2$); _lab(p, 1043, 738, $F_4$); _lab(p, 1275, 962, $F_3$)
})
