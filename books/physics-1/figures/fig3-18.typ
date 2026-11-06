// 图 3·18 求酒精比重（原书 p.62）
// 线条图，按原图重绘（斜线填充改为灰色填充）。尺寸标注的文字是竖排（旋转 -90°）。
// 坐标取自原页 200 dpi 预览图在看图工具里的显示坐标；画布原点为显示图 (215,840)，宽 420、高 380。
#import "/common/series.typ": *
#import "fig3-utube.typ": utube

#let fig-3-18(width: 5.4cm) = px-canvas(420, 380, width: width, (p, u) => {
  import cetz.draw: *
  let q(x, y) = p(x - 215, y - 840)
  let v(x, y, body) = content(q(x, y), anchor: "center", std.rotate(-90deg, text(font: fonts.hei, size: 7.5pt, body)))
  let dash = (thickness: 0.6pt, dash: "dashed")
  let ah = (end: "stealth", fill: black, scale: 0.4)
  utube(q, 290, 555, 30, 845, 1203, 50, ((1075, 880, luma(220)), (1075, 1118, luma(140))))
  line(q(222, 1075), q(640, 1075), stroke: dash)
  line(q(222, 1118), q(640, 1118), stroke: dash)
  line(q(358, 878), q(610, 878), stroke: 0.7pt)
  // 0.4 厘米：在两条水平线之间，数字写在上方
  line(q(250, 1030), q(250, 1075), stroke: 0.7pt, mark: ah)
  line(q(250, 1165), q(250, 1118), stroke: 0.7pt, mark: ah)
  v(247, 960, [0.4 厘米])
  // 6.4 厘米、6.8 厘米
  line(q(358, 878), q(358, 1075), stroke: 0.7pt, mark: (start: "stealth", end: "stealth", fill: black, scale: 0.4))
  line(q(585, 878), q(585, 1118), stroke: 0.7pt, mark: (start: "stealth", end: "stealth", fill: black, scale: 0.4))
  v(360, 975, [6.4 厘米])
  v(587, 995, [6.8 厘米])
})
