// 图 6·43 荧光屏上光点的运动 (a)(b)(c)；来源 原书 p.342，坐标取自 200 dpi 页面像素（1671×2500）。
#import "/common/series.typ": *
#import "fig6b-parts.typ": *

#let fig-6-43(width: 10.4cm) = px-canvas(860, 330, origin: (330, 765), width: width, (p, u) => {
  import cetz.draw: *
  let lab(x, y, body) = content(p(x, y), anchor: "center", text(size: 9.5pt, body))
  circle(p(459, 888), radius: 119, stroke: 1.8pt)
  circle(p(458, 881), radius: 7, fill: black, stroke: none)
  lab(459, 1046, [($a$)])
  circle(p(783, 888), radius: 119, stroke: 1.8pt)
  line(p(700, 878), p(877, 878), stroke: 2.4pt)
  lab(783, 1046, [($b$)])
  circle(p(1114, 874), radius: 119, stroke: 1.8pt)
  catmull(p(1023, 875), p(1040, 857), p(1048, 855), p(1052, 872), p(1057, 873), p(1070, 853), p(1080, 839),
    p(1092, 842), p(1093, 887), p(1093, 932), p(1097, 932), p(1107, 907), p(1112, 903), p(1120, 917),
    p(1128, 918), p(1140, 897), p(1147, 880), p(1153, 872), p(1157, 887), p(1162, 889), p(1167, 853),
    p(1175, 837), p(1185, 832), p(1188, 855), p(1192, 867), p(1197, 860), p(1205, 853), tension: 0.5, stroke: 1.8pt)
  lab(1119, 1038, [($c$)])
})
