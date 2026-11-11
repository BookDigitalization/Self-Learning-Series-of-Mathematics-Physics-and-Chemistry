// 图 1·26–图 1·33 和习题 1·5 的插图（原书 p.21–23），读坐标时的页面渲染 200 dpi。
// 图 1·28（钟面、圆规、卡钳）是写实插画，用原扫描二值化 PNG（B-1-28.png，p.22）。
// 图 1·26 原书左、中两个角并排，图号只印在左图下面；这里合成一幅。
#import "/books/geometry-1/figures/B-lib.typ": *

// 行内小记号：p.23 注意里的“带弧的角”（n 道弧）、p.29 的直角记号“∟”和带 d 的直角记号
#let B-amark(n) = box(baseline: 20%, px-canvas(40, 26, width: 1.5em, (p, u) => {
  import cetz.draw: *
  line(p(36, 3), p(3, 23), p(36, 23), stroke: 0.7pt)
  for i in range(n) { arc(p(3, 23), start: 0deg, stop: 32deg, radius: 18 + i * 5, anchor: "origin", stroke: 0.5pt) }
}))
#let B-rtsym(d: false) = box(baseline: 20%, px-canvas(40, 26, width: 1.5em, (p, u) => {
  import cetz.draw: *
  line(p(5, 2), p(5, 24), p(36, 24), stroke: 0.7pt)
  if d { content(p(17, 14), text(size: 0.75em, $d$)) }
}))

// 图 1·26（p.21）
#let fig-B-1-26(width: 480 * k) = px-canvas(480, 215, origin: (95, 605), width: width, (p, u) => {
  import cetz.draw: *
  let v = (145, 790)
  B-ray(p, v, (330, 648), frac: 0.75)
  B-ray(p, v, (375, 790), frac: 0.8)
  anglearc(p, v, (330, 648), (375, 790), 36)
  B-t(p, (121, 790), tt[顶点])
  B-t(p, (203, 717), tt[边])
  B-t(p, (246, 808), tt[边])
  let o = (485, 627)
  B-ray(p, o, (440, 790), frac: 0.72)
  B-ray(p, o, (548, 790), frac: 0.72)
  anglearc(p, o, (440, 790), (548, 790), 38)
  anglearc(p, o, (440, 790), (548, 790), 43)
  lbl(p, o, $O$, dir: "n", d: 13)
  lbl(p, (440, 790), $F$, dir: "sw", d: 11)
  lbl(p, (548, 790), $E$, dir: "se", d: 11)
})

// 图 1·27（p.21）
#let fig-B-1-27(width: 250 * k) = px-canvas(250, 195, origin: (575, 620), width: width, (p, u) => {
  import cetz.draw: *
  let v = (603, 783)
  B-ray(p, v, (755, 645), frac: 0.75)
  B-ray(p, v, (800, 783), frac: 0.6)
  anglearc(p, v, (755, 645), (800, 783), 30)
  lbl(p, (648, 765), $1$, dir: "c", d: 0)
  lbl(p, v, $B$, dir: "w", d: 12)
  lbl(p, (755, 645), $A$, dir: "ne", d: 12)
  lbl(p, (805, 783), $C$, dir: "e", d: 11)
})

// 图 1·28（p.22）：钟面、圆规、卡钳（写实插画，PNG）
#let fig-B-1-28(width: 445 * k) = image("B-1-28.png", width: width)

// 图 1·29（p.22）
#let fig-B-1-29(width: 330 * k) = px-canvas(330, 250, origin: (550, 460), width: width, (p, u) => {
  import cetz.draw: *
  let o = (562, 677)
  B-ray(p, o, (805, 480))
  B-ray(p, o, (862, 677))
  B-arc(p, o, 0, 40, 36)
  lbl(p, o, $O$, dir: "w", d: 11)
  lbl(p, (805, 480), $B$, dir: "ne", d: 12)
  lbl(p, (864, 673), $A$, dir: "ne", d: 12)
})

// 图 1·30（p.22）：平角
#let fig-B-1-30(width: 560 * k) = px-canvas(560, 110, origin: (245, 820), width: width, (p, u) => {
  import cetz.draw: *
  line(p(250, 884), p(300, 884), stroke: (paint: black, thickness: 1.4pt, dash: "dashed"))
  line(p(300, 884), p(500, 884), stroke: 1.2pt)
  line(p(514, 884), p(600, 884), stroke: 1.2pt)
  line(p(600, 884), p(790, 884), stroke: (paint: black, thickness: 1.4pt, dash: "dashed"))
  circle(p(507, 884), radius: 4, fill: white, stroke: 0.9pt)
  // 半圆形箭头：由射线 OA（右）逆时针转到 OB（左）
  arc(p(507, 884), start: 0deg, stop: 180deg, radius: 52, anchor: "origin", stroke: lt, mark: (end: "stealth", fill: black, scale: 0.45))
  lbl(p, (303, 872), $B$, dir: "c", d: 0)
  lbl(p, (737, 870), $A$, dir: "c", d: 0)
  lbl(p, (507, 903), $O$, dir: "c", d: 0)
})

