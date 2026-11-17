// 图 2·18 焦耳测定热功当量的实验装置 (a) 和量热器纵截面 (b)（原书 p.63）
// 写实插画，沿用原扫描裁剪（fig2b-18.png，原页 200 dpi 坐标 185,975–945,1305）；
// 图中字母 P、P′、B、A、K、N、L 和分图号 (a)、(b) 已涂去，用 CeTZ 文字补回。
// 坐标是 fig2b-18.png 的像素坐标（1520×660，y 向下）。
#import "/common/series.typ": *

#let fig-2-18(width: 11cm) = px-canvas(1520, 660, width: width, (p, u) => {
  import cetz.draw: *
  content(p(0, 0), anchor: "north-west", image("fig2b-18.png", width: 1520 * u))
  let lab(x, y, body, size: 9pt) = content(p(x, y), anchor: "center", text(size: size, body))
  lab(156, 520, $P$)
  lab(824, 360, $P'$)
  lab(586, 148, $B$)
  lab(596, 290, $A$)
  lab(1270, 62, $K$)
  lab(1462, 294, $N$)
  lab(982, 406, $L$)
  lab(470, 632, text(style: "italic")[(a)])
  lab(1220, 632, text(style: "italic")[(b)])
})
