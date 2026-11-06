// 图 3·10 压强的分布与容器的形状无关（原书 p.56）
// 写实/线条混合的容器图，沿用原扫描裁剪（已涂去 A、B、C、D），字母用 CeTZ 补回；h₁、h₂ 紧贴箭头，留在位图里（见 checklist/ch03.md）。
// 坐标是 fig3-10.png 的像素坐标（1749×673）；原页显示图 (360,1125) 起，×2.1314。
#import "/common/series.typ": *

#let fig-3-10(width: 12cm) = px-canvas(1749, 673, width: width, (p, u) => {
  import cetz.draw: *
  content(p(0, 0), anchor: "north-west", image("fig3-10.png", width: 1749 * u))
  let lab(x, y, body) = content(p(x, y), anchor: "center", text(size: 10pt, body))
  lab(350, 373, $A$)
  lab(782, 281, $B$)
  lab(1051, 273, $C$)
  lab(1520, 277, $D$)
})
