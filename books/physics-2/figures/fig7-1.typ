// 图 7·1 松香在熔化和凝固时温度改变的情形（原书 p.217，CeTZ 重绘）
// 坐标取自 200 dpi 带网格的页面图（render-pages.py --grid 100）。
#import "/common/series.typ": *

#let fig-7-1(width: 11cm) = px-canvas(600, 450, origin: (270, 900), width: width, (p, u) => {
  import cetz.draw: *
  let lw = 0.6pt
  set-style(stroke: lw)
  let tx(pt, body, anchor) = content(pt, anchor: anchor, text(size: 8pt, body))
  // 一幅坐标：x0 为纵轴位置，tx0 为 t=0 刻度位置
  let axes(x0, xt, xend) = {
    line(p(x0, 1215), p(x0, 915), mark: (end: ">", fill: black, scale: 0.5))
    line(p(x0, 1215), p(xend, 1215), mark: (end: ">", fill: black, scale: 0.5))
    for (i, v) in (100, 80, 60, 40, 20).enumerate() {
      let y = 1000 + i * 53.75
      line(p(x0, y), p(x0 + 5, y))
      tx(p(x0 - 4, y), [#v], "east")
    }
    for (i, v) in (0, 2, 4, 6, 8, 10).enumerate() {
      let x = xt + i * 27
      line(p(x, 1215), p(x, 1210))
      tx(p(x, 1224), [#v], "north")
    }
    tx(p(x0 - 38, 1085), std.rotate(-90deg, [温度（°C）]), "center")
    tx(p(xt + 70, 1255), [时间（分）], "center")
  }
  axes(350, 373, 568)
  axes(641, 664, 862)
  let thick = 1.4pt
  catmull(..(p(393, 1163), p(430, 1145), p(470, 1105), p(500, 1055), p(512, 1020), p(522, 972)), stroke: thick, tension: 0.5)
  catmull(..(p(675, 970), p(685, 1015), p(700, 1060), p(730, 1105), p(765, 1135), p(810, 1165)), stroke: thick, tension: 0.5)
  tx(p(430, 1300), [松香的熔化图线], "center")
  tx(p(742, 1300), [松香的凝固图线], "center")
})
