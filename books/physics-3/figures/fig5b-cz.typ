// 第 5 章下篇 CeTZ 重绘：图 5·20、5·21、5·23、5·24、5·26、5·27 及习题 5·6、5·7 的电路附图。
// 坐标取自原书页面像素（图 5·20/5·21/5·23/5·26 用 200 dpi 页面坐标；5·24、5·27 和习题电路图用 150/140 dpi 局部裁剪图的像素坐标，见各图注释），y 向下；位置、比例为目测近似，字母、数字照原图。
#import "/common/series.typ": *
#import cetz.draw: *

#let T = 1.2pt
#let t = 0.7pt
#let ar(s: 0.5) = (end: "stealth", fill: black, scale: s)
#let ar2(s: 0.5) = (start: "stealth", end: "stealth", fill: black, scale: s)
#let sub(body) = text(size: 6pt, weight: "bold", body)

// 沿给定点列画锯齿（电阻）：相邻点交替向法线两侧偏移 amp
#let zigzag(pts, amp, ..style) = {
  let out = ()
  for (i, q) in pts.enumerate() {
    let a = if i == 0 { pts.at(0) } else { pts.at(i - 1) }
    let b = if i == pts.len() - 1 { pts.at(i) } else { pts.at(i + 1) }
    let dx = b.at(0) - a.at(0)
    let dy = b.at(1) - a.at(1)
    let l = calc.sqrt(dx * dx + dy * dy)
    let s = if i == 0 or i == pts.len() - 1 { 0 } else if calc.even(i) { amp } else { -amp }
    out.push((q.at(0) - dy / l * s, q.at(1) + dx / l * s))
  }
  out
}

// 沿 y = base − amp·|sin| 的半波（x 自 xa 到 xb）
#let lobe(xa, xb, base, amp, n: 40) = range(n + 1).map(i => {
  let x = xa + (xb - xa) * i / n
  (x, base - amp * calc.sin(calc.pi * i / n))
})

// ───────── 图 5·20 单向脉动电流（p.281）─────────
#let fig-5-20(width: 7.4cm) = px-canvas(800, 480, origin: (440, 255), width: width, (p, u) => {
  let pp(pts) = pts.map(q => p(q.at(0), q.at(1)))
  let base = 525
  line(p(472, 722), p(472, 292), stroke: 1.3pt, mark: ar(s: 0.6))
  line(p(472, 525), p(472, 722), stroke: 2.5pt)
  line(p(458, 525), p(1190, 525), stroke: 1.3pt, mark: ar(s: 0.6))
  content(p(485, 290), anchor: "west", text(size: 9pt, $I$))
  content(p(452, 540), anchor: "east", text(size: 9pt, $O$))
  content(p(1205, 530), anchor: "west", text(size: 9pt, $t$))
  for (a, b) in ((472, 689), (689, 915), (915, 1123)) {
    line(..pp(lobe(a, b, base, 185)), stroke: 1.6pt)
  }
  for (a, b) in ((472, 689), (915, 1123)) {
    line(..pp(lobe(a + 4, b + 2, base, 178)), stroke: (thickness: 1pt, dash: "dashed"))
  }
  line(..pp(lobe(689, 915, base, -178)), stroke: (thickness: 1.2pt, dash: "dashed"))
})

