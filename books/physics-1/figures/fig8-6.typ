// 图 8·6 砖块和地面间的弹力（原书 p.215）
// 线条图，用 CeTZ 按原图重绘：上，砖块放在地面上；中，砖块受的力 F（向上）、G（向下）；下，地面受的力 F′（向下）。
// 坐标是原页显示图坐标（x-540, y-1290）。
#import "/common/series.typ": *

#let fig-8-6(width: 5.2cm) = px-canvas(380, 600, width: width, (p, u) => {
  import cetz.draw: *
  let q(x, y) = p(x - 540, y - 1290)
  let arr = (end: "stealth", fill: black, scale: 0.5)
  // 上：砖块放在地面上
  rect(q(642, 1300), q(817, 1383), stroke: 0.9pt)
  for k in range(0, 29) {
    let x = 645 + k * 6
    line(q(x, 1301), q(x, 1382), stroke: 0.6pt)
  }
  line(q(555, 1385), q(905, 1385), stroke: 0.9pt)
  for k in range(0, 30) {
    let x = 555 + k * 12
    line(q(x, 1410), q(x + 12, 1386), stroke: 0.6pt)
  }
  // 中：砖块受力
  rect(q(645, 1533), q(813, 1632), stroke: 0.9pt)
  circle(q(733, 1583), radius: 3 * u, fill: black, stroke: none)
  line(q(733, 1583), q(733, 1497), stroke: 0.9pt, mark: arr)
  line(q(733, 1583), q(733, 1678), stroke: 0.9pt, mark: arr)
  content(q(760, 1500), anchor: "center", text(size: 9pt, $F$))
  content(q(760, 1675), anchor: "center", text(size: 9pt, $G$))
  // 下：地面受力
  line(q(570, 1768), q(870, 1768), stroke: 0.9pt)
  for k in range(0, 25) {
    let x = 570 + k * 12
    line(q(x, 1792), q(x + 12, 1769), stroke: 0.6pt)
  }
  line(q(733, 1768), q(733, 1852), stroke: 0.9pt, mark: arr)
  content(q(762, 1845), anchor: "center", text(size: 9pt, $F'$))
})
