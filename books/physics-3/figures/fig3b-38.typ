// 图 3·38 磁场对通电线圈的作用（一）（原书 p.198）
// CeTZ 重绘：电池、电键 K、两根悬导线 PP′、QQ′ 和放在磁场里的矩形线圈 ABCD。
// 坐标是原页 130 dpi 渲染图的像素坐标，画布原点 (565, 485)。
#import "fig3b-lib.typ": *

#let fig-3-38(width: 6cm) = px-canvas(300, 500, origin: (565, 485), width: width, (p, u) => {
  import cetz.draw: *
  // 上方电路：电池、电键
  pl(p, (708, 585), (643, 585), (643, 568))
  pl(p, (643, 538), (643, 520), (773, 520), (773, 585), (724, 585))
  line(p(630, 560), p(656, 560), stroke: 0.9pt)
  line(p(636, 568), p(650, 568), stroke: 2pt)
  line(p(630, 538), p(656, 538), stroke: 0.9pt)
  line(p(643, 538), p(643, 560), stroke: 0.9pt)
  line(p(715, 520), p(735, 508), stroke: 0.9pt)
  lab(p, 718, 495, $K$, size: 8.5pt)
  // 支架（斜线表示固定物）
  rect(p(620, 593), p(797, 606), fill: white, stroke: 0.9pt)
  for i in range(20) {
    let x = 624 + i * 8.6
    line(p(x, 606), p(x + 6, 593), stroke: 0.5pt)
  }
  lab(p, 700, 618, $P$, size: 8.5pt)
  lab(p, 726, 618, $Q$, size: 8.5pt)
  // 两根悬导线（上段、下段，中间用虚线表示省略）
  line(p(705, 606), p(705, 625), stroke: 0.9pt)
  line(p(718, 606), p(718, 625), stroke: 0.9pt)
  line(p(705, 625), p(705, 745), stroke: (thickness: 0.9pt, dash: "dashed"))
  line(p(718, 625), p(718, 745), stroke: (thickness: 0.9pt, dash: "dashed"))
  line(p(705, 745), p(705, 850), stroke: 0.9pt)
  line(p(718, 745), p(718, 850), stroke: 0.9pt)
  ar(p, (711, 800), (711, 752))
  lab(p, 699, 750, $I$, size: 8.5pt)
  lab(p, 697, 822, $P'$, size: 8.5pt)
  lab(p, 730, 822, $Q'$, size: 8.5pt)
  // 磁极
  magnet(p, 568, 838, 610, 975)
  magnet(p, 815, 838, 861, 975)
  for dy in (850, 875, 900, 925, 950) {
    ar(p, (610, dy), (815, dy), st: 0.8pt)
  }
  lab(p, 588, 906, $N$, size: 9pt)
  lab(p, 838, 908, $S$, size: 9pt)
  // 线圈（双线表示线框）
  rect(p(668, 850), p(754, 965), radius: 10, fill: white, stroke: 0.9pt)
  rect(p(676, 858), p(746, 957), radius: 6, stroke: 0.9pt)
  lab(p, 655, 853, $A$, size: 9pt)
  lab(p, 771, 853, $B$, size: 9pt)
  lab(p, 655, 958, $C$, size: 9pt)
  lab(p, 771, 958, $D$, size: 9pt)
  ar(p, (668, 903), (638, 925))
  lab(p, 622, 918, $F$, size: 9pt)
  ar(p, (754, 905), (790, 880))
  lab(p, 805, 878, $F$, size: 9pt)
})
