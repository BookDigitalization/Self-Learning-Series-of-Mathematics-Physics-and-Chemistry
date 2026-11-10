// 复习题四 *12 的插图（原书 p.181，无编号）：地道截面，矩形上接半圆，半径 r、矩形高 h。
// 坐标取自 200 dpi 页面图（显示宽 1596 的缩放图，y 向下）：
// 半圆圆心 (1246, 635)，半径 148；矩形左 x=1098、右 x=1394、下 y=985；
// 高度标注线 x=1065；半径箭头从圆心指向 (1337, 530)。未用网格精量。
#import "/common/series.typ": *

#let fig-ex4-12(width: 4.4cm) = px-canvas(390, 540, origin: (1030, 470), width: width, (p, u) => {
  import cetz.draw: *
  let ar = (end: "stealth", fill: black, scale: 0.5)
  let ar2 = (start: "stealth", end: "stealth", fill: black, scale: 0.5)
  let lw = 1.4pt
  // 半圆
  arc(p(1246, 635), start: 0deg, stop: 180deg, radius: 148, anchor: "origin", stroke: lw)
  // 矩形三边和半圆的直径
  line(p(1098, 635), p(1098, 985), p(1394, 985), p(1394, 635), stroke: lw)
  line(p(1098, 635), p(1394, 635), stroke: lw)
  // 高度 h 的标注：两端短横线
  line(p(1065, 635), p(1065, 985), stroke: 0.6pt, mark: ar2)
  line(p(1052, 635), p(1078, 635), stroke: 0.6pt)
  line(p(1052, 985), p(1078, 985), stroke: 0.6pt)
  content(p(1046, 810), box(fill: white, inset: 1pt, text(font: fonts.song, size: 8pt, $h$)))
  // 半径 r
  line(p(1246, 635), p(1337, 530), stroke: 0.6pt, mark: ar)
  content(p(1267, 582), text(font: fonts.song, size: 8pt, $r$))
})
