// 图 11·7 合力的功等于分力的功的代数和（原书 p.334）
// 示意图，按原图重绘。坐标是 render-pages.py --dpi 200 显示图（宽 1568）上的像素坐标。
#import "/common/series.typ": *

#let fig-11-7(width: 10cm) = px-canvas(760, 330, origin: (460, 1520), width: width, (p, u) => {
  import cetz.draw: *
  let lab(x, y, body) = content(p(x, y), anchor: "center", text(size: 9pt, body))
  let arr = (end: "stealth", fill: black, scale: 0.45)
  let dash = (paint: black, thickness: 0.8pt, dash: "dashed")
  let dot = (paint: black, thickness: 0.6pt, dash: "dotted")
  // 地面
  line(p(470, 1768), p(1195, 1768), stroke: 1pt)
  for k in range(0, 60) {
    let x = 475 + k * 12
    line(p(x + 8, 1768), p(x, 1782), stroke: 0.5pt)
  }
  // 物体：初位置（实线）与末位置（虚线）
  line(p(675, 1768), p(675, 1768 - 130), p(520, 1768 - 130), p(520, 1768), stroke: 1.2pt)
  line(p(1012, 1768), p(1012, 1630), p(1152, 1630), p(1152, 1768), stroke: dash)
  // 力
  let (ox, oy) = (675, 1708)
  line(p(ox, oy), p(880, 1540), stroke: 1pt, mark: arr)
  line(p(ox, oy), p(735, 1607), stroke: 1pt, mark: arr)
  line(p(ox, oy), p(822, 1655), stroke: 1pt, mark: arr)
  line(p(735, 1607), p(880, 1540), stroke: dash)
  line(p(822, 1655), p(880, 1540), stroke: dash)
  line(p(ox, oy), p(890, oy), stroke: 0.8pt)
  line(p(880, 1540), p(888, oy), stroke: dash)
  line(p(735, 1607), p(737, oy), stroke: dot)
  line(p(822, 1655), p(822, oy), stroke: dot)
  lab(880, 1530, $F$)
  lab(703, 1600, $F_1$)
  lab(850, 1668, $F_2$)
  lab(792, 1648, $alpha$)
  lab(731, 1645, $alpha_1$)
  lab(773, 1694, $alpha_2$)
  lab(655, 1718, $O$)
  lab(736, 1727, $A$)
  lab(824, 1727, $B$)
  lab(889, 1727, $C$)
  // 路程 s
  line(p(675, 1812), p(900, 1812), stroke: 0.7pt, mark: (start: "stealth", fill: black, scale: 0.4))
  line(p(920, 1812), p(1152, 1812), stroke: 0.7pt, mark: (end: "stealth", fill: black, scale: 0.4))
  line(p(675, 1795), p(675, 1830), stroke: 0.8pt)
  line(p(1152, 1795), p(1152, 1830), stroke: 0.8pt)
  lab(910, 1812, $s$)
})
