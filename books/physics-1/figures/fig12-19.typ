// 图 12·19 例 10 两钢球的弹性碰撞（原书 p.408）
// 线条图，按原图重绘。坐标取自 p.408 的“显示图”坐标（宽 1568），内部乘 1.0657 换成真实像素。
#import "/common/series.typ": *

#let fig-12-19(width: 6.4cm) = px-canvas(474, 528, origin: (880, 1225), width: width, (p0, u) => {
  import cetz.draw: *
  let k = 1.0657
  let p = (x, y) => p0(x * k, y * k)
  let txt(x, y, body) = content(p(x, y), anchor: "center", text(size: 8pt, body))
  let arr(a, b) = line(p(..a), p(..b), stroke: 1pt, mark: (end: "stealth", fill: black, scale: 0.5))
  let ground(x0, x1, y) = {
    line(p(x0, y), p(x1, y), stroke: 1.2pt)
    let x = x0
    while x < x1 - 8 {
      line(p(x + 12, y), p(x, y + 11), stroke: 0.6pt)
      x += 15
    }
  }
  let ball(x, y, r, lab) = {
    circle(p(x, y), radius: r * k * u, stroke: 1pt)
    txt(x, y, lab)
  }
  // 碰撞前
  ground(890, 1290, 1395)
  ball(975, 1342, 50, $m_1$)
  ball(1188, 1340, 50, $m_2$)
  arr((940, 1245), (1022, 1245))
  txt(912, 1242, $v_1$)
  arr((1148, 1248), (1264, 1248))
  txt(1130, 1245, $v_2$)
  txt(1092, 1450, [碰撞前])
  // 碰撞后
  ground(888, 1318, 1645)
  ball(968, 1592, 48, $m_1$)
  ball(1180, 1592, 50, $m_2$)
  arr((925, 1515), (1034, 1515))
  txt(905, 1515, $v'_1$)
  arr((1135, 1512), (1237, 1512))
  txt(1118, 1513, $v'_2$)
  txt(1095, 1700, [碰撞后])
})
