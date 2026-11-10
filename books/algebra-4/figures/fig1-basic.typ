// 第 1 章的小图（原书 p.1–4、p.6，均无图号）：树形枚举、甲乙丙三地的路线图、两个位置方格。
// 树形图只是把原书的“根 + 分支 + 叶”排成文字示意，不按原图坐标描。
// 路线图原书 p.4（甲、乙、丙三个圆，A1 A2 两条弧，B1 B2 B3 三条线）；位置方格原书 p.6。
#import "/common/series.typ": *

// 树形枚举：root 在左，叶在右，分支用线连接。leaves 为叶内容的数组，tail-mid 放在中间一行右端（如“；”），
// tail 接在最后一片叶之后（如“。”）。
#let tree(root, leaves, tail: [], tail-mid: [], dy: 1.05, dx: 2.2) = {
  let n = leaves.len()
  box(baseline: 50%, cetz.canvas(length: 1em, {
    import cetz.draw: *
    content((0, 0), root, anchor: "east")
    for (i, l) in leaves.enumerate() {
      let y = ((n - 1) / 2 - i) * dy
      line((0.25, if n == 1 { 0 } else { 0 }), (dx - 0.1, y), stroke: 0.5pt)
      content((dx, y), if i == n - 1 { [#l#tail] } else { l }, anchor: "west")
    }
    if tail-mid != [] { content((dx + 0.9, 0), tail-mid, anchor: "west") }
  }))
}

// 图：甲乙丙三地的路线（p.4）
#let fig-roads(width: 8cm) = {
  set text(size: 8pt)
  cetz.canvas(length: width / 9, {
    import cetz.draw: *
    let lw = 0.6pt
    circle((0, 0), radius: 0.45, stroke: lw)
    circle((4, 0), radius: 0.45, stroke: lw)
    circle((8, 0), radius: 0.45, stroke: lw)
    content((0, 0), text(size: 7pt)[甲])
    content((4, 0), text(size: 7pt)[乙])
    content((8, 0), text(size: 7pt)[丙])
    bezier((0.35, 0.3), (3.65, 0.3), (1, 1.5), (3, 1.5), stroke: lw)
    bezier((0.35, -0.3), (3.65, -0.3), (1, -1.5), (3, -1.5), stroke: lw)
    bezier((4.35, 0.3), (7.65, 0.3), (5, 1.5), (7, 1.5), stroke: lw)
    bezier((4.35, -0.3), (7.65, -0.3), (5, -1.5), (7, -1.5), stroke: lw)
    line((4.45, 0), (7.55, 0), stroke: lw)
    content((2, 1.25), $A_1$)
    content((2, -1.25), $A_2$)
    content((6, 1.25), $B_1$)
    content((6, 0.25), $B_2$)
    content((6, -1.25), $B_3$)
  })
}

// 图：排好顺序的两个位置（p.6）
#let fig-slots(width: 2.6cm) = {
  set text(size: 8pt)
  cetz.canvas(length: width / 2, {
    import cetz.draw: *
    rect((0, 0), (2, 1.3), stroke: 0.6pt)
    line((1, 0), (1, 1.3), stroke: 0.6pt)
    content((0.5, 1.55), [1])
    content((1.5, 1.55), [2])
  })
}
