// 图 13·15 斜抛物体落地时的速度（原书 p.433）
// 示意图，按原图重绘：抛物线 O B A C D，B、C 等高，各点速度 v_B、v_C、v_D 及 D 点的分速度，角 θ、θ′。
// 坐标是页面显示图（宽 1568）上的像素坐标；抛物线为标准形状，位置为目测。
#import "/common/series.typ": *

#let fig-13-15(width: 13cm) = px-canvas(960, 400, origin: (415, 262), width: width, (p, u) => {
  import cetz.draw: *
  let arr = (end: "stealth", fill: black, scale: 0.5)
  let lab(x, y, body) = content(p(x, y), anchor: "center", text(size: 9pt, body))
  let dsh = (thickness: 0.8pt, dash: "dashed")
  let (ox, oy, dx, h) = (468, 507, 1210, 189)
  let L = dx - ox
  let par(x) = oy - 4 * h * (x - ox) * (dx - x) / (L * L)
  line(p(ox, oy), p(ox, 270), stroke: 1.4pt, mark: arr)
  line(p(ox, oy), p(1378, oy), stroke: 1.2pt, mark: arr)
  lab(482, 278, $y$)
  lab(1364, 522, $x$)
  lab(455, 520, $O$)
  line(..range(0, 62).map(k => { let x = ox + k * L / 61; p(x, par(x)) }), stroke: 1.4pt)
  // A、B、C
  let ax = (ox + dx) / 2
  let bx = 655
  let cx = dx + ox - bx
  line(p(bx, par(bx)), p(cx, par(cx)), stroke: dsh)
  line(p(ax, par(ax)), p(ax, oy), stroke: (thickness: 1.4pt, dash: "dashed"))
  lab(838, 296, $A$)
  lab(650, 335, $B$)
  lab(1020, 336, $C$)
  lab(1190, 528, $D$)
  // O 点速度及分量
  line(p(ox, oy), p(558, 397), stroke: 1.6pt, mark: arr)
  lab(503, 425, $v_0$)
  lab(418, 397, $v_0 sin theta$)
  line(p(ox, oy), p(560, oy), stroke: 1.8pt, mark: arr)
  lab(580, 530, $v_0 cos theta$)
  lab(513, 480, $theta$)
  // B、C 点速度
  line(p(bx, par(bx)), p(762, 305), stroke: 1.4pt, mark: arr)
  lab(712, 310, $v_B$)
  line(p(cx, par(cx)), p(1110, 400), stroke: 1.4pt, mark: arr)
  lab(1088, 372, $v_C$)
  // D 点速度
  line(p(1100, 400), p(dx, oy), stroke: dsh)
  line(p(dx, oy), p(1310, oy), stroke: 1.4pt, mark: arr)
  lab(1288, 483, $v_(D x)$)
  line(p(dx, oy), p(dx, 610), stroke: 1.4pt, mark: arr)
  lab(1182, 625, $v_(D y)$)
  line(p(dx, oy), p(1295, 610), stroke: 1.4pt, mark: arr)
  lab(1282, 628, $v_D$)
  lab(1250, 528, $theta'$)
})
