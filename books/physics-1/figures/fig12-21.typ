// 图 12·21 例 14 粒子碰撞（原书 p.412）
// 线条图，按原图重绘。坐标取自 p.412 的“显示图”坐标（宽 1568），内部乘 1.0657 换成真实像素。
#import "/common/series.typ": *

#let fig-12-21(width: 5.6cm) = px-canvas(437, 416, origin: (955, 790), width: width, (p0, u) => {
  import cetz.draw: *
  let k = 1.0657
  let p = (x, y) => p0(x * k, y * k)
  let th = 0.9pt
  let txt(x, y, body) = content(p(x, y), anchor: "center", text(size: 8pt, body))
  let arr(a, b) = line(p(..a), p(..b), stroke: 1pt, mark: (end: "stealth", fill: black, scale: 0.5))
  // 带斜线的实心粒子
  let solid(x, y, r) = {
    circle(p(x, y), radius: r * k * u, stroke: th, fill: luma(60))
  }
  // 上图：碰撞前
  solid(985, 862, 17)
  txt(985, 825, $m_1$)
  arr((1005, 862), (1170, 862))
  txt(1092, 890, $v_1$)
  circle(p(1193, 848), radius: 18 * k * u, stroke: th)
  txt(1195, 806, $m_2$)
  txt(1218, 887, $v_2 = 0$)
  // 下图：碰撞后
  line(p(1055, 1055), p(1355, 1055), stroke: (thickness: 0.7pt, dash: "dashed"))
  line(p(1180, 930), p(1180, 1165), stroke: (thickness: 0.7pt, dash: "dashed"))
  circle(p(1203, 1037), radius: 18 * k * u, stroke: th)
  txt(1183, 998, $m_2$)
  solid(1185, 1076, 20)
  txt(1140, 1075, $m_1$)
  arr((1215, 1030), (1280, 970))
  txt(1297, 970, $v'_2$)
  arr((1198, 1086), (1288, 1138))
  txt(1290, 1152, $v'_1$)
  arc(p(1230, 1055), start: 0deg, stop: 40deg, radius: 22 * k * u, stroke: 0.6pt)
  txt(1250, 1033, $alpha_2$)
  arc(p(1230, 1055), start: -35deg, stop: 0deg, radius: 22 * k * u, stroke: 0.6pt)
  txt(1250, 1078, $alpha_1$)
})
