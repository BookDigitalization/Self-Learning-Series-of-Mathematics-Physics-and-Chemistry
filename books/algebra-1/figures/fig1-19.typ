// 图 1·19 正方形的地（边长 8 米）、图 1·20 正方体（棱长 8 米）（原书 p.65）
// 坐标取自 p.65 局部放大图（200 dpi 页面像素，局部放大 3 倍后除以 3；y 向下），两幅图各用各的局部原点。
#import "/common/series.typ": *

#let dim-text(p, x, y, body) = cetz.draw.content(p(x, y), text(font: fonts.song, size: 8pt, body),
  frame: "rect", fill: white, stroke: none, padding: 1.2pt)

#let fig-1-19(width: 4.6cm) = px-canvas(300, 255, width: width, (p, u) => {
  import cetz.draw: *
  let arr = (start: "stealth", end: "stealth", fill: black, scale: 0.4)
  // 正方形
  rect(p(60, 33), p(240, 218), stroke: 0.9pt)
  // 右侧高的标注
  line(p(252, 33), p(268, 33), stroke: 0.5pt)
  line(p(252, 220), p(268, 220), stroke: 0.5pt)
  line(p(260, 33), p(260, 220), stroke: 0.5pt, mark: arr)
  dim-text(p, 268, 123, [8 米])
  // 下方宽的标注
  line(p(60, 232), p(60, 246), stroke: 0.5pt)
  line(p(241, 232), p(241, 246), stroke: 0.5pt)
  line(p(60, 239), p(241, 239), stroke: 0.5pt, mark: arr)
  dim-text(p, 149, 239, [8 米])
})

#let fig-1-20(width: 5.2cm) = px-canvas(360, 380, width: width, (p, u) => {
  import cetz.draw: *
  let arr = (start: "stealth", end: "stealth", fill: black, scale: 0.4)
  let dash = (dash: "dashed")
  // 可见的棱（粗实线）
  rect(p(49, 139), p(228, 322), stroke: 0.9pt)
  line(p(49, 139), p(116, 69), p(293, 69), p(228, 139), stroke: 0.9pt)
  line(p(293, 69), p(295, 254), p(228, 322), stroke: 0.9pt)
  // 看不见的棱（虚线）
  line(p(116, 69), p(117, 253), p(295, 254), stroke: (thickness: 0.6pt, dash: "dashed"))
  line(p(49, 319), p(117, 253), stroke: (thickness: 0.6pt, dash: "dashed"))
  // 高的标注
  line(p(302, 69), p(322, 69), stroke: 0.5pt)
  line(p(302, 255), p(322, 255), stroke: 0.5pt)
  line(p(313, 69), p(313, 255), stroke: 0.5pt, mark: arr)
  dim-text(p, 322, 163, [8 米])
  // 宽的标注
  line(p(49, 337), p(49, 351), stroke: 0.5pt)
  line(p(229, 337), p(229, 351), stroke: 0.5pt)
  line(p(49, 343), p(229, 343), stroke: 0.5pt, mark: arr)
  dim-text(p, 137, 343, [8 米])
  // 深的标注
  line(p(243, 322), p(267, 322), stroke: 0.5pt)
  line(p(305, 265), p(255, 322), stroke: 0.5pt, mark: arr)
  dim-text(p, 290, 293, [8 米])
})
