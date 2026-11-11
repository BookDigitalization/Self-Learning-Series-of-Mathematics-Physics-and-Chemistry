// 段 c5（三角 第 5 章 斜三角形的解法，原书 p.176–203）插图共用小工具。
// 坐标取自 render-pages.py / crop-view.py 按 --dpi 200 渲染的整页像素（页宽约 1271 像素）。
#import "/common/geo.typ": *

#let k = 0.012cm   // 1 像素（200 dpi）≈ 0.012 cm，图约为原图的 1.1 倍

// 以 c 为圆心、r 为半径的圆周上方向角 t（数学角，度，逆时针为正；页面 y 向下）的点
#let c5-on(c, r, t) = (c.at(0) + r * calc.cos(t * 1deg), c.at(1) - r * calc.sin(t * 1deg))

// 两点距离
#let c5-dist(a, b) = calc.sqrt(calc.pow(b.at(0) - a.at(0), 2) + calc.pow(b.at(1) - a.at(1), 2))

// 点 a 指向点 b 的方向角（度）
#let c5-ang(a, b) = dirang(b.at(0) - a.at(0), b.at(1) - a.at(1)).deg()

// 虚线圆弧：圆心 c、半径 r，方向角 t1 → t2（度），采样成折线
#let c5-darc(p, c, r, t1, t2, n: 40) = {
  import cetz.draw: *
  let pts = range(n + 1).map(i => p(..c5-on(c, r, t1 + (t2 - t1) * i / n)))
  line(..pts, stroke: (paint: black, thickness: 0.7pt, dash: "dashed"))
}

// 线段 a→b 上参数 t 处的点
#let c5-lerp(a, b, t) = (a.at(0) + (b.at(0) - a.at(0)) * t, a.at(1) + (b.at(1) - a.at(1)) * t)

// 粗虚线段（原书垂线、延长线用较粗的虚线）
#let c5-dseg(p, a, b) = {
  import cetz.draw: *
  line(p(..a), p(..b), stroke: (paint: black, thickness: 0.8pt, dash: "dashed"))
}
