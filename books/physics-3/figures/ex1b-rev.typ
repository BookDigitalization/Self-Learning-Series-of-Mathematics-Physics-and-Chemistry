// 复习题一附图（原书 p.74、p.75）。第 6、13 题 CeTZ 重绘（坐标：p.74 取自 200 dpi 页面图，p.75 取自 150 dpi 页面图），第 9 题为位图加真文字。
#import "fig1b-lib.typ": *

#let fig-rev-1-6(width: 7cm) = px-canvas(710, 370, origin: (400, 610), width: width, (p, u) => {
  import cetz.draw: *
  hatch(p, 543, 665, 1010, 712, d: 10)
  hatch(p, 545, 910, 1012, 958, d: 10)
  lab(p, 782, 689, [$-$], size: 11pt, fill: white)
  lab(p, 780, 934, [$+$], size: 11pt, fill: white)
  for i in range(10) {
    let x = 577 + 44.4 * i
    arr(p, (x, 910), (x, 713), w: 0.6pt, s: 0.4)
  }
  // 宽度 5 的尺寸线
  line(p(543, 622), p(543, 648), stroke: 0.6pt)
  line(p(1008, 622), p(1008, 648), stroke: 0.6pt)
  line(p(543, 636), p(1008, 636), stroke: 0.6pt, mark: (start: "stealth", end: "stealth", fill: black, scale: 0.4))
  lab(p, 773, 636, [$5$], size: 8pt, fill: white)
  // 电子的轨迹
  line(p(410, 815), p(1090, 815), stroke: (thickness: 0.5pt, dash: "dashed"))
  bezier(p(432, 815), p(700, 818), p(560, 814), p(640, 816), stroke: 1.6pt)
  bezier(p(700, 818), p(1045, 887), p(850, 822), p(960, 850), stroke: 1.6pt)
  circle(p(432, 813), radius: 6 * u, fill: black, stroke: none)
  lab(p, 440, 793, [$-e$], size: 8pt, fill: white)
})

// 位图 ex1b-rev-9.png 裁剪自 p.74 (185,1566)–(463,2112)，556×1092；A 球上的字母涂去后补回
#let fig-rev-1-9(width: 3.2cm) = bm("ex1b-rev-9.png", 556, 1092, width, ((406, 154, $A$),))

#let fig-rev-1-13(width: 8cm) = px-canvas(500, 400, origin: (420, 1010), width: width, (p, u) => {
  import cetz.draw: *
  // 两块板
  line(p(455, 1087), p(665, 1087), stroke: 3pt)
  line(p(455, 1270), p(665, 1270), stroke: 3pt)
  lab(p, 683, 1087, [$A$], size: 8pt)
  lab(p, 683, 1270, [$B$], size: 8pt)
  // 电池
  for k in range(6) {
    let y = 1138 + 18 * k
    let w = if calc.even(k) { 14 } else { 8 }
    line(p(872 - w, y), p(872 + w, y), stroke: if calc.even(k) { 1.6pt } else { 2.4pt })
  }
  line(p(872, 1087), p(872, 1138), stroke: th)
  line(p(872, 1228), p(872, 1322), stroke: th)
  lab(p, 893, 1112, [$+$], size: 9pt)
  lab(p, 893, 1245, [$-$], size: 9pt)
  lab(p, 805, 1183, [$100 space "V"$], size: 8pt)
  // 导线
  line(p(560, 1087), p(560, 1030), p(872, 1030), p(872, 1087), stroke: th)
  line(p(872, 1322), p(558, 1322), p(558, 1270), stroke: th)
  dot(p, 558, 1322, u: u)
  line(p(558, 1322), p(558, 1372), stroke: th)
  ground(p, 558, 1374, w: 30)
  // 尺寸：4 毫米、10 毫米
  line(p(530, 1087), p(530, 1148), stroke: 0.6pt, mark: (start: "stealth", end: "stealth", fill: black, scale: 0.35))
  lab(p, 568, 1122, [4 毫米], size: 8pt)
  line(p(440, 1087), p(440, 1270), stroke: 0.6pt, mark: (start: "stealth", end: "stealth", fill: black, scale: 0.35))
  line(p(432, 1087), p(455, 1087), stroke: 0.6pt)
  line(p(432, 1270), p(455, 1270), stroke: 0.6pt)
  content(p(424, 1180), angle: -90deg, text(size: 8pt)[10 毫米])
  circle(p(510, 1148), radius: 5 * u, fill: black, stroke: none)
  lab(p, 528, 1168, [$P$], size: 8pt)
})
