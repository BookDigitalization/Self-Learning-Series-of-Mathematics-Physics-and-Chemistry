// 图 5·14 旋转磁场的实验（原书 p.274）
// 示意图按原图 CeTZ 重绘；坐标取自原书页面 150 dpi 像素。
#import "/common/series.typ": *

#let fig-5-14(width: 4.4cm) = px-canvas(280, 540, origin: (150, 190), width: width, (p, u) => {
  import cetz.draw: *
  let tx(x, y, body, sz: 9pt) = content(p(x, y), anchor: "center", text(size: sz, body))
  // 天花板（斜线填充）
  rect(p(168, 205), p(412, 228), stroke: 0.7pt)
  for i in range(0, 20) {
    let x = 170 + i * 12.5
    line(p(x, 228), p(x + 10, 205), stroke: 0.5pt)
  }
  // 悬线
  line(p(295, 228), p(295, 385), stroke: 1pt)
  // 蹄形磁铁：外轮廓与内轮廓
  let cx = 289
  let ro = 121
  let ri = 84
  let cy = 560
  let arc-pts(r, a0, a1) = range(0, 41).map(i => {
    let a = a0 + (a1 - a0) * i / 40
    p(cx + r * calc.cos(a * 1deg), cy + r * calc.sin(a * 1deg))
  })
  line(p(cx - ro, 385), p(cx - ro, cy), ..arc-pts(ro, 180, 0), p(cx + ro, 385), p(cx + ri, 385), p(cx + ri, cy), ..arc-pts(ri, 0, 180), p(cx - ri, 385), close: true, stroke: 1pt)
  tx(190, 405, $N$)
  tx(393, 405, $S$)
  // 线圈（多匝，用相邻的两个方框表示）
  rect(p(235, 385), p(345, 500), stroke: 0.9pt)
  rect(p(228, 390), p(338, 497), stroke: 0.9pt)
  rect(p(231, 387), p(341, 499), stroke: 0.9pt)
  // 转轴 OO'
  line(p(289, 545), p(289, 690), stroke: (thickness: 0.7pt, dash: "dash-dotted"))
  tx(300, 545, $O'$)
  tx(289, 705, $O$)
})
