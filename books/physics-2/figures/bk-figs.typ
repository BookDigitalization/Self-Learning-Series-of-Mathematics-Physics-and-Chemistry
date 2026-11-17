// 书末插图（总复习题 p.346 第 31 题附图 + 习题 8·1 第 7 题答案附图 p.353–354），全部用 CeTZ 重绘。
// 坐标是原书页面 200 dpi 的像素坐标（y 向下），位置、比例为目测近似，几何关系、字母、数字照原图。
#import "/common/series.typ": *
#import cetz.draw: *

#let T = 1.2pt           // 粗线
#let t = 0.7pt           // 细线
#let ar(s: 0.55) = (end: "stealth", fill: black, scale: s)
#let lab(p, x, y, body, size: 9pt) = content(p(x, y), anchor: "center", text(size: size, body))

// ───────── 总复习题 第 31 题 p.346（测定表面张力系数的仪器）─────────
#let bk-r31(width: 3cm) = px-canvas(190, 500, origin: (160, 810), width: width, (p, u) => {
  // 刻度尺 S：斜面带短斜线
  line(p(200, 828), p(232, 822), p(246, 1195), p(208, 1200), close: true, fill: white, stroke: T)
  line(p(196, 833), p(200, 828), stroke: t)
  line(p(196, 833), p(204, 1203), p(208, 1200), stroke: t)
  let y = 846
  while y < 1180 {
    let dx = (y - 828) * 0.036
    line(p(205 + dx, y + 7), p(220 + dx, y - 5), stroke: 0.5pt)
    y += 13
  }
  // 弹簧 A
  line(p(232, 858), p(263, 858), stroke: t)
  circle(p(268, 857), radius: 5 * u, stroke: T, fill: white)
  line(p(268, 862), p(268, 880), stroke: t)
  let y = 886
  while y < 1122 {
    circle(p(268, y), radius: (11 * u, 4.5 * u), stroke: 0.8pt)
    y += 10
  }
  line(p(268, 1122), p(268, 1140), stroke: t)
  // 圆环 K
  circle(p(268, 1148), radius: (16 * u, 6 * u), stroke: T)
  line(p(259, 1144), p(277, 1152), stroke: t)
  line(p(259, 1152), p(277, 1144), stroke: t)
  // 指针 Z
  line(p(260, 1148), p(234, 1148), stroke: 1pt, mark: ar(s: 0.5))
  // 支架：夹块、台面、立柱、底座
  rect(p(196, 1188), p(246, 1216), stroke: T, fill: white)
  circle(p(200, 1196), radius: 4 * u, stroke: t)
  line(p(246, 1194), p(338, 1199), p(318, 1214), p(246, 1216), stroke: T, fill: white)
  line(p(208, 1216), p(210, 1285), stroke: T)
  line(p(238, 1216), p(240, 1262), stroke: T)
  line(p(177, 1290), p(325, 1250), p(342, 1258), p(342, 1270), p(190, 1303), p(177, 1296), close: true, stroke: T, fill: white)
  // 容器 B
  line(p(246, 1182), p(246, 1204), stroke: T)
  line(p(308, 1182), p(308, 1204), stroke: T)
  circle(p(277, 1204), radius: (31 * u, 8 * u), stroke: T, fill: white)
  rect(p(246, 1180), p(308, 1203), stroke: none, fill: white)
  line(p(246, 1182), p(246, 1204), stroke: T)
  line(p(308, 1182), p(308, 1204), stroke: T)
  circle(p(277, 1182), radius: (31 * u, 9 * u), stroke: T, fill: white)
  line(p(256, 1192), p(272, 1192), stroke: 0.5pt)
  line(p(280, 1196), p(298, 1196), stroke: 0.5pt)
  line(p(258, 1199), p(274, 1199), stroke: 0.5pt)
  lab(p, 243, 1022, $S$, size: 10pt)
  lab(p, 288, 1022, $A$, size: 10pt)
  lab(p, 244, 1117, $Z$, size: 10pt)
  lab(p, 293, 1147, $K$, size: 10pt)
  lab(p, 318, 1172, $B$, size: 10pt)
})

// ───────── 习题 8·1 答案第 7 题 p.354（p–V 图线）─────────
#let bk-a8-1(width: 7cm) = px-canvas(760, 260, origin: (150, 150), width: width, (p, u) => {
  let X(v) = 230 + 63.5 * v
  let Y(pr) = 360 - 65 * pr
  // 坐标轴
  line(p(230, 360), p(230, 165), stroke: 1.2pt, mark: ar(s: 0.6))
  line(p(230, 360), p(890, 350), stroke: 1.2pt, mark: ar(s: 0.6))
  for k in range(0, 10) {
    line(p(X(k), 360 - k * 0.15), p(X(k), 349 - k * 0.15), stroke: t)
    lab(p, X(k), 370 - k * 0.15, text(weight: "bold")[#k], size: 8pt)
  }
  for k in (1, 2) {
    line(p(230, Y(k)), p(238, Y(k)), stroke: t)
    lab(p, 218, Y(k), text(weight: "bold")[#k], size: 8pt)
  }
  // 图线：等压 2→4 升（1 大气压）；等容升压至 2 大气压；等温 4→8 升
  line(p(X(2), Y(1)), p(X(4), Y(1)), stroke: 2pt)
  line(p(X(4), Y(1)), p(X(4), Y(2)), stroke: 2pt)
  let pts = range(0, 21).map(i => {
    let v = 4 + i * 0.2
    (X(v), Y(8 / v))
  })
  line(..pts.map(q => p(..q)), stroke: 2pt)
  for (v, pr) in ((2, 1), (4, 1), (4, 2), (6, 8 / 6), (8, 1)) {
    circle(p(X(v), Y(pr)), radius: 4.5 * u, fill: black, stroke: none)
  }
  content(p(178, 250), angle: 90deg, anchor: "center", text(size: 8pt, weight: "bold")[$P$(大气压)])
  lab(p, 567, 395, text(weight: "bold")[$V$(升)], size: 8pt)
})
