// 图 4·8（原书 p.141）导出气态方程的附图：气缸中气体的初始、中间、最终三种状态。
// 示意图，按原图重绘（酒精灯与火焰为示意）。坐标取 200 dpi 页面像素。
#import "/common/series.typ": *

#let fig-4-8(width: 9cm) = px-canvas(520, 360, origin: (320, 815), width: width, (p, u) => {
  import cetz.draw: *
  let it = s => text(size: 9pt, style: "italic", s)
  let wall(x0, x1) = line(p(x0, 831), p(x0, 1017), p(x1, 1017), p(x1, 831), stroke: 1.4pt)
  let hatch(x0, x1, y0, y1) = {
    rect(p(x0, y0), p(x1, y1), stroke: 0.8pt)
    let n = int((x1 - x0) / 3.4)
    for i in range(0, n) {
      let x = x0 + 1 + i * 3.4
      line(p(x, y1), p(x + 3, y0), stroke: 0.4pt)
    }
  }
  // (a)
  wall(338, 447)
  line(p(338, 855), p(447, 855), stroke: 0.9pt)
  line(p(338, 859), p(447, 859), stroke: 0.9pt)
  content(p(392, 966), text(size: 9pt)[#text(style: "italic")[P#sub[1]V#sub[1]T#sub[1]]])
  content(p(392, 1157), it[(a)])
  // (b)
  wall(517, 624)
  line(p(517, 917), p(624, 917), stroke: 0.9pt)
  line(p(517, 921), p(624, 921), stroke: 0.9pt)
  hatch(531, 612, 897, 917)
  content(p(570, 966), text(size: 9pt)[#text(style: "italic")[P#sub[c]V#sub[2]T#sub[1]]])
  content(p(570, 1157), it[(b)])
  // (c)
  wall(696, 801)
  line(p(696, 917), p(801, 917), stroke: 0.9pt)
  line(p(696, 921), p(801, 921), stroke: 0.9pt)
  hatch(709, 790, 896, 917)
  hatch(718, 778, 876, 896)
  content(p(748, 966), text(size: 9pt)[#text(style: "italic")[P#sub[2]V#sub[2]T#sub[2]]])
  content(p(748, 1157), it[(c)])
  // 酒精灯与火焰
  let cx = 748
  line(p(cx - 6, 1058), p(cx - 18, 1030), p(cx - 24, 1023), stroke: 0.6pt)
  line(p(cx + 6, 1058), p(cx + 18, 1030), p(cx + 24, 1023), stroke: 0.6pt)
  line(p(cx, 1056), p(cx, 1028), stroke: 0.6pt)
  rect(p(cx - 24, 1074), p(cx + 24, 1090), stroke: 0.9pt)
  rect(p(cx - 4, 1058), p(cx + 4, 1074), stroke: 0.9pt)
  line(p(cx - 24, 1082), p(cx + 24, 1082), stroke: 0.5pt)
})
