// 写实插图（原扫描裁剪、二值化），图中原有文字已涂去，用 CeTZ 补成真文字。
// 图 2·7 电流表外形（原书 p.82）、图 2·12 标准电阻（p.88）、图 2·15 滑动变阻器（p.92）、
// 图 2·16 转柄变阻器（p.93）、图 2·18 液体变阻器（p.94）、图 2·19 电阻箱（p.95）。
// 坐标是各裁剪图（400 dpi）的像素坐标，文字大小用 px × u 表示。
#import "/common/series.typ": *

#let t(p, x, y, body, size, w: "regular") = {
  import cetz.draw: *
  content(p(x, y), anchor: "center", text(size: size, weight: w, body))
}

#let fig-2-7(width: 5.8cm) = px-canvas(1376, 1032, width: width, (p, u) => {
  import cetz.draw: *
  content(p(0, 0), anchor: "north-west", image("fig2-7.png", width: 1376 * u))
  t(p, 618, 192, [电流表], 72 * u)
})

#let fig-2-12(width: 4cm) = image("fig2-12.png", width: width)

#let fig-2-15(width: 6.4cm) = px-canvas(1267, 648, width: width, (p, u) => {
  import cetz.draw: *
  content(p(0, 0), anchor: "north-west", image("fig2-15.png", width: 1267 * u))
  t(p, 27, 340, $A$, 70 * u)
  t(p, 682, 80, $D$, 70 * u)
  t(p, 1082, 72, $C$, 70 * u)
})

#let fig-2-16(width: 5.2cm) = px-canvas(1158, 1641, width: width, (p, u) => {
  import cetz.draw: *
  content(p(0, 0), anchor: "north-west", image("fig2-16.png", width: 1158 * u))
  t(p, 628, 1262, $T$, 80 * u)
  t(p, 1108, 1345, $B$, 80 * u)
  t(p, 94, 1345, $A$, 80 * u)
})

#let fig-2-18(width: 6cm) = px-canvas(1251, 1016, width: width, (p, u) => {
  import cetz.draw: *
  content(p(0, 0), anchor: "north-west", image("fig2-18.png", width: 1251 * u))
  t(p, 572, 230, [铁板], 62 * u)
  t(p, 1070, 605, [绝缘体], 62 * u)
  t(p, 525, 800, [盐溶液], 62 * u)
})

#let fig-2-19(width: 11cm) = {
  let a = image("fig2-19a.png", width: width * 0.5)
  let b = px-canvas(658, 454, width: width * 0.4, (p, u) => {
    import cetz.draw: *
    content(p(0, 0), anchor: "north-west", image("fig2-19b.png", width: 658 * u))
    t(p, 143, 111, [1], 56 * u)
    t(p, 315, 111, [2], 56 * u)
    t(p, 92, 190, $A$, 56 * u)
    t(p, 300, 190, $B$, 56 * u)
    t(p, 485, 190, $C$, 56 * u)
  })
  grid(columns: 2, column-gutter: 1.5cm, align: bottom + center, row-gutter: 0.6em,
    a, b, text(size: 9pt, $(a)$), text(size: 9pt, $(b)$))
}
