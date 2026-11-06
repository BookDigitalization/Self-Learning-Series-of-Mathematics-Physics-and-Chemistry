// 图 15·19 冲角不为零时机翼周围的流线（原书 p.508）
// 流线、机翼沿用原扫描裁剪（fig15-19.png，已涂去字母）；字母用文字补回。
// 坐标是 fig15-19.png 的像素坐标（1792×1152，y 向下）；画布向左多留 80 px 放左侧标注。
// 清晰的：Q R v_1 v_2 v_3 α f。S₁ S₂ S₃ S₁' 的下标/撇号较糊，按位置推断，见 checklist/figtext-ch15.md。
#import "/common/series.typ": *

#let fig-15-19(width: 11cm) = px-canvas(1872, 1152, origin: (-80, 0), width: width, (p, u) => {
  import cetz.draw: *
  content(p(0, 0), anchor: "north-west", image("fig15-19.png", width: 1792 * u))
  let lab(x, y, body) = content(p(x, y), anchor: "center", text(size: 11pt, body))
  lab(940, 58, $Q$)
  lab(1080, 62, $R$)
  lab(810, 372, $S_2$)
  lab(1186, 372, $v_2$)
  lab(20, 478, $S_1$)
  lab(20, 932, $S'_1$)
  lab(318, 700, $v_1$)
  lab(936, 772, $v_3$)
  lab(828, 850, $S_3$)
  lab(1058, 553, $f$)
  lab(1014, 636, $alpha$)
})
