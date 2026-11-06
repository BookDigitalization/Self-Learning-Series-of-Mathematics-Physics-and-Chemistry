// 图 8·16 绳子各部分的受力（原书 p.227）
// 线条图，用 CeTZ 按原图重绘：绳子画成一串小环，两端带箭头和力的字母。
// 第 1、2 行：整根绳子在 f_2、f_1 作用下，加速度 a 分别向左、向右；第 2 行下标 D C B A；
// 第 3、4、5 行：AB 段、BC 段、CD 段。小环个数是示意，与原图不逐个对应。
// 坐标是原页显示图坐标（x-560, y-430），y 向下。
#import "/common/series.typ": *

#let fig-8-16(width: 11cm) = px-canvas(700, 450, width: width, origin: (560, 430), (p, u) => {
  import cetz.draw: *
  let arr = (end: "stealth", fill: black, scale: 0.45)
  let m(x, y, body) = content(p(x, y), anchor: "center", text(size: 8pt, body))
  let chain(x0, x1, y) = {
    let n = calc.floor((x1 - x0) / 13)
    for k in range(0, n) {
      circle(p(x0 + 6.5 + k * (x1 - x0) / n, y), radius: (8 * u, 5 * u), stroke: 0.8pt)
    }
  }
  // 第 1 行
  line(p(690, 497), p(635, 497), stroke: 0.9pt, mark: arr)
  line(p(1115, 497), p(1190, 497), stroke: 0.9pt, mark: arr)
  chain(690, 1115, 497)
  m(590, 497, $f_2$)
  m(1215, 497, $f_1$)
  line(p(915, 462), p(840, 462), stroke: 0.8pt, mark: arr)
  m(872, 447, $a$)
  // 第 2 行
  line(p(695, 572), p(633, 572), stroke: 0.9pt, mark: arr)
  line(p(1105, 572), p(1185, 572), stroke: 0.9pt, mark: arr)
  chain(695, 1105, 572)
  m(590, 572, $f_2$)
  m(1215, 572, $f_1$)
  line(p(840, 547), p(918, 547), stroke: 0.8pt, mark: arr)
  m(872, 532, $a$)
  m(698, 598, $D$)
  m(823, 598, $C$)
  m(965, 595, $B$)
  m(1097, 597, $A$)
  // 第 3 行：AB 段
  line(p(965, 648), p(900, 648), stroke: 0.9pt, mark: arr)
  line(p(1115, 648), p(1185, 648), stroke: 0.9pt, mark: arr)
  chain(965, 1115, 648)
  m(870, 648, $T'_1$)
  m(1215, 648, $f_1$)
  // 第 4 行：BC 段
  line(p(830, 720), p(745, 720), stroke: 0.9pt, mark: arr)
  line(p(970, 720), p(1040, 720), stroke: 0.9pt, mark: arr)
  chain(830, 970, 720)
  m(718, 720, $T'_2$)
  m(1070, 718, $T_1$)
  // 第 5 行：CD 段
  line(p(695, 798), p(635, 798), stroke: 0.9pt, mark: arr)
  line(p(830, 798), p(895, 798), stroke: 0.9pt, mark: arr)
  chain(695, 830, 798)
  m(590, 798, $f_2$)
  m(925, 798, $T_2$)
})
