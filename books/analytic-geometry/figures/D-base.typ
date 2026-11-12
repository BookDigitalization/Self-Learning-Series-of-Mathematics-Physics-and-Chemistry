// 段 D（原书 p.46–71）插图公用定义。页面渲染 200 dpi（页宽 1024 像素），
// 换算 k = 0.0152 cm/像素（图约为原图 1.1 倍，正文宽约 15 cm）。
#import "/common/geo.typ": *
#let k = 0.0152cm

// 坐标轴：x 轴从 (xa, oy) 到 (xb, oy)（右端带箭头），y 轴从 (ox, yb)（下端）到 (ox, yt)（上端箭头）；
// 页面坐标 y 向下，yt < yb。并写 x、y 轴名。
#let D-axes(p, ox, oy, xa, xb, yt, yb, xl: (6, -2), yl: (-1, -10)) = {
  import cetz.draw: *
  seg(p, (xa, oy), (xb, oy), mark: arw)
  seg(p, (ox, yb), (ox, yt), mark: arw)
  lbl(p, (xb + xl.at(0), oy + xl.at(1)), $x$, dir: "e", d: 4)
  lbl(p, (ox + yl.at(0), yt + yl.at(1)), $y$, dir: "c", d: 0)
}

// 坐标轴上的一点到另一轴的垂线（虚线）
#let D-dash(p, a, b) = dseg(p, a, b)

// 列表用的交叉箭头表：rows 是若干 (左项, 右项)，左项右端对齐 x=0，右项左端对齐 x=wd，
// 相邻两行之间画交叉的两支箭头；lead: true 时在上方加原书“+ / −”的引导箭头（p.63）。
#let D-arrtab(rows, wd: 44, dy: 46, wl: 60, wr: 80, lead: false) = {
  let n = rows.len()
  let top = if lead { 100 } else { 14 }
  let ht = top + (n - 1) * dy + 16
  px-canvas(wl + wd + wr, ht, origin: (-wl, -top), width: (wl + wd + wr) * k, (p, u) => {
    import cetz.draw: *
    for (i, r) in rows.enumerate() {
      let y = i * dy
      content(p(-2, y), anchor: "east", text(size: 10pt, r.at(0)))
      content(p(wd + 2, y), anchor: "west", text(size: 10pt, r.at(1)))
      if i < n - 1 {
        seg(p, (3, y + 4), (wd - 3, y + dy - 12), mark: arw)
        seg(p, (wd - 3, y + 4), (3, y + dy - 12), mark: arw)
      }
    }
    if lead {
      seg(p, (0, -93), (wd - 2, -53), mark: arw)
      content(p(wd + 14, -58), text(size: 10pt, $+$))
      content(p(wd + 14, -37), text(size: 10pt, $-$))
      seg(p, (wd - 2, -46), (3, -10), mark: arw)
    }
  })
}
