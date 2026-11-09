// 原书 p.325 说明 2 里的解题程序图表（不编号）：原方程 → 原方程的两根的和与积的值 → 新方程的两根的和与积的值 → 新方程的系数 → 新方程。
#import "/common/series.typ": *

#let flow8() = px-canvas(420, 110, width: 10cm, (p, u) => {
  import cetz.draw: *
  let t(x, y, body, anchor: "center") = content(p(x, y), anchor: anchor, text(font: fonts.song, size: 9.5pt, body))
  let arr(a, b) = line(a, b, stroke: 0.5pt, mark: (end: ">", fill: black, scale: 0.6))
  t(0, 10, [原方程], anchor: "west")
  arr(p(50, 10), p(100, 10))
  t(105, 10, [原方程的两根的和与积的值], anchor: "west")
  arr(p(250, 20), p(250, 40))
  t(250, 52, [新方程的两根的和与积的值])
  arr(p(250, 62), p(250, 86))
  t(0, 98, [新方程], anchor: "west")
  t(250, 98, [新方程的系数])
  arr(p(190, 98), p(50, 98))
})