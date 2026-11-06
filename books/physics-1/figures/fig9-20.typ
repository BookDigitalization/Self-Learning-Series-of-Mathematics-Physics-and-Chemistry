// 图 9·20、9·21、9·22（原书 p.256、p.257）：立体线条图，整幅用 CeTZ 重绘（原为含文字的位图）。
// 坐标都是原 png 的像素坐标（y 向下）：fig9-20.png 1206×1233，fig9-21.png 992×1233，fig9-22.png 736×1039。
// 近似处：虚线、点划线的疏密、箭头大小为目测；9·21 下方的 F 与 9·22 的 F′ 标注在扫描中带撇不清，见 checklist/figtext-ch9.md。
#import "/common/series.typ": *

#let _lab(p, x, y, body) = cetz.draw.content(p(x, y), anchor: "center", text(size: 9pt, body))
#let _head = (end: "stealth", fill: black, scale: 0.55)
#let _dd = (thickness: 0.8pt, dash: "dash-dotted")
#let _ds = (thickness: 0.7pt, dash: "dashed")

// 图 9·20
#let fig-9-20(width: 7cm) = px-canvas(1206, 1233, width: width, (p, u) => {
  import cetz.draw: *
  let th = 1.1pt
  // 水平面
  line(p(22, 597), p(640, 588), stroke: th)
  line(p(640, 588), p(745, 583), stroke: _ds)
  line(p(22, 597), p(275, 953), p(1020, 940), stroke: th)
  // 竖直面与交线
  line(p(765, 585), p(765, 10), p(1015, 340), p(1020, 345), p(1020, 940), stroke: th)
  line(p(765, 585), p(1020, 940), stroke: 0.9pt)
  line(p(1020, 940), p(1150, 1105), stroke: 0.7pt)
  // 转轴与辅助线
  line(p(450, 270), p(450, 595), stroke: _dd)
  line(p(453, 675), p(453, 730), stroke: _dd)
  line(p(455, 950), p(455, 1220), stroke: (thickness: 1.4pt, dash: "dash-dotted"))
  line(p(870, 345), p(870, 725), stroke: _dd)
  line(p(452, 730), p(660, 727), stroke: _ds)
  // 力
  line(p(870, 725), p(660, 727), stroke: th, mark: _head)
  line(p(870, 725), p(760, 860), stroke: th, mark: _head)
  line(p(870, 725), p(965, 862), stroke: th, mark: _head)
  line(p(660, 727), p(760, 858), stroke: _ds)
  line(p(760, 864), p(965, 864), stroke: _ds)
  circle(p(870, 725), radius: 3 * u, fill: black, stroke: none)
  _lab(p, 485, 285, $O'$); _lab(p, 902, 345, $y$)
  _lab(p, 685, 672, $F_3$); _lab(p, 918, 695, $A$); _lab(p, 422, 722, $C$)
  _lab(p, 725, 893, $F$); _lab(p, 940, 895, $F_1$); _lab(p, 1155, 1120, $x$); _lab(p, 490, 1190, $O$)
})

// 图 9·21
#let fig-9-21(width: 6.5cm) = px-canvas(992, 1233, width: width, (p, u) => {
  import cetz.draw: *
  let th = 1.1pt
  // 水平面
  line(p(18, 590), p(640, 585), stroke: th)
  line(p(18, 590), p(200, 948), p(835, 955), stroke: th)
  // 竖直面与交线
  line(p(640, 585), p(640, 15), p(835, 360), p(835, 955), stroke: th)
  line(p(640, 585), p(835, 955), stroke: 0.9pt)
  line(p(835, 955), p(940, 1160), stroke: 1.3pt)
  // 转轴
  line(p(318, 255), p(318, 735), stroke: _dd)
  line(p(320, 955), p(320, 1205), stroke: (thickness: 1.2pt, dash: "dash-dotted"))
  line(p(318, 735), p(410, 733), stroke: _ds)
  // F2 向上，F3 向左，F 向左上，F 的水平投影向左下，F1 沿交线
  line(p(720, 120), p(718, 300), stroke: _dd)
  line(p(712, 725), p(716, 302), stroke: th, mark: _head)
  line(p(712, 732), p(407, 733), stroke: th, mark: _head)
  line(p(712, 725), p(465, 438), stroke: th, mark: _head)
  line(p(712, 735), p(462, 850), stroke: th, mark: _head)
  line(p(712, 732), p(772, 858), stroke: th, mark: _head)
  line(p(465, 438), p(716, 300), stroke: _ds)
  line(p(465, 460), p(462, 850), stroke: _dd)
  line(p(410, 735), p(462, 850), stroke: _ds)
  line(p(462, 855), p(772, 855), stroke: _ds)
  circle(p(712, 728), radius: 3 * u, fill: black, stroke: none)
  _lab(p, 330, 215, $O'$); _lab(p, 765, 335, $F_2$); _lab(p, 430, 420, $F$)
  _lab(p, 412, 672, $F_3$); _lab(p, 277, 740, $C$); _lab(p, 757, 715, $A$)
  _lab(p, 460, 893, $F$); _lab(p, 750, 908, $F_1$); _lab(p, 322, 1220, $O$)
})

// 图 9·22 用力拉开门
#let fig-9-22(width: 4.6cm) = px-canvas(736, 1039, width: width, (p, u) => {
  import cetz.draw: *
  let th = 1.1pt
  // 转轴（门轴）及两端的铰链线
  line(p(85, 75), p(85, 985), stroke: 2.4pt)
  for x in (62, 108) {
    line(p(x, 90), p(x, 190), stroke: 0.7pt)
    line(p(x, 835), p(x, 950), stroke: 0.7pt)
  }
  // 门
  line(p(87, 312), p(460, 112), p(458, 583), p(90, 783), stroke: th)
  // C–A 及作用线
  line(p(90, 562), p(412, 395), stroke: 0.8pt)
  circle(p(422, 385), radius: 9 * u, stroke: 0.8pt)
  line(p(428, 393), p(625, 610), stroke: 1.6pt, mark: _head)
  line(p(100, 590), p(380, 878), stroke: _ds)
  line(p(205, 500), p(405, 725), stroke: _ds)
  line(p(335, 770), p(300, 792), stroke: 0.9pt, mark: _head)
  line(p(350, 748), p(405, 728), stroke: 0.9pt, mark: _head)
  line(p(495, 770), p(350, 848), stroke: 0.9pt, mark: _head)
  line(p(555, 742), p(662, 680), stroke: 0.9pt, mark: _head)
  _lab(p, 98, 36, $O'$); _lab(p, 45, 565, $C$); _lab(p, 378, 355, $A$); _lab(p, 188, 462, $A'$)
  _lab(p, 672, 590, $F$); _lab(p, 437, 668, $F'$); _lab(p, 352, 757, $L'$); _lab(p, 525, 762, $L$)
  _lab(p, 85, 1002, $O$)
})
