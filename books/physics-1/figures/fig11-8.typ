// 图 11·8 斜面上的物体（原书 p.335）
// 受力图，按原图重绘。坐标是 render-pages.py --dpi 200 显示图（宽 1568）上的像素坐标。
// 斜面倾角按原图约 22° 画；原图中 α、θ 的标注位置按原图摆放（见待核对清单）。
#import "/common/series.typ": *

#let fig-11-8(width: 6.4cm) = px-canvas(520, 500, origin: (880, 1430), width: width, (p, u) => {
  import cetz.draw: *
  let lab(x, y, body) = content(p(x, y), anchor: "center", text(size: 9pt, body))
  let arr = (end: "stealth", fill: black, scale: 0.45)
  let dash = (paint: black, thickness: 0.8pt, dash: "dashed")
  // 斜面和水平线
  line(p(890, 1723), p(1375, 1525), stroke: 1pt)
  line(p(890, 1723), p(1385, 1715), stroke: 1pt)
  // 物体：沿斜面的矩形
  let (ux, uy) = (0.927, -0.375)
  let (nx, ny) = (-0.375, -0.927)
  let (bx, by) = (1122, 1628)
  let c(a, h) = p(bx + a * ux + h * nx, by + a * uy + h * ny)
  line(c(-28, 0), c(-28, 55), c(28, 55), c(28, 0), close: true, stroke: 1pt)
  let (cx, cy) = (1112, 1603)
  // 力
  line(p(cx, cy), p(1060, 1452), stroke: 1pt, mark: arr)                // N
  line(p(1140, 1612), p(1225, 1565), stroke: 1pt, mark: arr)           // F
  line(p(1150, 1640), p(1195, 1618), stroke: 1pt, mark: arr)           // f
  line(p(cx, cy), p(1062, 1642), stroke: 1pt, mark: arr)                // G1
  line(p(cx, cy), p(1117, 1895), stroke: 1pt, mark: arr)                // G
  line(p(cx + 0.375 * 8, cy + 0.927 * 8), p(1190, 1850), stroke: dash, mark: arr) // G2
  lab(1078, 1452, $N$)
  lab(1215, 1556, $F$)
  lab(1198, 1630, $f$)
  lab(1025, 1635, $G_1$)
  lab(1097, 1912, $G$)
  lab(1212, 1862, $G_2$)
  lab(1098, 1660, $alpha$)
  lab(1132, 1690, $theta$)
  lab(998, 1700, $theta$)
})
