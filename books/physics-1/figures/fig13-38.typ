// 图 13·38 各种传动装置（原书 p.463）
// 八幅机械插画（a）斜面（楔）、（b）齿条与齿轮、（c）蜗轮蜗杆、（d）皮带传动、（e）交叉皮带传动、
// （f）一对齿轮、（g）三个齿轮、（h）锥齿轮，都是写实图，保留原扫描裁剪（fig13-38.png）；
// 只涂去并用 CeTZ 补回了（a）…（h）八个图标；图中的字母 A、B 紧贴机件，留在位图里，见待核对记录。
// 坐标是页面显示图（宽 1568）上的像素坐标。
#import "/common/series.typ": *

#let fig-13-38(width: 13cm) = px-canvas(990, 1770, width: width, origin: (430, 110), (p, u) => {
  import cetz.draw: *
  let lab(x, y, body) = content(p(x, y), anchor: "center", text(size: 9pt, body))
  content(p(430, 110), anchor: "north-west", image("fig13-38.png", width: 990 * u))
  lab(625, 482, $(a)$)
  lab(1155, 452, $(b)$)
  lab(657, 858, $(c)$)
  lab(1175, 840, $(d)$)
  lab(672, 1305, $(e)$)
  lab(1208, 1307, $(f)$)
  lab(652, 1823, $(g)$)
  lab(1240, 1850, $(h)$)
})
