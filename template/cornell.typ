#import "../lib/lib.typ": *

#show: cornell-note.with(
  title: "化工热力学笔记",
  author: "aFei@CUAS",
  abstract: "线索 + 推导过程 + 思想",
  createtime: "2025-01-09",
  lang: "zh",
  bibliography-style: "ieee",
  preface: [
    这是一本具有个人风格的化工热力学复习笔记。主要包括基本公式怎么来的（如果有推导过程的话），同时也包含公式怎么用的（限于那些统计出来的方程，只考虑怎么用的，后续如果深入学习，可能会接触到统计物理的推导过程）。这里涵盖了大量的推导，有志向做理论研究的同学或道友，应花费大量的时间抓住关键思想，琢磨公式的来龙去脉，为后续学业生涯钻研理论方面打好基础。

  ], 
  // bibliography-file: bibliography("refs.bib"), 
)

= 绪论

#le[
  // 这是第一个侧边笔记。@aFeiNote

  这是第一个侧边笔记。
  
  侧边笔记的主要作用是提醒读者这一小节内容的线索是什么，帮助读者更好地理解笔记结构。

  第三段的测试文字。我看它有没有缩进。
]

本章是化工热力学的绪论。对这门课程应该进行简单的描述。优先需要介绍本门课程的核心思想、核心逻辑脉络。强调熟悉该课程的关键术语、关键语言。掌握本学科的关键技能。了解解决本学科的关键工具。

除上述基本对学科的描述外，同学们需要了解教授的教学风格。课程的考核方式。今后本学科（热力学，特别是化工热力学）的延申发展方向。

另外，针对本模板。同学们需要知道以下内容：

1. 侧边笔记/左侧文字描述主要概括该章节的主要内容、起到线索作用。
2. 底部笔记/总结文字主要概况该章节的核心思想。 
  
希望同学们喜欢这样的笔记结构。

最后，预祝同学们学业有成！！！享受热力学带来的乐趣。

#pagebreak()

= 流体的 P-V-T 关系

#le[体积的函数表达-全微分式]

#grid(
  columns: (1fr, 1fr),
  gutter: 10pt,
  figure(
    image("./imgs/2.1.png", width: 100%, fit: "contain"),
    caption: [P-T图]
  ),
  figure(
    image("./imgs/2.2.png", width: 100%, fit: "contain"),
    caption: [P-V图]
  )
)

$ V = V(p,T) + #text[全微分定义] arrow.r dif V = (diff V)/(diff p)dif p + (diff V)/(diff T)dif T $

$ beta = 1/V ((diff V)/(diff T))_p $

$ kappa = -1/V ((diff V)/(diff p))_T $

当 $dif T arrow.r 0, dif p arrow.r 0$时，@eqt:keji 可积

$ (dif V)/V = beta dif T - kappa dif p $ <eqt:keji>

#sec

#le[

气体的PVT建模

理想气体的几个特点
]

对象，针对$1 m o l$物质而言有:

$ f(p,V,T) = 0 $

特别的，对于$1 m o l$理想气体有 $ p V = R T $

对象，针对$n m o l$物质而言，相应的$n$应该乘到广度性质前，即有如下数学表达:

$ f(p,V,T,n) = 0 $

也即

$ f(p,n V, T) = 0 $

特别的对于$n m o l$理想气体有 $ p V = n R T $

#sec

#le()[理想气体条件]

理想气体应符合以下几个特征，但是据我所想，如果对同种气体而言，分子结构大小基本一致，
那么分子间作用力必然相差无几，由分子间作用力导致的分子间距离也不应有太大的不同，
据此我个人认为以下几个点实际上都在描述同一种东西，即`同一种分子`， 
不知道我的理解是否有偏差：

1. 分子间作用力相似
2. 分子体积大小相似
3. 分子与分子间距相似

#sec

#le[维利方程]

