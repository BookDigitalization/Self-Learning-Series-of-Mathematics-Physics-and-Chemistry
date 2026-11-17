// 第 6 章写实插画：原扫描裁剪的二值化 PNG（见 scripts/crop-figure.py），图中原有文字已涂掉，用真文字补上。
// 来源页（原书页码）：图 6·1 p.183；6·4 p.186；6·5、6·6 p.187；6·7 p.190；6·9、6·11 p.194；
// 6·12、6·13、6·14 p.195；6·15、6·16、6·17 p.196；6·24 p.212；6·25、6·26 p.213。
#import "/common/series.typ": *

#let bm(file, w, h, width, extra: none, extra-h: 0) = px-canvas(w, h + extra-h, width: width, (p, u) => {
  import cetz.draw: *
  content(p(0, 0), anchor: "north-west", image(file, width: w * u))
  if extra != none { extra(p, u) }
})

#let fig-6-1(width: 5.4cm) = bm("fig6-1.png", 450, 511, width)

#let fig-6-4(width: 6.4cm) = bm("fig6-4.png", 570, 454, width, extra-h: 56, extra: (p, u) => {
  import cetz.draw: *
  circle(p(35, 486), radius: 16 * u, fill: black, stroke: 1pt)
  content(p(60, 486), anchor: "west", text(size: 8.5pt, [Cl]))
  circle(p(187, 486), radius: 16 * u, fill: white, stroke: 1pt)
  content(p(212, 486), anchor: "west", text(size: 8.5pt, [Na]))
})

#let fig-6-5(width: 5cm) = bm("fig6-5.png", 466, 510, width)

#let fig-6-6(width: 5.8cm) = bm("fig6-6.png", 555, 656, width, extra: (p, u) => {
  import cetz.draw: *
  for (y, t) in ((202, $a$), (395, $b$), (633, $c$)) {
    content(p(232, y), anchor: "center", text(size: 9pt, t))
  }
})

#let fig-6-7(width: 8.4cm) = bm("fig6-7.png", 623, 360, width)

#let fig-6-9(width: 7cm) = px-canvas(600, 540, width: width, (p, u) => {
  import cetz.draw: *
  content(p(131, 0), anchor: "north-west", image("fig6-9a.png", width: 338 * u))
  content(p(300, 236), anchor: "center", text(size: 8.5pt, $(a)$))
  content(p(7, 270), anchor: "north-west", image("fig6-9b.png", width: 586 * u))
  content(p(300, 510), anchor: "center", text(size: 8.5pt, $(b)$))
})

#let fig-6-11(width: 4.6cm) = bm("fig6-11.png", 398, 383, width)

#let fig-6-12(width: 7.6cm) = bm("fig6-12.png", 668, 360, width, extra: (p, u) => {
  import cetz.draw: *
  content(p(657, 75), anchor: "center", text(size: 9pt, $bold(italic(F))$))
  content(p(30, 273), anchor: "center", text(size: 9pt, $bold(italic(F))$))
})

#let fig-6-13(width: 4.6cm) = bm("fig6-13.png", 390, 413, width)

#let fig-6-14(width: 7.4cm) = bm("fig6-14.png", 616, 120, width)

#let fig-6-15(width: 4.8cm) = bm("fig6-15.png", 406, 443, width)

#let fig-6-16(width: 4.2cm) = bm("fig6-16.png", 361, 353, width)

#let fig-6-17(width: 8.4cm) = bm("fig6-17.png", 713, 323, width, extra-h: 125, extra: (p, u) => {
  import cetz.draw: *
  content(p(162, 396), anchor: "center", text(size: 8.5pt, $(a)$))
  content(p(530, 399), anchor: "center", text(size: 8.5pt, $(b)$))
})

#let fig-6-24(width: 5.6cm) = bm("fig6-24.png", 473, 278, width, extra: (p, u) => {
  import cetz.draw: *
  content(p(183, 24), anchor: "center", text(size: 8pt, [冲模]))
  content(p(417, 98), anchor: "center", text(size: 8pt, [金属板]))
  content(p(187, 251), anchor: "center", text(size: 8pt, [底模]))
})

#let fig-6-25(width: 8.4cm) = bm("fig6-25.png", 721, 345, width, extra: (p, u) => {
  import cetz.draw: *
  content(p(408, 52), anchor: "center", text(size: 8pt, [金属丝]))
  content(p(175, 158), anchor: "center", text(size: 8pt, [有孔的金属板]))
})

#let fig-6-26(width: 4.6cm) = bm("fig6-26.png", 390, 398, width, extra: (p, u) => {
  import cetz.draw: *
  content(p(348, 132), anchor: "center", text(size: 8pt, [轧辊]))
  content(p(348, 256), anchor: "center", text(size: 8pt, [轧辊]))
  content(p(52, 255), anchor: "center", text(size: 8pt, [金属坯]))
})
