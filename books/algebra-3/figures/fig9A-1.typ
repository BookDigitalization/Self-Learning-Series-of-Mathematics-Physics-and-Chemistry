// 图 9·1–9·4（原书 p.297、p.302、p.302、p.303），第 9 章 §9·1 数列。
// 图 9·1：圆管堆成的三角形（前面一排 3, 4, …, 9 个圆），原图是写实插画式的示意图，这里用 CeTZ 重画：
//   坐标取自 300 dpi 页面裁图的像素（裁图左上角在页面 (0.48w, 0.55h)），圆心按每行左右两端等分，
//   圆管长度向右上方取 (350, −325)。原图手绘，各行圆的间距略不等，这里按左右端点等分，是近似。
// 图 9·2–9·4：数列的点列图；坐标取自 200 dpi 网格图的显示读数（显示宽 1596，真实宽 1654，缩放 1.04，
//   整幅图统一用显示坐标，不影响图形）；点位、虚线位置照扫描，不是精量。
#import "/common/series.typ": *

#let fig-9-1(width: 6.4cm) = px-canvas(880, 700, origin: (65, 50), width: width, (p, u) => {
  import cetz.draw: *
  let r = 27.5
  let vx = 350.0
  let vy = -325.0
  let phi = calc.atan2(vx, vy)
  let pt(cx, cy, a) = (cx + r * calc.cos(a), cy + r * calc.sin(a))
  // 一根圆管：起点圆心 (cx, cy)，向右上方延伸 (vx, vy)，远端为半圆
  let tube(cx, cy) = {
    let n = 16
    let ex = cx + vx
    let ey = cy + vy
    let far = range(n + 1).map(i => pt(ex, ey, phi - 90deg + 180deg * (i / n)))
    let near = range(n + 1).map(i => pt(cx, cy, phi + 90deg + 180deg * (i / n)))
    let ps = (..far, ..near).map(q => p(q.at(0), q.at(1)))
    line(..ps, close: true, fill: white, stroke: 0.6pt)
  }
  // 前面各行圆心：自下而上第 k 行（k = 0…6）有 9−k 个圆
  let row(k) = {
    let n = 9 - k
    let l = 100 + 26.5 * k
    let rr = 563 - 29.5 * k
    let y = 715 - 51.5 * k
    range(n).map(i => (l + (rr - l) * i / (n - 1), y))
  }
  // 能看见的 9 根圆管：最上一排的 3 根，再加其余各行最右边的 6 根；后画的在前面
  for c in row(6) { tube(c.at(0), c.at(1)) }
  for k in range(5, -1, step: -1) { let c = row(k).last(); tube(c.at(0), c.at(1)) }
  for k in range(6, -1, step: -1) {
    for c in row(k) { circle(p(c.at(0), c.at(1)), radius: r * u, fill: white, stroke: 0.6pt) }
  }
})

