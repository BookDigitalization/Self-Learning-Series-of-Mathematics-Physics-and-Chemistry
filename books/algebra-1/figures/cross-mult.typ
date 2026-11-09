// §3·10 交叉相乘示意：四个数排成两行两列，两条对角线交叉。
// 原书 p.167（字母 a b / c d 的示意图，不编号）、p.168（例 25 里四个数字的交叉图，不编号）。
// 版式相同，共用一个函数；四个参数依次是左上、右上、左下、右下。
#import "/common/series.typ": *

#let cross-mult(a, b, c, d, width: 1.5cm) = px-canvas(60, 56, width: width, (p, u) => {
  import cetz.draw: *
  let t(x, y, body) = content(p(x, y), text(font: fonts.song, size: 9.5pt, body))
  t(8, 7, a); t(52, 7, b); t(8, 49, c); t(52, 49, d)
  line(p(18, 16), p(42, 40), stroke: 0.5pt)
  line(p(42, 16), p(18, 40), stroke: 0.5pt)
})
