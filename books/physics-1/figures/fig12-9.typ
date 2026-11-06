// 图 12·9 用矢量法求棒球、子弹的动量变化（原书 p.394）
// 线条图，按原图重绘。坐标取自 p.394 的“显示图”坐标（宽 1568），内部乘 1.0657 换成真实像素。
#import "/common/series.typ": *

#let fig-12-9(width: 12cm) = px-canvas(1020, 210, origin: (375, 1125), width: width, (p0, u) => {
  import cetz.draw: *
  let k = 1.0657
  let p = (x, y) => p0(x * k, y * k)
  let txt(x, y, body) = content(p(x, y), anchor: "center", text(size: 8pt, body))
  let arr(a, b, w: 1.8pt) = line(p(..a), p(..b), stroke: w, mark: (end: "stealth", fill: black, scale: 0.5))
  // （a）
  arr((648, 1167), (840, 1167))
  arr((648, 1167), (390, 1167))
  arr((840, 1205), (390, 1205))
  circle(p(648, 1167), radius: 2.5 * k * u, fill: black)
  txt(648, 1140, $O$)
  txt(440, 1140, $bold(P)_2 = m bold(v)_2$)
  txt(775, 1140, $bold(P)_1 = m bold(v)_1$)
  txt(615, 1237, $bold(I) = m bold(v)_2 - m bold(v)_1$)
  txt(618, 1303, $(a)$)
  // （b）
  arr((958, 1186), (1312, 1186))
  arr((958, 1203), (1175, 1203))
  arr((1312, 1208), (1175, 1208))
  txt(938, 1198, $O$)
  txt(1255, 1160, $bold(P)_1 = m bold(v)_1$)
  txt(1010, 1238, $bold(P)_2 = m bold(v)_2$)
  txt(1258, 1238, $bold(I) = bold(P)_2 - bold(P)_1$)
  txt(1155, 1287, $(b)$)
})
