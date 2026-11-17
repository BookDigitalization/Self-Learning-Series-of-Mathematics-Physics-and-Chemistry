// 图 4·6（原书 p.129）证明气体的体胀系数和压强系数相等的附图：带活塞 AB 的气缸三种状态。
// 示意图，按原图简化重绘（气体用点表示，酒精灯与火焰为示意）。坐标取 200 dpi 页面像素。
#import "/common/series.typ": *

// 气缸一幅：x0、x1 左右壁，ytop 缸口，ybot 缸底，yp 活塞上沿；lamp 为 true 时下面画酒精灯。
// 导出供图 4·8 使用。
#let cyl(p, x0, x1, ytop, ybot, yp, lamp: false, seed: 7) = {
  import cetz.draw: *
  line(p(x0, ytop), p(x0, ybot), p(x1, ybot), p(x1, ytop), stroke: 1.3pt)
  // 活塞（斜线填充的窄条）
  rect(p(x0, yp), p(x1, yp + 8), stroke: 0.8pt, fill: none)
  let n = int((x1 - x0) / 3.2)
  for i in range(0, n) {
    let x = x0 + 2 + i * 3.2
    line(p(x, yp + 8), p(x + 3, yp), stroke: 0.4pt)
  }
  // 气体：确定性的点阵（线性同余伪随机）
  let s = seed
  let nd = int((x1 - x0) * (ybot - yp - 14) / 60)
  for i in range(0, nd) {
    s = calc.rem(s * 1103 + 12345, 65521)
    let rx = s / 65521
    s = calc.rem(s * 1103 + 12345, 65521)
    let ry = s / 65521
    circle(p(x0 + 5 + rx * (x1 - x0 - 10), yp + 14 + ry * (ybot - yp - 20)), radius: 1.0, fill: black, stroke: none)
  }
  if lamp {
    let cx = (x0 + x1) / 2
    // 火焰
    line(p(cx - 6, ybot + 40), p(cx - 18, ybot + 12), p(cx - 24, ybot + 6), stroke: 0.6pt)
    line(p(cx + 6, ybot + 40), p(cx + 18, ybot + 12), p(cx + 24, ybot + 6), stroke: 0.6pt)
    line(p(cx, ybot + 38), p(cx, ybot + 10), stroke: 0.6pt)
    // 灯体
    rect(p(cx - 24, ybot + 56), p(cx + 24, ybot + 70), stroke: 0.9pt, fill: none)
    rect(p(cx - 4, ybot + 40), p(cx + 4, ybot + 56), stroke: 0.9pt, fill: none)
    line(p(cx - 24, ybot + 63), p(cx + 24, ybot + 63), stroke: 0.5pt)
  }
}

#let fig-4-6(width: 9.4cm) = px-canvas(470, 260, origin: (330, 455), width: width, (p, u) => {
  import cetz.draw: *
  let it = s => text(size: 9pt, style: "italic", s)
  // (a)
  cyl(p, 358, 452, 472, 605, 529, seed: 5)
  content(p(350, 533), it[A])
  content(p(463, 533), it[B])
  content(p(405, 690), it[(a)])
  // (b)
  cyl(p, 521, 614, 475, 606, 531, lamp: true, seed: 11)
  content(p(512, 535), it[A])
  content(p(626, 535), it[B])
  content(p(568, 690), it[(b)])
  // (c)
  cyl(p, 683, 777, 476, 609, 491, lamp: true, seed: 23)
  content(p(674, 495), it[A])
  content(p(789, 495), it[B])
  content(p(730, 690), it[(c)])
})
