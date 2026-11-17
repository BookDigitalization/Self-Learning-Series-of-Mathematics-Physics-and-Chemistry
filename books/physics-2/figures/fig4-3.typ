// 图 4·3（原书 p.122）观察气体热膨胀的装置：（a）烧瓶在冰水混合物中，（b）烧瓶在热水中。
// 装置示意图，按原图简化重绘（冰块、水面、刻度尺均为示意）。坐标取 200 dpi 页面像素。
#import "/common/series.typ": *

#let fig-4-3(width: 9cm) = px-canvas(540, 740, origin: (260, 160), width: width, (p, u) => {
  import cetz.draw: *
  let it = (s, sz: 9pt) => text(size: sz, style: "italic", s)
  // 刻度尺管：矩形 + 细刻度；mx0 为水银滴左端
  let ruler(x0, x1, y0, y1, mx0) = {
    rect(p(x0, y0), p(x1, y1), stroke: 0.9pt)
    line(p(x0, (y0 + y1) / 2 + 3), p(x1, (y0 + y1) / 2 + 3), stroke: 0.5pt)
    let n = int((x1 - x0 - 30) / 4)
    for i in range(0, n) {
      let x = x0 + 15 + i * 4
      let h = if calc.rem(i, 5) == 0 { 7 } else { 4 }
      line(p(x, (y0 + y1) / 2 + 3), p(x, (y0 + y1) / 2 + 3 + h), stroke: 0.4pt)
    }
    rect(p(mx0, (y0 + y1) / 2 - 6), p(mx0 + 30, (y0 + y1) / 2 + 2), radius: 4, fill: black, stroke: none)
    line(p(x1, (y0 + y1) / 2 - 2), p(x1 + 14, (y0 + y1) / 2 - 2), stroke: 0.9pt)
    line(p(x1, (y0 + y1) / 2 + 4), p(x1 + 14, (y0 + y1) / 2 + 4), stroke: 0.9pt)
  }
  // 烧瓶（双线表示玻璃壁）与瓶颈
  let flask(cx, cy, r, ytube) = {
    circle(p(cx, cy), radius: r, stroke: 1.1pt, fill: white)
    circle(p(cx, cy), radius: r - 4, stroke: 0.5pt)
    line(p(cx - 4, cy - r + 1), p(cx - 4, ytube + 8), stroke: 0.9pt)
    line(p(cx + 4, cy - r + 1), p(cx + 4, ytube + 8), stroke: 0.9pt)
    arc(p(cx - 4, ytube + 8), start: 180deg, stop: 90deg, radius: 8 * u, stroke: 0.9pt)
  }
  // (a) 冰水混合物
  ruler(385, 800, 195, 230, 415)
  content(p(462, 182), it[A])
  line(p(305, 265), p(305, 480), p(445, 480), p(445, 265), stroke: 1.5pt)
  // 冰块
  for (cx, cy, rx, ry) in ((325, 320, 14, 10), (355, 305, 13, 10), (420, 312, 14, 11), (330, 355, 12, 10), (320, 400, 12, 12), (330, 440, 15, 11), (365, 455, 14, 10), (405, 440, 14, 11), (428, 410, 12, 12), (432, 355, 11, 12), (410, 458, 12, 9)) {
    circle(p(cx, cy), radius: (rx, ry), stroke: 0.7pt)
  }
  flask(378, 388, 52, 224)
  content(p(378, 388), it[V#sub[0]])
  content(p(280, 378), text(size: 9pt, weight: "bold")[0°C])
  content(p(465, 498), it[(a)])
  // (b) 热水
  ruler(380, 785, 568, 605, 525)
  content(p(585, 555), it[B])
  line(p(300, 637), p(300, 847), p(438, 847), p(438, 637), stroke: 1.5pt)
  for y in (675, 690, 705, 768, 790, 810, 828) {
    line(p(306, y), p(332, y), stroke: 0.5pt)
    line(p(410, y), p(432, y), stroke: 0.5pt)
  }
  line(p(306, 675), p(432, 675), stroke: 0.6pt)
  flask(370, 748, 50, 595)
  content(p(370, 748), it[V#sub[t]])
  content(p(278, 747), text(size: 9pt)[#text(style: "italic")[t]°C])
  content(p(520, 865), it[(b)])
})
