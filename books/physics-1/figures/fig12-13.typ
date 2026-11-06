// 图 12·13 例 8 人从第一辆平板车跳到第二辆平板车（原书 p.400）
// 线条图，按原图重绘（小人用简笔画）。坐标取自 p.400 的“显示图”坐标（宽 1568），内部乘 1.0657 换成真实像素。
#import "/common/series.typ": *

#let fig-12-13(width: 10cm) = px-canvas(730, 310, origin: (485, 90), width: width, (p0, u) => {
  import cetz.draw: *
  let k = 1.0657
  let p = (x, y) => p0(x * k, y * k)
  let th = 0.8pt
  let txt(x, y, body) = content(p(x, y), anchor: "center", text(size: 8pt, body))
  let arr(a, b) = line(p(..a), p(..b), stroke: 1.2pt, mark: (end: "stealth", fill: black, scale: 0.5))
  let ground(x0, x1, y) = {
    line(p(x0, y), p(x1, y), stroke: 1.2pt)
    let x = x0
    while x < x1 - 8 {
      line(p(x + 12, y), p(x, y + 11), stroke: 0.6pt)
      x += 14
    }
  }
  // 平板车：薄板 + 两个轮子
  let cart(x0, x1, y, w1, w2) = {
    rect(p(x0, y), p(x1, y + 7), stroke: th, fill: luma(210))
    circle(p(w1, y + 15), radius: 7 * k * u, stroke: th)
    circle(p(w2, y + 15), radius: 7 * k * u, stroke: th)
  }
  // 简笔小人（脚在 (x, y)，高约 60）
  let person(x, y) = {
    circle(p(x, y - 52), radius: 5 * k * u, stroke: th)
    line(p(x, y - 46), p(x, y - 20), stroke: th)
    line(p(x, y - 20), p(x - 6, y), stroke: th)
    line(p(x, y - 20), p(x + 6, y), stroke: th)
    line(p(x - 8, y - 36), p(x, y - 42), p(x + 8, y - 36), stroke: th)
  }
  // 上图：人跳出之前
  ground(497, 1045, 208)
  cart(568, 710, 183, 597, 668)
  cart(800, 935, 183, 828, 885)
  person(688, 183)
  txt(540, 185, $m_1$)
  txt(688, 108, $m$)
  arr((578, 135), (625, 135))
  txt(642, 140, $v_1$)
  arr((705, 170), (757, 170))
  txt(777, 170, $v_3$)
  arr((835, 135), (885, 135))
  txt(905, 135, $v_2$)
  txt(948, 182, $m_2$)
  // 下图：人跳上第二辆车之后
  ground(553, 1150, 360)
  cart(715, 860, 332, 745, 828)
  cart(890, 1030, 332, 912, 992)
  person(907, 332)
  txt(690, 328, $m_1$)
  arr((735, 297), (790, 297))
  txt(808, 292, $v'_1$)
  txt(935, 276, $m$)
  arr((972, 293), (1022, 293))
  txt(1040, 290, $v'_2$)
  txt(1052, 330, $m_2$)
})
