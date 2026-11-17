// 第 1 章（上篇）CeTZ 插图共用的小工具。坐标均为原书 130 dpi 页面图的像素坐标（y 向下）。
#import "/common/series.typ": *

// 带箭头的线：粗细 th，箭头大小 s
#let arr(p, a, b, th: 0.8pt, s: 0.5) = cetz.draw.line(p(..a), p(..b), stroke: th, mark: (end: "stealth", fill: black, scale: s))
#let seg(p, a, b, th: 0.6pt, dash: none) = cetz.draw.line(p(..a), p(..b), stroke: (thickness: th, dash: dash))
// 小空心圆（点电荷、检验电荷）
#let ring(p, c, r: 4, fill: white) = cetz.draw.circle(p(..c), radius: r, stroke: 0.6pt, fill: fill)
// 文字标注
#let lab(p, pt, body, sz: 9pt, anchor: "center") = cetz.draw.content(p(..pt), anchor: anchor, text(size: sz, body))
// 矢量（粗斜体）字母
#let vec-it(s) = $bold(italic(#s))$
