// 图 3·19 求管中汽油的高度（原书 p.62）
// 线条图，按原图重绘（斜线填充改为灰色填充）。左侧尺寸标注的文字扫描里看不清，按文意写作“2x”（见 checklist/ch03.md）。
// 坐标取自原页 200 dpi 预览图在看图工具里的显示坐标；画布原点为显示图 (895,1440)，宽 470、高 410。
#import "/common/series.typ": *
#import "fig3-utube.typ": utube

#let fig-3-19(width: 5.6cm) = px-canvas(470, 410, width: width, (p, u) => {
  import cetz.draw: *
  let q(x, y) = p(x - 895, y - 1440)
  let v(x, y, body) = content(q(x, y), anchor: "center", std.rotate(-90deg, text(size: 8pt, body)))
  let dash = (thickness: 0.6pt, dash: "dashed")
  let ah = (start: "stealth", end: "stealth", fill: black, scale: 0.4)
  utube(q, 960, 1312, 50, 1450, 1830, 70, ((1660, 1475, luma(220)), (1660, 1728, luma(140))))
  line(q(905, 1728), q(1350, 1728), stroke: dash)
  line(q(1262, 1475), q(1350, 1475), stroke: 0.7pt)
  line(q(905, 1660), q(965, 1660), stroke: 0.7pt)
  line(q(925, 1660), q(925, 1728), stroke: 0.7pt, mark: ah)
  line(q(1335, 1475), q(1335, 1728), stroke: 0.7pt, mark: ah)
  v(912, 1695, $2 x$)
  v(1342, 1600, $24 + x$)
})
