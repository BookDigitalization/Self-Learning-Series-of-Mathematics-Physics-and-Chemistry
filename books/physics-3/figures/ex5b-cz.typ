// 习题 5·6 第 4 题（p.288）、习题 5·7 第 4、5 题（p.297）的附图，CeTZ 重绘。
// 坐标为局部裁剪图的像素坐标（5·6：150 dpi 裁剪，375 × 428；5·7 第 4 题：150 dpi，908 × 218；第 5 题：200 dpi 页面坐标，原点 (900, 1700)）；位置、比例为目测近似。
#import "/common/series.typ": *
#import cetz.draw: *

#let T = 1.2pt
#let t = 0.8pt
#let ar2(s: 0.5) = (start: "stealth", end: "stealth", fill: black, scale: s)
#let ar(s: 0.5) = (end: "stealth", fill: black, scale: s)

#let zig(pts, amp) = {
  let out = ()
  for (i, q) in pts.enumerate() {
    let s = if i == 0 or i == pts.len() - 1 { 0 } else if calc.even(i) { amp } else { -amp }
    out.push((q.at(0) + s, q.at(1)))
  }
  out
}

// 线圈符号（一列圈，竖排）
#let coil(p, u, x, y0, y1, n, rx, ry) = {
  for i in range(n) {
    let y = y0 + (y1 - y0) * i / (n - 1)
    circle(p(x, y), radius: (rx * u, ry * u), stroke: 1pt)
  }
}

// ───────── 习题 5·6 第 4 题 ─────────
#let fig-ex-5-6-4(width: 3.9cm) = px-canvas(375, 385, width: width, (p, u) => {
  // 电池组：左边竖线，上下两组，中间虚线
  line(p(22, 22), p(213, 22), p(213, 50), stroke: T)
  let r = zig(range(0, 9).map(i => (213, 50 + i * 13.75)), 8)
  line(..r.map(a => p(a.at(0), a.at(1))), stroke: 0.9pt)
  content(p(186, 100), anchor: "center", text(size: 9pt, $italic(R)$))
  line(p(22, 22), p(22, 100), stroke: T)
  for (y, w) in ((100, 22), (112, 12), (124, 22), (136, 12)) {
    line(p(22 - w, y), p(22 + w, y), stroke: if w > 15 { 1.6pt } else { 2.4pt })
  }
  line(p(22, 136), p(22, 148), stroke: T)
  line(p(22, 150), p(22, 228), stroke: (thickness: 0.8pt, dash: "dashed"))
  line(p(22, 228), p(22, 232), stroke: T)
  for (y, w) in ((232, 22), (244, 12), (256, 22), (268, 12)) {
    line(p(22 - w, y), p(22 + w, y), stroke: if w > 15 { 1.6pt } else { 2.4pt })
  }
  line(p(22, 268), p(22, 352), p(207, 352), stroke: T)
  content(p(50, 183), anchor: "center", text(size: 10pt, $cal(E)$))
  content(p(50, 207), anchor: "center", text(size: 8pt, $r$))
  // 电动机与伏特计
  line(p(213, 156), p(207, 177), stroke: T)
  line(p(207, 177), p(298, 177), p(298, 235), stroke: T)
  circle(p(207, 177), radius: 4 * u, stroke: none, fill: black)
  line(p(207, 177), p(207, 232), stroke: T)
  circle(p(207, 254), radius: 22 * u, stroke: T, fill: white)
  content(p(207, 254), anchor: "center", text(size: 9.5pt, $italic(M)$))
  line(p(207, 276), p(207, 352), stroke: T)
  circle(p(298, 257), radius: 22 * u, stroke: T, fill: white)
  content(p(298, 257), anchor: "center", text(size: 9.5pt, $italic(V)$))
  line(p(298, 279), p(298, 352), p(207, 352), stroke: T)
  circle(p(207, 352), radius: 4 * u, stroke: none, fill: black)
})

