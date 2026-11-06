// 图 15·13 圆柱体经过理想流体时的流线（原书 p.505）
// 流线图沿用原扫描裁剪（fig15-13.png，已涂去字母）；A B C D 用文字补回。
// 坐标是 fig15-13.png 的像素坐标（929×534，y 向下）。
#import "/common/series.typ": *

#let fig-15-13(width: 6.4cm) = px-canvas(929, 534, width: width, (p, u) => {
  import cetz.draw: *
  content(p(0, 0), anchor: "north-west", image("fig15-13.png", width: 929 * u))
  let lab(x, y, body) = content(p(x, y), anchor: "center", text(size: 10pt, body))
  lab(378, 282, $A$)
  lab(537, 282, $B$)
  lab(452, 212, $C$)
  lab(455, 360, $D$)
})
