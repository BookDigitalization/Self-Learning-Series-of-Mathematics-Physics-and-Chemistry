#import "/common/series.typ": *
// 第 6 章 §6·2（p.204）：三阶行列式“对角线法”示意图，不编号（正文：“如下图所示”）。
// 坐标取自 200 dpi 页面的真实像素（y 向下）：5 列 x≈323、404、481、563、641，3 行 y≈725、790、852；
// 实线（左上到右下，箭头在第三行）：a1→b2→c3、b1→c2→a3、c1→a2→b3；
// 虚线（左下到右上，箭头在第一行）：a3→b2→c1、b3→c2→a1、c3→a2→b1。
#let k = 0.0155cm
#let tt(body) = text(size: 10.5pt, body)
#let ar = (end: "stealth", fill: black, scale: 0.5)

#let fig-6-det3(width: 390 * k) = px-canvas(390, 190, origin: (290, 700), width: width, (p, u) => {
  import cetz.draw: *
  let xs = (323, 404, 481, 563, 641)
  let ys = (725, 790, 852)
  let names = (($a_1$, $b_1$, $c_1$, $a_1$, $b_1$), ($a_2$, $b_2$, $c_2$, $a_2$, $b_2$), ($a_3$, $b_3$, $c_3$, $a_3$, $b_3$))
  for (r, row) in names.enumerate() {
    for (c, nm) in row.enumerate() { content(p(xs.at(c), ys.at(r)), tt(nm)) }
  }
  // 沿 (c0,r0) 到 (c1,r1) 的一段，两端各缩进 17 px 让出字母
  let seg(c0, r0, c1, r1, dashed, arrow) = {
    let (x0, y0, x1, y1) = (xs.at(c0), ys.at(r0), xs.at(c1), ys.at(r1))
    let (dx, dy) = (x1 - x0, y1 - y0)
    let l = calc.sqrt(dx * dx + dy * dy)
    let (ex, ey) = (dx / l * 17, dy / l * 17)
    line(p(x0 + ex, y0 + ey), p(x1 - ex, y1 - ey),
      stroke: if dashed { (paint: black, thickness: 0.6pt, dash: "dashed") } else { 0.6pt },
      mark: if arrow { ar } else { none })
  }
  for c in (0, 1, 2) {
    seg(c, 0, c + 1, 1, false, false)
    seg(c + 1, 1, c + 2, 2, false, true)
    seg(c, 2, c + 1, 1, true, false)
    seg(c + 1, 1, c + 2, 0, true, true)
  }
})
