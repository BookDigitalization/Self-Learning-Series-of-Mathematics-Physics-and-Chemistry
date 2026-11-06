// 图 12·20 冲击摆（原书 p.411）
// 线条图，按原图重绘。坐标取自 p.411 的“显示图”坐标（宽 1568），内部乘 1.0657 换成真实像素。
#import "/common/series.typ": *

#let fig-12-20(width: 11cm) = px-canvas(746, 490, origin: (570, 785), width: width, (p0, u) => {
  import cetz.draw: *
  let k = 1.0657
  let p = (x, y) => p0(x * k, y * k)
  let th = 0.9pt
  let txt(x, y, body) = content(p(x, y), anchor: "center", text(size: 8pt, body))
  let arr(a, b) = line(p(..a), p(..b), stroke: 1pt, mark: (end: "stealth", fill: black, scale: 0.5))
  let ceiling(x0, x1, y) = {
    line(p(x0, y), p(x1, y), stroke: th)
    let x = x0
    while x < x1 - 4 {
      line(p(x + 4, y), p(x + 10, y - 10), stroke: 0.6pt)
      x += 8
    }
  }
  let bullet(x, y, w: 34) = {
    line(p(x - w / 2, y - 7), p(x + w / 2 - 8, y - 7), p(x + w / 2, y), p(x + w / 2 - 8, y + 7), p(x - w / 2, y + 7), close: true,
      stroke: 0.8pt, fill: luma(170))
  }
  // 左图：子弹射入前
  ceiling(745, 795, 797)
  line(p(770, 797), p(770, 1172), stroke: 1.8pt)
  txt(787, 822, $O$)
  rect(p(730, 1172), p(805, 1218), stroke: th)
  txt(797, 1148, $M$)
  bullet(688, 1195)
  txt(683, 1160, $m$)
  arr((585, 1192), (628, 1192))
  txt(603, 1214, $v_0$)
  // 右图：摆到最高点
  ceiling(1012, 1065, 797)
  txt(1020, 822, $O$)
  line(p(1035, 805), p(1035, 1262), stroke: (thickness: 1pt, dash: "dashed"))
  line(p(1035, 805), p(1218, 1112), stroke: 1.8pt)
  line(p(1035, 1112), p(1180, 1112), stroke: (thickness: 1pt, dash: "dashed"))
  line(p(1035, 1160), p(1180, 1160), stroke: (thickness: 1pt, dash: "dashed"))
  rect(p(1180, 1112), p(1258, 1158), stroke: th)
  bullet(1218, 1135, w: 32)
  rect(p(995, 1158), p(1075, 1203), stroke: (thickness: th, dash: "dashed"))
  bullet(1035, 1181, w: 32)
  arr((1120, 1135), (1120, 1112))
  arr((1120, 1138), (1120, 1160))
  txt(1112, 1135, $h$)
  arr((1015, 1226), (1072, 1226))
  txt(1000, 1222, $v$)
})
