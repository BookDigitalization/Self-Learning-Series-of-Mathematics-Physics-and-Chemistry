// 段 D 图的共用小工具（页面像素坐标，200 dpi 页面宽约 1000 像素）。
#import "/common/geo.typ": *
#let k = 0.0152cm
// 粗线折线（原图里描粗的线）
#let tk(p, ..pts) = {
  import cetz.draw: *
  line(..pts.pos().map(q => p(..q)), stroke: lb)
}
// 普通折线（不封闭）
#let pl(p, ..pts) = {
  import cetz.draw: *
  line(..pts.pos().map(q => p(..q)), stroke: lw)
}
// 封闭多边形（平面的平行四边形）
#let pg(p, ..pts) = {
  import cetz.draw: *
  line(..pts.pos().map(q => p(..q)), close: true, stroke: lw)
}
// 虚折线
#let dd(p, ..pts) = {
  import cetz.draw: *
  line(..pts.pos().map(q => p(..q)), stroke: dsh)
}
// 三次贝塞尔曲线
#let bz(p, a, c1, c2, b) = {
  import cetz.draw: *
  bezier(p(..a), p(..b), p(..c1), p(..c2), stroke: lw)
}
// 文字居中放在页面坐标 pt
#let t(p, pt, body) = lbl(p, pt, body, dir: "c", d: 0)
// 小圆圈（空心点）
#let oc(p, c) = ring(p, c, r: 2.5)
