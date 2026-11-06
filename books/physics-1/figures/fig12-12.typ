// 图 12·12 例 7 两物体碰撞粘合（原书 p.398）
// 线条图，按原图重绘。坐标取自 p.398 的“显示图”坐标（宽 1568），内部乘 1.0657 换成真实像素。
#import "/common/series.typ": *

#let fig-12-12(width: 9.2cm) = px-canvas(710, 345, origin: (515, 755), width: width, (p0, u) => {
  import cetz.draw: *
  let k = 1.0657
  let p = (x, y) => p0(x * k, y * k)
  let th = 0.8pt
  let txt(x, y, body) = content(p(x, y), anchor: "center", text(size: 8pt, body))
  let arr(a, b) = line(p(..a), p(..b), stroke: 1pt, mark: (end: "stealth", fill: black, scale: 0.5))
  let ground(x0, x1, y) = {
    line(p(x0, y), p(x1, y), stroke: 1.2pt)
    let x = x0
    while x < x1 - 8 {
      line(p(x + 10, y), p(x, y + 9), stroke: 0.6pt)
      x += 14
    }
  }
  let box(x0, y0, x1, y1, lab) = {
    rect(p(x0, y0), p(x1, y1), stroke: th)
    txt((x0 + x1) / 2, (y0 + y1) / 2, lab)
  }
  // 碰撞前
  ground(525, 995, 880)
  box(566, 828, 622, 880, $m_2$)
  box(870, 828, 925, 880, $m_1$)
  arr((555, 792), (622, 792))
  arr((926, 792), (866, 792))
  txt(588, 770, $v_2$)
  txt(912, 770, $v_1$)
  // 碰撞后（粘合）
  ground(530, 1050, 1048)
  box(710, 1000, 760, 1048, $m_2$)
  box(760, 1000, 808, 1048, $m_1$)
  arr((725, 958), (782, 958))
  txt(792, 958, $v$)
  // 碰撞时两物体受到的冲量
  box(1030, 922, 1082, 958, $m_2$)
  arr((1128, 938), (1086, 938))
  txt(1127, 910, $F_2 Delta t$)
  box(1030, 995, 1085, 1030, $m_1$)
  arr((965, 1012), (1028, 1012))
  txt(960, 990, $F_1 Delta t$)
})
