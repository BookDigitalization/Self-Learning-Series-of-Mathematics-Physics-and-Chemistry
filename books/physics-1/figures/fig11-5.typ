// 图 11·5 拉力的分解（原书 p.332）
// 滚子是写实插画，沿用原扫描裁剪（fig11-5.png）；力的箭头、虚线、字母用 CeTZ 重绘。
// 坐标是 render-pages.py --dpi 200 显示图（宽 1568）上的像素坐标；png 左上角在 (855,935)，宽 242。
#import "/common/series.typ": *

#let fig-11-5(width: 7cm) = px-canvas(500, 190, origin: (855, 885), width: width, (p, u) => {
  import cetz.draw: *
  content(p(855, 935), anchor: "north-west", image("fig11-5.png", width: 242 * u))
  let lab(x, y, body) = content(p(x, y), anchor: "center", text(size: 10pt, body))
  let arr = (end: "stealth", fill: black, scale: 0.5)
  let (ox, oy) = (1097, 975)
  line(p(ox, oy), p(1310, 925), stroke: 1pt, mark: arr)           // F
  line(p(ox, oy), p(1310, oy), stroke: 1pt, mark: arr)            // F2
  line(p(ox, oy), p(ox, 925), stroke: 1pt, mark: arr)             // F1
  line(p(ox, 925), p(1310, 925), stroke: (paint: black, thickness: 0.8pt, dash: "dashed"))
  line(p(1310, 925), p(1310, oy), stroke: (paint: black, thickness: 0.8pt, dash: "dashed"))
  lab(1088, 902, $F_1$)
  lab(1330, 920, $F$)
  lab(1330, 990, $F_2$)
  lab(1200, 963, $alpha$)
  line(p(1118, 1043), p(1200, 1043), stroke: 1pt, mark: arr)
  content(p(1270, 1045), anchor: "center", text(font: fonts.hei, size: 8pt, weight: "medium", [运动方向]))
})
