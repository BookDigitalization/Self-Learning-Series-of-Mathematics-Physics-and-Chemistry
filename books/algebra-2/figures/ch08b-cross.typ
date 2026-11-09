// 十字相乘示意：四个数排成两行两列，两条对角线带箭头（箭头指向右列）。
// 原书 p.333（图中 1、2 / 1、3；1、5 / 2、3）、p.334（例 1–4 的交叉图），均不编号。
// 参数依次是左上、右上、左下、右下；cross8 的数字写成 content（可带负号）。
#import "/common/series.typ": *

#let cross8(a, b, c, d, width: 1.9cm) = px-canvas(80, 56, width: width, (p, u) => {
  import cetz.draw: *
  let t(x, y, body) = content(p(x, y), text(font: fonts.song, size: 9.5pt, body))
  t(8, 7, a); t(70, 7, b); t(8, 49, c); t(70, 49, d)
  line(p(19, 15), p(58, 41), stroke: 0.5pt, mark: (end: ">", fill: black, scale: 0.6))
  line(p(19, 41), p(58, 15), stroke: 0.5pt, mark: (end: ">", fill: black, scale: 0.6))
})