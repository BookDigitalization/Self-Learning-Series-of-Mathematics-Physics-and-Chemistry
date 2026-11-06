// 图 12·8 动量变化的矢量三角形（原书 p.393）
// 线条图，按原图重绘。坐标取自 p.393 的“显示图”坐标（宽 1568），内部乘 1.0657 换成真实像素。
#import "/common/series.typ": *

#let fig-12-8(width: 5.6cm) = px-canvas(380, 490, origin: (1115, 495), width: width, (p0, u) => {
  import cetz.draw: *
  let k = 1.0657
  let p = (x, y) => p0(x * k, y * k)
  let txt(x, y, body) = content(p(x, y), anchor: "center", text(size: 8pt, body))
  let arr(a, b, w: 1.2pt) = line(p(..a), p(..b), stroke: w, mark: (end: "stealth", fill: black, scale: 0.55))
  // 竖直线 MN
  line(p(1085, 585), p(1085, 825), stroke: (thickness: 0.7pt, dash: "dashed"))
  txt(1066, 592, $M$)
  txt(1068, 812, $N$)
  txt(1070, 715, $O$)
  // 两个动量矢量与它们的差
  arr((1085, 713), (1372, 478))
  arr((1085, 713), (1372, 910))
  arr((1375, 910), (1375, 480), w: 1.8pt)
  txt(1232, 545, $bold(P)_2$)
  txt(1216, 838, $bold(P)_1$)
  txt(1318, 698, $Delta bold(P) = bold(I)$)
  txt(1105, 660, $alpha_2$)
  txt(1102, 746, $alpha_1$)
})
