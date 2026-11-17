// 图 6·15 双回路矿石机（原书 p.320）
// 线路图：CeTZ 重绘；实体图：写实插画沿用原扫描裁剪（fig6-15.png，已涂去字母 A、D、T、C1、C2、L1、L2、E），字母用真文字补回。
// 坐标为 150 dpi 页面像素坐标；实体图裁剪区 (185,905)–(980,1425)。
#import "/common/series.typ": *
#import "fig6-parts.typ": *

#let fig-6-15-circuit(width: 7.6cm) = px-canvas(430, 250, origin: (360, 560), width: width, (p, u) => {
  import cetz.draw: *
  antenna(p, 405, 567, h: 98)
  txt(p, 435, 582, $A$)
  coil(p, 405, 665, 740, n: 4, w: 14, side: -1)
  coil(p, 432, 665, 740, n: 4, w: 14, side: 1)
  txt(p, 378, 712, $L_1$); txt(p, 472, 712, $L_2$)
  wire(p, (405, 740), (405, 795))
  ground(p, 405, 797)
  txt(p, 435, 803, $E$)
  // 谐振线路（虚线左边）
  wire(p, (432, 665), (510, 665), (580, 665))
  wire(p, (510, 665), (510, 696))
  varcap(p, 510, 707, len: 22, gap: 9)
  wire(p, (510, 718), (510, 760))
  txt(p, 542, 713, $C_1$)
  wire(p, (432, 740), (432, 760), (735, 760))
  node(p, 510, 665); node(p, 510, 760)
  line(p(560, 578), p(560, 790), stroke: (thickness: 0.75pt, dash: (6pt, 3pt)))
  // 检波线路（虚线右边）
  wire(p, (580, 665), (586, 665))
  diode(p, 598, 665)
  wire(p, (609, 665), (735, 665))
  txt(p, 603, 638, $D$)
  wire(p, (658, 665), (658, 701))
  cap(p, 658, 709, len: 22, gap: 9)
  wire(p, (658, 718), (658, 760))
  txt(p, 690, 713, $C_2$)
  node(p, 658, 665); node(p, 658, 760)
  wire(p, (735, 665), (735, 690))
  phone(p, 735, 712, h: 40)
  wire(p, (735, 736), (735, 760))
  txt(p, 767, 713, $T$)
})

#let fig-6-15-real(width: 12cm) = px-canvas(795, 520, origin: (185, 905), width: width, (p, u) => {
  import cetz.draw: *
  content(p(185, 905), anchor: "north-west", image("fig6-15.png", width: 795 * u))
  let lab(x, y, body) = content(p(x, y), anchor: "center", text(size: 9pt, body))
  lab(252, 910, $A$); lab(697, 963, $D$); lab(910, 1008, $T$)
  lab(617, 1097, $C_1$); lab(727, 1130, $C_2$)
  lab(484, 1070, $L_1$); lab(484, 1172, $L_2$); lab(256, 1355, $E$)
})

#let fig-6-15() = {
  set par(first-line-indent: 0em)
  align(center, stack(spacing: 0.6em,
    fig-6-15-circuit(),
    text(font: fonts.kai, size: 9.5pt)[线路图],
    v(0.8em),
    fig-6-15-real(),
    text(font: fonts.kai, size: 9.5pt)[实体图],
  ))
}