// 图 1·31（p.22）：周角
#let fig-B-1-31(width: 310 * k) = px-canvas(310, 100, origin: (370, 955), width: width, (p, u) => {
  import cetz.draw: *
  let o = (415, 997)
  line(p(..o), p(590, 997), stroke: 1.2pt)
  line(p(590, 997), p(660, 997), stroke: (paint: black, thickness: 1.4pt, dash: "dashed"))
  B-arc(p, o, -28, 360, 37, mark: (end: "stealth", fill: black, scale: 0.45))
  lbl(p, (417, 1012), $O$, dir: "c", d: 0)
  lbl(p, (607, 984), $A$, dir: "c", d: 0)
  lbl(p, (607, 1012), $B$, dir: "c", d: 0)
})

// 图 1·32（p.23）
#let fig-B-1-32(width: 280 * k) = px-canvas(280, 190, origin: (125, 225), width: width, (p, u) => {
  import cetz.draw: *
  let o = (150, 396)
  B-ray(p, o, (392, 396))
  B-ray(p, o, (385, 337))
  B-ray(p, o, (332, 245))
  anglearc(p, o, (392, 396), (385, 337), 78)
  anglearc(p, o, (385, 337), (332, 245), 40)
  lbl(p, (236, 383), $1$, dir: "c", d: 0)
  lbl(p, (190, 371), $2$, dir: "c", d: 0)
  lbl(p, o, $O$, dir: "w", d: 11)
  lbl(p, (392, 396), $A$, dir: "e", d: 11)
  lbl(p, (385, 337), $B$, dir: "e", d: 11)
  lbl(p, (332, 245), $C$, dir: "ne", d: 11)
})

// 图 1·33（p.23）
#let fig-B-1-33(width: 310 * k) = px-canvas(310, 215, origin: (480, 205), width: width, (p, u) => {
  import cetz.draw: *
  let o = (510, 396)
  B-ray(p, o, (770, 396))
  B-ray(p, o, (762, 331))
  B-ray(p, o, (712, 226))
  anglearc(p, o, (770, 396), (762, 331), 78)
  anglearc(p, o, (762, 331), (712, 226), 62)
  lbl(p, (592, 379), $1$, dir: "c", d: 0)
  lbl(p, (577, 360), $2$, dir: "c", d: 0)
  lbl(p, o, $B$, dir: "w", d: 12)
  lbl(p, (770, 396), $D$, dir: "e", d: 11)
  lbl(p, (762, 331), $E$, dir: "e", d: 11)
  lbl(p, (712, 226), $F$, dir: "ne", d: 11)
})

// 习题 1·5 第 3 题（p.23）
#let fig-B-ex1-5-3(width: 330 * k) = px-canvas(330, 210, origin: (95, 1035), width: width, (p, u) => {
  import cetz.draw: *
  let o = (240, 1225)
  B-ray(p, o, (130, 1085))
  B-ray(p, o, (240, 1050))
  B-ray(p, o, (400, 1137))
  B-ray(p, o, (408, 1215))
  lbl(p, (130, 1085), $A$, dir: "nw", d: 11)
  lbl(p, (240, 1050), $B$, dir: "n", d: 11)
  lbl(p, (400, 1137), $C$, dir: "ne", d: 11)
  lbl(p, (408, 1215), $D$, dir: "e", d: 11)
  lbl(p, o, $O$, dir: "s", d: 11)
})

// 习题 1·5 第 4 题（p.23）
#let fig-B-ex1-5-4(width: 290 * k) = px-canvas(290, 235, origin: (510, 1040), width: width, (p, u) => {
  import cetz.draw: *
  let o = (528, 1138)
  let a = (775, 1055)
  let b = (775, 1093)
  let c = (775, 1172)
  let d = (770, 1262)
  B-ray(p, o, a)
  B-ray(p, o, b)
  B-ray(p, o, c)
  B-ray(p, o, d)
  // ∠1 = ∠AOB（外弧）；∠3、∠4 在 OB 与 OC 之间；∠2 = ∠COD
  anglearc(p, o, a, b, 96)
  anglearc(p, o, b, c, 72)
  anglearc(p, o, b, d, 100)
  anglearc(p, o, c, d, 55)
  lbl(p, (636, 1106), $1$, dir: "c", d: 0)
  lbl(p, (602, 1140), $3$, dir: "c", d: 0)
  lbl(p, (622, 1141), $4$, dir: "c", d: 0)
  lbl(p, (575, 1158), $2$, dir: "c", d: 0)
  lbl(p, a, $A$, dir: "ne", d: 11)
  lbl(p, b, $B$, dir: "e", d: 11)
  lbl(p, c, $C$, dir: "e", d: 11)
  lbl(p, d, $D$, dir: "se", d: 11)
  lbl(p, o, $O$, dir: "w", d: 11)
})
