// 图 9·41（a）（b）（原书 p.281）：位图（已涂去 C、G），字母用 CeTZ 补回。
// 坐标是各 png 的像素坐标：fig9-41a.png 1077×630，fig9-41b.png 576×833。
#import "/common/series.typ": *

#let fig-9-41a(width: 7cm) = px-canvas(1077, 630, width: width, (p, u) => {
  import cetz.draw: *
  content(p(0, 0), anchor: "north-west", image("fig9-41a.png", width: 1077 * u))
  content(p(524, 24), anchor: "center", text(size: 9pt, $C$))
  content(p(560, 448), anchor: "center", text(size: 9pt, $G$))
})

#let fig-9-41b(width: 3.8cm) = px-canvas(576, 833, width: width, (p, u) => {
  import cetz.draw: *
  content(p(0, 0), anchor: "north-west", image("fig9-41b.png", width: 576 * u))
  content(p(308, 278), anchor: "center", text(size: 9pt, $C$))
  content(p(318, 770), anchor: "center", text(size: 9pt, $G$))
})
