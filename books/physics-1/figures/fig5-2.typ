// 图 5·2 匀加速和匀减速直线运动加速度的方向示意图（原书 p.124）
// 线条图，按原图重绘。坐标取自 200 dpi 页面图的“显示图”坐标（宽 1568），原点取 (380, 830)。
#import "/common/series.typ": *

#let fig-5-2(width: 12cm) = px-canvas(820, 350, origin: (380, 830), width: width, (p, u) => {
  import cetz.draw: *
  let hei(x, y, body, anchor: "center") = content(p(x, y), anchor: anchor, text(font: fonts.kai, size: 8.5pt, body))
  let var(x, y, body) = content(p(x, y), anchor: "center", text(size: 9pt, body))
  let arr(a, b, w: 0.8pt) = line(a, b, stroke: w, mark: (end: "stealth", fill: black, scale: 0.45))
  let tick(x, y) = line(p(x, y - 9), p(x, y + 9), stroke: 0.6pt)

  // ── 匀加速 ──
  hei(450, 860, [匀加速])
  hei(450, 892, [直线运动])
  arr(p(515, 878), p(1125, 878))
  var(548, 857, $A$)
  var(597, 857, $v_0$)
  var(875, 860, $B$)
  var(995, 858, $v$)
  var(775, 838, $a$)
  arr(p(735, 855), p(818, 855), w: 1.4pt)
  hei(1180, 870, [运动方向])
  hei(1180, 905, [（正方向）])
  // 矢量关系
  var(708, 905, $v_0$)
  var(775, 905, $v - v_0$)
  arr(p(682, 925), p(735, 925))
  arr(p(735, 925), p(820, 925))
  arr(p(682, 942), p(820, 942))
  tick(682, 933)
  tick(735, 925)
  tick(820, 933)
  var(752, 960, $v$)

  // ── 匀减速 ──
  hei(445, 1045, [匀减速])
  hei(445, 1076, [直线运动])
  arr(p(510, 1060), p(1115, 1060))
  var(545, 1040, $A$)
  var(680, 1042, $v_0$)
  var(863, 1040, $B$)
  var(903, 1040, $v$)
  var(782, 1015, $a$)
  arr(p(812, 1034), p(728, 1034), w: 1.4pt)
  hei(1170, 1043, [运动方向])
  hei(1170, 1078, [（正方向）])
  // 矢量关系
  var(762, 1103, $v_0$)
  arr(p(683, 1118), p(825, 1118))
  arr(p(683, 1135), p(738, 1135))
  arr(p(825, 1135), p(738, 1135))
  tick(683, 1126)
  tick(738, 1135)
  tick(825, 1126)
  var(712, 1152, $v$)
  var(775, 1152, $v - v_0$)
})
