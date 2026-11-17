// 图 8·3 描述气体状态的 P-V 图线（原书 p.286）
// CeTZ 重绘，坐标为 200 dpi 页面像素（p.286，原点取 170,995）。
#import "/common/series.typ": *

#let fig-8-3(width: 7cm) = px-canvas(390, 315, width: width, origin: (170, 995), (p, u) => {
  import cetz.draw: *
  let lab(x, y, body, anchor: "center") = content(p(x, y), anchor: anchor, text(size: 9pt, body))
  let ax = (stroke: 0.8pt, mark: (end: ">", fill: black, scale: 0.6))
  line(p(213, 1280), p(213, 1008), ..ax)
  line(p(213, 1280), p(527, 1280), ..ax)
  let dash = (stroke: (thickness: 0.6pt, dash: "dashed"))
  line(p(213, 1078), p(305, 1078), ..dash)
  line(p(213, 1163), p(397, 1163), ..dash)
  line(p(213, 1213), p(445, 1213), ..dash)
  line(p(305, 1078), p(305, 1280), ..dash)
  line(p(397, 1163), p(397, 1280), ..dash)
  line(p(445, 1213), p(445, 1280), ..dash)
  lab(213, 1002, $P$)
  lab(540, 1281, $V$)
  lab(205, 1292, $O$)
  lab(196, 1075, $P_1$)
  lab(197, 1161, $P_2$)
  lab(197, 1211, $P_3$)
  lab(309, 1078, $A(P_1 V_1)$, anchor: "west")
  lab(402, 1161, $B(P_2 V_2)$, anchor: "west")
  lab(449, 1217, $C(P_3 V_3)$, anchor: "west")
  lab(301, 1295, $V_1$)
  lab(398, 1295, $V_2$)
  lab(446, 1295, $V_3$)
})
