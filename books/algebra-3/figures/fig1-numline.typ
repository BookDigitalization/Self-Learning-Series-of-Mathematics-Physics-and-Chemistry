// 图 1·1–1·12 及 §1·3 习题 1·3 第 4 题解法举例的无编号数轴图（原书 p.13 图 1·1、p.14 图 1·2、1·3、
// p.15 图 1·4、1·5、1·6、p.16 图 1·7、1·8、p.17 图 1·9、p.19 图 1·10、1·11、p.20 图 1·12；无编号图在 p.12–13 之间，见 p.13 页首）。
// 数轴上画不等式（组）的解：每个不等式的解是从边界点出发的一条射线（上方带箭头的折线），
// 轴上加粗的一段是不等式组的解（公共部分）。位置、层高按原图大致比例取，单位为画布像素，未用网格精量。
// 说明：原图中个别图的加粗段因印刷墨色不均难以分辨（图 1·4、1·5 左侧），一律按“加粗＝解的范围”画（无解的图不加粗）。
#import "/common/series.typ": *

// ticks: ((位置, 标注[, 下移像素]), …)，标注画在对应点的下方；
// rays: ((边界位置, "l"/"r", 空心?, 层高), …)，层高为折线水平段在轴上方的像素高度；
// bold: ((起, 止), …) 轴上加粗的区间；tickmarks: 需要画小刻度线的位置
#let nl(ticks, rays, bold: (), lo: 10, hi: 500, h: 80, tickmarks: (), W: 520) = px-canvas(W, h, width: 9.5cm, (p, u) => {
  import cetz.draw: *
  let ay = h - 24
  let t(x, y, body) = content(p(x, y), text(font: fonts.song, size: 8pt, body))
  let arrow = (end: "stealth", fill: black, scale: 0.5)
  for (a, b) in bold { line(p(a, ay), p(b, ay), stroke: 1.8pt) }
  // 数轴：左端无箭头，右端箭头与“x”
  line(p(lo, ay), p(hi, ay), stroke: 0.6pt, mark: arrow)
  t(hi + 14, ay, $x$)
  for x in tickmarks { line(p(x, ay - 4), p(x, ay + 4), stroke: 0.6pt) }
  for (b, d, open, off) in rays {
    let end = if d == "r" { hi - 22 } else { lo }
    line(p(b, ay), p(b, ay - off), p(end, ay - off), stroke: 0.6pt, mark: arrow)
  }
  for (b, d, open, off) in rays {
    circle(p(b, ay), radius: 2.6 * u, fill: if open { white } else { black }, stroke: 0.6pt)
  }
  for tk in ticks { t(tk.at(0), ay + if tk.len() > 2 { tk.at(2) } else { 12 }, tk.at(1)) }
})

// 图 1·1：线段 AB。轴上 A（16）、B（22）是黑点；从 B 向左、从 A 向右各一条射线；AB 段加粗
#let fig-1-1() = px-canvas(520, 80, width: 9.5cm, (p, u) => {
  import cetz.draw: *
  let ay = 56
  let t(x, y, body) = content(p(x, y), text(font: fonts.song, size: 8pt, body))
  let arrow = (end: "stealth", fill: black, scale: 0.5)
  line(p(130, ay), p(300, ay), stroke: 1.8pt)
  line(p(50, ay), p(480, ay), stroke: 0.6pt, mark: arrow)
  t(30, ay, $X'$)
  t(495, ay, $X$)
  // 射线 BX′：从 B 向上再向左
  line(p(300, ay), p(300, ay - 34), p(40, ay - 34), stroke: 0.6pt, mark: arrow)
  // 射线 AX：从 A 向上再向右
  line(p(130, ay), p(130, ay - 20), p(470, ay - 20), stroke: 0.6pt, mark: arrow)
  circle(p(130, ay), radius: 2.8 * u, fill: black, stroke: 0.6pt)
  circle(p(300, ay), radius: 2.8 * u, fill: black, stroke: 0.6pt)
  t(121, ay - 12, $A$)
  t(311, ay - 12, $B$)
  t(130, ay + 12, [16])
  t(300, ay + 12, [22])
})

// 习题 1·3 第 4 题“解法举例”里的无编号图：x < 1，刻度 0、1
#let fig-1-ex() = nl(
  ((250, [0]), (330, [1])),
  ((330, "l", true, 22),), bold: ((10, 330),), lo: 10, hi: 500, h: 56, tickmarks: (250,))

// 图 1·2：x > 3、x > 5
#let fig-1-2() = nl(
  ((150, [3]), (290, [5])),
  ((150, "r", true, 44), (290, "r", true, 22)), bold: ((290, 480),), lo: 50, hi: 500, h: 76)
// 图 1·3：x < 5、x < 3
#let fig-1-3() = nl(
  ((230, [3]), (360, [5])),
  ((360, "l", true, 44), (230, "l", true, 22)), bold: ((10, 230),), lo: 10, hi: 500, h: 76)
// 图 1·4：x > 3、x < 5
#let fig-1-4() = nl(
  ((210, [3]), (330, [5])),
  ((210, "r", true, 44), (330, "l", true, 22)), bold: ((210, 330),), lo: 10, hi: 500, h: 76)
// 图 1·5：x < 3、x > 5（没有解）
#let fig-1-5() = nl(
  ((190, [3]), (330, [5])),
  ((190, "l", true, 30), (330, "r", true, 30)), lo: 20, hi: 500, h: 62)
// 图 1·6：x > −6、x > 0
#let fig-1-6() = nl(
  ((110, [−6]), (290, [0])),
  ((110, "r", true, 44), (290, "r", true, 22)), bold: ((290, 480),), lo: 20, hi: 500, h: 76)
// 图 1·7：x < 3½、x < −6
#let fig-1-7() = nl(
  ((160, [−6]), (330, $mx(3, 1, 2)$, 22)),
  ((330, "l", true, 44), (160, "l", true, 22)), bold: ((10, 160),), lo: 10, hi: 500, h: 84)
// 图 1·8：x > 1、x > 5
#let fig-1-8() = nl(
  ((110, [1]), (290, [5])),
  ((110, "r", true, 44), (290, "r", true, 22)), bold: ((290, 480),), lo: 20, hi: 500, h: 76)
// 图 1·9：x < −1、x > 1（没有解）
#let fig-1-9() = nl(
  ((190, [−1]), (320, [1])),
  ((190, "l", true, 24), (320, "r", true, 24)), lo: 20, hi: 500, h: 62)
// 图 1·10：x > 1、x > 3、x > 5
#let fig-1-10() = nl(
  ((130, [1]), (240, [3]), (340, [5])),
  ((130, "r", true, 66), (240, "r", true, 44), (340, "r", true, 22)), bold: ((340, 480),), lo: 20, hi: 500, h: 98)
// 图 1·11：x > 1、x > 3、x < 5
#let fig-1-11() = nl(
  ((150, [1]), (270, [3]), (390, [5])),
  ((150, "r", true, 66), (270, "r", true, 44), (390, "l", true, 22)), bold: ((270, 390),), lo: 20, hi: 500, h: 98)
// 图 1·12：x < 1、x < 3、x > 5（没有解）
#let fig-1-12() = nl(
  ((150, [1]), (265, [3]), (380, [5])),
  ((150, "l", true, 22), (265, "l", true, 44), (380, "r", true, 44)), lo: 20, hi: 500, h: 76)
