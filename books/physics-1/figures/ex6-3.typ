// 习题 6·3 附图（原书 p.179）：第 1 题（六个受力图）、第 2 题（五个求合力的图）
// 矢量示意图，按原图用 CeTZ 重绘；坐标取自 200 dpi 页面显示图（宽 1568），内部乘 1.0657 换成真实像素。
#import "/common/series.typ": *

#let ex-helpers(p) = {
  let q(x, y) = p(x * 1.0657, y * 1.0657)
  let arr(a, b, w: 0.9pt) = cetz.draw.line(q(..a), q(..b), stroke: w, mark: (end: "stealth", fill: black, scale: 0.45))
  let lab(x, y, body, size: 8pt) = cetz.draw.content(q(x, y), anchor: "center", text(size: size, body))
  (q, arr, lab)
}

#let fig-ex-6-3-1(width: 9.5cm) = px-canvas(780, 520, width: width, origin: (500 * 1.0657, 735 * 1.0657), (p, u) => {
  import cetz.draw: *
  let (q, arr, lab) = ex-helpers(p)
  let box(x0, y0, x1, y1) = rect(q(x0, y1), q(x1, y0), stroke: 0.9pt)
  let dash(a, b) = line(q(..a), q(..b), stroke: (thickness: 0.5pt, dash: "dashed"))
  // (1)
  circle(q(600, 832), radius: 40 * 1.0657, stroke: 0.9pt)
  arr((560, 812), (533, 812)); arr((600, 832), (600, 905))
  lab(645, 905, $(1)$)
  // (2)
  box(722, 800, 792, 870)
  arr((760, 800), (760, 745)); arr((760, 845), (760, 905))
  lab(817, 908, $(2)$)
  // (3)
  box(903, 805, 990, 875)
  arr((903, 838), (845, 835)); arr((990, 860), (1055, 858))
  lab(945, 908, $(3)$)
  // (4)
  box(563, 1028, 635, 1098)
  arr((585, 1028), (585, 990)); arr((585, 1085), (585, 1128)); arr((635, 1060), (698, 1060))
  lab(673, 1120, $(4)$)
  // (5)
  box(818, 1015, 908, 1085)
  arr((818, 1048), (760, 1048)); arr((878, 1015), (903, 968))
  lab(858, 1123, $(5)$)
  // (6)
  box(1065, 910, 1185, 980)
  arr((1065, 945), (1000, 945))
  arr((1185, 910), (1230, 868)); arr((1185, 980), (1238, 1038))
  dash((1185, 915), (1275, 915)); dash((1185, 985), (1285, 985))
  lab(1228, 903, $alpha$); lab(1228, 995, $alpha$)
  lab(1115, 1010, $(6)$)
})

// 第 5 题：写实线图沿用原扫描裁剪（ex6-3b.png，已涂去 T、12 公斤、O、16 公斤），文字用 CeTZ 补回。
// 坐标是 ex6-3b.png 的像素坐标（1099×1312）；由页面显示图坐标换算：(x-600)×2.1314, (y-525)×2.1314。
#let fig-ex-6-3-5(width: 5.6cm) = px-canvas(1099, 1312, width: width, (p, u) => {
  import cetz.draw: *
  content(p(0, 0), anchor: "north-west", image("ex6-3b.png", width: 1099 * u))
  let d(x, y) = ((x - 600) * 2.1314, (y - 525) * 2.1314)
  let lab(x, y, body) = content(p(..d(x, y)), anchor: "center", text(size: 8pt, body))
  lab(765, 651, $T$); lab(895, 695, [12 公斤]); lab(802, 751, $O$); lab(790, 1120, [16 公斤])
})

#let fig-ex-6-3-2(width: 10cm) = px-canvas(840, 580, width: width, origin: (430 * 1.0657, 1330 * 1.0657), (p, u) => {
  import cetz.draw: *
  let (q, arr, lab) = ex-helpers(p)
  let kg(x, y, n) = lab(x, y, [#n 公斤])
  // (1)
  arr((490, 1480), (545, 1405)); arr((490, 1480), (437, 1550))
  circle(q(490, 1480), radius: 2.5, fill: black, stroke: none)
  kg(522, 1385, 2); kg(470, 1562, 2); lab(567, 1540, $(1)$)
  // (2)
  arr((720, 1500), (720, 1345)); arr((720, 1500), (720, 1580))
  circle(q(720, 1500), radius: 2.5, fill: black, stroke: none)
  kg(765, 1352, 3); kg(790, 1580, 1.5); lab(870, 1548, $(2)$)
  // (3)
  arr((1117, 1448), (945, 1448)); arr((1117, 1448), (1295, 1448)); arr((1117, 1478), (1117, 1620))
  rect(q(1090, 1478), q(1142, 1448), stroke: 0.9pt)
  kg(980, 1418, 3); kg(1257, 1420, 3); kg(1167, 1583, 3); lab(1253, 1545, $(3)$)
  // (4)
  circle(q(638, 1705), radius: 25, stroke: 0.9pt)
  arr((638, 1705), (638, 1615)); arr((638, 1705), (568, 1752)); arr((638, 1705), (710, 1752))
  kg(650, 1597, 2); kg(517, 1755, 2); kg(733, 1772, 2)
  lab(572, 1690, [$120°$]); lab(700, 1690, [$120°$]); lab(640, 1752, [$120°$])
  lab(770, 1724, $(4)$)
  // (5)
  arr((1005, 1750), (1005, 1665)); arr((1005, 1750), (1092, 1750)); arr((1005, 1750), (880, 1865))
  rect(q(1005, 1750), q(1030, 1725), stroke: 0.6pt)
  kg(1013, 1638, 2); kg(1090, 1782, 2); kg(930, 1858, 4)
  lab(983, 1740, $theta$); lab(1017, 1770, $theta'$); lab(1157, 1722, $(5)$)
})
