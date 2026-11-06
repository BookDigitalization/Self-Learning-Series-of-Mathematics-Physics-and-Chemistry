// 图 12·7 钢球碰撞钢板（原书 p.391）
// 线条图，按原图重绘（a）～（e）五幅。坐标取自 p.391 的“显示图”坐标（宽 1568），内部乘 1.0657 换成真实像素。
#import "/common/series.typ": *

#let fig-12-7(width: 9.5cm) = px-canvas(720, 920, origin: (520, 830), width: width, (p0, u) => {
  import cetz.draw: *
  let k = 1.0657
  let p = (x, y) => p0(x * k, y * k)
  let th = 0.8pt
  let txt(x, y, body) = content(p(x, y), anchor: "center", text(size: 8pt, body))
  let arr(a, b, w: 1.2pt) = line(p(..a), p(..b), stroke: w, mark: (end: "stealth", fill: black, scale: 0.5))
  let ground(x0, x1, y) = {
    line(p(x0, y), p(x1, y), stroke: 1.2pt)
    let x = x0
    while x < x1 - 8 {
      line(p(x + 10, y), p(x, y + 9), stroke: 0.6pt)
      x += 14
    }
  }
  let ang(cx, cy, a0, a1, r: 40) = arc(p(cx, cy), start: a0, stop: a1, radius: r * k * u, stroke: 0.6pt)

  // （a）入射
  ground(590, 715, 1015)
  line(p(650, 800), p(650, 1012), stroke: (thickness: 0.7pt, dash: "dash-dotted"))
  line(p(505, 880), p(650, 1012), stroke: (thickness: 0.9pt, dash: "dashed"))
  line(p(595, 960), p(650, 1012), stroke: 1.4pt)
  ang(650, 1012, 90deg, 138deg, r: 48)
  txt(622, 942, $alpha_1$)
  txt(580, 990, $v_1$)
  txt(668, 995, $m$)
  txt(648, 1058, $(a)$)
  // （b）反弹
  ground(922, 1018, 1015)
  line(p(965, 790), p(965, 1012), stroke: (thickness: 0.7pt, dash: "dash-dotted"))
  line(p(965, 1012), p(1022, 945), stroke: 1.4pt, mark: (end: "stealth", fill: black, scale: 0.5))
  line(p(1022, 945), p(1120, 828), stroke: (thickness: 0.9pt, dash: "dashed"))
  ang(965, 1012, 50deg, 90deg, r: 48)
  txt(985, 938, $alpha_2$)
  txt(1050, 955, $v_2$)
  txt(940, 990, $m$)
  txt(972, 1062, $(b)$)
  // （c）v1 的分解
  arr((645, 1177), (775, 1177))
  arr((645, 1177), (645, 1308))
  arr((645, 1177), (775, 1308))
  ang(645, 1177, -90deg, -45deg, r: 45)
  txt(665, 1236, $alpha_1$)
  txt(745, 1150, $m v'_1$)
  txt(628, 1333, $m v''_1$)
  txt(762, 1333, $m v_1$)
  txt(627, 1410, $(c)$)
  // （d）v2 的分解
  arr((970, 1320), (970, 1180))
  arr((970, 1320), (1100, 1320))
  arr((970, 1320), (1088, 1190))
  ang(970, 1320, 48deg, 90deg, r: 45)
  txt(990, 1262, $alpha_2$)
  txt(965, 1157, $m v''_2$)
  txt(1072, 1345, $m v'_2$)
  txt(1090, 1160, $m v_2$)
  txt(1037, 1410, $(d)$)
  // （e）竖直方向受力
  arr((868, 1510), (868, 1325))
  arr((868, 1510), (868, 1580))
  circle(p(868, 1510), radius: 2.5 * k * u, fill: black)
  txt(893, 1405, $F$)
  txt(893, 1508, $m$)
  txt(893, 1565, $G$)
  txt(803, 1617, $(e)$)
})
