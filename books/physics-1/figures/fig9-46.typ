// 图 9·46–9·50（原书 p.288–290）：长方体的稳度。写实/立体插画，位图已涂去 C、G、O、l₁、l₂、（a）（b）（c），
// 用 CeTZ 补回；涂字时切断的线条用 CeTZ 补一小段（见各图 patch）。
// 坐标是各 png 的像素坐标：fig9-46 1110×757，fig9-47 1472×960，fig9-48 1568×939，fig9-49 1493×897，fig9-50 1727×911。
#import "/common/series.typ": *

#let _px(p, x, y, body, sz) = cetz.draw.content(p(x, y), anchor: "center", text(size: sz, body))

#let fig-9-46(width: 7.5cm) = px-canvas(1110, 757, width: width, (p, u) => {
  import cetz.draw: *
  content(p(0, 0), anchor: "north-west", image("fig9-46.png", width: 1110 * u))
  _px(p, 112, 720, [（$a$）], 10pt); _px(p, 722, 712, [（$b$）], 10pt)
})

#let fig-9-47(width: 11cm) = px-canvas(1472, 960, width: width, (p, u) => {
  import cetz.draw: *
  content(p(0, 0), anchor: "north-west", image("fig9-47.png", width: 1472 * u))
  // patch：补回被涂掉的长方体左边线
  line(p(221, 466), p(221, 526), stroke: 4 * u)
  line(p(554, 466), p(545, 548), stroke: 4 * u)
  let m(x, y, body) = _px(p, x, y, body, 11pt)
  m(312, 36, [（$a$）]); m(698, 38, [（$b$）]); m(1165, 35, [（$c$）])
  m(275, 327, $C$); m(226, 493, $G$)
  m(625, 330, $C$); m(572, 508, $G$); m(660, 670, $O$)
  m(1055, 350, $C$); m(1008, 502, $G$); m(947, 672, $O$)
  m(612, 876, $l_1$); m(1010, 862, $l_2$)
})

#let fig-9-48(width: 10.5cm) = px-canvas(1568, 939, width: width, (p, u) => {
  import cetz.draw: *
  content(p(0, 0), anchor: "north-west", image("fig9-48.png", width: 1568 * u))
  let m(x, y, body) = _px(p, x, y, body, 10pt)
  m(388, 52, [（$a$）]); m(770, 52, [（$b$）]); m(1205, 50, [（$c$）])
  m(345, 600, $C$); m(428, 608, $G$)
  m(822, 382, $C$); m(888, 490, $G$); m(935, 682, $O$); m(906, 886, $l_1$)
  m(1203, 352, $C$); m(1240, 528, $G$); m(1153, 680, $O$); m(1190, 892, $l_2$)
})

#let fig-9-49(width: 10cm) = px-canvas(1493, 897, width: width, (p, u) => {
  import cetz.draw: *
  content(p(0, 0), anchor: "north-west", image("fig9-49.png", width: 1493 * u))
  // patch：补回被涂掉的左边线与右侧黑色阴影带
  line(p(226, 338), p(228, 412), stroke: 4 * u)
  rect(p(326, 328), p(354, 378), fill: black, stroke: none)
  let m(x, y, body) = _px(p, x, y, body, 10pt)
  m(335, 50, [（$a$）]); m(1078, 52, [（$b$）])
  m(240, 378, $O$); m(330, 352, $C$); m(290, 588, $G$)
  m(1138, 358, $C$); m(850, 628, $O$); m(1113, 634, $G$)
})

#let fig-9-50(width: 11cm) = px-canvas(1727, 911, width: width, (p, u) => {
  import cetz.draw: *
  content(p(0, 0), anchor: "north-west", image("fig9-50.png", width: 1727 * u))
  let m(x, y, body) = _px(p, x, y, body, 9pt)
  m(370, 420, $C$); m(370, 832, $G$); m(1124, 540, $C$); m(1192, 860, $G$)
})
