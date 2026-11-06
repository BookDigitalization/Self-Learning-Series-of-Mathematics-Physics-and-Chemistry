// 图 13·38 各种传动装置（原书 p.463）
// 八幅机械插画（a）斜面（楔）、（b）齿条与齿轮、（c）蜗轮蜗杆、（d）皮带传动、（e）交叉皮带传动、
// （f）一对齿轮、（g）三个齿轮、（h）锥齿轮，都是写实图，保留原扫描裁剪（fig13-38.png）；
// 位图里的字母 A、B 与（a）…（h）八个图标已全部涂去，用 CeTZ 补回。
// 坐标是 PNG 像素坐标（宽 2111、高 3774）；字母位置按涂去前的原位量取（量取时用的是缩小显示图，宽 1441，故乘 k）。
#import "/common/series.typ": *

#let fig-13-38(width: 13cm) = px-canvas(2111, 3774, width: width, (p, u) => {
  import cetz.draw: *
  let k = 2111 / 1441
  let v(x, y) = p(x * k, y * k)
  let lab(x, y, body) = content(v(x, y), anchor: "center", text(size: 9pt, body))
  content(p(0, 0), anchor: "north-west", image("fig13-38.png", width: 2111 * u))
  // 字母
  lab(215, 185, $B$)
  lab(207, 378, $A$)
  lab(1203, 242, $A$)
  lab(1343, 388, $B$)
  lab(127, 915, $A$)
  lab(522, 798, $B$)
  lab(1257, 603, $B$)
  lab(836, 778, $A$)
  lab(123, 1615, $A$)
  lab(523, 1610, $B$)
  lab(1290, 1487, $B$)
  lab(1040, 1727, $A$)
  lab(97, 2200, $A$)
  lab(637, 2420, $B$)
  lab(1052, 1900, $A$)
  lab(1350, 2203, $B$)
  // 图标（原位于各小图下方）
  lab(284, 541, $(a)$)
  lab(1055, 498, $(b)$)
  lab(330, 1088, $(c)$)
  lab(1084, 1062, $(d)$)
  lab(352, 1738, $(e)$)
  lab(1170, 1775, $(f)$)
  lab(323, 2490, $(g)$)
  lab(1178, 2529, $(h)$)
})

