// 数理化自学丛书 · 全丛书共用样式与组件
//
// 各分册只 `#import "/common/series.typ": *`，不得直接引用图书模板。
// 模板（bookly）、字体、编号格式、组件样式都集中在这里，换模板只改本文件。
//
// 分册 main.typ 的基本结构：
//   #show: series-book.with(title: "物理", volume: "第一册")
//   #show: front-matter        // 目录等，页码 i, ii, …
//   #tableofcontents
//   #show: main-matter         // 正文，章 = 1，节 = §1·1，图 = 图 1·1
//   #include "chapters/ch01.typ"
//   #show: back-matter         // 总复习题、习题答案、附录（不编号）

#import "@preview/bookly:3.1.0" as bookly
#import "@preview/marginalia:0.3.1" as marginalia
#import "@preview/cetz:0.5.3"

// ───────────────────────── 字体 ─────────────────────────
// 只用开源字体（见 README）。西文与数字统一用 New Computer Modern，
// covers: "latin-in-cjk" 让中文标点仍由中文字体负责。
// 黑体里西文仍用 Noto Sans SC（无衬线更协调），只有中间点和 § 交给西文字体，
// 否则 Noto 会把 · 排成全角，"§1·1" 变成 "§1 · 1"。
#let latin = (name: "New Computer Modern", covers: "latin-in-cjk")
#let latin-dot = (name: "New Computer Modern", covers: regex("[·§]"))
#let fonts = (
  song: (latin, "Noto Serif SC"),          // 正文
  hei: (latin-dot, "Noto Sans SC"),        // 标题、粗体关键词
  kai: (latin, "霞鶩文楷"),                 // 边注、图题
  math: ("New Computer Modern Math", "Noto Serif SC"),
  raw: ("DejaVu Sans Mono",),
)

#let colors = (
  primary: rgb("#1f4e79"),    // 标题、编号等强调色
  rule: rgb("#1f4e79"),
  note-bg: rgb("#f3f6fa"),
)

// ───────────────────────── 编号 ─────────────────────────
// 原书编号用中间点：章 1，节 §1·1，图 1·1，习题 1·1。小标题（三级）不编号。
#let heading-numbering = (..n) => {
  let n = n.pos()
  if n.len() == 1 { str(n.first()) }
  else if n.len() == 2 { "§" + n.map(str).join("·") }
  else { none }
}
#let dot-numbering = (..n) => n.pos().map(str).join("·")

// ───────────────────────── 整书设置 ─────────────────────────
#let title-page(title, volume) = {
  set page(header: none, footer: none, numbering: none)
  marginalia.wideblock(side: "both", align(center)[
    #v(18%)
    #text(font: fonts.kai, size: 20pt, tracking: 0.3em)[数理化自学丛书]
    #v(3em)
    #text(font: fonts.hei, size: 40pt, weight: "bold", fill: colors.primary, tracking: 0.2em)[#title]
    #v(1em)
    #text(font: fonts.hei, size: 22pt, tracking: 0.2em)[#volume]
    #v(1fr)
    #text(font: fonts.kai, size: 12pt, fill: luma(70))[数字重排改订版（非官方）]
    #v(8%)
  ])
  pagebreak()
}

