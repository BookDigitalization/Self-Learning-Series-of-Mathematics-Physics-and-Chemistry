// 图 15·7 各种不同的流线分布（原书 p.498）
// 流线图沿用原扫描裁剪（fig15-7.png，已涂去字母）；A B C D 用文字补回。
// 坐标是 fig15-7.png 的像素坐标（2218×747，y 向下）。
#import "/common/series.typ": *

#let fig-15-7(width: 13.2cm) = px-canvas(2218, 747, width: width, (p, u) => {
  import cetz.draw: *
  content(p(0, 0), anchor: "north-west", image("fig15-7.png", width: 2218 * u))
  let lab(x, y, body) = content(p(x, y), anchor: "center", text(size: 10pt, body))
  for (xa, xc) in ((138, 340), (890, 1103), (1650, 1870)) {
    lab(xa, 52, $A$)
    lab(xc, 48, $C$)
    lab(xa, 705, $B$)
    lab(xc, 703, $D$)
  }
})
