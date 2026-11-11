// 段 B（第 1 章 §1·5–§1·7）插图的共用小工具。坐标一律为原书页面像素（200 dpi，宽约 1000，y 向下）。
#import "/common/geo.typ": *

#let k = 0.0152cm

// 从点 v 沿数学角 ang（度，逆时针为正，页面上向右为 0°）走 len 像素得到的点
#let B-pt(v, ang, len) = (v.at(0) + len * calc.cos(ang * 1deg), v.at(1) - len * calc.sin(ang * 1deg))

// 文字（中心对齐）
#let B-t(p, pt, body) = lbl(p, pt, body, dir: "c", d: 0)

// 加粗线段（原图里角的边画得较粗）
#let B-seg(p, a, b) = {
  import cetz.draw: *
  line(p(..a), p(..b), stroke: 1.2pt)
}

// 射线：从 v 到 e；frac 为实线部分占的比例，其余画成虚线（表示射线继续延伸）；frac = 1 时全实线
#let B-ray(p, v, e, frac: 1) = {
  import cetz.draw: *
  if frac >= 1 {
    line(p(..v), p(..e), stroke: 1.2pt)
  } else {
    let m = (v.at(0) + (e.at(0) - v.at(0)) * frac, v.at(1) + (e.at(1) - v.at(1)) * frac)
    line(p(..v), p(..m), stroke: 1.2pt)
    line(p(..m), p(..e), stroke: (paint: black, thickness: 1.2pt, dash: "dashed"))
  }
}

// 圆弧：顶点 v，从数学角 a0 到 a1（度，逆时针），半径 r；可带箭头
#let B-arc(p, v, a0, a1, r, ..style) = {
  import cetz.draw: *
  arc(p(..v), start: a0 * 1deg, stop: a1 * 1deg, radius: r, anchor: "origin", stroke: lt, ..style)
}

// 阴影三角形（原图用密集斜线涂黑）：底边 (e, d) 在水平线上，顶点 f；斜线沿 ang（度）方向，间距 s
#let B-hatch(p, e, d, f, ang: 75, s: 8) = {
  import cetz.draw: *
  let y0 = e.at(1)
  let dx = calc.cos(ang * 1deg)
  let dy = -calc.sin(ang * 1deg)
  // 求射线 (x0, y0) + t (dx, dy) 与线段 a-b 的交点参数 t，没有交点返回 none
  let hit(x0, a, b) = {
    let ex = b.at(0) - a.at(0)
    let ey = b.at(1) - a.at(1)
    let den = dx * ey - dy * ex
    if calc.abs(den) < 1e-9 { return none }
    let wx = a.at(0) - x0
    let wy = a.at(1) - y0
    let t = (wx * ey - wy * ex) / den
    let u = (wx * dy - wy * dx) / den
    if t > 0 and u >= 0 and u <= 1 { t } else { none }
  }
  let x = e.at(0) + s
  while x < d.at(0) - 2 {
    let ts = (hit(x, e, f), hit(x, f, d)).filter(t => t != none)
    if ts.len() > 0 {
      let t = calc.min(..ts)
      line(p(x, y0), p(x + dx * t, y0 + dy * t), stroke: 0.7pt)
    }
    x += s
  }
}

// 量角器（图 1·37–1·39）：圆心 o，外半径 220 像素；半圆刻度 0°–180°，左端 0° 的一排在外，右端 0° 的一排在内。
#let B-protractor(p, o) = {
  import cetz.draw: *
  let (ox, oy) = o
  // 外沿半圆与底座
  arc(p(ox, oy - 2), start: 0deg, stop: 180deg, radius: 220, anchor: "origin", stroke: 1.5pt)
  line(p(ox - 220, oy - 2), p(ox - 220, oy + 20), p(ox + 220, oy + 20), p(ox + 220, oy - 2), stroke: 1.5pt)
  line(p(ox - 220, oy + 20), p(ox + 220, oy + 20), stroke: 2.4pt)
  // 内圈边（粗）
  arc(p(ox, oy - 2), start: 0deg, stop: 180deg, radius: 155, anchor: "origin", stroke: 2.4pt)
  line(p(ox - 155, oy - 2), p(ox + 155, oy - 2), stroke: 1.5pt)
  // 数字圈的粗弧（90° 处断开）
  arc(p(ox, oy - 2), start: 0deg, stop: 86deg, radius: 177, anchor: "origin", stroke: 2.2pt)
  arc(p(ox, oy - 2), start: 94deg, stop: 180deg, radius: 177, anchor: "origin", stroke: 2.2pt)
  // 每度一格的刻线
  for a in range(0, 181) {
    let l = if calc.rem(a, 10) == 0 { 18 } else if calc.rem(a, 5) == 0 { 12 } else { 8 }
    let c = calc.cos(a * 1deg)
    let s = calc.sin(a * 1deg)
    line(p(ox + c * 202, oy - 2 - s * 202), p(ox + c * (202 + l), oy - 2 - s * (202 + l)), stroke: 0.5pt)
  }
  // 放射线：每 10° 一条，自小半圆到内圈
  for a in range(10, 180, step: 10) {
    let c = calc.cos(a * 1deg)
    let s = calc.sin(a * 1deg)
    line(p(ox + c * 33, oy - 2 - s * 33), p(ox + c * 155, oy - 2 - s * 155), stroke: 0.8pt)
  }
  // 圆心处的小半圆
  arc(p(ox, oy - 2), start: 0deg, stop: 180deg, radius: 33, anchor: "origin", stroke: 2pt)
  circle(p(ox, oy + 3), radius: 4, fill: white, stroke: 0.9pt)
  // 两排度数：外排左端 0°、右端 180°；内排相反
  for n in range(0, 181, step: 10) {
    let phi = 180 - n
    let c = calc.cos(phi * 1deg)
    let s = calc.sin(phi * 1deg)
    let sz = if n == 90 { 14pt } else { 7.5pt }
    content(p(ox + c * 190, oy - 2 - s * 190), text(font: fonts.song, size: sz)[#n], angle: (phi - 90) * 1deg)
    if n != 90 {
      let phi2 = n
      let c2 = calc.cos(phi2 * 1deg)
      let s2 = calc.sin(phi2 * 1deg)
      content(p(ox + c2 * 166, oy - 2 - s2 * 166), text(font: fonts.song, size: 7.5pt)[#n],
        angle: (phi2 - 90) * 1deg)
    }
  }
}
