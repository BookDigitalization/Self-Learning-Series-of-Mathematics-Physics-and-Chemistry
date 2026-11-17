// 图 5·8 三相交流电的电动势图线（原书 p.267）
// 位图沿用原扫描裁剪（fig5-8.png，已涂去文字）；文字用真文字补回。标注坐标为原书页面 200 dpi 网格坐标。
#import "fig5-lib.typ": *
// 转子小图：位图里的转子原图只剩残迹，用白底方框盖住后重画（磁极字母为真文字）
#let rotor(ang, top, bottom) = rotate(ang, box(width: 9pt, height: 22pt, fill: white, stroke: 0.7pt, inset: 0pt, align(center + horizon, stack(dir: ttb, spacing: 1pt, text(size: 7pt, top), text(size: 5pt)[·], text(size: 7pt, bottom)))))
#let fig-5-8(width: 9.6cm) = bitfig("fig5-8.png", (379, 263, 1339, 989), (
  (433, 291, $scr(E)$),
  (474, 467, $A$),
  (402, 555, $O$),
  (505, 573, $C$),
  (477, 680, $B$),
  (1332, 538, $t$),
  (565, 764, $A$),
  (746, 759, $A$),
  (923, 750, $A$),
  (1113, 747, $A$),
  (497, 963, $C$),
  (695, 959, $C$),
  (883, 960, $C$),
  (1070, 957, $C$),
  (624, 963, $B$),
  (803, 958, $B$),
  (991, 956, $B$),
  (1180, 949, $B$),
  (559, 867, rotor(0deg, $S$, $N$)),
  (1113, 857, rotor(0deg, $S$, $N$)),
  (749, 862, rotor(45deg, $N$, $S$)),
  (934, 863, rotor(-40deg, $N$, $S$)),
), width: width, size: 9pt)
