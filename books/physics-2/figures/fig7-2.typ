// 图 7·2 萘在熔化和凝固时温度改变的情形（原书 p.219，CeTZ 重绘）
// 坐标取自 200 dpi 带网格的页面图。
#import "/common/series.typ": *

#let fig-7-2(width: 11cm) = px-canvas(620, 360, origin: (270, 140), width: width, (p, u) => {
  import cetz.draw: *
  let lw = 0.6pt
  set-style(stroke: lw)
  let tx(pt, body, anchor) = content(pt, anchor: anchor, text(size: 8pt, body))
  let axes(x0, xt, xend) = {
    line(p(x0, 395), p(x0, 150), mark: (end: ">", fill: black, scale: 0.5))
    line(p(x0, 395), p(xend, 395), mark: (end: ">", fill: black, scale: 0.5))
    for (i, v) in (100, 80, 60, 40, 20, 0).enumerate() {
      let y = 216 + i * 35.8
      if v > 0 { line(p(x0, y), p(x0 + 5, y)) }
      tx(p(x0 - 4, y), [#v], "east")
    }
    for (i, v) in (2, 4, 6, 8, 10).enumerate() {
      let x = xt + i * 35
      line(p(x, 395), p(x, 390))
      tx(p(x, 404), [#v], "north")
    }
    tx(p(x0 - 42, 290), std.rotate(-90deg, [温度（°C）]), "center")
    tx(p(xt + 75, 434), [时间（分）], "center")
  }
  axes(335, 371, 565)
  axes(638, 674, 870)
  let thick = 1.4pt
  catmull(..(p(373, 357), p(400, 338), p(420, 312), p(435, 285), p(447, 260), p(458, 252), p(480, 249), p(500, 247), p(512, 238), p(522, 190)), stroke: thick, tension: 0.5)
  catmull(..(p(657, 185), p(664, 215), p(672, 238), p(685, 244), p(740, 245), p(752, 270), p(775, 305), p(800, 340), p(816, 362)), stroke: thick, tension: 0.5)
  tx(p(431, 247), text(style: "italic", [$A$]), "south")
  tx(p(518, 248), text(style: "italic", [$B$]), "south")
  tx(p(665, 248), text(style: "italic", [$C$]), "south")
  tx(p(754, 247), text(style: "italic", [$D$]), "south")
  tx(p(434, 481), [萘的熔化图线], "center")
  tx(p(752, 481), [萘的凝固图线], "center")
})
