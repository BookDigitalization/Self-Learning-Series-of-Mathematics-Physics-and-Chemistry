// 图 1·38–1·40 几种常用电容器（原书 p.68–69）：写实插画沿用原扫描裁剪（二值化），名称用真文字补回。
// 图 1·38 中纸质、云母电容器壳上印的“250 PF”“100 PF UP=500V”是器件上的标记，随位图保留。
#import "fig1b-lib.typ": *

// 位图 fig1b-38.png 裁剪自 p.68 (288,896)–(1303,1174)，2030×556
#let fig-1-38(width: 11cm) = px-canvas(2030, 700, width: width, (p, u) => {
  import cetz.draw: *
  content(p(0, 0), anchor: "north-west", image("fig1b-38.png", width: 2030 * u))
  for (x, name) in ((340, [纸质电容器]), (958, [云母电容器]), (1400, [陶瓷电容器]), (1838, [油质电容器])) {
    lab(p, x, 640, name, size: 8.5pt)
  }
})

// 位图 fig1b-39.png 裁剪自 p.68 (211,1797)–(886,2184)，1350×774
#let fig-1-39(width: 9cm) = px-canvas(1350, 774, width: width, (p, u) => {
  import cetz.draw: *
  content(p(0, 0), anchor: "north-west", image("fig1b-39.png", width: 1350 * u))
})

// 位图 fig1b-40.png 裁剪自 p.69 (515,319)–(1174,597)，1318×556
#let fig-1-40(width: 8cm) = px-canvas(1318, 556, width: width, (p, u) => {
  import cetz.draw: *
  content(p(0, 0), anchor: "north-west", image("fig1b-40.png", width: 1318 * u))
})
