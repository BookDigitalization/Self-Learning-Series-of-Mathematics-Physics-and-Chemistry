// 图 1·34–1·37 电容器的连接（原书 p.63–67）。CeTZ 重绘；坐标取自 150 dpi 页面图。
#import "fig1b-lib.typ": *

// 图 1·34 电容器并联
#let fig-1-34(width: 5cm) = px-canvas(320, 400, origin: (780, 210), width: width, (p, u) => {
  import cetz.draw: *
  let branch(y, name, ly) = {
    line(p(853, y), p(930, y), stroke: th)
    line(p(942, y), p(1020, y), stroke: th)
    cap-h(p, 936, y, h: 13, g: 12)
    lab(p, 910, y - 8, [$+$], size: 8pt)
    lab(p, 962, y - 8, [$-$], size: 8pt)
    lab(p, 938, ly, name, size: 8pt)
  }
  branch(262, [$C_1$], 235)
  branch(420, [$C_2$], 383)
  branch(578, [$C_3$], 545)
  line(p(853, 262), p(853, 578), stroke: th)
  line(p(1020, 262), p(1020, 578), stroke: th)
  line(p(792, 420), p(853, 420), stroke: th)
  line(p(1020, 420), p(1080, 420), stroke: th)
  dot(p, 853, 420, u: u)
  dot(p, 1020, 420, u: u)
  lab(p, 838, 403, [$A$], size: 8pt)
  lab(p, 1034, 403, [$B$], size: 8pt)
})

// 图 1·35 电容器串联
#let fig-1-35(width: 7cm) = px-canvas(450, 100, origin: (115, 455), width: width, (p, u) => {
  import cetz.draw: *
  line(p(125, 505), p(548, 505), stroke: th)
  for (x, name) in ((222, [$C_1$]), (340, [$C_2$]), (448, [$C_3$])) {
    rect(p(x - 9, 497), p(x + 9, 513), stroke: none, fill: white)
    cap-h(p, x, 505, h: 13, g: 12)
    lab(p, x + 3, 468, name, size: 8pt)
    lab(p, x - 22, 523, [$+$], size: 8pt)
    lab(p, x + 24, 523, [$-$], size: 8pt)
  }
  for (x, name) in ((157, [$a$]), (285, [$b$]), (397, [$c$]), (510, [$d$])) {
    dot(p, x, 505, u: u)
    lab(p, x, 485, name, size: 8pt)
  }
})

// 薄片电容器：n 块金属片，奇数块（从 0 起算的偶数序号）接左引线，其余接右引线
#let stack(p, y0, step, n, xl, xr, lead-y, plus-label) = {
  import cetz.draw: *
  for k in range(n - 1) {
    hatch(p, xl + 20, y0 + step * k + 3, xr - 20, y0 + step * (k + 1) - 3, d: 4, stroke-w: 0pt)
  }
  for k in range(n) {
    let y = y0 + step * k
    if calc.even(k) { line(p(xl, y), p(xr - 20, y), stroke: 1.8pt) } else { line(p(xl + 20, y), p(xr, y), stroke: 1.8pt) }
  }
  let last-even = if calc.even(n - 1) { n - 1 } else { n - 2 }
  let last-odd = if calc.even(n - 1) { n - 2 } else { n - 1 }
  line(p(xl, y0), p(xl, y0 + step * last-even), stroke: 1.8pt)
  line(p(xr, y0 + step), p(xr, y0 + step * last-odd), stroke: 1.8pt)
}

// 图 1·36 薄片电容器并联
#let fig-1-36(width: 6.5cm) = px-canvas(490, 260, origin: (125, 680), width: width, (p, u) => {
  import cetz.draw: *
  stack(p, 695, 28, 9, 215, 520, 0, 0)
  line(p(135, 807), p(215, 807), stroke: th)
  line(p(520, 835), p(600, 835), stroke: th)
  lab(p, 200, 787, [$+$], size: 9pt)
  lab(p, 538, 815, [$-$], size: 9pt)
})

// 图 1·37 薄片电容器串联
#let fig-1-37(width: 6.5cm) = px-canvas(340, 420, origin: (760, 225), width: width, (p, u) => {
  import cetz.draw: *
  for k in range(9) {
    hatch(p, 775, 333 + 26 * k, 1080, 333 + 26 * (k + 1) - 3, d: 4, stroke-w: 0pt)
  }
  for k in range(10) {
    line(p(775, 330 + 26 * k), p(1080, 330 + 26 * k), stroke: 1.8pt)
  }
  line(p(930, 235), p(930, 330), stroke: th)
  line(p(930, 564), p(930, 632), stroke: th)
  lab(p, 947, 306, [$+$], size: 9pt)
  lab(p, 947, 588, [$-$], size: 9pt)
})
