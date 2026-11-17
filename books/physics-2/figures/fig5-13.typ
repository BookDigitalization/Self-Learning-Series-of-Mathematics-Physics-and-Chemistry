// 图 5·13 小容器中的凹形液面和凸形液面（原书 p.173）
// 线条图，按原图重绘。坐标取自原页 200 dpi 页面像素坐标（1130×1662），原点取画布左上角 (620, 865)。
#import "/common/series.typ": *

#let fig-5-13(width: 4cm) = px-canvas(260, 310, origin: (620, 865), width: width, (p, u) => {
  import cetz.draw: *
  let lab(x, y, body, a: "center") = content(p(x, y), anchor: a, text(size: 8.5pt, body))
  // 试管：外壁 xl–xr，内壁 il–ir，顶 yt，底 yb
  let tube(xl, xr, yt, yb) = {
    let t = 5.4
    let r = (xr - xl) / 2
    let xc = (xl + xr) / 2
    line(p(xl, yt), p(xl, yb - r), stroke: 1pt)
    line(p(xr, yt), p(xr, yb - r), stroke: 1pt)
    line(p(xl + t, yt), p(xl + t, yb - r), stroke: 1pt)
    line(p(xr - t, yt), p(xr - t, yb - r), stroke: 1pt)
    line(p(xl, yt), p(xl + t, yt), stroke: 1pt)
    line(p(xr, yt), p(xr - t, yt), stroke: 1pt)
    arc(p(xc, yb - r), start: 180deg, stop: 360deg, radius: r, anchor: "origin", stroke: 1pt)
    arc(p(xc, yb - r), start: 180deg, stop: 360deg, radius: r - t, anchor: "origin", stroke: 1pt)
  }
  // 左：水
  tube(636, 684, 873, 1128)
  let lw = 641.5
  let rw = 678.5
  for (i, y) in range(918, 1110, step: 9).enumerate() {
    line(p(lw + 3 + calc.rem(i, 3) * 3, y), p(lw + 14 + calc.rem(i, 2) * 5, y), stroke: 0.5pt)
    line(p(lw + 20, y + 3), p(rw - 3, y + 3), stroke: 0.5pt)
  }
  // 凹弯月面
  line(p(lw, 898), p(lw + 6, 904), p(lw + 19, 908), p(rw - 19, 908), p(rw - 6, 904), p(rw, 898), stroke: 1pt)
  lab(710, 923, [水])
  line(p(701, 925), p(673, 934), stroke: 0.6pt)
  lab(664, 1153, [凹形液面])
  // 右：水银
  tube(754.5, 802, 873, 1128)
  merge-path(close: true, fill: black, stroke: none, {
    line(p(760, 897), p(764, 889), p(776, 886), p(788, 889), p(796, 897))
    line(p(796, 897), p(796, 1103))
    arc(p(778, 1103), start: 0deg, stop: -180deg, radius: 18, anchor: "origin")
    line(p(760, 1103), p(760, 897))
  })
  lab(840, 920, [水银])
  line(p(814, 921), p(798, 928), stroke: 0.6pt)
  lab(785, 1152, [凸形液面])
})
