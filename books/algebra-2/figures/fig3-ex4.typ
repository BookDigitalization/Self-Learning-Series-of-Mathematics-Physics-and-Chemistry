// 习题 3·11(1) 第 4 题插图：均匀棒 AB，距 A 端 0.7 米处的 C 点挂 180 公斤（原书 p.127，不编号）
// 坐标取自 p.127 的 200 dpi 网格图（y 向下），原点取 (230, 830)。
#import "/common/series.typ": *

#let fig-3-ex4(width: 8cm) = px-canvas(600, 200, width: width, origin: (230, 830), (p, u) => {
  import cetz.draw: *
  let arr = (start: "stealth", end: "stealth", fill: black, scale: 0.4)
  let t(x, y, body, fill: none) = content(p(x, y), text(font: fonts.song, size: 8pt, body),
    frame: if fill == none { none } else { "rect" }, fill: fill, stroke: none, padding: 1.5pt)
  // 棒 AB
  line(p(270, 872), p(788, 872), stroke: 1.6pt)
  line(p(270, 872), p(270, 840), stroke: 0.9pt, mark: (end: "stealth", fill: black, scale: 0.5))
  line(p(788, 872), p(788, 845), stroke: 0.9pt, mark: (end: "stealth", fill: black, scale: 0.5))
  t(255, 857, text(style: "italic")[A])
  t(802, 862, text(style: "italic")[B])
  t(510, 850, text(style: "italic")[C])
  // 尺寸线
  for x in (270, 510, 788) { line(p(x, 888), p(x, 912), stroke: 0.5pt) }
  line(p(270, 900), p(510, 900), stroke: 0.5pt, mark: arr)
  line(p(510, 900), p(788, 900), stroke: 0.5pt, mark: arr)
  t(385, 898, [0.7 米], fill: white)
  t(650, 902, [0.8 米], fill: white)
  // 重物
  line(p(510, 872), p(510, 958), stroke: 0.7pt)
  rect(p(464, 958), p(556, 1002), stroke: 1.2pt)
  t(510, 981, [180 公斤])
})
