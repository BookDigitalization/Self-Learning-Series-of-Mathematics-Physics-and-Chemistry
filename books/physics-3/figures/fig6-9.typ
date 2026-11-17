// 图 6·9 天线电路里的振荡电流、图 6·10 调幅作用（原书 p.314–315）、图 6·11 调频波（原书 p.315）。
// CeTZ 重绘，波形由公式生成（只保留原图的形状特征：幅度、疏密、包络），坐标为 150 dpi 页面像素坐标。
#import "/common/series.typ": *
#import "fig6-parts.typ": *

#let fig-6-9(width: 8.4cm) = px-canvas(525, 225, origin: (335, 905), width: width, (p, u) => {
  import cetz.draw: *
  axes(p, 358, 1055, 845, 925, ybot: 1112)
  let pts = range(0, 835).map(i => p(358 + i / 2, 1055 + 50 * calc.cos(2 * calc.pi * i / 2 / 10.4)))
  line(..pts, stroke: 0.7pt)
  txt(p, 364, 924, $I$); txt(p, 345, 1060, $O$); txt(p, 842, 1045, $t$)
})

#let fig-6-10(width: 8.4cm) = px-canvas(570, 590, origin: (365, 195), width: width, (p, u) => {
  import cetz.draw: *
  // (a) 调制信号（声波）
  axes(p, 405, 340, 915, 232, ybot: 345)
  let a = range(0, 466).map(i => p(405 + i, 296 - 19 * calc.cos(2 * calc.pi * (i - 25) / 215)))
  line(..a, stroke: 1pt)
  txt(p, 408, 210, $P$); txt(p, 391, 337, $O$); txt(p, 928, 352, $t$, size: 8pt)
  txt(p, 668, 378, [($a$)])
  // (b) 载波
  axes(p, 398, 487, 915, 395, ybot: 520)
  let b = range(0, 920).map(i => p(398 + i / 2, 487 + 45 * calc.cos(2 * calc.pi * i / 2 / 12.2)))
  line(..b, stroke: 0.7pt)
  txt(p, 400, 375, $E$); txt(p, 386, 470, $O$); txt(p, 928, 490, $t$, size: 8pt)
  txt(p, 655, 556, [($b$)])
  // (c) 调幅波
  axes(p, 392, 655, 910, 565, ybot: 735)
  let env(x) = 46 + 18 * calc.cos(2 * calc.pi * (x - 420) / 215)
  let c = range(0, 940).map(i => {
    let x = 398 + i / 2
    p(x, 655 + env(x) * calc.cos(2 * calc.pi * i / 2 / 12.4))
  })
  line(..c, stroke: 0.7pt)
  let e1 = range(0, 466).map(i => p(398 + i, 655 - env(398 + i)))
  let e2 = range(0, 466).map(i => p(398 + i, 655 + env(398 + i)))
  line(..e1, stroke: (thickness: 0.5pt, dash: "dashed"))
  line(..e2, stroke: (thickness: 0.5pt, dash: "dashed"))
  line(p(697, 606), p(706, 596), stroke: 0.5pt)
  txt(p, 395, 548, $I$); txt(p, 378, 657, $O$); txt(p, 921, 680, $t$, size: 8pt)
  txt(p, 708, 597, $A$, size: 8pt)
  txt(p, 637, 762, [($c$)])
})

#let fig-6-11(width: 8.4cm) = px-canvas(545, 240, origin: (345, 975), width: width, (p, u) => {
  import cetz.draw: *
  axes(p, 372, 1148, 868, 1010, ybot: 1182)
  let period(x) = 11 + 24 * calc.exp(-calc.pow((x - 615) / 75, 2))
  let pts = ()
  let ph = 0
  for i in range(0, 840) {
    let x = 372 + i / 2
    pts.push(p(x, 1148 + 40 * calc.cos(ph)))
    ph += 2 * calc.pi / period(x) / 2
    if x > 795 { break }
  }
  line(..pts, stroke: 0.7pt)
  txt(p, 378, 988, $I$); txt(p, 358, 1146, $O$); txt(p, 877, 1141, $t$, size: 8pt)
})
