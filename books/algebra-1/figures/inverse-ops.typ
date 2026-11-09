// §1·1 逆运算关系示意图（原书 p.3 加法与减法；p.4 乘法与除法）
// 坐标取自 p.3 / p.4 局部放大图（200 dpi 裁剪，宽 670、高约 190，y 向下）；两幅图版式相同，故共用一个函数。
// 三条折线：和→被减数，加数乙→减数，加数甲→差（乘除同理：积→被除数，因数乙→除数，因数甲→商）。
#import "/common/series.typ": *

#let inverse-ops(left, right, a, op1, b, c, d, op2, e, f, width: 9.4cm) = px-canvas(670, 190, width: width, (p, u) => {
  import cetz.draw: *
  let t(x, y, body) = content(p(x, y), text(font: fonts.song, size: 9.5pt, body))
  t(185, 28, left)
  t(590, 28, right)
  // 算式行
  t(124, 72, a); t(176, 72, op1); t(226, 72, b); t(275, 72, [＝]); t(303, 72, c)
  t(430, 72, d); t(496, 72, op2); t(552, 72, e); t(606, 72, [＝]); t(640, 72, f)
  // 折线：从下方起点引出，沿下横线到右边，箭头向上指到右侧对应项
  let route(x0, x1, y) = line(p(x0, 88), p(x0, y), p(x1, y), p(x1, 90),
    stroke: 0.6pt, mark: (end: "stealth", fill: black, scale: 0.35))
  route(305, 430, 118)
  route(232, 552, 143)
  route(125, 640, 168)
})
