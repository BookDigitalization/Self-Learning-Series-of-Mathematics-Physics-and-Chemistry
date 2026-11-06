// 图 2·10 在烂泥的路上行走（原书 p.38）
// 人物和路面是写实插画，沿用原扫描裁剪（fig2-10.png，已涂去 (a)(b)）；(a)(b) 用 CeTZ 补回。
// 坐标是 fig2-10.png 的像素坐标（原页显示图 (370,1275) 起，×2.1314）。
#import "/common/series.typ": *

#let fig-2-10(width: 10cm) = px-canvas(1962, 1237, width: width, (p, u) => {
  import cetz.draw: *
  content(p(0, 0), anchor: "north-west", image("fig2-10.png", width: 1962 * u))
  let d(x, y) = ((x - 370) * 2.1314, (y - 1275) * 2.1314)
  content(p(..d(518, 1832)), anchor: "center", text(size: 9.5pt, $(a)$))
  content(p(..d(1045, 1833)), anchor: "center", text(size: 9.5pt, $(b)$))
})

