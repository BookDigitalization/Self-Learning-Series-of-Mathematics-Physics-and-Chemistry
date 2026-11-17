// 图 7·24 表明温度对水和水汽的密度的关系图（原书 p.263）
// CeTZ 重绘（曲线按原图描点），坐标是原页局部放大图（330 dpi 裁剪）的像素坐标，y 向下。
#import "/common/series.typ": *

#let fig-7-24(width: 9cm) = px-canvas(915, 880, width: width, (p, u) => {
  import cetz.draw: *
  let curve(..pts) = catmull(..pts.pos().map(a => p(..a)), stroke: 6 * u, tension: 0.5)
  let t(x, y, body, anchor: "center", s: 36) = content(p(x, y), anchor: anchor, text(size: s * u, body))
  let it(x, y, body) = t(x, y, body)
  // 一幅分图：顶 yt，底 yb，左 155，右 745；横向每 0.2 一格，纵向每 40°C 一格
  let frame(yt, yb) = {
    let dy = (yb - yt) / 5
    for i in range(0, 11) {
      line(p(155 + 59 * i, yb), p(155 + 59 * i, yt), stroke: 1.1 * u)
    }
    for j in range(0, 6) {
      line(p(155, yb - dy * j), p(745, yb - dy * j), stroke: 1.1 * u)
    }
    for (j, v) in ("0.2", "0.4", "0.6", "0.8", "1.0").enumerate() {
      t(143, yb - dy * (j + 1), v, anchor: "east")
    }
    for (i, v) in ("0", "80", "160", "240", "320").enumerate() {
      t(155 + 118 * i, yb + 22, v)
    }
    t(745, yb + 22, [400(°C)])
    content(p(52, (yt + yb) / 2), anchor: "center", angle: 90deg, text(size: 36 * u)[密度(克/厘米#super[3])])
  }
  // (a)
  frame(22, 328)
  curve((155, 24), (270, 30), (390, 50), (450, 68), (510, 88), (560, 108), (610, 130), (660, 152))
  curve((155, 327), (270, 326), (390, 322), (450, 316), (510, 308), (560, 296), (610, 278), (648, 258))
  it(170, 46, $C$); it(668, 176, $D$); it(655, 240, $B$); it(172, 312, $A$)
  t(432, 95, [液体]); t(450, 298, [蒸汽])
  t(285, 392, [($a$) 临界温度($t_K$)])
  // (b)
  frame(465, 760)
  curve((155, 467), (270, 472), (390, 490), (450, 508), (510, 525), (560, 545), (610, 570), (650, 598), (690, 618), (708, 640))
  curve((708, 640), (708, 668), (695, 692), (670, 714), (630, 732), (570, 746), (510, 755), (450, 759), (155, 760))
  line(p(710, 690), p(710, 765), stroke: (thickness: 1.6 * u, dash: "dotted"))
  it(172, 488, $C$); it(655, 562, $D$); it(728, 625, $K$); it(622, 717, $B$); it(172, 740, $A$)
  t(450, 530, [液体]); t(455, 737, [蒸汽])
  t(285, 822, [($b$) 临界温度($t_K$)])
})
