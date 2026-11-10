// 第 6 章（续）本章提要、复习题六（原书 p.221–225：本章提要从 p.221 中部起，p.221 上部是习题 6·4(2) 的尾部，不在本文件）
#import "/common/series.typ": *

// 局部：行列式（竖线括号）。mat 的行用分号分隔：dt(a, b; c, d)
#set math.mat(column-gap: 1.1em, row-gap: 0.6em)
#let dt(..rows) = math.mat(delim: "|", ..rows)
// 局部：分式放在行列式里时按 display 样式排（矩阵单元格默认缩小）
#let fr(a, b) = math.display(math.frac(a, b))
// 局部：含分式的方程组的大括号，每行按 display 样式排
#let cs(..rows) = math.cases(..rows.pos().map(math.display))
#set math.cases(gap: 0.9em)

// p.221
#summary[
*1. 二阶行列式与三阶行列式的展开法则*

$ dt(a_1, b_1; a_2, b_2) = a_1 b_2 - a_2 b_1 ju $

$ dt(a_1, b_1, c_1; a_2, b_2, c_2; a_3, b_3, c_3) = (a_1 b_2 c_3 + a_2 b_3 c_1 + a_3 b_1 c_2) - (a_3 b_2 c_1 + a_2 b_1 c_3 + a_1 b_3 c_2) ju $

*2. 行列式的性质*

(1) 把行列式的行与列对调后，不改变它的值。

(2) 把行列式的相邻两列（或两行）对调后，它的绝对值不变而符号相反。

(3) 如果行列式中有两列（或两行）的元素依次相同，那么这行列式的值等于零。

(4) 如果用数 $k$ 乘行列式的某一列（或某一行）中的所有元素，所得行列式的值即等于原行列式的值乘以 $k$。

(5) 含有两个成比例的列（或行）的行列式，其值等于零。

(6) 如果行列式的某一列（或某一行）可以表为两项的和的形式，那么这行列式可变形为两个行列式的和。

(7) 如果在行列式中把某一列（或行）的元素加上另一列（或行）的对应元素的 $k$ 倍，那么此行列式的值不改变。

(8) 行列式的值，等于它的任一列（或行）中所有的元素和它对应的代数余子式的乘积的和。

// p.222
(9) 行列式的某一列（或行）的各元素与另一列（或行）对应元素的代数余子式的积的和恒等于零。

*3. 一次方程组的解*

(1) 二元一次方程组

$ cs(a_1 x + b_1 y = c_1 dou, a_2 x + b_2 y = c_2 ju) $

设 #h(1em) $D = dt(a_1, b_1; a_2, b_2) dou quad D_x = dt(c_1, b_1; c_2, b_2) dou quad D_y = dt(a_1, c_1; a_2, c_2) ju$

1° 如果 $D != 0$，方程组有唯一组解：

$ x = D_x / D dou quad quad y = D_y / D ju $

2° 如果 $D = 0$，而未知数的系数不全为零，那么：

当 $D_x != 0$ $(D_y != 0)$ 时，方程组无解；

当 $D_x = D_y = 0$ 时，方程组有无穷多组解。

(2) 三元一次方程组

$ cs(a_1 x + b_1 y + c_1 z = k_1 dou, a_2 x + b_2 y + c_2 z = k_2 dou, a_3 x + b_3 y + c_3 z = k_3 ju) $

设

$ D = dt(a_1, b_1, c_1; a_2, b_2, c_2; a_3, b_3, c_3) dou quad quad D_x = dt(k_1, b_1, c_1; k_2, b_2, c_2; k_3, b_3, c_3) dou \
  D_y = dt(a_1, k_1, c_1; a_2, k_2, c_2; a_3, k_3, c_3) dou quad quad D_z = dt(a_1, b_1, k_1; a_2, b_2, k_2; a_3, b_3, k_3) ju $

1° 如果 $D != 0$，方程组有唯一组解：

$ x = D_x / D dou quad y = D_y / D dou quad z = D_z / D ju $

2° 如果 $D = 0$，而 $D_x, D_y, D_z$ 至少有一个不等于零，方程组无解。

3° 如果 $D = 0$，且 $D_x = D_y = D_z = 0$ 时，方程组有无穷多组解，或无解。

(3) 三元齐次线性方程组

// p.223
$ cs(a_1 x + b_1 y + c_1 z = 0 dou, a_2 x + b_2 y + c_2 z = 0 dou, a_3 x + b_3 y + c_3 z = 0 ju) $

设 #h(1em) $D = dt(a_1, b_1, c_1; a_2, b_2, c_2; a_3, b_3, c_3) ju$

1° 如果 $D != 0$，方程组有唯一组解：

#pad(left: 4em)[$x = 0, quad y = 0, quad z = 0$ #h(0.5em)（称为零解）。]

2° 如果 $D = 0$，方程组有无穷多组解：

$ cs(x = k A_i dou, y = k B_i dou, z = k C_i dou) $

这里 $k$ 为任意常数，$A_i, B_i, C_i$ 不全为零 $(i = 1, 2, 3)$。
]

