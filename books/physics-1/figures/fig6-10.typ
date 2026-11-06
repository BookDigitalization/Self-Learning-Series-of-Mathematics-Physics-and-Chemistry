// 图 6·10 互成角度的两个共点力的合成（原书 p.177）
// 线图沿用原扫描裁剪（fig6-10.png，已涂去全部字母），字母 A B' B C D E F₁ F₂ R 用文字补回。
// 坐标是 fig6-10.png 的像素坐标；由原页显示图坐标换算：(x-600)×2.1314, (y-125)×2.1314。
#import "/common/series.typ": *

#let fig-6-10(width: 8cm) = px-canvas(1238, 1365, width: width, (p, u) => {
  import cetz.draw: *
  content(p(0, 0), anchor: "north-west", image("fig6-10.png", width: 1238 * u))
  let d(x, y) = ((x - 600) * 2.1314, (y - 125) * 2.1314)
  let lab(x, y, body) = content(p(..d(x, y)), anchor: "center", text(size: 8pt, body))
  lab(652, 195, $A$); lab(922, 198, $B'$); lab(1150, 206, $F_1$); lab(1105, 338, $F_2$)
  lab(652, 441, $A$); lab(906, 440, $B'$); lab(1143, 537, $R$)
  lab(650, 656, $A$); lab(906, 658, $B$); lab(970, 632, $F_1$); lab(1035, 614, $C$)
  lab(1023, 655, $R$); lab(1155, 679, $E$); lab(980, 716, $F_2$); lab(1060, 741, $D$)
})
