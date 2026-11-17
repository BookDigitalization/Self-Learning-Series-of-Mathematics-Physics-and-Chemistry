// 图 4·12（原书 p.149）活塞式压气机工作示意图：（a）活塞向上运动，（b）活塞向下运动。
// 示意图，按原图简化重绘（曲柄连杆、两个阀、进排气管）。坐标取 200 dpi 页面像素。
#import "/common/series.typ": *

#let fig-4-12(width: 7.6cm) = px-canvas(350, 410, origin: (590, 905), width: width, (p, u) => {
  import cetz.draw: *
  let it = s => text(size: 9pt, style: "italic", s)
  let hatch = tiling(size: (2.4pt, 2.4pt))[#place(std.line(start: (0%, 100%), end: (100%, 0%), stroke: 0.45pt))]
  // 气缸：黑色壁
  let cyl(x0, x1, ytop, ybot) = {
    let t = 4
    rect(p(x0, ytop), p(x0 + t, ybot), fill: black, stroke: none)
    rect(p(x1 - t, ytop), p(x1, ybot), fill: black, stroke: none)
    rect(p(x0, ybot - t), p(x1, ybot), fill: black, stroke: none)
    rect(p(x0, ytop), p(x1, ytop + t), fill: black, stroke: none)
  }
  let piston(x0, x1, y0, y1, pin) = {
    rect(p(x0, y0), p(x1, y1), stroke: 0.9pt, fill: hatch)
    circle(p(..pin), radius: 4, fill: white, stroke: 0.8pt)
  }
  // 阀：气缸顶上的小阀体
  let valve(x, y) = {
    rect(p(x - 5, y), p(x + 5, y + 13), stroke: 0.8pt, fill: white)
    line(p(x - 8, y + 4), p(x + 8, y + 4), stroke: 0.8pt)
  }
  // 连杆（窄长带）：从 a 到 b，宽 w（取像素）
  let rod(a, b, w) = {
    let dx = b.at(0) - a.at(0)
    let dy = b.at(1) - a.at(1)
    let l = calc.sqrt(dx * dx + dy * dy)
    let nx = -dy / l * w / 2
    let ny = dx / l * w / 2
    line(p(a.at(0) + nx, a.at(1) + ny), p(b.at(0) + nx, b.at(1) + ny), p(b.at(0) - nx, b.at(1) - ny), p(a.at(0) - nx, a.at(1) - ny), close: true, stroke: 0.9pt, fill: white)
  }
  // 曲柄（长圆形）：圆心 a、b
  let crank(a, b) = {
    let dx = b.at(0) - a.at(0)
    let dy = b.at(1) - a.at(1)
    let l = calc.sqrt(dx * dx + dy * dy)
    let nx = -dy / l * 13
    let ny = dx / l * 13
    line(p(a.at(0) + nx, a.at(1) + ny), p(b.at(0) + nx, b.at(1) + ny), stroke: 0.9pt)
    line(p(a.at(0) - nx, a.at(1) - ny), p(b.at(0) - nx, b.at(1) - ny), stroke: 0.9pt)
    circle(p(..a), radius: 13, fill: white, stroke: 0.9pt)
    circle(p(..b), radius: 13, fill: white, stroke: 0.9pt)
    // 补白，盖住两圆之间的内侧线
    line(p(a.at(0) + nx * 0.8, a.at(1) + ny * 0.8), p(b.at(0) + nx * 0.8, b.at(1) + ny * 0.8), p(b.at(0) - nx * 0.8, b.at(1) - ny * 0.8), p(a.at(0) - nx * 0.8, a.at(1) - ny * 0.8), close: true, fill: white, stroke: none)
    circle(p(..a), radius: 3.5, fill: white, stroke: 0.8pt)
    circle(p(..b), radius: 3.5, fill: white, stroke: 0.8pt)
  }
  // 进排气管：垂直段 + 弯 + 水平段 + 法兰
  let pipe(x, ytop, xend, arrow) = {
    let sgn = if xend > x { 1 } else { -1 }
    line(p(x - 4, ytop), p(x - 4, 924), p(x - 4 + sgn * 12, 916), p(xend, 916), stroke: 0.9pt)
    line(p(x + 4, ytop), p(x + 4, 928), p(x + 4 + sgn * 6, 924), p(xend, 924), stroke: 0.9pt)
    line(p(xend, 910), p(xend, 930), stroke: 1.2pt)
    if arrow != none {
      line(..arrow, stroke: 0.8pt, mark: (end: "stealth", fill: black, scale: 0.4))
    }
  }

  // (a)
  cyl(620, 706, 946, 1102)
  piston(628, 698, 960, 994, (662, 980))
  valve(640, 932)
  valve(680, 932)
  pipe(640, 945, 597, (p(618, 922), p(598, 922)))
  pipe(680, 945, 728, none)
  rod((662, 994), (662, 1166), 18)
  circle(p(664, 1212), radius: 60, stroke: (thickness: 0.8pt, dash: "dashed"))
  crank((662, 1166), (664, 1212))
  // 转向箭头（沿圆弧，自下而上）
  arc(p(664, 1212), start: 200deg, stop: 150deg, radius: 66 * u, stroke: 0.8pt, mark: (end: "stealth", fill: black, scale: 0.4))
  content(p(662, 1292), it[(a)])

  // (b)
  cyl(804, 888, 946, 1098)
  piston(812, 880, 1040, 1090, (846, 1070))
  valve(822, 932)
  valve(862, 932)
  pipe(822, 945, 780, none)
  pipe(862, 945, 934, (p(930, 920), p(904, 920)))
  rod((846, 1070), (878, 1246), 16)
  circle(p(846, 1212), radius: 60, stroke: (thickness: 0.8pt, dash: "dashed"))
  crank((846, 1212), (878, 1246))
  arc(p(846, 1212), start: -35deg, stop: -80deg, radius: 66 * u, stroke: 0.8pt, mark: (end: "stealth", fill: black, scale: 0.4))
  content(p(846, 1288), it[(b)])
})