$ p V &= a + b p + c p^2 + d p^3 + ... \
      &= a(1 + B' p + C' p^2 + D' p^3 + ...) $<eqt:weili>

当 $p arrow.r 0$时，上式即理想气体的一个拟合，有$p V = a$，又由$p V=R T$得$a = R T$

所以 @eqt:weili 可改写为

$ p V &= R T(1 + B' p + C' p^2 + D' p^3 + ...) $

亦即，$p -> 0$时，还原为理想气体状态方程

#sec

#le[压缩因子]

$ Z = p V \/ R T = 1 + B' p + C' p^2 + D' p^3 + ... #text[(压力形式)] $
$ Z = p V \/ R T = 1 + B V + C V^2 + D V^3 + ... #text[(体积形式)] $

其中，压力/体积前的系数，修正了一定量的理想气体，当考虑$n$个分子间相互作用力时，形成的与真实气体考虑$n$分子间作用力之间的偏差。

#sec

#le[压缩因子的两项截断式]

$ Z = p V \/ R T = 1 + B' p $
$ Z = p V \/ R T = 1 + B \/ V $

#bo[
1.未经特殊说明讨论对象均为$1 m o l$对象

2.维利方程感觉只是在运用阶多项式拟合，没有别的理论基础，不知道老师所谓的能在理论上证明是什么意思

3.维利方程可以看作是理想气体状态方程的修正，考虑越复杂的情况采用的修正因子$p "or" V #text[前的]"系数个数越多"$

]

#sec

#le[VDE-EOS]

$ p = (R T)/(V - b)"(分子体积修正项)" - a/V^2"(内压修正项)" $

用临界点的两个方程（一阶导数为0，二阶导数为0）
$ ((diff p)/(diff V))_(T=T_c) = 0 $
$ ((diff^2 p)/(diff V^2))_(T=T_c) = 0 $

联立可得a,b表达式，
$ a = 27/64 (R^2 T_c^2)/ p_c $
$ b = 1/8 (R T_c)/p_c $

再带入上述 vdw 方程可得临界点压缩因子的表达式$Z_c = p_c V_c\/ R T = 3/8 (R T_c)/ V_c V_c /(R T_c) = 3/8 = 0.375 $为一定值

#align(center)[
  #grid(
    columns: (1fr, 1fr),
    gutter: 16pt,
    [
      #figure(
        image("./imgs/2.3.png", width: 100%, fit: "contain"),
        caption: [P-T图]
      )
    ],
    [
      #v(1.0em)
      #table(
        columns: (auto, auto),
        inset: 10pt,
        align: horizon,
        [*根的情况*], [*描述*],
        [1], [三个不等的实根],
        [2], [三个相等的实根],
        [3], [一个实根,两个虚根]
      )
    ]
  )
]

#sec

#le[RK-EOS

其a, b与VDE中a,b不同不应混淆]

$ p = (R T)/(V - b) - a/(T^0.5 V (V + b)) $

非极性物质，液体不太行，若对象为气体则可行。a,b相比于vdw方程依旧不一，不应混淆。

以下是RK状态方程便于计算机应用的形式，后续页面中添加了RK方程计算机程序求解的程序框图以及相应的`Julia`代码实现。主要的思想在于迭代——给定初值，不断逼近。

#sec

#le[RK方程-便于计算机应用的形式]

$ cases(
   Z = 1/(1-h) - A/B 1/(1+h),
   h = b/V = B/Z,
   A = (a p) / (R^2 T^2.5),
   B = (b p) / (R T)
) $

#align(center)[
  #figure(
    caption: "RK方程求解流程图",
  )[
    #diagram(
      node-stroke: 0.5pt,
      node-fill: white,
      spacing: (1.8cm, 1.2cm),
      node((0,0), $"初始猜测"Z_(n-1), n=1$, shape: shapes.pill),
      node((0,-1), $"计算"h = b/V = B/Z$),
      node((0,-2), $"用"h"计算新的"Z_n = 1/(1-h) - A/B 1/(1+h)$),
      node((0,-3), $|Z_n-Z_(n-1)| <= 1e^(-3)$, shape: shapes.diamond),
      node((-0.75,-2),$n += 1 \ Z_n => Z_(n-1)$),
      
      node((1.0,-3), $"输出"Z_n$, shape: shapes.pill),
      
      edge((0,0), (0,-1), "->"),
      edge((0,-1), (0,-2), "->"),
      edge((0,-2), (0,-3), "->"),
      edge((0,-3), (1.0,-3), "->", label: text(size: 0.8em, "yes")),
      edge((0,-3), (-0.75,-3), "->"),
      edge((-0.75,-3), (-0.75,-1), "->"),
      edge((-0.75,-1), (0,-1), "->", label: text(size: 0.8em, "no")),
    )
  ]
]