#review(title: [复习题六])[
1. 解下列方程组：

#cols[(1) $cs(3x + 5y = 13 dou, 2x + 7y = 81 fen)$][(2) $cs(3x + 4y - 2 = 0 dou, 2x + 3y - 7 = 0 fen)$]
#cols[(3) $cs(x + 2y + 3z = 6 dou, 2x + 4y + z = 7 dou, 3x + 2y + 9z = 14 fen)$][(4) $cs(2x + z = 5 dou, x + 3y = 10 dou, 5y - z = 10 ju)$]

2. 不通过解方程组的方法，试确定下列方程组是无解还是有无穷多组解：

#cols[(1) $cs(3x + 5y = 4 dou, 6x + 10y = 2 fen)$][(2) $cs(3x - 5y = 4 dou, 9x - 15y = 12 fen)$]
#cols[(3) $cs(3x + 4y = 1 dou, 6x + 8y = 3 fen)$][(4) $cs(3x + 4y = 1 dou, 6x + 8y = 2 fen)$]
#cols[(5) $cs(2x - 3y + z = -2 dou, x - 2y + 3z = -1 dou, x - y - 2z = 3 fen)$][(6) $cs(2x + 4y - 2z = 8 dou, 3x - y + 2z = -1 dou, 11x + y + 4z = 0 fen)$]

// p.224
#cols[(7) $cs(x + 2y - z = -3 dou, 2x - y + 3z = 3 dou, 8x + y + 7z = 3 fen)$][(8) $cs(3x - 6y + 3z = fr(3, 2) dou, x - 2y + z = fr(1, 2) dou, -2x + 4y - 2z = -1 ju)$]

3. 计算下列行列式：

#cols[(1) $dt(2, 0, 1; 1, -4, -1; -1, 8, -3)$；][(2) $dt(4, -2, 4; 10, 2, 12; 1, 2, 2)$；]
#cols[(3) $dt(4, 2, 3; 3, 4, 2; 2, 3, 4)$；][(4) $dt(a, a, a; a, b, b; a, b, c)$；]
#cols[(5) $dt(1, a, b + c; 1, b, c + a; 1, c, a + b)$；][(6) $dt(1, 1, 1; a, b, c; a^2, b^2, c^2)$。]

4. 计算下列行列式：

#cols[(1) $dt(a + b, a, b; a, c + a, c; b, c, c + b)$；][(2) $dt(a + 2b, a + 4b, a + 6b; a + 3b, a + 5b, a + 7b; a + 4b, a + 6b, a + 8b)$；]

(3) $dt(b + c, a - c, a - b; b - c, c + a, b - a; c - b, c - a, a + b)$。

5. 证明下列各式：

(1) $dt(1, a, a^2 - b c; 1, b, b^2 - c a; 1, c, c^2 - a b) = 0$；

(2) $dt(b + c, c + a, a + b; b' + c', c' + a', a' + b'; b'' + c'', c'' + a'', a'' + b'') = 2 dt(a, b, c; a', b', c'; a'', b'', c'')$；

(3) $dt(a, a + b, a + b + c; 2a, 3a + 2b, 4a + 3b + 2c; 3a, 6a + 3b, 10a + 9b + 3c) = a^3 + 3a^2 b$；

// p.225
(4) $dt(1, 1, 1; a x, a y, a z; a^2 + x^2, a^2 + y^2, a^2 + z^2) = a (x - y)(y - z)(z - x)$。

6. 解下列方程中的 $x$：

#cols[(1) $dt(x^2 - 1, 2, 3; x, 3, 2; 1, 1, 1) = 0$；][(2) $dt(x, 2x, 9; 3, 5, 10; 1, 3, 8) = 0$；]

(3) $dt(15 - 2x, 11, 10; 11 - 3x, 17, 16; 7 - x, 14, 13) = 0$。

7. 解下列方程组：

#cols[(1) $cs(x - 3y + 4z = 0 dou, 2x - 5z = 0 dou, 3x - y + 7z = 0 fen)$][(2) $cs(10x + 8y + 2z = 0 dou, 15x + 3y + 12z = 0 dou, 21x + 4y + 17z = 0 fen)$]
#cols[(3) $cs(3x + 3y + 4z = 0 dou, 2x + 5y + 4z = 0 dou, 2x + 3y + 7z = 0 fen)$][(4) $cs(-fr(1, 2) x + fr(2, 3) y - z = 0 dou, fr(1, 4) x + fr(1, 2) y + z = 0 dou, fr(1, 5) y + 2z = 0 fen)$]

(5) $cs(x + a y + (b + c) z = 0 dou, x + b y + (c + a) z = 0 dou, x + c y + (a + b) z = 0) quad (a, b, c "为已知常数") fen$

(6) $cs(x + 2z = 0 dou, y + 2z = 0 dou, x - y = 0 ju)$

8. $k$ 为何值时，下列方程组有非零解：

$ cs(4x + 3y + z = k x dou, 3x - 4y + 7z = k y dou, x + 7y - 6z = k z ju) $
]