#let fig-9-2(width: 5.8cm) = px-canvas(495, 565, origin: (585, 275), width: width, (p, u) => {
  import cetz.draw: *
  let t(x, y, body) = content(p(x, y), text(font: fonts.song, size: 7.5pt, body))
  let ar = (end: "stealth", fill: black, scale: 0.5)
  let ox = 650
  let oy = 741
  let un = 37.3
  let ux = 37.1
  // 坐标轴
  line(p(ox, 830), p(ox, 308), stroke: 0.6pt, mark: ar)
  line(p(595, oy + 2), p(1050, oy + 4), stroke: 0.6pt, mark: ar)
  t(653, 289, $a_n$)
  t(1062, 752, $n$)
  t(637, 757, $0$)
  // 纵轴刻度 1…9
  for k in range(1, 10) {
    line(p(ox - 5, oy - un * k), p(ox + 5, oy - un * k), stroke: 0.5pt)
    t(ox - 14, oy - un * k, [#k])
  }
  // 点 (n, n+2)，n = 1…7
  let pts = range(1, 8).map(n => (ox + ux * n, oy - un * (n + 2)))
  for (i, c) in pts.enumerate() {
    let n = i + 1
    line(p(c.at(0), oy), p(c.at(0), c.at(1)), stroke: (thickness: 0.7pt, dash: "dashed"))
    line(p(c.at(0), oy - 4), p(c.at(0), oy + 4), stroke: 0.5pt)
    t(c.at(0), oy + 29, [#n])
  }
  line(..pts.map(c => p(c.at(0), c.at(1))), stroke: (thickness: 1.1pt, dash: "dashed"))
  for c in pts { circle(p(c.at(0), c.at(1)), radius: 4.5 * u, fill: white, stroke: 0.6pt) }
})

#let fig-9-3(width: 7.4cm) = px-canvas(660, 600, origin: (545, 1560), width: width, (p, u) => {
  import cetz.draw: *
  let t(x, y, body) = content(p(x, y), text(font: fonts.song, size: 7.5pt, body))
  let ar = (end: "stealth", fill: black, scale: 0.5)
  let dsh = (thickness: 0.8pt, dash: "dashed")
  let oy = 1868
  // 坐标轴
  line(p(630, 2130), p(630, 1595), stroke: 0.6pt, mark: ar)
  line(p(565, oy), p(1178, oy), stroke: 0.6pt, mark: ar)
  t(633, 1572, $a_n$)
  t(1200, oy, $n$)
  t(643, 1882, $0$)
  // 横向虚线 ±1/2
  line(p(630, 1748), p(1140, 1748), stroke: dsh)
  line(p(630, 2047), p(1140, 2047), stroke: dsh)
  // 纵轴刻度和标注
  for (y, lab) in ((1748, $1 / 2$), (1825, $1 / 4$), (1945, $-1 / 4$), (2047, $-1 / 2$)) {
    line(p(625, y), p(635, y), stroke: 0.5pt)
    t(598, y, lab)
  }
  // 点 a_n，n = 1…5
  let pts = ((708, 2050), (780, 1827), (857, 1905), (930, 1850), (1007, 1900))
  for (i, c) in pts.enumerate() {
    line(p(c.at(0), oy), p(c.at(0), c.at(1)), stroke: (thickness: 0.7pt, dash: "dashed"))
  }
  line(..pts.map(c => p(c.at(0), c.at(1))), stroke: (thickness: 1.1pt, dash: "dashed"))
  for c in pts { circle(p(c.at(0), c.at(1)), radius: 4.5 * u, fill: white, stroke: 0.6pt) }
  // 项数标注：点在轴下的标在轴上，点在轴上的标在轴下
  t(703, 1842, [1])
  t(783, 1895, [2])
  t(856, 1843, [3])
  t(930, 1895, [4])
  t(1007, 1913, [5])
})

#let fig-9-4(width: 7cm) = px-canvas(600, 520, origin: (505, 575), width: width, (p, u) => {
  import cetz.draw: *
  let t(x, y, body) = content(p(x, y), text(font: fonts.song, size: 7.5pt, body))
  let ar = (end: "stealth", fill: black, scale: 0.5)
  let oy = 1015
  // 坐标轴
  line(p(595, 1085), p(595, 622), stroke: 0.6pt, mark: ar)
  line(p(515, oy), p(1060, oy + 4), stroke: 0.6pt, mark: ar)
  t(600, 590, $a_n$)
  t(1085, 1018, $n$)
  t(583, 1030, $0$)
  // 项数刻度
  let xs = (633, 670, 707, 744, 781, 818, 855)
  for (i, x) in xs.enumerate() {
    line(p(x, oy - 5), p(x, oy + 5), stroke: 0.5pt)
    t(x, 1045, [#(i + 1)])
  }
  // 纵轴刻度：1、1/2、1/4
  for (y, lab) in ((717, [1]), (866, $1 / 2$), (942, $1 / 4$)) {
    line(p(590, y), p(600, y), stroke: 0.5pt)
    t(568, y, lab)
  }
  // a_n = 1 的横虚线
  line(p(595, 717), p(1005, 719), stroke: (thickness: 0.8pt, dash: "dashed"))
  // 点
  let pts = ((633, 718), (670, 870), (706, 913), (741, 940), (778, 958), (817, 973), (853, 980))
  line(..pts.map(c => p(c.at(0), c.at(1))), stroke: (thickness: 1.2pt, dash: "dashed"))
  for c in pts { circle(p(c.at(0), c.at(1)), radius: 4.5 * u, fill: white, stroke: 0.6pt) }
})
