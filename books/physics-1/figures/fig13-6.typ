// 图 13·6 物体通过曲线上不同位置的速度方向（原书 p.420）
// 示意图，按原图重绘：曲线上 A、B、C、D 四点，各点的速度 v_A、v_B、v_C、v_D 沿切线方向。
// 坐标是页面显示图（宽 1568）上的像素坐标；位置、曲线形状为目测示意。
#import "/common/series.typ": *

#let fig-13-6(width: 9cm) = px-canvas(660, 320, origin: (510, 875), width: width, (p, u) => {
  import cetz.draw: *
  let arr = (end: "stealth", fill: black, scale: 0.55)
  let lab(x, y, body) = content(p(x, y), anchor: "center", text(size: 9pt, body))
  let pts = ((523, 1187), (548, 1110), (580, 1017), (625, 1003), (680, 1018), (735, 1080),
    (790, 1097), (835, 1070), (870, 1020), (910, 960), (945, 903), (1000, 903), (1050, 910), (1150, 935))
  catmull(..pts.map(a => p(..a)), tension: 0.5, stroke: 1.2pt)
  let tdash = (thickness: 0.7pt, dash: "dashed")
  // A
  line(p(527, 1075), p(580, 1018), stroke: tdash)
  line(p(580, 1018), p(660, 950), stroke: 1.5pt, mark: arr)
  // B
  line(p(705, 1070), p(735, 1083), stroke: tdash)
  line(p(735, 1083), p(805, 1135), stroke: 1.5pt, mark: arr)
  // C
  line(p(825, 1083), p(848, 1050), stroke: tdash)
  line(p(848, 1050), p(912, 982), stroke: 1.5pt, mark: arr)
  // D
  line(p(940, 903), p(1000, 903), stroke: tdash)
  line(p(1050, 907), p(1095, 912), stroke: 1.5pt, mark: arr)
  lab(576, 1010, $A$)
  lab(723, 1103, $B$)
  lab(843, 1032, $C$)
  lab(978, 925, $D$)
  lab(678, 943, $v_A$)
  lab(823, 1162, $v_B$)
  lab(928, 1010, $v_C$)
  lab(1083, 889, $v_D$)
})
