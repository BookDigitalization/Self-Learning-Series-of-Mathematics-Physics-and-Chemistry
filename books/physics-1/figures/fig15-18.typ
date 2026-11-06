// 图 15·18 冲角为零时机翼周围的流线（原书 p.508）
// 流线、机翼沿用原扫描裁剪（fig15-18.png，已涂去字母）；字母用文字补回。
// 坐标是 fig15-18.png 的像素坐标（1621×704，y 向下）。
// 清晰的：Q R a。较糊、按正文与位置推断的：f b c v_1 v_2 v_3；
// 完全无法辨认的用 #unclear 标出（上方箭头旁 (715,262) 一处、左侧尺寸线旁 S₁ S₂ 的下标）。见 checklist/figtext-ch15.md。
#import "/common/series.typ": *

#let fig-15-18(width: 10.5cm) = px-canvas(1701, 704, origin: (-80, 0), width: width, (p, u) => {
  import cetz.draw: *
  content(p(0, 0), anchor: "north-west", image("fig15-18.png", width: 1621 * u))
  let lab(x, y, body) = content(p(x, y), anchor: "center", text(size: 11pt, body))
  lab(755, 45, $Q$)
  lab(922, 50, $R$)
  lab(200, 272, $a$)
  lab(718, 262, unclear[？])
  lab(932, 272, $v_2$)
  lab(658, 365, unclear[$b$])
  lab(912, 478, $f$)
  lab(425, 523, $v_1$)
  lab(886, 588, unclear[$c$])
  lab(772, 675, $v_3$)
  lab(45, 410, unclear[$S_1$])
  lab(45, 598, unclear[？])
})
