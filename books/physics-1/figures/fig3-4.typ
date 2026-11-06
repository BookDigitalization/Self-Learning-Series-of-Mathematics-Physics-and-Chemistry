// 图 3·4 万吨水压机（原书 p.47）
// 写实插画，沿用原扫描裁剪（fig3-4.png）；机身横梁上的铭牌文字“上 海 / 江南造船厂 / 1961年”已涂去，用 CeTZ 文字补回。
// 铭牌年份扫描里糊成“1261年”，按字形和史实猜作“1961年”，用 unclear 标出（见 checklist/figtext-ch3.md）。
// 坐标是 fig3-4.png 的像素坐标（1270×1973，y 向下）。
#import "/common/series.typ": *

#let fig-3-4(width: 6cm) = px-canvas(1270, 1973, width: width, (p, u) => {
  import cetz.draw: *
  content(p(0, 0), anchor: "north-west", image("fig3-4.png", width: 1270 * u))
  let lab(x, y, body, size: 9pt) = content(p(x, y), anchor: "center", text(font: fonts.hei, size: size, weight: "bold", body))
  lab(555, 387, [上])
  lab(678, 387, [海])
  lab(618, 503, [江南造船厂], size: 8pt)
  lab(622, 598, unclear[1961年], size: 7.5pt)
})
