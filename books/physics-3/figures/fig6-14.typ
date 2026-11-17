// 图 6·14（原书 p.318）：外来已调幅波、检波后的波形、检波后的电流。
// CeTZ 重绘，波形由公式生成（保留幅度、疏密、包络特征），坐标为 150 dpi 页面像素坐标。
#import "/common/series.typ": *
#import "fig6-parts.typ": *

#let fig-6-14(width: 9cm) = px-canvas(510, 660, origin: (325, 930), width: width, (p, u) => {
  import cetz.draw: *
  let env(x) = 54 + 22 * calc.cos(2 * calc.pi * (x - 395) / 205)
  let per = 12.7
  let ph(i) = 2 * calc.pi * i / 2 / per
  // (a)
  axes(p, 343, 1030, 826, 940, ybot: 1125)
  line(..range(0, 920).map(i => {
    let x = 346 + i / 2
    p(x, 1030 + env(x) * calc.cos(ph(i)))
  }), stroke: 0.7pt)
  txt(p, 510, 1127, [($a$)外来已调幅波], size: 9pt)
  // (b)
  axes(p, 343, 1312, 826, 1205, ybot: 1318)
  line(..range(0, 920).map(i => {
    let x = 346 + i / 2
    p(x, 1312 - 0.92 * env(x) * calc.max(0, calc.cos(ph(i))))
  }), stroke: 0.7pt)
  txt(p, 515, 1350, [($b$)检波后的波形], size: 9pt)
  // (c)
  axes(p, 343, 1517, 826, 1415, ybot: 1555)
  line(..range(0, 920).map(i => {
    let x = 346 + i / 2
    p(x, 1517 - 0.92 * env(x) * calc.max(0, calc.cos(ph(i))))
  }), stroke: 0.7pt)
  line(..range(0, 480).map(i => {
    let x = 346 + i
    p(x, 1517 - 0.3 * env(x))
  }), stroke: 0.5pt)
  txt(p, 495, 1423, [高频振荡电流], size: 9pt)
  txt(p, 680, 1423, [低频单向电流], size: 9pt)
  line(p(560, 1432), p(566, 1445), stroke: 0.4pt)
  line(p(626, 1432), p(618, 1456), stroke: 0.4pt)
  txt(p, 515, 1562, [($c$)检波后的电流], size: 9pt)
})
