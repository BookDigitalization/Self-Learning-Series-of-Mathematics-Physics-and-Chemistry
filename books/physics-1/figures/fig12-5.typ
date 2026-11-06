// 图 12·5（b）起重机吊重物的受力图（原书 p.389）；（a）起重机是写实插画，用位图 fig12-5a.png。
// 线条图，按原图重绘。坐标取自 p.389 的“显示图”坐标（宽 1568），内部乘 1.0657 换成真实像素。
#import "/common/series.typ": *

#let fig-12-5b(width: 4.6cm) = px-canvas(420, 500, origin: (1000, 1130), width: width, (p0, u) => {
  import cetz.draw: *
  let k = 1.0657
  let p = (x, y) => p0(x * k, y * k)
  let th = 0.8pt
  let txt(x, y, body) = content(p(x, y), anchor: "center", text(size: 8pt, body))
  let arr(a, b, w: th) = line(p(..a), p(..b), stroke: w, mark: (end: "stealth", fill: black, scale: 0.55))
  // 重物（箱）及其内部分格
  rect(p(958, 1355), p(1168, 1460), stroke: th, radius: 4pt)
  line(p(1018, 1355), p(1018, 1460), stroke: th)
  line(p(1065, 1355), p(1065, 1460), stroke: th)
  line(p(958, 1385), p(1168, 1385), stroke: 0.5pt)
  line(p(958, 1420), p(1168, 1420), stroke: 0.5pt)
  // 吊索
  line(p(1018, 1355), p(1060, 1230), stroke: th)
  line(p(1108, 1355), p(1060, 1230), stroke: th)
  // 拉力 F 与重力 G
  arr((1060, 1230), (1060, 1085), w: 1.6pt)
  txt(1085, 1100, $F$)
  arr((1065, 1460), (1065, 1500), w: 1.6pt)
  txt(1065, 1512, $G$)
  // 动量
  arr((1258, 1395), (1258, 1200), w: 1.6pt)
  txt(1255, 1165, $m v_2$)
  txt(1250, 1410, $m v_1 = 0$)
})
