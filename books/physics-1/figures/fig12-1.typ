// 图 12·1 汽锤打击工件的受力分析（原书 p.384）
// 线条图，按原图重绘。坐标取自 p.384 的“显示图”坐标（宽 1568），内部乘 1.0657 换成真实像素。
// 画布左上角在真实页面坐标 (320, 290)，画布 1120 × 400。
#import "/common/series.typ": *

#let fig-12-1(width: 13cm) = px-canvas(1120, 400, origin: (320, 290), width: width, (p0, u) => {
  import cetz.draw: *
  let k = 1.0657
  let p = (x, y) => p0(x * k, y * k)
  let th = 0.8pt
  let txt(x, y, body) = content(p(x, y), anchor: "center", text(size: 8pt, body))
  // 斜线阴影（填满矩形）
  let hatch(x0, y0, x1, y1, d: 11) = {
    rect(p(x0, y0), p(x1, y1), stroke: th)
    let c = x0 + y0 + d
    while c < x1 + y1 {
      let lo = calc.max(x0, c - y1)
      let hi = calc.min(x1, c - y0)
      if lo < hi { line(p(lo, c - lo), p(hi, c - hi), stroke: 0.5pt) }
      c += d
    }
  }
  // 工件上的楔形块（灰色示意）
  let wedge(x, y) = line(p(x, y), p(x + 60, y), p(x, y + 36), close: true, stroke: th, fill: luma(185))
  let ground(x0, x1, y) = {
    line(p(x0, y), p(x1, y), stroke: th)
    let x = x0
    while x < x1 - 8 {
      line(p(x + 8, y), p(x, y + 8), stroke: 0.5pt)
      x += 12
    }
  }
  let arr(a, b) = line(p(..a), p(..b), stroke: th, mark: (end: "stealth", fill: black, scale: 0.5))

  // —— 图一：下落与接触 ——
  hatch(377, 285, 443, 345)
  txt(360, 312, $m$)
  txt(487, 308, $v_0 = 0$)
  // h 的尺寸线
  arr((357, 372), (357, 352))
  arr((357, 425), (357, 508))
  txt(357, 425, $h$)
  rect(p(378, 452), p(437, 507), stroke: (thickness: th, dash: "dashed"))
  arr((462, 435), (462, 480))
  txt(535, 462, $v_1 = sqrt(2 g h)$)
  rect(p(350, 510), p(445, 570), stroke: th)
  wedge(445, 510)
  ground(322, 520, 572)
  // —— 图二：作用结束 ——
  hatch(635, 450, 690, 505)
  txt(735, 470, $v_2 = 0$)
  rect(p(612, 510), p(705, 570), stroke: th)
  wedge(705, 510)
  ground(598, 780, 572)
  // Δt
  arr((540, 620), (447, 620))
  arr((565, 620), (655, 620))
  txt(553, 620, $Delta t$)
  // —— 图三：汽锤的受力 ——
  hatch(860, 297, 918, 352)
  arr((888, 352), (888, 400))
  txt(868, 388, $G$)
  hatch(998, 462, 1058, 525)
  arr((1020, 525), (1020, 580))
  txt(1007, 553, $G$)
  arr((1042, 610), (1042, 565))
  txt(1055, 592, $F$)
  // —— 图四：铁砧（工件）的受力 ——
  rect(p(1176, 520), p(1265, 585), stroke: th)
  wedge(1265, 520)
  arr((1210, 432), (1210, 518))
  txt(1232, 465, $F'$)
  arr((1205, 590), (1205, 630))
  txt(1185, 620, $G'$)
  arr((1255, 632), (1255, 592))
  txt(1270, 618, $N$)
})
