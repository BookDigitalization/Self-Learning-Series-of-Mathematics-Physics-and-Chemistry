// §1·6 的插图：图 1·1（原书 p.33）、图 1·2（p.42）、图 1·3（p.43）、习题 1·6(6) 第 8 题插图（p.50，不编号）。
// 坐标取自各图局部放大图（200 dpi 页面像素，y 向下）；原图里的“車、時”等繁体照现行字形写作“车、时”。
#import "/common/series.typ": *

#let lab(p, x, y, body, size: 8pt) = cetz.draw.content(p(x, y), text(font: fonts.song, size: size, body))
#let arr = (end: "stealth", fill: black, scale: 0.4)
#let arr2 = (start: "stealth", end: "stealth", fill: black, scale: 0.4)

// 图 1·1：通讯员追学生队伍的路程线段图
#let fig-1-1(width: 9cm) = px-canvas(600, 90, origin: (200, 1170), width: width, (p, u) => {
  import cetz.draw: *
  // 通讯员走的路程 14x 公里
  line(p(222, 1188), p(705, 1188), stroke: 0.5pt, mark: arr2)
  line(p(705, 1180), p(705, 1196), stroke: 0.5pt)
  rect(p(430, 1181), p(535, 1195), stroke: none, fill: white)
  lab(p, 482, 1188, [$14x$ 公里])
  lab(p, 752, 1188, [通讯员])
  // 总线：甲到乙
  line(p(222, 1215), p(705, 1215), stroke: 1.6pt)
  line(p(222, 1208), p(222, 1222), stroke: 0.5pt)
  line(p(365, 1208), p(365, 1222), stroke: 0.5pt)
  // 学生队伍走的路程
  line(p(222, 1244), p(705, 1244), stroke: 0.5pt, mark: arr2)
  line(p(365, 1237), p(365, 1251), stroke: 0.5pt)
  line(p(705, 1237), p(705, 1251), stroke: 0.5pt)
  rect(p(258, 1237), p(336, 1251), stroke: none, fill: white)
  lab(p, 297, 1244, [$4x$ 公里])
  rect(p(450, 1233), p(592, 1257), stroke: none, fill: white)
  lab(p, 520, 1244, [$4 times frac(20, 60)$ 公里])
  lab(p, 745, 1244, [学生队伍])
})

// 图 1·2：两列火车相向而行
#let fig-1-2(width: 9cm) = px-canvas(620, 170, origin: (200, 640), width: width, (p, u) => {
  import cetz.draw: *
  line(p(261, 731), p(780, 731), stroke: 0.5pt, mark: arr2)
  line(p(780, 723), p(780, 739), stroke: 0.5pt)
  rect(p(480, 723), p(562, 739), stroke: none, fill: white)
  lab(p, 520, 731, [159 公里])
  line(p(261, 758), p(780, 758), stroke: 1.6pt)
  line(p(621, 751), p(621, 765), stroke: 0.5pt)
  lab(p, 248, 760, [甲])
  lab(p, 793, 760, [乙])
  line(p(261, 785), p(621, 785), stroke: 0.5pt, mark: arr2)
  line(p(621, 785), p(780, 785), stroke: 0.5pt, mark: arr2)
  line(p(780, 777), p(780, 793), stroke: 0.5pt)
  rect(p(385, 777), p(520, 793), stroke: none, fill: white)
  lab(p, 452, 785, [$36(1+x)$ 公里])
  rect(p(670, 777), p(745, 793), stroke: none, fill: white)
  lab(p, 705, 785, [$46x$ 公里])
})

// 沿给定折线走、拐角处圆角的开口路径：pts 为 (x, y) 列表，rs 为各内顶点的圆角半径
#let rpath(p, pts, rs, sw: 0.9pt) = {
  import cetz.draw: *
  let unit(a, b) = {
    let dx = b.at(0) - a.at(0)
    let dy = b.at(1) - a.at(1)
    let l = calc.sqrt(dx * dx + dy * dy)
    (dx / l, dy / l)
  }
  let cur = pts.at(0)
  for i in range(1, pts.len() - 1) {
    let v = pts.at(i)
    let r = rs.at(i - 1)
    let d1 = unit(pts.at(i - 1), v)
    let d2 = unit(v, pts.at(i + 1))
    let s = (v.at(0) - r * d1.at(0), v.at(1) - r * d1.at(1))
    let e = (v.at(0) + r * d2.at(0), v.at(1) + r * d2.at(1))
    line(p(..cur), p(..s), stroke: sw)
    bezier(p(..s), p(..e), p(..v), stroke: sw)
    cur = e
  }
  line(p(..cur), p(..pts.last()), stroke: sw)
}

// 图 1·3：环形跑道上甲、乙同向出发后再相遇
#let fig-1-3(width: 8.4cm) = px-canvas(500, 330, origin: (290, 480), width: width, (p, u) => {
  import cetz.draw: *
  // 甲：一圈不到，从起点出发到相遇处
  rpath(p, ((538, 741), (698, 741), (698, 551), (372, 551), (372, 645)), (40, 40, 40))
  // 跑道的一条线（粗线，闭合）
  rect(p(350, 531), p(718, 758), radius: 50 * u, stroke: 1.6pt)
  // 乙：多跑一圈
  rpath(p, ((538, 777), (738, 777), (738, 513), (330, 513), (330, 796), (757, 796), (757, 493), (310, 493), (310, 645)),
    (60, 66, 66, 66, 80, 80, 80))
  // 相遇处的虚线
  line(p(303, 646), p(380, 646), stroke: (thickness: 0.7pt, dash: "dashed"))
  // 起点的虚线
  line(p(538, 733), p(538, 786), stroke: (thickness: 0.7pt, dash: "dashed"))
  lab(p, 524, 741, [甲])
  lab(p, 524, 777, [乙])
  // 方向箭头
  let a(x1, y1, x2, y2) = line(p(x1, y1), p(x2, y2), stroke: 0.9pt, mark: arr)
  a(545, 493, 525, 493)
  a(545, 513, 525, 513)
  a(545, 531, 525, 531)
  a(545, 551, 525, 551)
  a(600, 741, 620, 741)
  a(600, 777, 620, 777)
  a(600, 796, 620, 796)
  a(698, 650, 698, 630)
  a(738, 650, 738, 630)
  a(757, 650, 757, 630)
  a(310, 625, 310, 645)
  a(372, 625, 372, 645)
})

// 习题 1·6(6) 第 8 题：铁板中央开一个正方形的口（图中涂灰的是铁板）
#let ex-1-6-8(width: 6.4cm) = px-canvas(420, 230, origin: (320, 1030), width: width, (p, u) => {
  import cetz.draw: *
  rect(p(342, 1042), p(682, 1227), stroke: 1.8pt, fill: luma(215))
  rect(p(478, 1105), p(545, 1175), stroke: 1.4pt, fill: white)
  lab(p, 505, 1118, [$x$])
  lab(p, 487, 1141, [$x$])
  lab(p, 532, 1141, [$x$])
  lab(p, 509, 1164, [$x$])
  lab(p, 702, 1136, [$x+3$])
  lab(p, 507, 1241, [$x+8$])
})
