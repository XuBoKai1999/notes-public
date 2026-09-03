# Stage 02｜常用機率分配

> 對應講義：**(1-02) 常用機率分配之介紹**

## 為什麼需要 probability distribution？

量測不確定度用 distribution 描述：根據現有資訊，哪些值可合理歸給 input quantity，以及相對可能程度。

核心用途只有一個：

$$
\boxed{\text{已知資訊}\rightarrow\text{合理 distribution}\rightarrow\text{standard deviation}\rightarrow u(x)}
$$

## Random variable 與 probability

- Discrete random variable：各可能值可逐一列出，用 probability mass $P(X=x)$。
- Continuous random variable：用 density $p(x)$，區間機率是曲線下面積。

$$
p(x)\geq0,qquad \int_{-\infty}^{\infty}p(x)\,\mathrm dx=1
$$

$$
P(a<X<b)=\int_a^b p(x)\,\mathrm dx
$$

Distribution 的中心與散布為：

$$
\mu=E[X],\qquad \sigma^2=E[(X-\mu)^2],\qquad \sigma=\sqrt{\sigma^2}
$$

Standard uncertainty 就是 standard-deviation scale。

## 課程常用 distributions

令 $a$ 為相對中心的 half-width：

| Distribution | 資訊形態 | Standard uncertainty |
|---|---|---:|
| Normal | 已知 standard deviation | $\sigma$ |
| Rectangular | $\pm a$ 內各值等可能 | $a/\sqrt3$ |
| Triangular | 中央最可能、往兩端遞減 | $a/\sqrt6$ |
| U-shaped | 兩端比中央更可能 | $a/\sqrt2$ |
| Student's $t$ | 由有限樣本估計散布 | 依自由度 $\nu$ |

相同 bounds 下：

$$
\frac{a}{\sqrt6}<\frac{a}{\sqrt3}<\frac{a}{\sqrt2}
$$

因為 probability mass 越靠近兩端，variance 越大。

## Digital resolution

若 resolution 為 $d$，rounding error 通常在 $\pm d/2$ 內。採 rectangular distribution：

$$
\boxed{u_{res}=\frac{d/2}{\sqrt3}=\frac{d}{\sqrt{12}}}
$$

因此必須區分：

- 規格直接給 $\pm a$：$u=a/\sqrt3$；
- resolution 是一格 $d$：$u=d/\sqrt{12}$。

## 判斷原則

看到 $\pm a$ 時，先判斷它是：

- absolute bounds；
- expanded uncertainty；
- 某個 coverage interval；
- 或其他規格定義。

不能只看符號就套 rectangular distribution。最小結論是：

$$
\boxed{u(x)=\text{根據可用資訊所選 distribution 的 standard deviation}}
$$
