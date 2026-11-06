// 图 9·42 悬挂法求重心（原书 p.282）
// 写实插画，位图（fig9-42.png，已涂去 F、G、A、B、C 和（a）（b）（c））；文字用 CeTZ 补回。
// 坐标是 fig9-42.png 的像素坐标（2196×2239）。
#import "/common/series.typ": *

#let fig-9-42(width: 11cm) = px-canvas(2196, 2239, width: width, (p, u) => {
  import cetz.draw: *
  content(p(0, 0), anchor: "north-west", image("fig9-42.png", width: 2196 * u))
  let m(x, y, body) = content(p(x, y), anchor: "center", text(size: 9pt, body))
  // （a）左图
  m(767, 30, $F$); m(708, 477, $A$); m(749, 1202, $G$)
  // （a）右图
  m(1573, 30, $F$); m(1601, 477, $B$); m(1192, 584, $G$); m(1516, 710, $C$); m(1724, 660, $A$)
  m(1124, 1096, [（$a$）])
  // （b）
  m(774, 1962, $C$); m(518, 2145, [（$b$）])
  // （c）
  m(1963, 1857, $C$); m(1728, 2122, [（$c$）])
})
