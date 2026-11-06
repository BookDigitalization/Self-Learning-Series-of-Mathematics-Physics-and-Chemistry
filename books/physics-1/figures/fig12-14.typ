// 图 12·14 大炮发射炮弹（原书 p.401）
// 上半（大炮、炮弹）是写实插画：保留原扫描裁剪的二值化 PNG（fig12-14.png，已涂去 m、v、α、M 字样，用 CeTZ 补回）；
// 下半（Mv′ 与 mv 的分解图）是线条图，用 CeTZ 重绘。
// 坐标取自 p.401 的“显示图”坐标（宽 1568），裁剪图左上角在显示图 (865, 1255)，放大 2.1314 倍。
#import "/common/series.typ": *

#let fig-12-14(width: 9cm) = px-canvas(1167, 1110, width: width, (p, u) => {
  import cetz.draw: *
  let s = 2.1314
  let q = (x, y) => p((x - 865) * s, (y - 1255) * s)
  let txt(x, y, body) = content(q(x, y), anchor: "center", text(size: 8pt, body))
  let arr(a, b) = line(q(..a), q(..b), stroke: 1pt, mark: (end: "stealth", fill: black, scale: 0.5))
  content(p(0, 0), anchor: "north-west", image("fig12-14.png", width: 1167 * u))
  // 补回位图上涂掉的字母
  txt(1272, 1305, $m$)
  txt(1393, 1258, $v$)
  txt(1163, 1440, $alpha$)
  txt(1042, 1517, $M$)
  // 动量矢量
  arr((1085, 1728), (955, 1728))
  txt(1020, 1708, $M v'$)
  arr((1163, 1728), (1163, 1650))
  arr((1163, 1728), (1308, 1728))
  arr((1163, 1728), (1308, 1655))
  line(q(1200, 1728), q(1197, 1716), stroke: 0.6pt)
  txt(1224, 1712, $alpha$)
  txt(1195, 1627, $m v sin alpha$)
  txt(1300, 1627, $m v$)
  txt(1232, 1756, $m v cos alpha$)
})
