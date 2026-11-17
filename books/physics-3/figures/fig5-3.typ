// 图 5·3 正弦式交流电图线（原书 p.258）
// 坐标取自原书页面 150 dpi 像素；曲线按 I = I_m sin ωt 重画，上方五个线圈位置图按原图简化重绘。
#import "/common/series.typ": *

#let fig-5-3(width: 12.4cm) = px-canvas(900, 470, origin: (150, 405), width: width, (p, u) => {
  import cetz.draw: *
  let tx(x, y, body, anchor: "center", sz: 8pt) = content(p(x, y), anchor: anchor, text(size: sz, body))
  let ax = 752
  let x0 = 228
  let half = 285
  let amp = 80
  // 坐标轴
  line(p(190, ax), p(1000, ax), mark: (end: ">", fill: black), stroke: 0.8pt)
  line(p(x0, 835), p(x0, 640), mark: (end: ">", fill: black), stroke: 0.8pt)
  tx(x0, 618, text(style: "italic", weight: "bold")[$I$])
  tx(1018, 752, $t$)
  // 曲线：实线 0 → T，虚线 T → 5T/4
  let pts(a, b) = range(0, 61).map(i => {
    let x = a + (b - a) * i / 60
    (x, ax - amp * calc.sin((x - x0) / half * calc.pi))
  })
  line(..pts(x0, x0 + 2 * half).map(q => p(..q)), stroke: 1.4pt)
  line(..pts(x0 + 2 * half, x0 + 2.5 * half).map(q => p(..q)), stroke: (thickness: 1.4pt, dash: "dashed"))
  // 竖直引线
  for x in (370, 513, 655, 805) {
    line(p(x, 590), p(x, ax), stroke: (thickness: 0.6pt, dash: "dashed"))
  }
  line(p(945, ax), p(945, ax - amp), stroke: 1pt)
  line(p(370, ax - amp), p(370, ax), stroke: 0.8pt)
  // 周期 T
  line(p(370, 858), p(945, 858), mark: (start: "|", end: "|"), stroke: 0.7pt)
  line(p(370, 858), p(645, 858), stroke: 0.7pt)
  tx(662, 858, $T$)
  // 刻度标注
  tx(352, 740, $I_m$, anchor: "east")
  tx(930, 740, $I_m$)
  tx(635, 772, $-I_m$, anchor: "east")
  tx(371, 775, $pi slash 2 omega$)
  tx(371, 800, $(T slash 4)$)
  tx(500, 775, $pi slash omega$)
  tx(500, 800, $(T slash 2)$)
  tx(660, 713, $3 pi slash 2 omega$)
  tx(660, 742, $(3 T slash 4)$)
  tx(824, 775, $5 pi slash omega$)
  tx(808, 800, $(T)$)
  tx(944, 775, $5 pi slash 2 omega$)
  tx(940, 800, $(5 T slash 4)$)
  // 上方五个线圈位置图
  let diagram(cx, vertical, top, bottom) = {
    let cy = 497
    circle(p(cx, cy), radius: 52 * u, stroke: (thickness: 0.6pt, dash: "dashed"))
    for dy in (-60, -30, 0, 30, 60) {
      line(p(cx - 68, cy + dy), p(cx + 68, cy + dy), mark: (end: ">", fill: black, scale: 0.5), stroke: 0.5pt)
    }
    if vertical {
      rect(p(cx - 6, cy - 50), p(cx + 6, cy + 50), radius: 6 * u, fill: white, stroke: 0.9pt)
      tx(cx, cy - 66, top)
      tx(cx, cy + 74, bottom)
    } else {
      rect(p(cx - 56, cy - 6), p(cx + 56, cy + 6), radius: 6 * u, fill: white, stroke: 0.9pt)
      tx(cx - 70, cy, top)
      tx(cx + 70, cy, bottom)
    }
  }
  diagram(225, true, $a$, $d$)
  diagram(370, false, $d$, $a$)
  diagram(513, true, $d$, $a$)
  diagram(655, false, $a$, $d$)
  diagram(805, true, $a$, $d$)
  // 水平线圈两端的 ⊗ 与 ⊙
  tx(327, 497, text(size: 7pt)[⊗])
  tx(413, 497, text(size: 7pt)[⊙])
  tx(617, 497, text(size: 7pt)[⊗])
  tx(693, 497, text(size: 7pt)[⊙])
})