#let series-book(
  title: "物理",
  volume: "第一册",
  author: "数理化自学丛书编委会",
  body,
) = {
  show: bookly.bookly.with(
    title: "数理化自学丛书 " + title + " " + volume,
    author: author,
    theme: bookly.modern,
    lang: "zh",
    tufte: false,                      // 不用 bookly 的 tufte 开关，页边由下面的 marginalia.setup 自己管
    fonts: (body: fonts.song, math: fonts.math, raw: fonts.raw),
    colors: (primary: colors.primary, header: luma(80)),
    title-page: title-page(title, volume),
    config-options: (open-right: false, alt-margins: false),
  )

  // 页边：右侧留宽边放原书边注（数值同 bookly tufte 的默认，现在可在此自行调整）
  show: marginalia.setup.with(
    inner: (far: 1.25cm, width: 0cm, sep: 0cm),
    outer: (far: 1.25cm, width: 3.6cm, sep: 0.4cm),
    book: false,
  )

  // 中文正文
  set text(lang: "zh", region: "cn", size: 10.5pt)
  set par(
    justify: true,
    leading: 0.9em,
    spacing: 0.9em,
    first-line-indent: (amount: 2em, all: true),
  )
  show strong: set text(font: fonts.hei, weight: "bold")
  show emph: set text(font: fonts.kai, style: "normal")

  // 公式默认不编号（原书公式大多无编号）
  set math.equation(numbering: none)

  // 列表（习题、答案）
  set enum(numbering: "1.", indent: 0em, body-indent: 0.5em, spacing: 0.8em)
  set list(indent: 1em)

  // ── 标题 ──
  set heading(numbering: heading-numbering)
  show heading.where(level: 3): set heading(outlined: false)

  // 章：大号章号 + 章名，居中
  show heading.where(level: 1): it => {
    pagebreak(weak: true)
    bookly.reset-counters
    set align(center)
    set par(first-line-indent: 0em)
    marginalia.wideblock(side: "both", block(width: 100%, above: 0em, below: 3em, {
      v(3em)
      if it.numbering != none {
        text(font: fonts.hei, size: 44pt, fill: colors.primary,
          counter(heading).display(it.numbering))
        v(0.6em)
      }
      text(font: fonts.hei, size: 22pt, weight: "medium", tracking: 0.1em, it.body)
    }))
    v(2.5em)
  }

  // 节：§1·1 长度的量度，居中
  show heading.where(level: 2): it => {
    set align(center)
    set par(first-line-indent: 0em)
    block(above: 2.2em, below: 1.4em, sticky: true, text(font: fonts.hei, size: 14pt, weight: "medium", {
      if it.numbering != none {
        // 节号用衬线数字（同原书），也避免黑体数字与中间点混排时出现空隙
        text(font: fonts.song, fill: colors.primary, counter(heading).display(it.numbering))
        h(1em)
      }
      it.body
    }))
  }

  // 小标题：粗体无编号，左对齐
  show heading.where(level: 3): it => {
    set par(first-line-indent: 0em)
    block(above: 1.4em, below: 0.9em, sticky: true,
      text(font: fonts.hei, size: 10.5pt, weight: "bold", it.body))
  }

  // ── 目录（两级） ──
  set outline(depth: 2, indent: auto)
  show outline.entry.where(level: 1): set block(above: 1.0em)
  show outline.entry.where(level: 2): set block(above: 0.5em)
  show outline.entry.where(level: 1): set text(font: fonts.hei, weight: "bold")

  // ── 插图 ──
  show figure.where(kind: image): set figure(supplement: [图])
  set figure.caption(position: bottom)
  show figure: set figure.caption(separator: h(1em))   // 覆盖 bookly 的 " -- "
  show figure.caption: it => {
    set text(font: fonts.kai, size: 9.5pt)
    set par(first-line-indent: 0em)
    if it.numbering != none {
      text(font: fonts.hei, weight: "bold")[#it.supplement~#context it.counter.display(it.numbering)]
      if it.body != [] { it.separator }   // 原书有的图只有图号，没有图题
    }
    it.body
  }

  // ── 表格 ──
  set table(stroke: 0.5pt + luma(60), inset: (x: 0.6em, y: 0.45em))
  show table.cell.where(y: 0): set text(weight: "regular")

  body
}

// ───────────────────────── 分区 ─────────────────────────
#let tableofcontents = bookly.tableofcontents

#let front-matter(body) = {
  show: bookly.front-matter
  body
}

#let main-matter(body) = {
  show: bookly.main-matter
  set heading(numbering: heading-numbering)
  bookly.states.num-pattern.update("1·1")
  bookly.states.num-pattern-fig.update("1·1")
  bookly.states.num-pattern-subfig.update("1·1a")
  bookly.states.num-pattern-eq.update("(1·1)")
  body
}

// 总复习题、习题答案、附录：一级标题不编号，照原书标题原文写（如"附录一 本书主要物理量和单位"）
#let back-matter(body) = {
  set heading(numbering: none)
  body
}

// ───────────────────────── 组件 ─────────────────────────

