// 图 5·17 导出液体在毛细管中上升高度公式的附图（原书 p.175）
// 线条图，按原图重绘。坐标取自原页 200 dpi 页面像素坐标（1130×1662），原点取画布左上角 (625, 1040)。
#import "/common/series.typ": *

#let fig-5-17(width: 5cm) = px-canvas(285, 210, origin: (625, 1040), width: width, (p, u) => {
  import cetz.draw: *
  let ar = (end: "stealth", fill: black, scale: 0.45)
  let lab(x, y, body) = content(p(x, y), anchor: "center", text(size: 9pt, body))
  // 管壁（斜线阴影）
  let wall(x0, x1, ya, yb) = {
    rect(p(x0, ya), p(x1, yb), stroke: 0.9pt, fill: white)
    let hh = yb - ya
    for k in range(-hh, int(x1 - x0), step: 4) {
      let tmin = calc.max(0, -k)
      let tmax = calc.min(hh, x1 - x0 - k)
      if tmin < tmax {
        line(p(x0 + k + tmin, yb - tmin), p(x0 + k + tmax, yb - tmax), stroke: 0.4pt)
      }
    }
  }
  // 容器中的液面和水纹
  line(p(630, 1198), p(730, 1198), stroke: 0.9pt)
  line(p(803, 1198), p(910, 1198), stroke: 0.9pt)
  for (i, y) in range(1207, 1240, step: 9).enumerate() {
    for x in range(635 + calc.rem(i, 2) * 16, 905, step: 38) {
      if x < 728 or x > 805 { line(p(x, y), p(x + 20, y), stroke: 0.5pt) }
    }
  }
  // 管外液面沿管壁爬升
  line(p(730, 1198), p(738, 1196), p(745, 1187), p(748, 1170), p(749, 1160), stroke: 0.9pt)
  line(p(795, 1198), p(789, 1195), p(783, 1187), p(780, 1170), p(779, 1160), stroke: 0.9pt)
  // 管内液体与水纹
  wall(734.6, 743, 1051, 1217)
  wall(794, 802.5, 1051, 1217)
  line(p(743, 1217), p(794, 1217), stroke: 0.9pt)
  for (i, y) in range(1152, 1212, step: 9).enumerate() {
    line(p(748 + calc.rem(i, 3) * 4, y), p(765, y), stroke: 0.5pt)
    line(p(770, y + 3), p(788 - calc.rem(i, 2) * 4, y + 3), stroke: 0.5pt)
  }
  // 管内凹月面
  line(p(743, 1127), p(747, 1133), p(756, 1140), p(768, 1143), p(780, 1140), p(790, 1133), p(794, 1127), stroke: 1pt)
  // r
  line(p(768.5, 1117), p(792, 1117), stroke: (thickness: 0.6pt, dash: "dashed"))
  lab(775, 1109, $r$)
  // h
  line(p(803, 1144.6), p(843.5, 1144.6), stroke: 0.6pt)
  line(p(835, 1144.6), p(835, 1197), stroke: 0.7pt, mark: (start: "stealth", end: "stealth", fill: black, scale: 0.45))
  lab(846, 1172, $h$)
})