// ───────── 图 5·21 两相电流叠加（p.281）─────────
#let fig-5-21(width: 6.6cm) = px-canvas(660, 380, origin: (780, 1225), width: width, (p, u) => {
  let pp(pts) = pts.map(q => p(q.at(0), q.at(1)))
  let base = 1520
  let amp = 142
  line(p(817, 1568), p(817, 1237), stroke: 1.2pt, mark: ar(s: 0.6))
  line(p(817, 1520), p(817, 1568), stroke: 2.2pt)
  line(p(805, 1520), p(1385, 1520), stroke: 1.2pt, mark: ar(s: 0.6))
  content(p(805, 1240), anchor: "east", text(size: 9pt, $I$))
  content(p(800, 1530), anchor: "east", text(size: 9pt, $O$))
  content(p(1400, 1526), anchor: "west", text(size: 9pt, $t$))
  let L = 166
  // 每条细线：半波，P 的零点在 905 + 166k，Q 的零点在 822 + 166k
  let P(x) = amp * calc.abs(calc.sin(calc.pi * (x - 905) / L))
  let Q(x) = amp * calc.abs(calc.sin(calc.pi * (x - 822) / L))
  let xs = range(0, 301).map(i => 822 + i * 500 / 300)
  line(..pp(xs.map(x => (x, base - P(x)))), stroke: 1pt)
  line(..pp(xs.map(x => (x, base - Q(x)))), stroke: 1pt)
  line(..pp(xs.map(x => (x, base - P(x) - Q(x)))), stroke: 2.2pt)
  line(p(1325, 1298), p(1325, 1580), stroke: (thickness: 1.6pt, dash: "dashed"))
})

// ───────── 图 5·23 说明磁场力做功的图（p.285）─────────
#let fig-5-23(width: 6.2cm) = px-canvas(470, 300, origin: (960, 990), width: width, (p, u) => {
  for y in (1027, 1093, 1151, 1212, 1275) {
    line(p(975, y), p(1385, y), stroke: 1pt, mark: ar(s: 0.5))
  }
  content(p(1415, 1025), anchor: "center", text(size: 10pt, $bold(italic(H))$))
  // 圆（虚线）
  circle(p(1170, 1150), radius: 135 * u, stroke: (thickness: 1.4pt, dash: (array: (6 * u, 4 * u))))
  // 导线截面：⊗ 与 ⊙
  circle(p(1237, 1058), radius: 22 * u, stroke: 1.2pt, fill: white)
  line(p(1221, 1042), p(1253, 1074), stroke: 1.2pt)
  line(p(1221, 1074), p(1253, 1042), stroke: 1.2pt)
  circle(p(1100, 1252), radius: 22 * u, stroke: 1.2pt, fill: white)
  circle(p(1100, 1252), radius: 5 * u, stroke: none, fill: black)
  // F 与 v
  line(p(1237, 1090), p(1237, 1165), stroke: 1pt, mark: ar(s: 0.5))
  content(p(1212, 1135), anchor: "center", text(size: 9pt, $F$))
  line(p(1237, 1058), p(1387, 1152), stroke: 1pt, mark: ar(s: 0.5))
  content(p(1405, 1128), anchor: "center", text(size: 9pt, $v$))
  // 夹角 α（F 与 v）、β（v 与 H）
  arc(p(1237, 1058), start: -90deg, stop: -32.5deg, radius: 40 * u, anchor: "origin", stroke: 0.8pt)
  content(p(1266, 1085), anchor: "center", text(size: 9pt, $alpha$))
  arc(p(1237, 1058), start: -32.5deg, stop: 0deg, radius: 68 * u, anchor: "origin", stroke: 0.8pt)
  arc(p(1237, 1058), start: -32.5deg, stop: 0deg, radius: 74 * u, anchor: "origin", stroke: 0.8pt)
  content(p(1318, 1058), anchor: "center", text(size: 9pt, $beta$))
})

