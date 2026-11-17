// 图 4·12（原书 p.243）自感现象实验装置（一）（CeTZ 重绘）
#import "fig4-lib.typ": *

#let fig-4-12(width: 8.2cm) = px-canvas(760, 420, origin: (640, 480), width: width, (p, u) => {
  import cetz.draw: *
  set-style(stroke: 1pt)
  // 左侧竖线与三条支路
  line(p(658, 495), p(658, 850))
  line(p(658, 495), p(755, 495))
  // 电磁铁 H
  for k in range(14) {
    circle(p(758 + k * 14, 514), radius: (6, 17), stroke: 0.8pt)
  }
  line(p(945, 533), p(1117, 533))
  lamp(p, 1150, 533, 33)
  line(p(1183, 533), p(1380, 533))
  line(p(1380, 533), p(1380, 800))
  // 支路 R–A
  line(p(658, 688), p(782, 688))
  junction(p, 658, 688)
  rheostat(p, 782, 965, 688, n: 8, amp: 10)
  line(p(868, 640), p(868, 676), mark: arrow-mark)
  line(p(868, 640), p(1116, 640))
  lamp(p, 1148, 640, 32)
  line(p(1180, 640), p(1380, 640))
  junction(p, 1380, 637)
  // 电源支路
  line(p(658, 850), p(735, 850))
  rheostat(p, 735, 920, 850, n: 8, amp: 11)
  line(p(825, 805), p(825, 838), mark: arrow-mark)
  line(p(825, 805), p(985, 805))
  battery(p, 985, 1075, 805)
  line(p(1075, 805), p(1188, 805))
  key-switch(p, 1188, 1237, 805)
  line(p(1237, 805), p(1380, 805))
  tx(p, 842, 553, $H$); tx(p, 1196, 553, $B$); tx(p, 1190, 662, $A$)
  tx(p, 870, 724, $R$); tx(p, 1211, 828, $K$); tx(p, 822, 885, $S$)
})
