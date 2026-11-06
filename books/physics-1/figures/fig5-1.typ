// 图 5·1 小球沿光滑斜槽下滑（原书 p.119）
// 线条图，按原图重绘。坐标取自裁剪图（原页显示图 (540,1500) 起，×2.1314）的像素坐标，画布 1493×853。
#import "/common/series.typ": *

#let fig-5-1(width: 9cm) = px-canvas(1493, 853, width: width, (p, u) => {
  import cetz.draw: *
  // 地面及斜线
  line(p(30, 705), p(1465, 705), stroke: 1.6pt)
  for x in range(45, 1400, step: 85) {
    line(p(x + 20, 708), p(x - 15, 745), stroke: 0.8pt)
  }
  // 斜槽
  line(p(225, 665), p(1350, 122), stroke: 0.9pt)
  line(p(240, 697), p(1262, 205), stroke: 0.9pt)
  line(p(225, 665), p(240, 697), stroke: 0.9pt)
  line(p(1350, 122), p(1366, 152), stroke: 0.9pt)
  line(p(1366, 152), p(1262, 205), stroke: 0.9pt)
  // 支柱
  line(p(1222, 205), p(1222, 705), stroke: 1.2pt)
  line(p(1262, 205), p(1262, 705), stroke: 1.2pt)
  // 小球
  for (x, y) in ((1280, 118), (1225, 143), (1140, 183), (1035, 240), (978, 262), (885, 310), (800, 358), (350, 578)) {
    circle(p(x, y), radius: 26, stroke: 0.8pt, fill: white)
  }
  let lab(x, y, body) = content(p(x, y), anchor: "center", text(size: 9pt, body))
  lab(1215, 68, $A$)
  lab(1140, 100, $B$)
  lab(1050, 155, $C$)
  lab(960, 212, $C''$)
  lab(870, 238, $C'$)
  lab(805, 285, $D$)
  lab(365, 500, $E$)
  // 运动方向箭头
  line(p(1025, 100), p(700, 262), stroke: 0.9pt, mark: (end: "stealth", fill: black, scale: 0.5))
})
