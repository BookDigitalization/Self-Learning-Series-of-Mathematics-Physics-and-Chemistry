// 附英语字母表及常用希腊字母表（原书 p.303–304）
#import "/common/series.typ": *

// 表内斜体
#let it(x) = text(style: "italic", x)
// 希腊字母读音的数字版注（体例同物理第一册脚注）
#let gnote(ipa) = footnote[数字版注：该字母英式音标 /#ipa/。]

// p.303
= 附英语字母表及常用希腊字母表

#set par(first-line-indent: 0em)

#align(center)[#text(font: fonts.hei, size: 12pt)[英语字母表]]

#let en(up, ipa) = (
  [#up], [#lower(up)], [#it(up)], [#it(lower(up))], [\[#ipa\]],
)

#align(center)[
  #table(
    columns: (3.2cm, 3.2cm, 3.2cm, 3.2cm, 4cm),
    align: center + horizon,
    stroke: none,
    table.hline(stroke: 1pt),
    table.header(
      table.cell(colspan: 2)[正体], table.cell(colspan: 2)[斜体], table.cell(rowspan: 2)[国际音标注音],
      [大写], [小写], [大写], [小写],
      table.hline(stroke: 0.5pt),
    ),
    ..en("A", "ei"),
    ..en("B", "biː"),
    ..en("C", "siː"),
    ..en("D", "diː"),
    ..en("E", "iː"),
    ..en("F", "ef"),
    ..en("G", "dʒiː"),
    ..en("H", "eitʃ"),
    ..en("I", "ai"),
    ..en("J", "dʒei"),
    ..en("K", "kei"),
    ..en("L", "el"),
    ..en("M", "em"),
    ..en("N", "en"),
    ..en("O", "ou"),
    ..en("P", "piː"),
    ..en("Q", "kjuː"),
    ..en("R", "ɑː"),
    ..en("S", "es"),
    ..en("T", "tiː"),
    ..en("U", "juː"),
    ..en("V", "viː"),
    ..en("W", "ˈdʌbljuː"),
    ..en("X", "eks"),
    ..en("Y", "wai"),
    ..en("Z", "zed"),
    table.hline(stroke: 1pt),
  )
]

#pagebreak()
// p.304
#align(center)[#text(font: fonts.hei, size: 12pt)[常用希腊字母表]]

#let gr(up, lo, iup, ilo, reading, name, ipa) = (
  [#up], [#lo], [#it(iup)], [#it(ilo)],
  align(left)[#reading #name#gnote(ipa)],
)

#align(center)[
  #table(
    columns: (3cm, 3cm, 3cm, 3cm, 4.6cm),
    align: center + horizon,
    stroke: none,
    table.hline(stroke: 1pt),
    table.header(
      table.cell(colspan: 2)[正体], table.cell(colspan: 2)[斜体], table.cell(rowspan: 2)[读音拼音],
      [大写], [小写], [大写], [小写],
      table.hline(stroke: 0.5pt),
    ),
    ..gr("Α", "α", "Α", "α", "阿尔发", "alpha", "ˈælfə"),
    ..gr("Β", "β", "Β", "β", "培他", "beta", "ˈbiːtə"),
    ..gr("Γ", "γ", "Γ", "γ", "伽玛", "gamma", "ˈɡæmə"),
    ..gr("Δ", "δ", "Δ", "δ", "台尔他", "delta", "ˈdeltə"),
    ..gr("Ε", "ε", "Ε", "ε", "依浦西隆", "epsilon", "ˈepsɪlɒn"),
    ..gr("Θ", "ϑ", "Θ", "ϑ", "西塔", "theta", "ˈθiːtə"),
    ..gr("Λ", "λ", "Λ", "λ", "来姆达", "lambda", "ˈlæmdə"),
    ..gr("Μ", "μ", "Μ", "μ", "弥优", "mu", "mjuː"),
    ..gr("Ν", "ν", "Ν", "ν", "纽", "nu", "njuː"),
    ..gr("Π", "π", "Π", "π", "派爱", "pi", "paɪ"),
    ..gr("Ρ", "ϱ", "Ρ", "ρ", "罗", "rho", "rəʊ"),
    ..gr("Σ", "σ, ς", "Σ", "σ", "西格玛", "sigma", "ˈsɪɡmə"),
    ..gr("Φ", "φ, ϕ", "Φ", "φ, ϕ", "非", "phi", "faɪ"),
    ..gr("Ω", "ω", "Ω", "ω", "噢米茄", "omega", "ˈəʊmɪɡə"),
    table.hline(stroke: 1pt),
  )
]