求解过程中初始值$Z_0$应考虑相应的物理化学含义，即赋一比较接近于实际状况的值，以减少迭代次数，恰好，我们有气体的理想状态方程，正好可以拿来做这件事情。

以下是RK方程求解的`Julia`实现:

```julia
function solve_RK_equation(p, T, Tc, pc, ω, ε=1e-3)
    R = 8.314  # 气体常数
    
    # 计算 a 和 b
    Tr = T / Tc
    a = 0.42748 * R ^ 2 * Tc ^ 2 / pc * (1 + 0.48 + 1.574 * ω - 0.176 * ω ^ 2) * (1 / Tr ^ 0.5)
    b = 0.08664 * R * Tc / pc
    # 计算 A 和 B
    A = a * p / (R ^ 2 * T ^ 2.5)
    B = b * p / (R * T)
    Z₀ = 1.0  # 初始猜测，理想气体的压缩因子
    n = 1
    # 主循环
    while true
        h = B / Z₀
        Z = 1 / (1 - h) - A / B * 1 / (1 + h)
        if abs(Z - Z₀) ≤ ε
            return Z
        end
        Z₀ = Z
        n += 1
    end
end
# 主程序
p = 1e6     # 压力，Pa
T = 300     # 温度，K
Tc = 190.6  # 临界温度，K （以甲烷为例）
pc = 4.6e6  # 临界压力，Pa（以甲烷为例）
ω = 0.011   # 偏心因子，1 （以甲烷为例）
Z = solve_RK_equation(p, T, Tc, pc, ω);
@show Z;
```

若上述过程中发散则烤炉用$(Z_(0) + Z_n) / 2$进行迭代。

#sec

#le[SRK-EOS
]

$ p = (R T)/(V -b) - (a(t)) / (V(V + b)) $
$ a = 0.42748 (R^2 T_c^2)/P_c $
$ b = 0.08664 (R T_c) / P_c $
$ m = 0.480 + 1.574 omega - 0.176 omega^2 $

#bo()[
SRK方程与RK方程的主要区别

SRK方程引入了温度依赖的α(T)函数,使得a成为温度的函数a(T)。引入了偏心因子ω,使得方程可以更好地适用于不同类型的物质。由于这些改进,这使得SRK方程能更准确地描述非极性和弱极性流体的PVT行为。所以SRK方程通常比RK方程具有更高的精度,特别是在预测液相密度方面。
]

$ alpha(T_r) = [1 + m(1-T_r^0.5)]^2 $
$ a(t) = a alpha(T_r) $

#sec

#le[SRK方程-便于计算机应用的形式]

$ cases(
   Z = 1/(1-h) - A/h 1/(1+h),
   h = b/V = B/Z,
   A = (a(T) p) / (R^2 T^2),
   B = (b p) / (R T)
) $

SRK方程尽管对于非极性和弱极性物质的预测效果很好,但对于强极性物质(如水)和氢键物质的预测可能不够准确。

与RK方程类似,如果迭代过程发散,可以使用$(Z_(0) + Z_n) / 2$进行迭代来改善收敛性。

#pagebreak()

#le[SRK方程-求解流程图]

