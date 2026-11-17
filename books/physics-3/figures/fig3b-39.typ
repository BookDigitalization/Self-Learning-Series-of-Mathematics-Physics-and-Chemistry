// 图 3·39 磁场对通电线圈的作用（二）（原书 p.199）
// CeTZ 重绘：自上向下看线圈 AB 边（线圈平面与磁力线夹角 θ），A 端 ⊗、B 端 ⊙，F 为 AC 边、BD 边所受磁场力。
// 坐标是原页 130 dpi 渲染图的像素坐标，画布原点 (280, 450)。
#import "fig3b-lib.typ": *

#let fig-3-39(width: 10.4cm) = px-canvas(580, 570, origin: (280, 450), width: width, (p, u) => {
  import cetz.draw: *
  // x0：磁力线左端；y0：第一条磁力线；a、b：线圈两端；fa、fb：两端受力箭头（起点、终点）；
  // fla、flb：F 字的位置；hp：H 字的位置；tag、tp：小图标号及位置
  let sub(x0, y0, a, b, fa, fb, fla, flb, hp, tag, tp, la, lb) = {
    for k in range(6) { ar(p, (x0, y0 + 33 * k), (x0 + 230, y0 + 33 * k), st: 0.8pt) }
    let dx = b.at(0) - a.at(0)
    let dy = b.at(1) - a.at(1)
    let len = calc.sqrt(dx * dx + dy * dy)
    let nx = -dy / len * 5
    let ny = dx / len * 5
    line(p(a.at(0) + nx, a.at(1) + ny), p(b.at(0) + nx, b.at(1) + ny), p(b.at(0) - nx, b.at(1) - ny), p(a.at(0) - nx, a.at(1) - ny), close: true, fill: white, stroke: 0.9pt)
    isym(p, a.at(0), a.at(1), "x", r: 6)
    isym(p, b.at(0), b.at(1), "out", r: 6)
    let c = ((a.at(0) + b.at(0)) / 2, (a.at(1) + b.at(1)) / 2)
    arc(p(..c), start: 40deg, stop: 330deg, radius: 12 * u, anchor: "origin", stroke: 0.8pt, mark: (end: "stealth", fill: black, scale: 0.4))
    ar(p, ..fa, scale: 0.45)
    ar(p, ..fb, scale: 0.45)
    lab(p, ..fla, $F$, size: 8.5pt)
    lab(p, ..flb, $F$, size: 8.5pt)
    lab(p, ..hp, $H$, size: 8.5pt)
    lab(p, ..tp, tag, size: 8.5pt)
    lab(p, ..la, $A$, size: 8.5pt)
    lab(p, ..lb, $B$, size: 8.5pt)
  }
  // (a)：线圈与磁力线平行
  sub(280, 482, (345, 563), (440, 563), ((345, 572), (345, 625)), ((443, 555), (443, 497)),
    (358, 628), (454, 503), (522, 563), $(a)$, (400, 683), (327, 563), (458, 563))
  // (b)：线圈与磁力线垂直
  sub(600, 487, (711, 612), (711, 513), ((711, 620), (711, 665)), ((711, 505), (711, 462)),
    (727, 667), (727, 463), (840, 565), $(b)$, (712, 705), (727, 628), (727, 513))
  line(p(711, 577), p(722, 577), p(722, 566), stroke: 0.7pt)
  // (c)、(d)：成 θ 角
  sub(280, 780, (350, 897), (437, 832), ((350, 905), (350, 950)), ((437, 825), (437, 780)),
    (352, 963), (438, 765), (520, 865), $(c)$, (395, 988), (333, 903), (453, 828))
  lab(p, 418, 866, $theta$, size: 8.5pt)
  sub(600, 780, (740, 905), (685, 817), ((742, 915), (742, 955)), ((688, 808), (688, 765)),
    (754, 958), (703, 770), (840, 862), $(d)$, (727, 995), (748, 925), (671, 811))
  lab(p, 760, 897, $theta$, size: 8.5pt)
})