// ───────── 习题 5·7 第 4 题 ─────────
#let fig-ex-5-7-4(width: 11cm) = px-canvas(908, 205, width: width, (p, u) => {
  let dash = (thickness: 1pt, dash: "dashed")
  // 甲：升压变压器
  line(p(78, 40), p(78, 5), p(245, 5), p(245, 165), p(78, 165), p(78, 132), stroke: dash)
  line(p(25, 40), p(78, 40), stroke: dash)
  line(p(25, 132), p(78, 132), stroke: dash)
  line(p(78, 40), p(138, 40), p(138, 48), stroke: T)
  line(p(78, 132), p(138, 132), p(138, 112), stroke: T)
  coil(p, u, 146, 62, 108, 4, 12, 9)
  line(p(163, 38), p(163, 135), stroke: 1pt)
  line(p(169, 38), p(169, 135), stroke: 1pt)
  coil(p, u, 186, 62, 118, 5, 12, 9)
  line(p(186, 40), p(245, 40), stroke: T)
  line(p(186, 132), p(245, 132), stroke: T)
  // 输电线
  line(p(245, 40), p(402, 40), stroke: dash)
  line(p(245, 132), p(402, 132), stroke: dash)
  // 乙：降压变压器
  line(p(402, 40), p(402, 8), p(565, 8), p(565, 150), p(402, 150), p(402, 132), stroke: dash)
  line(p(402, 40), p(460, 40), stroke: T)
  line(p(402, 132), p(460, 132), stroke: T)
  coil(p, u, 466, 62, 118, 5, 12, 9)
  line(p(485, 38), p(485, 135), stroke: 1pt)
  line(p(491, 38), p(491, 135), stroke: 1pt)
  coil(p, u, 508, 62, 108, 4, 12, 9)
  line(p(508, 40), p(850, 40), stroke: T)
  line(p(508, 132), p(850, 132), stroke: T)
  // 灯泡
  for x in (627, 675, 723, 770, 810) {
    line(p(x, 40), p(x, 132), stroke: 0.8pt)
    circle(p(x, 40), radius: 3.5 * u, stroke: none, fill: black)
    circle(p(x, 132), radius: 3.5 * u, stroke: none, fill: black)
    circle(p(x, 86), radius: 17 * u, stroke: 1pt, fill: white)
    line(p(x - 12, 74), p(x + 12, 98), stroke: 1pt)
    line(p(x - 12, 98), p(x + 12, 74), stroke: 1pt)
  }
  content(p(167, 190), anchor: "center", text(size: 10pt)[甲])
  content(p(487, 186), anchor: "center", text(size: 10pt)[乙])
})

// ───────── 习题 5·7 第 5 题 ─────────
#let fig-ex-5-7-5(width: 6.2cm) = px-canvas(580, 400, origin: (900, 1700), width: width, (p, u) => {
  let lab(x, y, body) = content(p(x, y), anchor: "center", text(size: 8.5pt, weight: "bold", body))
  // 原线圈
  line(p(980, 1745), p(980, 1810), p(990, 1820), stroke: T)
  line(p(1398, 1745), p(1398, 1810), p(1390, 1820), stroke: T)
  for i in range(22) {
    circle(p(1000 + i * 18.6, 1822), radius: (11 * u, 13 * u), stroke: 1pt)
  }
  line(p(985, 1768), p(1390, 1768), stroke: 0.9pt, mark: ar2(s: 0.5))
  rect(p(1130, 1755), p(1235, 1782), stroke: none, fill: white)
  lab(1182, 1768, $220 italic(V)$)
  // 铁芯
  line(p(940, 1852), p(1440, 1852), stroke: 1.2pt)
  line(p(940, 1862), p(1440, 1862), stroke: 1.2pt)
  // 副线圈
  line(p(932, 2062), p(932, 1910), p(942, 1895), stroke: T)
  line(p(1455, 2062), p(1455, 1910), p(1445, 1895), stroke: T)
  for i in range(28) {
    circle(p(955 + i * 17.8, 1897), radius: (11 * u, 13 * u), stroke: 1pt)
  }
  // 电压标注
  line(p(938, 1945), p(1062, 1945), stroke: 0.9pt, mark: ar2(s: 0.5))
  line(p(1062, 1905), p(1062, 1972), stroke: 0.9pt)
  rect(p(945, 1930), p(1040, 1960), stroke: none, fill: white)
  lab(990, 1945, [5 伏特])
  line(p(938, 1996), p(1098, 1996), stroke: 0.9pt, mark: ar2(s: 0.5))
  line(p(1098, 1905), p(1098, 2005), stroke: 0.9pt)
  rect(p(945, 1981), p(1055, 2011), stroke: none, fill: white)
  lab(1000, 1996, [6.3 伏特])
  line(p(932, 2050), p(1450, 2050), stroke: 0.9pt, mark: ar2(s: 0.5))
  line(p(932, 2005), p(932, 2075), stroke: 0.9pt)
  line(p(1455, 2005), p(1455, 2075), stroke: 0.9pt)
  rect(p(1120, 2036), p(1260, 2064), stroke: none, fill: white)
  lab(1190, 2050, [350 伏特])
})
