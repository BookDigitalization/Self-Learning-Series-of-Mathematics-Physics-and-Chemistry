// 图 15·3：粗细不均的管子，截面 S₁、S₂（原书 p.494，坐标取自 200 dpi 页面显示图）
#import "/common/series.typ": *
#import "@preview/cetz:0.5.3"

#let fig-15-3(width: 11cm) = px-canvas(720, 290, origin: (500, 1550), width: width, (p, u) => {
  import cetz.draw: *
  let lw = 1.3pt
  // 管壁
  merge-path(stroke: lw, {
    line(p(577, 1635), p(830, 1635))
    bezier(p(830, 1635), p(1020, 1580), p(900, 1635), p(950, 1580))
    line(p(1020, 1580), p(1190, 1580))
  })
  merge-path(stroke: lw, {
    line(p(577, 1740), p(830, 1740))
    bezier(p(830, 1740), p(1020, 1800), p(900, 1740), p(950, 1800))
    line(p(1020, 1800), p(1190, 1800))
  })
  // S1, S2 实线截面；S1', S2' 虚线截面
  line(p(617, 1635), p(617, 1740), stroke: lw)
  line(p(1022, 1580), p(1022, 1800), stroke: lw)
  line(p(788, 1635), p(788, 1740), stroke: (thickness: lw, dash: "dashed"))
  line(p(1118, 1580), p(1118, 1800), stroke: (thickness: lw, dash: "dashed"))
  // 流速箭头
  line(p(525, 1688), p(590, 1688), stroke: lw, mark: (end: ">", fill: black))
  line(p(900, 1688), p(975, 1688), stroke: lw, mark: (end: ">", fill: black))
  content(p(547, 1667), text(size: 10pt)[$v_1$])
  content(p(927, 1667), text(size: 10pt)[$v_2$])
  content(p(697, 1685), text(size: 10pt)[$S_1 v_1$])
  content(p(1068, 1685), text(size: 10pt)[$S_2 v_2$])
  content(p(619, 1766), text(size: 10pt)[$S_1$])
  content(p(792, 1766), text(size: 10pt)[$S'_1$])
  content(p(1020, 1822), text(size: 10pt)[$S_2$])
  content(p(1116, 1822), text(size: 10pt)[$S'_2$])
})
