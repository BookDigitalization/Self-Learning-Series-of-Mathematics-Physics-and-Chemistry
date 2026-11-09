// §1·6 图 1·5（p.20）、§1·8 图 1·9～1·12（p.25–27）、§1·9 图 1·13、1·14（p.32）：路程示意图（直线上的路线与距离标注）
// 坐标取自原书页面像素坐标（200 dpi 预览网格，y 向下）。
// 图 1·14 左端的“30 公里”在扫描上近似“80 公里”，按文义（向西行 30 公里）作 30。
#import "/common/series.typ": *

#let ar = (fill: black, scale: 0.6)
#let lab(p, x, y, body) = {
  import cetz.draw: *
  content(p(x, y), text(font: fonts.song, size: 7pt, body))
}

// 尺寸线：x0～x1 间，高度 y，两端各一竖杠；a0/a1 表示该端是否带箭头；label 居中于 cx，两侧留空 gw
#let dim(p, x0, x1, y, label, cx, a0: true, a1: true, gw: 30) = {
  import cetz.draw: *
  line(p(x0, y), p(cx - gw, y), stroke: 0.5pt, mark: if a0 { (start: "stealth", ..ar) } else { (:) })
  line(p(cx + gw, y), p(x1, y), stroke: 0.5pt, mark: if a1 { (end: "stealth", ..ar) } else { (:) })
  line(p(x0, y - 7), p(x0, y + 7), stroke: 0.6pt)
  line(p(x1, y - 7), p(x1, y + 7), stroke: 0.6pt)
  lab(p, cx, y, label)
}

// 路线轴：粗线，右端箭头；pts 为圆点位置（小点 small 表示中间的小圆）
#let route(p, y, x0, x1, big, small: ()) = {
  import cetz.draw: *
  line(p(x0, y), p(x1, y), stroke: 1.2pt, mark: (end: "stealth", fill: black, scale: 0.5))
  for x in big { circle(p(x, y), radius: 3.5, fill: white, stroke: 0.6pt) }
  for x in small { circle(p(x, y), radius: 2.5, fill: white, stroke: 0.6pt) }
}

// 竖排两字（如“甲／地”）
#let vtext(p, x, y0, y1, a, b) = { lab(p, x, y0, a); lab(p, x, y1, b) }

// 图 1·5：p.20
#let fig-1-5(width: 10cm) = px-canvas(690, 60, origin: (200, 450), width: width, (p, u) => {
  import cetz.draw: *
  line(p(210, 487), p(887, 487), stroke: 1.2pt, mark: (end: "stealth", fill: black, scale: 0.5))
  for x in (315, 532, 753) { circle(p(x, 487), radius: 3.5, fill: white, stroke: 0.6pt) }
  dim(p, 315, 532, 469, [30公里], 427)
  dim(p, 532, 753, 469, [30公里], 613)
  lab(p, 315, 503, [丙]); lab(p, 532, 503, [甲]); lab(p, 753, 503, [乙])
})

// 图 1·9：p.25
#let fig-1-9(width: 10.5cm) = px-canvas(780, 70, origin: (200, 1280), width: width, (p, u) => {
  route(p, 1312, 232, 950, (303, 592, 808))
  lab(p, 213, 1314, [西]); lab(p, 967, 1314, [东])
  dim(p, 303, 592, 1295, [4公里], 447)
  dim(p, 592, 808, 1295, [3公里], 700)
  dim(p, 303, 808, 1330, [7公里], 556)
  vtext(p, 292, 1331, 1347, [甲], [地])
})

// 图 1·10：p.26
#let fig-1-10(width: 10.5cm) = px-canvas(800, 80, origin: (140, 655), width: width, (p, u) => {
  route(p, 688, 172, 897, (259, 473, 765))
  lab(p, 155, 690, [西]); lab(p, 907, 688, [东])
  dim(p, 259, 473, 672, [3公里], 367)
  dim(p, 473, 765, 672, [4公里], 605)
  dim(p, 259, 765, 706, [7公里], 453)
  vtext(p, 773, 698, 722, [甲], [地])
})

// 图 1·11：p.27，点间距 72 px（1 公里）
#let fig-1-11(width: 9.5cm) = px-canvas(710, 100, origin: (240, 350), width: width, (p, u) => {
  route(p, 400, 290, 890, (398, 470, 688), small: (542, 615))
  lab(p, 272, 401, [西]); lab(p, 913, 403, [东])
  dim(p, 398, 688, 367, [4公里], 530)
  dim(p, 470, 688, 385, [3公里], 565, gw: 28)
  // 1 公里：尺寸线在上，文字在下
  dim(p, 398, 470, 415, [], 434, gw: 0)
  lab(p, 433, 433, [1公里])
  vtext(p, 385, 413, 433, [甲], [地])
})

// 图 1·12：p.27
#let fig-1-12(width: 9.5cm) = px-canvas(730, 100, origin: (230, 1085), width: width, (p, u) => {
  route(p, 1138, 271, 917, (435, 651, 723), small: (507, 579))
  lab(p, 250, 1139, [西]); lab(p, 940, 1139, [东])
  dim(p, 435, 723, 1103, [4公里], 577)
  dim(p, 435, 651, 1120, [3公里], 537, gw: 28)
  dim(p, 651, 723, 1157, [], 687, gw: 0)
  lab(p, 687, 1172, [1公里])
  vtext(p, 733, 1150, 1170, [甲], [地])
})

// 图 1·13：p.32，每 10 公里一个点
#let fig-1-13(width: 10cm) = px-canvas(720, 100, origin: (180, 590), width: width, (p, u) => {
  route(p, 650, 217, 857, (355, 495, 713), small: (427, 570, 639))
  lab(p, 203, 647, [西]); lab(p, 873, 650, [东])
  dim(p, 355, 713, 614, [第一天], 537, a0: false)
  dim(p, 495, 713, 634, [第二天], 613, a1: false)
  lab(p, 359, 667, [原地]); lab(p, 495, 667, [20公里]); lab(p, 713, 667, [50公里])
})

// 图 1·14：p.32
#let fig-1-14(width: 10cm) = px-canvas(760, 100, origin: (160, 900), width: width, (p, u) => {
  route(p, 960, 193, 883, (327, 543, 689), small: (399, 471, 615))
  lab(p, 179, 958, [西]); lab(p, 897, 960, [东])
  dim(p, 327, 691, 923, [第二天], 513, a0: false)
  dim(p, 327, 543, 944, [第一天], 437, a1: false)
  lab(p, 327, 977, [30公里]); lab(p, 543, 977, [原地]); lab(p, 689, 977, [20公里])
})