#align(center)[
  #figure(
    caption: "SRK方程求解流程图",
  )[
    #diagram(
      node-stroke: 0.5pt,
      node-fill: white,
      spacing: (2cm, 1.0cm),
      node((0,0), $"输入"p, T, T_c, p_c, omega$, shape: shapes.pill),
      node((0,-1), $"计算"a, b$),
      node((0,-2), $"计算"m, alpha(T)$),
      node((0,-3), $"计算"A, B$),
      node((0,-4), $"初始猜测"Z_(n-1), n=1$),
      node((0,-5), $"计算"h = B/Z_(n-1)$),
      node((0,-6), $"计算"Z_n = 1/(1-h) - A/h 1/(1+h)$),
      node((0,-7), $|Z_n-Z_(n-1)| <= epsilon$, shape: shapes.diamond),
      node((-1,-6),$n += 1 \ Z_n => Z_(n-1)$),
      
      node((1.0,-7), $"输出"Z_n$, shape: shapes.pill),
      
      edge((0,0), (0,-1), "->"),
      edge((0,-1), (0,-2), "->"),
      edge((0,-2), (0,-3), "->"),
      edge((0,-3), (0,-4), "->"),
      edge((0,-4), (0,-5), "->"),
      edge((0,-5), (0,-6), "->"),
      edge((0,-6), (0,-7), "->"),
      edge((0,-7), (1.0,-7), "->", label: text(size: 0.8em, "是")),
      edge((0,-7), (-1,-7), "->"),
      edge((-1,-7), (-1,-5), "->"),
      edge((-1,-5), (0,-5), "->", label: text(size: 0.8em, "否")),
    )
  ]
]

#le[SRK方程-Julia实现]

以下是SRK方程求解的`Julia`实现:

#le[
右侧`julia`程序考虑了如果常规迭代未收敛时的情况，如果其他程序也是这样未收敛，可仿照上述SRK方程的求解方法，采用求平均值的赋值方式。
]

```julia
function solve_SRK_equation(p, T, Tc, pc, ω, ε=1e-6, max_iter=1000)
    R = 8.314  # 气体常数
    # 计算 a 和 b
    a = 0.42748 * R^2 * Tc^2 / pc
    b = 0.08664 * R * Tc / pc
    # 计算 m 和 α(T)
    m = 0.480 + 1.574 * ω - 0.176 * ω^2
    Tr = T / Tc
    α = (1 + m * (1 - sqrt(Tr)))^2
    # 计算 A 和 B
    A = a * α * p / (R^2 * T^2)
    B = b * p / (R * T)
    # 尝试常规迭代
    Z₀ = 1.0  # 初始猜测，理想气体的压缩因子
    for i in 1:max_iter
        h = B / Z₀
        Z = 1 / (1 - h) - A / h * 1 / (1 + h)
        if abs(Z - Z₀) ≤ ε
            return Z
        end
        if isnan(Z) || isinf(Z)
            break  # 如果发散，跳出循环
        end
        Z₀ = Z
    end
    # 如果常规迭代失败，从头开始使用平均值法
    Z₀ = 1.0  # 重新初始化
    for i in 1:max_iter
        h = B / Z₀
        Z = 1 / (1 - h) - A / h * 1 / (1 + h)
        if abs(Z - Z₀) ≤ ε
            return Z
        end
        Z₀ = (Z₀ + Z) / 2  # 使用平均值法
    end
    error("达到最大迭代次数，未收敛")
end
# 主程序
p = 1e6     # 压力，Pa
T = 300     # 温度，K
Tc = 190.6  # 临界温度，K （以甲烷为例）
pc = 4.6e6  # 临界压力，Pa（以甲烷为例）
ω = 0.011   # 偏心因子
try
    Z = solve_SRK_equation(p, T, Tc, pc, ω)
    println("压缩因子 Z = ", Z)
catch e
    println("错误: ", e)
end
```

#sec

#le[PR-EOS]

$ p = (R T)/(V - b) - a(T) / (V (V + b) + (V - b)b) $

其中:
$ a = 0.45724 (R^2 T_c^2) / p_c $
$ b = 0.07780 (R T_c)/p_c $
$ k = 0.37464 + 1.54226 omega - 0.26992 omega^2 $
$ alpha(T_r) = [1 + k(1-T_r^0.5)]^2 $
$ a(T) = a alpha(T) $

#sec

#le[PR方程-便于计算机应用的形式]

$ cases(
   Z^3 + (B-1)Z^2 + (A-3B^2-2B)Z + (B^3+B^2-A B) = 0,
   A = (a(T) p) / (R^2 T^2),
   B = (b p) / (R T)
) $

由上式知，PR方程是一个三次方程,可以通过求解三次方程的方法直接得到Z值,而不需要像RK和SRK方程那样进行迭代。

