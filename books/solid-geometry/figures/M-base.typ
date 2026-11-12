// 段 M（立体几何第 3 章 §3·5–§3·7，p.238–251）插图共用小工具。
// 页面渲染 dpi：200（build/pages/sgM/g，页面宽约 1000 像素；坐标取自网格图与 crop-view 放大图）。
#import "/common/geo.typ": *

#let k = 0.0152cm   // 1 像素 ≈ 0.0152 cm

// 椭圆弧上的点：中心 c、半轴 rx、ry、参数角 t（度，逆时针；页面 y 向下已处理）
#let M-ept(c, rx, ry, t) = (c.at(0) + rx * calc.cos(t * 1deg), c.at(1) - ry * calc.sin(t * 1deg))
// 椭圆弧（折线逼近）：a0→a1（度）。st 为线样，默认轮廓线。
#let M-earc(p, c, rx, ry, a0, a1, st: lw) = {
  import cetz.draw: *
  let n = calc.max(8, int(calc.abs(a1 - a0) / 4))
  let pts = range(n + 1).map(i => p(..M-ept(c, rx, ry, a0 + (a1 - a0) * i / n)))
  line(..pts, stroke: st)
}
// 圆弧（折线逼近）
#let M-carc(p, c, r, a0, a1, st: lw) = M-earc(p, c, r, r, a0, a1, st: st)
// 底面椭圆：前半（下半）实线，后半（上半）虚线；full: true 时整圈实线
#let M-base-ell(p, c, rx, ry, full: false, st: lw) = {
  M-earc(p, c, rx, ry, 180, 360, st: st)
  M-earc(p, c, rx, ry, 0, 180, st: if full { st } else { dsh })
}
// 加粗线
#let M-tseg(p, a, b) = {
  import cetz.draw: *
  line(p(..a), p(..b), stroke: lb)
}
// 字母标注：直接放在原图字母的中心位置（页面坐标）
#let M-L(p, x, y, body) = lbl(p, (x, y), body, dir: "c", d: 0)
#let M-lerp(a, b, t) = (a.at(0) + (b.at(0) - a.at(0)) * t, a.at(1) + (b.at(1) - a.at(1)) * t)
// 向量方向角（度，数学角）
#let M-ang(c, q) = calc.atan2(q.at(0) - c.at(0), c.at(1) - q.at(1)).deg()
// 点线（点划线）：中心线用
#let M-dashdot = (paint: black, thickness: 0.6pt, dash: "dash-dotted")
// 细线段（seg 已带 stroke，不能再传）
#let M-thin(p, a, b) = {
  import cetz.draw: *
  line(p(..a), p(..b), stroke: lt)
}
