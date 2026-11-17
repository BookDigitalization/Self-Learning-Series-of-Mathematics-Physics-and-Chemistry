// 习题 3·5 第 1 题附图（原书 p.203）
// CeTZ 重绘：三幅小图。左图给出磁场 H、电流（垂直纸面向外）和磁场力 F；中图给出电流和 F；右图给出电流和 H。
// 坐标是 200 dpi 渲染的局部图（1124×262）的像素坐标。
#import "fig3b-lib.typ": *

#let fig-ex-3-5-1(width: 11cm) = px-canvas(1124, 262, width: width, (p, u) => {
  import cetz.draw: *
  // 左：磁场向右，电流 ⊙，F 向下
  for y in (35, 70, 105, 142, 178, 213) { ar(p, (15, y), (310, y), st: 1pt, scale: 0.55) }
  ar(p, (160, 142), (160, 215), st: 1pt, scale: 0.55)
  isym(p, 163, 122, "out", r: 20)
  lab(p, 328, 123, $H$, size: 9.5pt)
  lab(p, 182, 233, $F$, size: 9.5pt)
  // 中：电流 ⊙，F 向右
  isym(p, 488, 127, "out", r: 20, filled: true)
  ar(p, (510, 127), (590, 127), st: 1pt, scale: 0.55)
  lab(p, 606, 127, $F$, size: 9.5pt)
  // 右：磁场向右，电流 ⊙
  for y in (42, 75, 112, 148, 183, 218) { ar(p, (780, y), (1090, y), st: 1pt, scale: 0.55) }
  isym(p, 938, 128, "out", r: 22, filled: true)
  lab(p, 1110, 120, $H$, size: 9.5pt)
})
