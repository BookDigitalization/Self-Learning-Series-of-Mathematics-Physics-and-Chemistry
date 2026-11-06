// 图 5·7 利用速度图线求所通过的路程（初速度不等于零）（原书 p.138）
// 坐标图，按原图重绘。坐标取自 200 dpi 页面图的“显示图”坐标（宽 1568），画布原点取 (800, 1230)。
#import "/common/series.typ": *
#import "fig5-6.typ": hatch

#let fig-5-7(width: 6.8cm) = px-canvas(620, 620, origin: (800, 1230), width: width, (p, u) => {
  import cetz.draw: *
  let mk = (end: "stealth", fill: black, scale: 0.45)
  let both = (start: (symbol: "stealth", fill: black, scale: 0.4), end: (symbol: "stealth", fill: black, scale: 0.4))
  let lab(x, y, body) = content(p(x, y), anchor: "center", text(size: 9pt, body))
  let (x0, y0) = (865, 1795)
  let (xr, yv, yt) = (1232, 1523, 1358)
  hatch(p, ((x0, y0), (xr, y0), (xr, yv), (x0, yv)))
  hatch(p, ((x0, yv), (xr, yv), (xr, yt)), st: 0.35pt)
  line(p(x0, y0), p(1385, y0), stroke: 0.9pt, mark: mk)
  line(p(x0, y0), p(x0, 1285), stroke: 0.9pt, mark: mk)
  line(p(x0, yv), p(1295, 1330), stroke: 1.4pt)
  line(p(830, yv), p(xr, yv), stroke: (thickness: 1pt, dash: "dashed"))
  line(p(xr, y0), p(xr, 1335), stroke: (thickness: 1pt, dash: "dashed"))
  line(p(851, yv), p(851, y0), stroke: 0.7pt, mark: both)
  line(p(x0, 1825), p(xr, 1825), stroke: 0.7pt, mark: both)
  line(p(1262, yt), p(1262, yv), stroke: 0.7pt, mark: both)
  lab(850, 1782, $O$)
  lab(850, 1290, $v$)
  lab(1372, 1780, $t$)
  lab(1052, 1822, $t$)
  lab(838, 1650, $v_0$)
  lab(1278, 1440, $a t$)
  content(p(1040, 1412), std.rotate(24deg, text(size: 8.5pt, $v = v_0 + a t$)))
  lab(1120, 1485, $S_2 = 1 / 2 a t^2$)
  lab(1055, 1650, $S_1 = v_0 t$)
})