三次方程的求解可能涉及到三个根，此时需要考虑根的物理意义：
对于气相,通常选择最大的实根作为解;对于液相,选择最小的正实根。

- 注意：尽管PR方程比SRK方程更准确,但对于强极性物质(如水)和氢键物质的预测仍可能不够精确。

#bo[
PR方程与SRK方程的主要区别

1. 吸引项形式不同: PR方程在分母中加入了$(V - b)b$项,使得方程在高压下的表现更好。

2. 参数取值不同: a和b的系数与SRK方程略有不同,k的计算公式也有所变化。

3. 精度: PR方程通常在预测液相密度和临界点附近的行为方面比SRK方程更准确。

4. 适用范围: PR方程对于非极性和弱极性物质,特别是碳氢化合物的预测效果很好,在石油和天然气工业中广泛应用。
]

#align(center)[
  #figure(
    caption: "PR方程求解流程图",
  )[
    #diagram(
      node-stroke: 0.5pt,
      node-fill: white,
      spacing: (2cm, 1.0cm),
      node((0,0), $"输入"p, T, T_c, p_c, omega$, shape: shapes.pill),
      node((0,-1), $"计算"a, b$),
      node((0,-2), $"计算"k, alpha(T)$),
      node((0,-3), $"计算"A, B$),
      node((0,-4), $"求解三次方程"Z^3 + (B-1)Z^2 + (A-3B^2-2B)Z + (B^3+B^2-A B) = 0$),
      node((0,-5), $"根据相态选择适当的根"$),
      node((0,-6), $"输出"Z$, shape: shapes.pill),
      
      edge((0,0), (0,-1), "->"),
      edge((0,-1), (0,-2), "->"),
      edge((0,-2), (0,-3), "->"),
      edge((0,-3), (0,-4), "->"),
      edge((0,-4), (0,-5), "->"),
      edge((0,-5), (0,-6), "->"),
    )
  ]
]

#le[
  PR方程-Julia实现
]

以下是PR方程求解的`Julia`实现:

```julia
function solve_RK_equation(p, T, Tc, pc, ω, ε=1e-3)
    R = 8.314  # 气体常数
    # 计算 a 和 b
    Tr = T / Tc
    a = 0.42748 * R ^ 2 * Tc ^ 2 / pc * (1 + 0.48 + 1.574 * ω - 0.176 * ω ^ 2) * (1 / Tr ^ 0.5)
    b = 0.08664 * R * Tc / pc
    # 计算 A 和 B
    A = a * p / (R ^ 2 * T ^ 2.5)
    B = b * p / (R * T)
    Z₀ = 1.0  # 初始猜测，理想气体的压缩因子
    n = 1
    # 主循环
    while true
        h = B / Z₀
        Z = 1 / (1 - h) - A / B * 1 / (1 + h)
        if abs(Z - Z₀) ≤ ε
            return Z
        end
        Z₀ = Z
        n += 1
    end
end
# 主程序
p = 1e6     # 压力，Pa
T = 300     # 温度，K
Tc = 190.6  # 临界温度，K （以甲烷为例）
pc = 4.6e6  # 临界压力，Pa（以甲烷为例）
ω = 0.011   # 偏心因子，1 （以甲烷为例）
Z = solve_RK_equation(p, T, Tc, pc, ω);
@show Z;
```

== 应用及注意

=== EOS解法
1. 知$T,V$查表$P_c,T_c$求 P 直接代
2. 知$P,T$求$V$，迭代法

其中迭代法，以$p = (R T)/(V - b) - a/(T^0.5 V (V + b))$为例（RK方程），
上式可改写为如下迭代式

$ V_(n+1) = (R T)/p + b - a(V-b) / (T^0.5 P V_n (V_n + b)) $

迭代可给一理想气体$V_(n-1),n=1$迭代得$V_n$,若$|V_n - V_(n-1)|<=1 times 10^(-3)$则认为收敛

