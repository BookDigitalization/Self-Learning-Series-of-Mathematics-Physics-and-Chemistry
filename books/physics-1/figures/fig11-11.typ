// 图 11·11 摩擦力的功的图示、图 11·12 拉弹簧、图 11·13 弹簧拉力的功（原书 p.338–339）
// 示意图/坐标图，按原图重绘。坐标是 render-pages.py --dpi 200 显示图（宽 1568）上的像素坐标。
// 图 11·11 纵轴标注原图为 f（摩擦力），照录；斜线按等距斜线重绘。
#import "/common/series.typ": *

#let fig-11-11(width: 7cm) = px-canvas(500, 300, origin: (300, 1560), width: width, (p, u) => {
  import cetz.draw: *
  let lab(x, y, body) = content(p(x, y), anchor: "center", text(size: 9pt, body))
  let arr = (end: "stealth", fill: black, scale: 0.45)
  let (x0, x1, ya, yb) = (360, 660, 1708, 1793)
  let h = yb - ya
  let t = -h
  while t < x1 - x0 {
    let s0 = calc.max(0, -t / h)
    let s1 = calc.min(1, (x1 - x0 - t) / h)
    if s1 > s0 {
      line(p(x0 + t + s0 * h, yb - s0 * h), p(x0 + t + s1 * h, yb - s1 * h), stroke: 0.5pt)
    }
    t += 20
  }
  line(p(x0, 1855), p(x0, 1580), stroke: 1pt, mark: arr)
  line(p(x0, ya), p(780, ya), stroke: 1pt, mark: arr)
  line(p(x0, yb), p(715, yb), stroke: 1.4pt)
  line(p(x1, ya), p(x1, yb), stroke: 1pt)
  lab(378, 1578, $f$)
  lab(345, 1708, [0])
  lab(335, 1793, [$-2$])
  lab(666, 1685, $s_0$)
  lab(793, 1703, $s$)
  lab(378, 1815, $P$)
  lab(660, 1815, $Q'$)
  lab(720, 1815, $Q$)
  lab(470, 1752, $W$)
  lab(530, 1752, $f s_0$)
})

#let fig-11-12(width: 8.6cm) = px-canvas(560, 340, origin: (830, 1570), width: width, (p, u) => {
  import cetz.draw: *
  let lab(x, y, body) = content(p(x, y), anchor: "center", text(size: 9pt, body))
  let arr = (end: "stealth", fill: black, scale: 0.45)
  let dash = (paint: black, thickness: 0.8pt, dash: "dashed")
  // 弹簧：锯齿线
  let spring(xa, xb, y, amp, n) = {
    let pts = ((xa, y),)
    for k in range(0, n) {
      let xm = xa + (k + 0.5) * (xb - xa) / n
      pts.push((xm, y + amp * (if calc.rem(k, 2) == 0 { -1 } else { 1 })))
    }
    pts.push((xb, y))
    line(..pts.map(q => p(..q)), stroke: 1.2pt)
  }
  // 墙
  for y0 in (1590, 1740) {
    let hh = if y0 == 1590 { 55 } else { 120 }
    line(p(870, y0), p(870, y0 + hh), stroke: 1.2pt)
    for k in range(0, 8) {
      let y = y0 + k * hh / 7
      line(p(870, y), p(852, y + 10), stroke: 0.6pt)
    }
  }
  spring(870, 1045, 1622, 22, 8)
  spring(870, 1195, 1790, 26, 8)
  line(p(1048, 1625), p(1048, 1745), stroke: dash)
  line(p(1048, 1745), p(1048, 1850), stroke: 0.8pt)
  line(p(1195, 1790), p(1220, 1790), stroke: 1pt)
  line(p(1220, 1695), p(1220, 1850), stroke: dash)
  line(p(1220, 1762), p(1320, 1762), stroke: 1pt, mark: arr)
  lab(1072, 1598, $P$)
  lab(1257, 1738, $P'$)
  lab(1342, 1765, $F$)
  line(p(1048, 1835), p(1110, 1835), stroke: 0.7pt, mark: (start: "stealth", fill: black, scale: 0.4))
  line(p(1160, 1835), p(1220, 1835), stroke: 0.7pt, mark: (end: "stealth", fill: black, scale: 0.4))
  lab(1135, 1832, $s_0$)
})

#let fig-11-13(width: 6.2cm) = px-canvas(420, 330, origin: (950, 1010), width: width, (p, u) => {
  import cetz.draw: *
  let lab(x, y, body) = content(p(x, y), anchor: "center", text(size: 9pt, body))
  let arr = (end: "stealth", fill: black, scale: 0.45)
  let dash = (paint: black, thickness: 0.8pt, dash: "dashed")
  let (ox, oy, qx, qy) = (1025, 1293, 1238, 1090)
  let k = (oy - qy) / (qx - ox)
  // 三角形内斜线
  let c = -268
  while c < -55 {
    let xhi = calc.min(qx, c + oy)
    let xlo = (oy + ox * k + c) / (1 + k)
    if xlo < xhi {
      line(p(xlo, xlo - c), p(xhi, xhi - c), stroke: 0.5pt)
    }
    c += 14
  }
  line(p(ox, oy), p(ox, 1022), stroke: 1pt, mark: arr)
  line(p(ox, oy), p(1350, oy), stroke: 1pt, mark: arr)
  line(p(ox, oy), p(qx, qy), stroke: 1.2pt)
  line(p(qx, qy), p(qx, oy), stroke: 1pt)
  line(p(ox, 1080), p(qx, 1080), stroke: dash)
  lab(1038, 1022, $F$)
  lab(1362, 1296, $s$)
  lab(1003, 1295, $O$)
  lab(1258, 1075, $Q$)
  lab(978, 1075, $K s_0$)
  lab(1232, 1320, $s_0$)
  lab(1090, 1258, $W$)
  lab(1150, 1262, $display(1/2) K s_0$)
})
