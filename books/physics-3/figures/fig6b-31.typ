// 图 6·31 扩音机示意图（方块图）；来源 原书 p.331，200 dpi 页面像素坐标。
#import "/common/series.typ": *
#import "fig6b-parts.typ": *

#let fig-6-31(width: 8.6cm) = px-canvas(780, 340, origin: (690, 1770), width: width, (p, u) => {
  import cetz.draw: *
  mic(p, 776, 1850, r: 30)
  wire(p, (776, 1853), (809, 1853))
  blk(p, 809, 1810, 959, 1896, [电压放大])
  blk(p, 1019, 1810, 1173, 1896, [电压放大])
  blk(p, 1205, 1810, 1355, 1896, [功率放大])
  wire(p, (959, 1853), (1019, 1853)); wire(p, (1173, 1853), (1205, 1853))
  wire(p, (1355, 1853), (1387, 1853))
  spk(p, 1387, 1851, hh: 27, flare: 58)
  node(p, 987, 1853, r: 3)
  wire(p, (987, 1853), (987, 2000))
  blk(p, 916, 2000, 1073, 2078, [收音部分])
  // 拾音器
  circle(p(760, 1945), radius: 22, stroke: 1.6pt)
  line(p(742, 1972), p(778, 1916), stroke: 1.6pt, mark: (end: "stealth", fill: black, scale: 0.5))
  wire(p, (782, 1949), (987, 1949))
  blab(p, 762, 1796, [送话器], size: 7.5pt)
  blab(p, 768, 2003, [拾音器], size: 7.5pt)
  blab(p, 1405, 1935, [扬声器], size: 7.5pt)
})