#align(center)[
  #figure(
    caption: "EOS迭代法求解体积V的流程图",
  )[
    #diagram(
      node-stroke: 0.5pt,
      node-fill: white,
      spacing: (2cm, 1.2cm),
      node((0,0), $"输入"p, T, a, b$, shape: shapes.pill),
      node((0,-1), $"初始猜测"V_(n-1) = R T / p, n = 1$),
      node((0,-2), $"计算"V_n = (R T)/p + b - a(V_(n-1)-b) / (T^0.5 p V_(n-1) (V_(n-1) + b))$),
      node((0,-3), $|V_n - V_(n-1)| <= 1 times 10^(-3)$, shape: shapes.diamond),
      node((-0.8,-2), $n += 1 \ V_n => V_(n-1)$),
      
      node((1.0,-3), $"输出"V_n$, shape: shapes.pill),
      
      edge((0,0), (0,-1), "->"),
      edge((0,-1), (0,-2), "->"),
      edge((0,-2), (0,-3), "->"),
      edge((0,-3), (1.0,-3), "->", label: text(size: 0.8em, "是")),
      edge((0,-3), (-0.8,-3), "->"),
      edge((-0.8,-3), (-0.8,-1), "->"),
      edge((-0.8,-1), (0,-1), "->", label: text(size: 0.8em, "否")),
    )
  ]
]

该迭代流程图本质上与前面给定$Z_0$迭代求解$Z$的流程没有什么本质的差别。但是在求解过程中需要注意单位的一致性。

=== 小结

上述几个模型的数学表达式总结如下

#align(center)[
  #table(
    columns: (8em, 20em),
    inset: 10pt,
    align: horizon + center,
    [*模型*], [*数学表达*],
    [ID 方程], [$P V = R T$],
    [WILLY 方程], [$Z = (P V)/(R T) = 1 + B/V + C/V^2$],
    [VDW 方程], [$ p = (R T)/(V - b) - a/V^2$],
    [RK 方程], [$p = (R T)/(V - b) - a/(T^0.5 V (V + b))$],
    [SRK 方程], [$p = (R T)/(V -b) - (a(t)) / (V(V + b))$],
    [PR 方程], [$p = (R T)/(V - b) - a(T) / (V (V + b) + (V - b)b)$],
  )
]

#sec

#le[对比态原理]
#bo[
  便于计算机应用的形式中$Z$都是用普遍化参数表示的
]
$ T_r = T / T_c $
$ V_r = V/V_c $
$ p_r = p/p_c $
如果其中两个参数相差不大的，另外一个相差也不大，或者说一致，
也即$f(T_r,V_r,p_r) = 0$，可改写为$V_r = g(T_r,p_r)$

根据上述，有如下两参数普遍化临界压缩因子关系式:
$ Z_c = (P V)/(R T) = (p_c p_r V_c V_r )/(R T_c T_r) $
考虑分子间作用力，偶极矩时，$Z_c$并不能起到良好的效果。于是考虑用三参数（另加一偏心因子$omega$），
此时有，
$ Z = f(T_r, P_r, omega) $

#sec

#le[偏心因子（偏心率）$omega$]

在低压下，克－克方程式表示为： 

$ frac(d P, P) = frac(Delta H_v, R T^2) thin d T $

式中，$P$ —蒸汽压力;$T$ —蒸汽温度;$H_v$ —汽化热 

$ mat(
  delim: #none, 
  log P = - frac(Delta H, 2.303 R) frac(1, T) + c quad arrow.r.double quad log P = a_1 - b_1 frac(1, T);
) $

其中　$a_1＝c,b_1 = frac(Delta H, 2 . 303 R)$

#le[#figure(
  image("./imgs/2.4.png", width: 100%, fit: "contain"),
  caption: [P-T图]
)]

把饱和蒸汽压$P^s$和$T$用对比参数代入
$ log P_r^s = a - b / T_r $

此时相当于直线方程： $y = a-b x$

1. 对于球形分子（非极性，量子），如$A r、K r、X e$，作 $log P_r^s ~ 1/T_r$ 图，其斜率相同，并且在 $T_r = 0.7$ 时，$log P_r^s = -1$ 。

2. 对于非球形分子，作 $log P_r^s ~ 1/T_r$ 线，结果皆位于球形分子的下面，并且随着物质极性的增加，偏离程度愈加明显。