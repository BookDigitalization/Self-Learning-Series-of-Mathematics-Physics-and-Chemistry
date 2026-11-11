// 段 K 图的共用小工具（几何第二册 p.192–206，第 3 章 §3·5–§3·6）。页面渲染 dpi：120。
#import "/common/geo.typ": *

#let k = 0.0152cm   // 1 像素 ≈ 0.0152 cm

// 点 pt 在直线 a→b 上的垂足
#let K-foot(pt, a, b) = {
  let (dx, dy) = (b.at(0) - a.at(0), b.at(1) - a.at(1))
  let t = ((pt.at(0) - a.at(0)) * dx + (pt.at(1) - a.at(1)) * dy) / (dx * dx + dy * dy)
  (a.at(0) + t * dx, a.at(1) + t * dy)
}
// 线段 a→b 上按比例 t 取点
#let K-lerp(a, b, t) = (a.at(0) + (b.at(0) - a.at(0)) * t, a.at(1) + (b.at(1) - a.at(1)) * t)
// 小号斜体文字（面积符号 S₁ 之类、罗马数字、边长 a b c）
#let K-sm(body) = text(font: fonts.song, size: 7.5pt, style: "italic", body)
