// 段 P 图的共用小工具（几何第二册 p.290–303，第 5 章 §5·5–§5·6、复习题五）。页面渲染 dpi：120。
#import "/common/geo.typ": *

#let k = 0.0152cm   // 1 像素 ≈ 0.0152 cm

// 圆弧上的点（页面坐标 y 向下；角度为数学角，度数，逆时针为正）
#let P-pt(c, r, a) = (c.at(0) + r * calc.cos(a * 1deg), c.at(1) - r * calc.sin(a * 1deg))
// 圆弧的点列：从 a0 到 a1（度），n 段
#let P-arcpts(c, r, a0, a1, n: 40) = range(n + 1).map(i => P-pt(c, r, a0 + (a1 - a0) * i / n))
// 画圆弧（数学角，度）；传 stroke 以外的样式用 ..style
#let P-arc(p, c, r, a0, a1, ..style) = {
  import cetz.draw: *
  let (s, e) = if a1 >= a0 { (a0, a1) } else { (a1, a0) }
  arc(p(..c), start: s * 1deg, stop: e * 1deg, radius: r, anchor: "origin", stroke: lw, ..style)
}
// 线段 a→b 上按比例 t 取点
#let P-lerp(a, b, t) = (a.at(0) + (b.at(0) - a.at(0)) * t, a.at(1) + (b.at(1) - a.at(1)) * t)
// 小号斜体文字
#let P-sm(body) = text(font: fonts.song, size: 7.5pt, body)

// 阴影线：loops 为若干闭合折线（页面坐标点列，奇偶规则，可含内环）；
// ang 为阴影线的方向角（度，页面向量的数学角：0 水平、90 竖直、45 为“／”）
#let P-hatch(p, loops, ang: 0, gap: 5, sw: 0.4pt) = {
  import cetz.draw: *
  let c = calc.cos(ang * 1deg)
  let s = calc.sin(-ang * 1deg)   // 页面 y 向下，故取负号
  // 沿线方向 a、垂直方向 b
  let tr(pt) = (pt.at(0) * c + pt.at(1) * s, -pt.at(0) * s + pt.at(1) * c)
  let ls = loops.map(l => l.map(tr))
  let bs = ls.map(l => l.map(q => q.at(1))).flatten()
  let bmin = calc.min(..bs)
  let bmax = calc.max(..bs)
  let n = int((bmax - bmin) / gap)
  for i in range(1, n + 1) {
    let b = bmin + i * gap - gap / 2
    let xs = ()
    for l in ls {
      let m = l.len()
      for j in range(m) {
        let q1 = l.at(j)
        let q2 = l.at(calc.rem(j + 1, m))
        if (q1.at(1) <= b and q2.at(1) > b) or (q2.at(1) <= b and q1.at(1) > b) {
          xs.push(q1.at(0) + (b - q1.at(1)) / (q2.at(1) - q1.at(1)) * (q2.at(0) - q1.at(0)))
        }
      }
    }
    xs = xs.sorted()
    for j in range(0, xs.len() - 1, step: 2) {
      line(p(xs.at(j) * c - b * s, xs.at(j) * s + b * c), p(xs.at(j + 1) * c - b * s, xs.at(j + 1) * s + b * c), stroke: sw)
    }
  }
}
// 带白底的文字（压在弧线或尺寸线上的标注）
#let P-lbw(p, pt, body) = {
  import cetz.draw: *
  content(p(..pt), tt(body), fill: white, padding: 1pt, stroke: none)
}
// 两端带箭头的圆弧（尺寸弧），中间留出放文字的缺口：a0 到 a1 为全范围，gap 为缺口半宽（度）
#let P-darc(p, c, r, a0, a1, gap: 10, mid: auto, lab: none) = {
  import cetz.draw: *
  let m = if mid == auto { (a0 + a1) / 2 } else { mid }
  arc(p(..c), start: a0 * 1deg, stop: (m - gap) * 1deg, radius: r, anchor: "origin", stroke: lt, mark: (start: "stealth", fill: black, scale: 0.45))
  arc(p(..c), start: (m + gap) * 1deg, stop: a1 * 1deg, radius: r, anchor: "origin", stroke: lt, mark: (end: "stealth", fill: black, scale: 0.45))
  if lab != none { lbl(p, P-pt(c, r, m), lab, dir: "c", d: 0) }
}
