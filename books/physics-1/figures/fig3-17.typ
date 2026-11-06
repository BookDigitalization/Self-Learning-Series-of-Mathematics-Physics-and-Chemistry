// 图 3·17 测量液体的比重（原书 p.62）
// 线条图，按原图重绘：（a）（b）两幅 U 形管，水银（深灰）和待测液体（浅灰）；原图的斜线填充改为灰色填充。
// 坐标取自原页 200 dpi 预览图在看图工具里的显示坐标；画布原点为显示图 (410,90)，宽 900、高 420。
#import "/common/series.typ": *
#import "fig3-utube.typ": utube

#let fig-3-17(width: 12cm) = px-canvas(900, 420, width: width, (p, u) => {
  import cetz.draw: *
  let q(x, y) = p(x - 410, y - 90)
  let t(x, y, body, sz: 8.5pt) = content(q(x, y), anchor: "center", text(size: sz, body))
  let dash = (thickness: 0.6pt, dash: "dashed")
  let arr(x, y0, y1) = line(q(x, y0), q(x, y1), stroke: 0.7pt,
    mark: (start: "stealth", end: "stealth", fill: black, scale: 0.4))
  let hg = luma(140)
  let lq = luma(220)
  // （a）
  utube(q, 467, 738, 30, 125, 447, 55, ((283, 160, lq), (283, 355, hg)))
  line(q(415, 357), q(785, 357), stroke: dash)
  arr(515, 283, 357)
  arr(690, 160, 357)
  t(524, 321, $h_1$)
  t(692, 262, $h_2$)
  t(425, 343, $A$, sz: 9pt)
  t(776, 341, $B$, sz: 9pt)
  t(580, 495, $(a)$)
  // （b）
  utube(q, 1000, 1262, 28, 100, 422, 50, ((255, 135, lq), (255, 333, hg)))
  line(q(945, 333), q(1300, 333), stroke: dash)
  line(q(950, 405), q(1295, 405), stroke: dash)
  line(q(1133, 395), q(1133, 425), stroke: 1pt)
  arr(1045, 255, 333)
  arr(1215, 135, 333)
  arr(972, 333, 405)
  arr(1285, 333, 405)
  t(1050, 297, $h_1$)
  t(1212, 232, $h_2$)
  t(972, 372, $h_3$)
  t(1285, 368, $h_3$)
  t(962, 318, $A$, sz: 9pt)
  t(1290, 316, $B$, sz: 9pt)
  t(1135, 373, $C$, sz: 9pt)
  t(1133, 440, $D$, sz: 9pt)
  t(1135, 473, $(b)$)
})