// ───────── 图 5·24 起动电阻示意图（p.287）─────────
// 坐标：140 dpi 级的局部裁剪图（原点为裁剪图左上，705 × 435），下面的 q 把裁剪图像素直接作画布坐标。
#let fig-5-24(width: 8.4cm) = px-canvas(705, 435, width: width, (p, u) => {
  let q = p
  // 电动机 M
  circle(q(68, 160), radius: 40 * u, stroke: T, fill: white)
  content(q(68, 160), anchor: "center", text(size: 10pt, $italic(M)$))
  rect(q(58, 124), q(78, 132), stroke: none, fill: black)
  rect(q(58, 200), q(78, 208), stroke: none, fill: black)
  // 外接导线
  line(q(68, 124), q(68, 30), q(493, 30), q(493, 128), q(580, 128), stroke: T)
  line(q(68, 208), q(68, 385), q(170, 385), q(170, 118), q(385, 118), q(385, 160), stroke: T)
  line(q(415, 367), q(493, 367), q(493, 181), q(580, 181), stroke: T)
  circle(q(585, 128), radius: 5 * u, stroke: t, fill: white)
  circle(q(585, 181), radius: 5 * u, stroke: t, fill: white)
  content(q(603, 126), anchor: "center", text(size: 10pt, weight: "bold")[+])
  content(q(603, 180), anchor: "center", text(size: 10pt, weight: "bold")[−])
  content(q(625, 157), anchor: "west", text(size: 8.5pt)[电源])
  // 变阻器：绕枢轴 (405, 367) 的圆弧上的锯齿
  let pivot = (405, 367)
  let at(r, th) = (pivot.at(0) + r * calc.cos(th * 1deg), pivot.at(1) - r * calc.sin(th * 1deg))
  let arcpts = range(0, 23).map(i => at(208, 95 + i * 3.4))
  line(..zigzag(arcpts, 7).map(a => q(a.at(0), a.at(1))), stroke: 0.9pt)
  for (r, th) in ((165, 110.6), (160, 130), (155, 148.9), (143, 169)) {
    let a = at(r, th)
    let b = at(204, th)
    line(q(a.at(0), a.at(1)), q(b.at(0), b.at(1)), stroke: 0.8pt)
    circle(q(a.at(0), a.at(1)), radius: 4.5 * u, stroke: none, fill: black)
  }
  content(q(250, 203), anchor: "center", text(size: 9pt, $italic(R)$))
  // 转动臂：实线位置（水平）与虚线位置
  line(q(262, 360), q(398, 358), stroke: 0.9pt)
  line(q(262, 384), q(398, 378), stroke: 0.9pt)
  arc(q(262, 372), start: 90deg, stop: 270deg, radius: 12 * u, anchor: "origin", stroke: 0.9pt)
  circle(q(262, 372), radius: 7 * u, stroke: 0.8pt, fill: white)
  circle(q(262, 372), radius: 2 * u, stroke: none, fill: black)
  circle(q(405, 367), radius: 9 * u, stroke: 1pt, fill: white)
  circle(q(405, 367), radius: 3.5 * u, stroke: none, fill: black)
  line(q(383, 360), q(383, 218), stroke: (thickness: 0.9pt, dash: "dashed"))
  line(q(414, 360), q(414, 218), stroke: (thickness: 0.9pt, dash: "dashed"))
  arc(q(398, 218), start: 0deg, stop: 180deg, radius: 15 * u, anchor: "origin", stroke: (thickness: 0.9pt, dash: "dashed"))
  circle(q(397, 207), radius: 5 * u, stroke: none, fill: black)
  line(q(385, 160), q(397, 204), stroke: 0.9pt)
  // “开始时”及转向箭头
  arc(q(263, 372), start: 130deg, stop: 250deg, radius: 26 * u, anchor: "origin", stroke: 0.9pt, mark: (end: "stealth", fill: black, scale: 0.4))
  content(q(265, 405), anchor: "center", text(size: 8.5pt)[开始时])
})

