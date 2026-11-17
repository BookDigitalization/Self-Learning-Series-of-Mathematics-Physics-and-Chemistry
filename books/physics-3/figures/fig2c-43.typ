// 图 2·43 接触电动势（原书 p.153）、图 2·44 伏打电池的电动势（p.154）
// 坐标：这两幅图 300 dpi 局部截图的像素坐标（y 向下）；形状、位置按原图描。
#import "/common/series.typ": *
#import "fig2c-sym.typ": *

#let hatch = tiling(size: (4pt, 4pt), place(line(start: (0%, 100%), end: (100%, 0%), stroke: 0.45pt)))
#let K = 2.65
#let sg = text.with(size: 8pt)
#let h-plus = $"H"^+$
#let so4 = $"SO"_4^(- -)$
#let h2so4 = $"H"_2"SO"_4$
#let zn-ion = $("Zn"^(+ +))$
#let big-plus(p, x, y) = lab(p, x, y, $+$, size: 8pt)
#let dashln(p, ..pts) = {
  import cetz.draw: *
  line(..pts.pos().map(a => p(..a)), stroke: (thickness: 0.6pt, dash: (4pt, 2.5pt)))
}
#let thick(p, ..pts) = {
  import cetz.draw: *
  line(..pts.pos().map(a => p(..a)), stroke: 1.6pt)
}

#let fig-2-43(width: 7.6cm) = px-canvas(1030, 1190, width: width, (p, u) => {
  import cetz.draw: *
  beaker(p, 222, 920, 80, 535, 130, rows: 11, k: K)
  rect(p(515, 30), p(638, 440), fill: hatch, stroke: lw)
  for y in (165, 225, 285, 350, 410) {
    big-plus(p, 490, y)
    big-plus(p, 656, y)
  }
  lab(p, 572, 270, $"Zn"$, bg: true)
  lab(p, 575, 355, $-$, size: 11pt, bg: true)
  lab(p, 375, 270, h-plus, bg: true)
  lab(p, 375, 345, so4, bg: true)
  lab(p, 385, 410, h2so4, bg: true)
  lab(p, 752, 270, h-plus, bg: true)
  lab(p, 755, 350, so4, bg: true)
  lab(p, 765, 410, h2so4, bg: true)
  big-plus(p, 545, 458)
  big-plus(p, 603, 458)
  lab(p, 578, 497, zn-ion, bg: true)
  lab(p, 85, 320, $(a)$)
  lab(p, 85, 805, $(b)$)
  // (b) 电势图
  dashln(p, (222, 540), (222, 710))
  dashln(p, (515, 540), (515, 710))
  dashln(p, (638, 540), (638, 710))
  dashln(p, (918, 540), (918, 710))
  thick(p, (225, 710), (515, 710), (515, 1010), (640, 1010), (640, 710), (920, 710))
  dashln(p, (230, 1010), (515, 1010))
  dashln(p, (640, 1010), (815, 1010))
  line(p(225, 710), p(225, 1085), stroke: 1.6pt)
  line(p(225, 1085), p(940, 1085), stroke: 1.6pt, mark: (end: "o", fill: black, scale: 0.35))
  line(p(710, 712), p(710, 1008), stroke: 0.7pt, mark: (start: arr.end, end: arr.end, fill: black, scale: 0.45))
  lab(p, 175, 710, $U_"液"$)
  lab(p, 175, 1010, $U_"锌"$)
  lab(p, 855, 885, $cal(E)_1 "（接触电动势）"$, bg: true)
})

#let fig-2-44(width: 7.6cm) = px-canvas(1060, 1200, width: width, (p, u) => {
  import cetz.draw: *
  beaker(p, 140, 905, 185, 625, 225, rows: 11, k: K)
  rect(p(218, 98), p(300, 525), fill: hatch, stroke: lw)
  rect(p(752, 98), p(828, 522), fill: white, stroke: lw)
  lab(p, 258, 62, $"Zn"$, size: 8pt)
  lab(p, 790, 62, $"Cu"$, size: 8pt)
  lab(p, 260, 385, $-$, size: 11pt, bg: true)
  lab(p, 795, 385, $+$, size: 11pt, bg: true)
  for y in (255, 318, 378, 437, 495) {
    big-plus(p, 203, y)
    big-plus(p, 320, y)
  }
  for y in (255, 318, 378, 437, 495) {
    lab(p, 742, y, $-$, size: 8pt)
  }
  for y in (255, 315, 378) {
    lab(p, 855, y, $-$, size: 8pt)
  }
  lab(p, 520, 350, h-plus, bg: true)
  lab(p, 500, 425, so4, bg: true)
  lab(p, 520, 497, h2so4, bg: true)
  big-plus(p, 237, 543)
  big-plus(p, 283, 543)
  lab(p, 255, 582, zn-ion, bg: true)
  lab(p, 790, 582, $("SO"_4^(- -))$, bg: true)
  lab(p, 1030, 430, $(a)$)
  lab(p, 1030, 1010, $(b)$)
  // (b) 电势图
  dashln(p, (218, 630), (218, 820))
  dashln(p, (300, 630), (300, 820))
  dashln(p, (765, 630), (765, 688))
  dashln(p, (825, 630), (825, 688))
  dashln(p, (905, 630), (905, 820))
  thick(p, (145, 820), (218, 820), (218, 1100), (300, 1100), (300, 820), (765, 820), (765, 688), (825, 688), (825, 820), (905, 820))
  dashln(p, (148, 688), (765, 688))
  dashln(p, (148, 1100), (218, 1100))
  dashln(p, (300, 1100), (470, 1100))
  line(p(145, 630), p(145, 1185), stroke: 1.6pt)
  line(p(145, 1185), p(905, 1185), stroke: 1.6pt)
  line(p(440, 690), p(440, 1098), stroke: 0.7pt, mark: (start: arr.end, end: arr.end, fill: black, scale: 0.45))
  line(p(350, 822), p(350, 1098), stroke: 0.7pt, mark: (start: arr.end, end: arr.end, fill: black, scale: 0.45))
  line(p(868, 690), p(868, 818), stroke: 0.7pt, mark: (start: arr.end, end: arr.end, fill: black, scale: 0.45))
  lab(p, 97, 688, $U_"铜"$)
  lab(p, 97, 822, $U_"液"$)
  lab(p, 97, 1105, $U_"锌"$)
  lab(p, 520, 880, $cal(E) = cal(E)_1 + cal(E)_2$, bg: true)
  lab(p, 365, 975, $cal(E)_1$, bg: true)
  lab(p, 905, 770, $cal(E)_2$, bg: true)
})