// 边注：原书正文旁的要点提示框，放在右侧页边。
//   #sidenote[量度就是将待测量与标准量进行比较]
#let sidenote(body) = marginalia.note(
  counter: none,
  numbering: none,
  shift: "avoid",
  keep-order: true,
  text-style: (size: 9.5pt),
  block-style: (
    width: 100%,
    inset: (x: 0.6em, y: 0.5em),
    stroke: (left: 1.5pt + colors.rule),
    fill: colors.note-bg,
  ),
  text(font: fonts.kai, par(first-line-indent: 0em, leading: 0.7em, body)),
)

// 插图：number 为原书图号（如 "1·1"），与自动编号核对，不一致时编译报错，防止漏图、错号。
//   #fig("1·1", image("figures/1-1.png", width: 40%))[国际米原器]
//   #fig("1·2", image(...))[]          原书只有图号、没有图题时，图题留空
#let fig(number, body, caption, label: none) = {
  [#figure(body, kind: image, caption: caption) #if label != none { label }]
  context {
    let ch = counter(heading).get().first()
    let n = counter(figure.where(kind: image)).get().first()
    let got = dot-numbering(ch, n)
    assert(got == number, message: "图号不符：源码写 图 " + number + "，自动编号为 图 " + got)
  }
}

// CeTZ 重绘插图的画布：坐标直接用原扫描页上量出的像素坐标（原点在左上，y 向下），
// 这样描图时不用换算。`draw` 是 (p, u) => { import cetz.draw: *; … }：
//   p(x, y)  把像素坐标换成 CeTZ 坐标     u  一个像素对应的排版长度（给 image 定宽用：width: 80 * u）
// w、h：画布的像素宽高；origin：画布左上角在页面像素坐标里的位置；width：图在页面上的实际宽度。
//   #px-canvas(1180, 555, origin: (320, 495), width: 12cm, (p, u) => { import cetz.draw: *; line(p(0, 0), p(50, 80)) })
#let px-canvas(w, h, width: 10cm, origin: (0, 0), draw) = {
  let u = width / w
  let p = (x, y) => (x - origin.at(0), h - (y - origin.at(1)))
  set par(first-line-indent: 0em, justify: false, leading: 0.4em)
  cetz.canvas(length: u, draw(p, u))
}

// 不编号的小图（如习题插图"（第 4 题）"），可多幅并排：
//   #plainfig((image(...), [（第 4 题）]), (image(...), [（第 5 题）]))
// 也用于编号插图内部的分图小标题（如图 1·6 的"眼睛的位置放得正确"）。
#let plainfig(..items) = {
  let items = items.pos()
  block(width: 100%, breakable: false, above: 1em, below: 1em, grid(
    columns: items.len(),
    column-gutter: 1.5em,
    align: center + bottom,
    ..items.map(((img, cap)) => stack(spacing: 0.6em, img,
      text(font: fonts.kai, size: 9.5pt, cap))),
  ))
}

// 习题：每节后的"习题 x·y"，题目用 + 编号列表。
// 自动加标签 <ex-1·1>，供习题答案交叉引用核对。
//   #exercise("1·1")[
//     + 第一题 …
//     + 第二题 …
//   ]
#let exercise-label(number) = label("ex-" + number)
#let exercise(number, body) = {
  set par(first-line-indent: 0em)
  block(above: 1.6em, below: 0.8em, sticky: true, box(
    stroke: (top: 1.2pt + colors.rule, bottom: 1.2pt + colors.rule),
    inset: (x: 0.4em, y: 0.35em),
    text(font: fonts.hei, weight: "bold", fill: colors.primary)[习题 #number],
  ))
  [#metadata(number) #exercise-label(number)]
  block(above: 0em, body)
}

// 复习题：每章末。
#let review(body) = {
  set par(first-line-indent: 0em)
  block(above: 2em, below: 1em, sticky: true, width: 100%, {
    text(font: fonts.hei, size: 12pt, weight: "bold", fill: colors.primary)[复习题]
    v(-0.6em)
    line(length: 100%, stroke: 0.8pt + colors.rule)
  })
  body
}

// 章末"单元检查题（第 x～y 章）"：原书印在若干章之后，样式同"复习题"，标题照原书逐次传入。
#let unit-check(title, body) = {
  set par(first-line-indent: 0em)
  block(above: 2em, below: 1em, sticky: true, width: 100%, {
    text(font: fonts.hei, size: 12pt, weight: "bold", fill: colors.primary)[#title]
    v(-0.6em)
    line(length: 100%, stroke: 0.8pt + colors.rule)
  })
  body
}