// ───────── 图 5·26 自耦变压器（p.291）─────────
#let fig-5-26(width: 6.4cm) = px-canvas(560, 440, origin: (930, 1040), width: width, (p, u) => {
  // 线圈：竖直排列的圈
  let n = 17
  for i in range(n) {
    let y = 1078 + i * 22.4
    circle(p(1205, y), radius: (18 * u, 12 * u), stroke: 1pt)
  }
  // 铁芯
  line(p(1238, 1090), p(1238, 1430), stroke: 1pt)
  line(p(1246, 1090), p(1246, 1430), stroke: 1pt)
  // 导线与端钮
  line(p(972, 1070), p(1410, 1070), stroke: T)
  line(p(972, 1255), p(1187, 1255), stroke: T)
  line(p(1205, 1448), p(1410, 1448), stroke: T)
  for (x, y) in ((967, 1070), (1415, 1070), (967, 1255), (1415, 1448)) {
    circle(p(x, y), radius: 6 * u, stroke: t, fill: white)
  }
  content(p(935, 1066), anchor: "center", text(size: 10pt, $italic(A)$))
  content(p(1440, 1066), anchor: "center", text(size: 10pt, $italic(A)$))
  content(p(935, 1252), anchor: "center", text(size: 10pt, $italic(B)$))
  content(p(1440, 1446), anchor: "center", text(size: 10pt, $italic(C)$))
  // 尺寸线
  line(p(1047, 1074), p(1047, 1251), stroke: 0.8pt, mark: ar2(s: 0.5))
  rect(p(1008, 1145), p(1128, 1185), stroke: none, fill: white)
  content(p(1068, 1165), anchor: "center", text(size: 9pt)[110 伏特])
  line(p(1350, 1074), p(1350, 1444), stroke: 0.8pt, mark: ar2(s: 0.5))
  rect(p(1300, 1240), p(1425, 1285), stroke: none, fill: white)
  content(p(1362, 1262), anchor: "center", text(size: 9pt)[220 伏特])
})

// ───────── 图 5·27 输电路上电压分布情况（p.294）─────────
// 坐标：140 dpi 局部裁剪图（581 × 455）像素。
#let fig-5-27(width: 7.6cm) = px-canvas(595, 385, width: width, (p, u) => {
  let dash = (thickness: 1.2pt, dash: "dashed")
  line(p(80, 72), p(515, 72), stroke: dash)
  line(p(33, 328), p(515, 328), stroke: 1.8pt)
  // 发电机 G
  line(p(82, 72), p(82, 175), stroke: T)
  circle(p(82, 197), radius: 22 * u, stroke: T, fill: white)
  content(p(82, 197), anchor: "center", text(size: 10pt, $italic(G)$))
  line(p(82, 219), p(82, 232), p(88, 242), p(88, 378), stroke: T)
  // 负载
  line(p(507, 72), p(507, 122), stroke: T)
  rect(p(487, 122), p(527, 272), stroke: T, fill: white)
  content(p(507, 160), anchor: "center", text(size: 10pt)[负])
  content(p(507, 232), anchor: "center", text(size: 10pt)[载])
  line(p(507, 272), p(507, 328), stroke: T)
  // 尺寸线
  line(p(33, 72), p(70, 72), stroke: 0.7pt)
  line(p(45, 76), p(45, 324), stroke: 0.8pt, mark: ar2(s: 0.5))
  content(p(30, 197), anchor: "center", text(size: 9pt)[#h(0pt)$V$#sub[端]])
  line(p(527, 72), p(580, 72), stroke: 0.7pt)
  line(p(527, 328), p(580, 328), stroke: 0.7pt)
  line(p(566, 76), p(566, 324), stroke: 0.8pt, mark: ar2(s: 0.5))
  content(p(544, 197), anchor: "center", text(size: 9pt)[#h(0pt)$V$#sub[载]])
  line(p(82, 45), p(505, 45), stroke: 0.8pt, mark: ar2(s: 0.5))
  rect(p(255, 28), p(335, 62), stroke: none, fill: white)
  content(p(295, 45), anchor: "center", text(size: 9pt, [$1 / 2 V$#sub[线]]))
  line(p(82, 357), p(505, 357), stroke: 0.8pt, mark: ar2(s: 0.5))
  rect(p(255, 340), p(335, 374), stroke: none, fill: white)
  content(p(295, 357), anchor: "center", text(size: 9pt, [$1 / 2 V$#sub[线]]))
})
