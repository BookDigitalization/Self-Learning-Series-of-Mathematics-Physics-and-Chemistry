// 第 4 章（复数）插图的共用小工具。
// 各图坐标取自 150 dpi 页面图（即扫描原生像素，宽 800，y 向下），用放大裁图加网格读出；
// 1 个像素在成书里画成 0.0190 cm。
#import "/common/series.typ": *

#let k = 0.0190cm
#let ar = (end: "stealth", fill: black, scale: 0.55)
#let ar2 = (start: "stealth", end: "stealth", fill: black, scale: 0.55)
#let tt(body) = text(font: fonts.song, size: 8pt, body)
#let tb(body) = text(font: fonts.hei, size: 8pt, weight: "bold", body)
#let wbox(body) = box(fill: white, inset: (x: 1pt, y: 0pt), tt(body))
#let axw = 0.9pt          // 坐标轴线宽
#let vw = 1.5pt           // 向量线宽
#let dash = (paint: black, thickness: 0.7pt, dash: "dashed")
#let pdot(c, r: 3) = {
  import cetz.draw: *
  circle(c, radius: r, fill: black, stroke: none)
}
// 页面向量 (dx, dy)（y 向下）的方向角（数学角，逆时针为正）
#let dirang(dx, dy) = calc.atan2(dx, -dy)
