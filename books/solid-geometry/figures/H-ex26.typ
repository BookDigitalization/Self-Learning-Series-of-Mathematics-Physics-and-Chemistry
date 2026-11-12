// 习题 2·6 第 3 题的插图（原书 p.158）；页面 200 dpi 坐标。
#import "H-base.typ": *

#let fig-H-ex26-3(width: 375 * k) = px-canvas(375, 255, origin: (488, 628), width: width, (p, u) => {
  import cetz.draw: *
  // 左：底面正三角形（边长 141 像素）
  let O = (504, 849)
  let R = (645, 849)
  let T = (574.5, 727)
  let G = (574.5, 849)
  Hbp(p, (O, T, R))
  Hax(p, O, (680, 849))
  Hax(p, O, (504, 680))
  dseg(p, T, G)
  HL(p, 498, 668, $Y$)
  HL(p, 693, 851, $X$)
  HL(p, 500, 866, $O$)
  // 右：正三棱柱的直观图
  let a = (717, 877)
  let b = (853, 877)
  let c = (823, 833)
  let h = 197
  let up(pt) = (pt.at(0), pt.at(1) - h)
  Hbp(p, (up(a), up(b), up(c)), close: true)
  Hbp(p, (up(a), a, b, up(b)))
  dseg(p, a, c)
  dseg(p, c, b)
  dseg(p, c, up(c))
})
