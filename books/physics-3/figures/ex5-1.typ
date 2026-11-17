// 习题 5·1 第 6、7 题附图（原书 p.261）。坐标取自原书页面 150 dpi 像素。
#import "/common/series.typ": *

#let fig-ex-5-1-6(width: 5.4cm) = px-canvas(420, 380, origin: (170, 530), width: width, (p, u) => {
  import cetz.draw: *
  let tx(x, y, body) = content(p(x, y), anchor: "center", text(size: 9pt, body))
  rect(p(288, 628), p(500, 843), stroke: 1pt)
  for y in (660, 708, 768, 816) {
    line(p(240, y), p(538, y), mark: (end: ">", fill: black), stroke: 0.7pt)
  }
  line(p(210, 738), p(570, 738), stroke: (thickness: 0.7pt, dash: "dash-dotted"))
  line(p(398, 565), p(398, 900), stroke: (thickness: 0.7pt, dash: "dash-dotted"))
  // 原书图右侧中线下方有一条竖向虚线箭头（p.261），箭头在上段
  line(p(471, 738), p(471, 836), stroke: (thickness: 0.8pt, dash: "dashed"))
  line(p(471, 738), p(471, 768), mark: (end: ">", fill: black, scale: 0.6), stroke: 0.8pt)
  tx(555, 660, $H$); tx(398, 553, $A$); tx(395, 890, $B$); tx(190, 740, $C$); tx(583, 737, $D$)
})

#let fig-ex-5-1-7(width: 5.4cm) = px-canvas(400, 260, origin: (710, 640), width: width, (p, u) => {
  import cetz.draw: *
  let tx(x, y, body) = content(p(x, y), anchor: "center", text(size: 9pt, body))
  let dash = (thickness: 0.8pt, dash: "dashed")
  line(p(735, 720), p(1085, 720), stroke: (thickness: 0.7pt, dash: "dashed"))
  circle(p(815, 718), radius: (25 * u, 58 * u), stroke: dash)
  circle(p(985, 718), radius: (25 * u, 58 * u), stroke: dash)
  line(p(815, 660), p(985, 660), stroke: dash)
  line(p(815, 718), p(815, 777), p(985, 777), p(985, 718), stroke: 1.1pt)
  line(p(765, 850), p(1065, 850), mark: (end: ">", fill: black), stroke: 1pt)
  tx(903, 828, $I$); tx(735, 718, $O$); tx(1078, 718, $O'$)
})