// 章末"本章提要"：与复习题同样的小标题样式。
#let summary(body) = {
  set par(first-line-indent: 0em)
  block(above: 2em, below: 1em, sticky: true, width: 100%, {
    text(font: fonts.hei, size: 12pt, weight: "bold", fill: colors.primary)[本章提要]
    v(-0.6em)
    line(length: 100%, stroke: 0.8pt + colors.rule)
  })
  body
}

// 带公式号的独立公式：公式居中，右侧写原书公式号，如 #eqn("4·1", $ v = s / t $) → （4·1）。
#let eqn(n, body) = block(width: 100%, above: 1em, below: 1em, {
  set par(first-line-indent: 0em)
  grid(
    columns: (1fr, auto, 1fr),
    align: (left, center + horizon, right + horizon),
    [], math.equation(block: true, numbering: none, body), [（#n）],
  )
})

// 表格：表号写在第一个参数，表题在表上方居中。`body` 是 table(...)。
#let tab(number, caption, body) = block(width: 100%, breakable: false, above: 1em, below: 1em, {
  set par(first-line-indent: 0em)
  align(center, text(font: fonts.kai, size: 9.5pt)[
    #text(font: fonts.hei, weight: "bold")[表 #number]#h(1em)#caption])
  v(0.4em)
  align(center, body)
})

// 例题与解：`#example("例 1")[题目]`、`#solution[解答]`。
#let example(label, body) = block(above: 1.2em, below: 0.5em, width: 100%, {
  set par(first-line-indent: 0em)
  text(font: fonts.hei, weight: "bold")[#label]
  h(0.8em)
  body
})
// 默认“［解］”（物理册）；数学册原书印“【解】”，用 brackets: "【】"，多种解法写 label: [解 1]。
#let solution(body, label: [解], brackets: "［］") = block(above: 0.5em, below: 0.5em, width: 100%, {
  text(font: fonts.hei, weight: "bold")[#brackets.first()#label#brackets.last()]
  h(0.5em)
  body
})

// ───────── 数学册组件 ─────────
// 数学册的“【解】”：#sol[…]、#sol(label: [解 1])[…]
#let sol = solution.with(brackets: "【】")

// 小块说明：原书的“分析”“注”“注意”，字号略小，标题黑体。
//   #remark[分析][这里只有第一级运算……]
#let remark(title, body) = block(above: 0.7em, below: 0.7em, width: 100%, {
  set par(first-line-indent: 0em)
  set text(size: 9.8pt)
  text(font: fonts.hei, weight: "bold")[#title]
  h(0.8em)
  body
})
#let analysis(body) = remark([分析], body)
#let note-small(body) = remark([注], body)
#let attention(body) = remark([注意], body)

// 着重点（字下加点）：原书用来标出定义、法则里的关键字。
//   #edot[绝对值]
#let edot(body) = underline(
  stroke: (thickness: 1.1pt, cap: "round", dash: (array: (0pt, 1em), phase: 0.5em)),
  offset: 3pt, evade: false, body)
// 带分数：整数部分 + 分数，如 $mx(3, 1, 2)$ 排成 3½（整数与分数并排，不是乘法）。
#let mx(whole, num, den) = $#whole #h(0.05em) frac(#num, #den)$
// 习题答案中的一组："习题 1·1"，编号必须对应正文中已有的习题。
#let answers(number, body) = {
  set par(first-line-indent: 0em)
  context {
    let found = query(exercise-label(number))
    assert(found.len() == 1, message: "习题答案引用了不存在的习题 " + number)
  }
  block(above: 1.2em, below: 0.6em, sticky: true,
    link(exercise-label(number), text(font: fonts.hei, weight: "bold")[习题 #number]))
  body
}

// 识别不清的字：#unclear[猜测]。正式版前应全部消除。
#let unclear(body) = highlight(fill: rgb("#ffe58f"), body)

// 数字版注（脚注，与原文区分）
#let dnote(body) = footnote[数字版注：#body]
