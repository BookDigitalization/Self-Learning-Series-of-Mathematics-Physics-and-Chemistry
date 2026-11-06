// 图 15·14 圆柱体经过实际流体时的流线与旋涡（原书 p.505）
// 流线图沿用原扫描裁剪（fig15-14.png，已涂去字母；字母压在斜线阴影上，涂白处留有小缺口）；A B C D 用文字补回。
// 原图字母旁似有撇号（B'、D' 之类），扫描糊，按正文用 A B C D。
// 坐标是 fig15-14.png 的像素坐标（981×534，y 向下）。
#import "/common/series.typ": *

#let fig-15-14(width: 6.76cm) = px-canvas(981, 534, width: width, (p, u) => {
  import cetz.draw: *
  content(p(0, 0), anchor: "north-west", image("fig15-14.png", width: 981 * u))
  let lab(x, y, body) = content(p(x, y), anchor: "center", text(size: 10pt, body))
  lab(443, 277, $A$)
  lab(597, 272, $B$)
  lab(510, 205, $C$)
  lab(522, 335, $D$)
})
