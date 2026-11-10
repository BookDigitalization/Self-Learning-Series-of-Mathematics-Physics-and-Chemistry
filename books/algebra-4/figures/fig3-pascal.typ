// §3·1 杨辉三角形的小表（原书 p.60）：(a+b)^1 … (a+b)^6 各项系数，行间用 ∨ 表示“肩上两数之和”。
// 数字用 Typst 排版（不是位图）。
#import "/common/series.typ": *

#let pascal-rows = (
  (1, 1),
  (1, 2, 1),
  (1, 3, 3, 1),
  (1, 4, 6, 4, 1),
  (1, 5, 10, 10, 5, 1),
  (1, 6, 15, 20, 15, 6, 1),
)

#let pascal-small() = {
  let w = 1.7em
  let cells = ()
  for (i, row) in pascal-rows.enumerate() {
    let n = i + 1
    // 数字行：标签 + 13 列，第 j 个数在第 (6 - n) + 2j 列
    cells.push(align(left, $(a + b)^#n$))
    for c in range(13) {
      let j = c - (6 - n)
      if j >= 0 and calc.rem(j, 2) == 0 and calc.quo(j, 2) <= n {
        cells.push(align(center, str(row.at(calc.quo(j, 2)))))
      } else { cells.push([]) }
    }
    // ∨ 行
    if n < 6 {
      cells.push([])
      for c in range(13) {
        let j = c - (6 - n) - 1
        if j >= 0 and calc.rem(j, 2) == 0 and calc.quo(j, 2) < n {
          cells.push(align(center, text(size: 0.8em)[∨]))
        } else { cells.push([]) }
      }
    }
  }
  block(breakable: false, above: 1em, below: 1em, grid(
    columns: (4.5em,) + (w,) * 13,
    row-gutter: 0.35em,
    align: center + horizon,
    ..cells,
  ))
}
