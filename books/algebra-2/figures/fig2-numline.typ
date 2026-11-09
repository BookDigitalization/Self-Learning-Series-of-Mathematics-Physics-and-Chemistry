// 图 2·1–2·8 数轴上表示不等式的解（原书 p.78 图 2·1；p.79 图 2·2；p.80 图 2·3、图 2·4；p.82 图 2·5；
// p.83 图 2·6、图 2·7；p.84 图 2·8）。八幅图版式相同，共用 nline；坐标按原图大致比例取，单位为画布像素。
#import "/common/series.typ": *

// ticks: ((位置, 刻度标注), …)，位置为画布 x；bound: 边界点位置；blabel: 边界点下方的标注（没有则 none）；
// dir: "left" / "right" 为解的范围（上方带箭头的折线、轴上加粗），none 表示只是一个点；open: 边界点是空心圈（true）或黑点（false）
#let nline(ticks, bound, dir, open, blabel: none, lo: 10, hi: 500, W: 520) = px-canvas(W, 80, width: 9.5cm, (p, u) => {
  import cetz.draw: *
  let ay = 46
  let uy = 18
  let t(x, y, body) = content(p(x, y), text(font: fonts.song, size: 8pt, body))
  // 数轴：左端无箭头，右端箭头与“x”
  line(p(lo, ay), p(hi, ay), stroke: 0.6pt, mark: (end: "stealth", fill: black, scale: 0.5))
  t(hi + 14, ay, $x$)
  for (x, s) in ticks {
    line(p(x, ay - 4), p(x, ay + 4), stroke: 0.6pt)
    t(x, ay + 13, s)
  }
  if dir != none {
    let end = if dir == "left" { lo } else { hi - 22 }
    // 轴上加粗的一段与上方折线
    line(p(bound, ay), p(if dir == "left" { lo } else { hi }, ay), stroke: 1.6pt)
    line(p(bound, ay), p(bound, uy), p(end, uy), stroke: 0.6pt, mark: (end: "stealth", fill: black, scale: 0.5))
  }
  if open { circle(p(bound, ay), radius: 2.6 * u, fill: white, stroke: 0.6pt) } else { circle(p(bound, ay), radius: 2.6 * u, fill: black, stroke: 0.6pt) }
  if blabel != none { t(bound, ay + 27, blabel) }
})

// 图 2·1：x < −2，刻度 −4 … 0，−2 处空心圈
#let fig-2-1() = nline(
  ((110, [−4]), (190, [−3]), (270, [−2]), (350, [−1]), (430, [0])),
  270, "left", true, lo: 10, hi: 500)
// 图 2·2：x > −4
#let fig-2-2() = nline(
  ((110, [−4]), (190, [−3]), (270, [−2]), (350, [−1]), (430, [0])),
  110, "right", true, lo: 10, hi: 500)
// 图 2·3：x < 2/9
#let fig-2-3() = nline(
  ((100, [0]), (230, [1]), (360, [2])),
  130, "left", true, blabel: $2/9$, lo: 10, hi: 500)
// 图 2·4：x > 2
#let fig-2-4() = nline(
  ((150, [0]), (250, [1]), (350, [2])),
  350, "right", true, lo: 40, hi: 500)
// 图 2·5：x > 2⅓
#let fig-2-5() = nline(
  ((150, [0]), (230, [1]), (310, [2]), (390, [3])),
  335, "right", true, blabel: $mx(2, 1, 3)$, lo: 10, hi: 500)
// 图 2·6：x = 2⅓，只标一个点（原图中该点是黑点）
#let fig-2-6() = nline(
  ((150, [0]), (230, [1]), (310, [2]), (390, [3])),
  335, none, false, blabel: $mx(2, 1, 3)$, lo: 10, hi: 500)
// 图 2·7：x < 2⅓
#let fig-2-7() = nline(
  ((150, [0]), (230, [1]), (310, [2]), (390, [3])),
  335, "left", true, blabel: $mx(2, 1, 3)$, lo: 10, hi: 500)
// 图 2·8：x ≥ 14，14 处是黑点
#let fig-2-8() = nline(
  ((60, [0]), (300, [10]), (420, [14])),
  420, "right", false, lo: 10, hi: 510)
