// 图 12·18 火箭喷气的推力推导（原书 p.406）
// 线条图，按原图重绘（火箭、喷出的气体用示意线条）。坐标取自 p.406 的“显示图”坐标（宽 1568），内部乘 1.0657 换成真实像素。
#import "/common/series.typ": *

#let fig-12-18(width: 11cm) = px-canvas(735, 425, origin: (490, 95), width: width, (p0, u) => {
  import cetz.draw: *
  let k = 1.0657
  let p = (x, y) => p0(x * k, y * k)
  let th = 0.9pt
  let txt(x, y, body, anchor: "center") = content(p(x, y), anchor: anchor, text(size: 8pt, body))
  let arr(a, b) = line(p(..a), p(..b), stroke: 1pt, mark: (end: "stealth", fill: black, scale: 0.5))
  // 火箭：箭体 + 弧形头部 + 尾部方框
  let rocket(y) = {
    line(p(655, y), p(935, y), stroke: th)
    line(p(655, y + 50), p(935, y + 50), stroke: th)
    bezier(p(935, y), p(985, y + 12), p(970, y + 4), stroke: th)
    bezier(p(985, y + 12), p(935, y + 50), p(978, y + 45), stroke: th)
    rect(p(660, y + 5), p(705, y + 47), stroke: th, fill: luma(200))
  }
  // 上：t 时刻
  rocket(170)
  arr((735, 120), (845, 120))
  txt(785, 105, $v$)
  txt(797, 243, $M$)
  txt(1005, 205, [在 $t$ 时刻], anchor: "west")
  // 下：t + Δt 时刻
  rocket(393)
  for dy in (-30, -18, -6, 6, 18, 30) {
    line(p(652, 418), p(520, 418 + dy * 2.2), stroke: 0.5pt, mark: (end: "stealth", fill: black, scale: 0.35))
  }
  arr((645, 340), (505, 340))
  txt(590, 315, $v_0 - v$)
  arr((745, 355), (870, 355))
  txt(805, 328, $v + Delta v$)
  txt(595, 468, $Delta m$)
  txt(780, 470, $M - Delta m$)
  txt(1010, 425, [在 $t + Delta t$ 时刻], anchor: "west")
})
