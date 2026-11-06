// 图 4·16 速度的合成（原书 p.111）
// 线条图 CeTZ 重绘；坐标取自 200 dpi 页面图的显示坐标（原点 (640,1180)）。
#import "/common/series.typ": *

#let fig-4-16(width: 10cm) = px-canvas(560, 320, origin: (640, 1180), width: width, (p, u) => {
  import cetz.draw: *
  let lab(x, y, body) = content(p(x, y), anchor: "center", text(size: 8.5pt, body))
  let thick = (end: "stealth", fill: black, scale: 0.6)
  let thin = (end: "stealth", fill: black, scale: 0.45)
  let o = (688, 1436)
  let (q1, q2, s1) = ((800, 1437), (905, 1434), (1005, 1432))
  let (r1, r2, s2) = ((735, 1362), (790, 1290), (838, 1232))
  let (p1, p2, s) = ((845, 1365), (1015, 1285), (1155, 1215))
  // 平行四边形的虚线
  let dsh = (thickness: 0.8pt, dash: "dashed")
  line(p(..q1), p(..p1), stroke: dsh)
  line(p(..q2), p(..p2), stroke: dsh)
  line(p(..s1), p(..s), stroke: dsh)
  line(p(..r1), p(..p1), stroke: dsh)
  line(p(..r2), p(..p2), stroke: dsh)
  line(p(..s2), p(..s), stroke: dsh)
  // 基线与左侧斜线
  line(p(..o), p(..s1), stroke: 0.8pt)
  line(p(..o), p(..s2), stroke: 0.8pt)
  // 合路程 Os（细线，箭头在 S）
  line(p(..o), p(..s), stroke: 0.8pt, mark: thin)
  // 分速度 v1、v2 和合速度 v（粗箭头）
  line(p(..o), p(..q1), stroke: 1.6pt, mark: thick)
  line(p(..o), p(..r1), stroke: 1.6pt, mark: thick)
  line(p(..o), p(..p1), stroke: 1.6pt, mark: thick)
  lab(665, 1450, $O$)
  lab(1014, 1452, $S_1$)
  lab(830, 1212, $S_2$)
  lab(1166, 1204, $S$)
  lab(792, 1462, $v_1$)
  lab(722, 1350, $v_2$)
  lab(742, 1388, $v$)
  lab(888, 1460, $(v_1)$)
  lab(963, 1452, $(v_1)$)
  lab(758, 1292, $(v_2)$)
  lab(800, 1260, $(v_2)$)
  lab(892, 1308, $(v)$)
  lab(1048, 1246, $(v)$)
})
