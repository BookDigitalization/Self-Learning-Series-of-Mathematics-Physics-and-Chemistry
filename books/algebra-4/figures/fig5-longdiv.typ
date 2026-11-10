// 第 5 章用的竖式辅助（不是插图，只是为本章的多项式除法竖式、综合除法表格提供组件）
// 长除法竖式（原书版式：被除式在左，竖线右侧上方是除式，除式下面一横，横下是商）。
//   longdiv(除式, 商, 被除式, ..各行)
//   被除式与各行：按幂次分列，列之间用 | 隔开（空项留空），每行行末可加 ;s（该行下面画一横）。
//   商、除式各是一个数学式字符串。
#let cellsof(s, n: none) = {
  let cs = s.split("|").map(c => {
    let c = c.trim()
    if c == "" { none } else { eval(c, mode: "math") }
  })
  if n != none { while cs.len() < n { cs.push(none) } }
  cs
}

#let longdiv(divisor, quo, dvd, ..rows) = {
  let dv = cellsof(dvd)
  let n = dv.len()
  let cell(c) = if c == none { [] } else { c }
  let items = ()
  for c in dv { items.push(cell(c)) }
  items.push(eval(divisor, mode: "math"))
  items.push(grid.hline(y: 1, start: n, end: n + 1))
  let specs = rows.pos()
  let r = 1
  for spec in specs {
    let parts = spec.split(";")
    let cs = cellsof(parts.at(0), n: n)
    assert(cs.len() == n, message: "竖式列数不符：" + spec)
    let rule = if parts.len() > 1 { parts.at(1).trim() } else { "" }
    for c in cs { items.push(cell(c)) }
    // 商放在第一行的右边一格，其余行右边留空
    if r == 1 { items.push(eval(quo, mode: "math")) } else { items.push([]) }
    let first = cs.position(c => c != none)
    if rule == "s" { items.push(grid.hline(y: r + 1, start: first, end: n)) }
    r += 1
  }
  items.push(grid.vline(x: n, start: 0, end: 2))
  block(breakable: false, align(center, grid(columns: (auto,) * (n + 1),
    align: (x, y) => if x == n { left + horizon } else { right + horizon },
    inset: (x: 0.35em, y: 0.3em), stroke: none, ..items)))
}

// 综合除法表格。
//   syn(列数, ..各行, vr: (起行, 止行), vl: (起行, 止行))
//   每行是一个字典 (c: "数|数|…", r: 右边标注, l: 左边标注, rule: "s")：
//   c 里按列分格（空格留空，格子里写 Typst 数学式），r、l 是数学式字符串，rule: "s" 表示该行下面画一横；
//   vr 在数据列右边画竖线，vl 在数据列左边画竖线（包含起止行，行号从 0 起）。
#let syn(n, ..rows, vr: none, vl: none) = {
  let cell(c) = if c == none { [] } else { c }
  let items = ()
  let specs = rows.pos()
  for (i, row) in specs.enumerate() {
    let cs = cellsof(row.c, n: n)
    assert(cs.len() == n, message: "综合除法表列数不符：" + row.c)
    items.push(if row.at("l", default: none) == none { [] } else { eval(row.l, mode: "math") })
    for c in cs { items.push(cell(c)) }
    items.push(if row.at("r", default: none) == none { [] } else { eval(row.r, mode: "math") })
    let rule = row.at("rule", default: none)
    if rule == "s" {
      items.push(grid.hline(y: i + 1, start: if row.at("l", default: none) == none { 1 } else { 0 }, end: n + 1))
    } else if type(rule) == array {
      items.push(grid.hline(y: i + 1, start: rule.at(0), end: rule.at(1)))
    }
  }
  if vr != none { items.push(grid.vline(x: n + 1, start: vr.at(0), end: vr.at(1) + 1)) }
  if vl != none { items.push(grid.vline(x: 1, start: vl.at(0), end: vl.at(1) + 1)) }
  block(breakable: false, align(center, grid(
    columns: (auto,) + (auto,) * n + (auto,),
    align: (x, y) => if x == 0 { right + horizon } else if x == n + 1 { left + horizon } else { center + horizon },
    inset: (x: 0.6em, y: 0.3em), stroke: none, ..items)))
}
