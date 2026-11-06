// 习题 9·8 附图（原书 p.290）第 5 题：斜面上的长方体。CeTZ 重绘，坐标取自页面显示图，原点 (820,1380)。
#import "/common/series.typ": *

#let fig-ex-9-8-5(width: 6.4cm) = px-canvas(540, 460, origin: (820, 1380), width: width, (p, u) => {
  import cetz.draw: *
  let lab(x, y, body) = content(p(x, y), anchor: "center", text(size: 9pt, body))
  // 水平线与斜面
  line(p(835, 1757), p(1340, 1757), stroke: 1pt)
  line(p(835, 1752), p(1325, 1658), stroke: 1pt)
  arc(p(835, 1754), start: 0deg, delta: 11deg, radius: 160 * u, stroke: 0.6pt, anchor: "origin")
  // 长方体
  line(p(1105, 1698), p(1222, 1676), p(1212, 1430), p(1058, 1480), close: true, stroke: 1.8pt)
  // a、b 尺寸
  line(p(1048, 1428), p(1165, 1390), stroke: 0.7pt, mark: (start: "stealth", end: "stealth", fill: black, scale: 0.35))
  line(p(1245, 1440), p(1252, 1672), stroke: 0.7pt, mark: (start: "stealth", end: "stealth", fill: black, scale: 0.35))
  // 重心与重力
  circle(p(1145, 1558), radius: 4 * u, fill: black)
  line(p(1145, 1558), p(1145, 1690), stroke: 1.2pt, mark: (end: "stealth", fill: black, scale: 0.5))
  // 倾倒方向的弧形箭头
  arc(p(1060, 1600), start: 100deg, delta: 70deg, radius: 70 * u, stroke: 1pt, anchor: "origin",
    mark: (end: "stealth", fill: black, scale: 0.4))
  lab(1105, 1408, $a$); lab(1225, 1550, $b$); lab(1178, 1720, $G$); lab(1018, 1740, $alpha$)
})
