// 图 1·11 静电感应实验（一）（原书 p.25）
// 写实插画沿用原扫描裁剪的 fig1-11.png（939×893），已涂去 R、A、B 和各处“＋”“－”号，用 CeTZ 补回；棒上三个“＋”号位置为目测。
#import "/common/series.typ": *

#let fig-1-11(width: 8cm) = px-canvas(939, 893, width: width, (p, u) => {
  import cetz.draw: *
  content(p(0, 0), anchor: "north-west", image("fig1-11.png", width: 939 * u))
  content(p(270, 115), anchor: "center", text(size: 9pt, [$R$]))
  content(p(88, 183), anchor: "center", text(size: 8pt, [$+$]))
  content(p(197, 181), anchor: "center", text(size: 8pt, [$+$]))
  content(p(310, 181), anchor: "center", text(size: 8pt, [$+$]))
  content(p(100, 262), anchor: "center", text(size: 10pt, [$-$]))
  content(p(345, 268), anchor: "center", text(size: 9pt, [$A$]))
  content(p(298, 665), anchor: "center", text(size: 9pt, [$B$]))
  content(p(175, 692), anchor: "center", text(size: 11pt, [$+$]))
})
