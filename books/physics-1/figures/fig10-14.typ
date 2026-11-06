// 图 10·14 铁橇撬石的另一种用法（原书 p.308）与 图 10·15 水压机（原书 p.308）
// 图 10·14 用 CeTZ 近似重绘（石块用椭圆代替原图的手绘轮廓）；坐标是 render-pages.py --dpi 200 显示图（宽 1568）上的像素坐标。
// 图 10·15 沿用原扫描裁剪（fig10-15.png，已涂去字母，397×... 见下），F、F′、G 用文字补回；
//   换算：(x-915)×2.1314, (y-500)×2.1314。
#import "/common/series.typ": *

#let fig-10-14(width: 6.6cm) = px-canvas(450, 420, origin: (350, 495), width: width, (p, u) => {
  import cetz.draw: *
  let lab(x, y, body) = content(p(x, y), anchor: "center", text(size: 8.5pt, body))
  let arr = (end: "stealth", fill: black, scale: 0.45)
  // 地面
  line(p(355, 790), p(780, 790), stroke: 1pt)
  // 石块
  circle(p(415, 732), radius: (58 * u, 80 * u), stroke: 1pt)
  circle(p(437, 682), radius: 2.5 * u, fill: black, stroke: none)
  // 铁橇
  line(p(510, 512), p(612, 745), stroke: 1.6pt)
  line(p(612, 745), p(648, 760), p(626, 800), p(470, 795), close: false, stroke: 1pt)
  line(p(612, 745), p(655, 748), stroke: 1pt)
  // 力
  line(p(510, 515), p(603, 515), stroke: 1pt, mark: arr); lab(612, 520, $F$)
  line(p(422, 730), p(422, 885), stroke: 1pt, mark: arr); lab(442, 875, $G$)
  line(p(437, 682), p(470, 792), stroke: 1pt, mark: arr); lab(476, 722, $N$)
  // N 的作用线与力臂 L₁
  line(p(470, 792), p(507, 858), stroke: (thickness: 0.6pt, dash: "dashed"))
  line(p(630, 806), p(509, 856), stroke: 0.6pt, mark: arr)
  lab(558, 822, $L_1$)
  lab(634, 816, $O$)
})

#let fig-10-15(width: 6.6cm) = px-canvas(917, 837,width: width, (p, u) => {
  import cetz.draw: *
  content(p(0, 0), anchor: "north-west", image("fig10-15.png", width: 917 * u))
  let d(x, y) = ((x - 915) * 2.1314, (y - 500) * 2.1314)
  let lab(x, y, body) = content(p(..d(x, y)), anchor: "center", text(size: 9pt, body))
  lab(927, 596, $F$)
  lab(1000, 592, $F'$)
  lab(1221, 512, $G$)
})
