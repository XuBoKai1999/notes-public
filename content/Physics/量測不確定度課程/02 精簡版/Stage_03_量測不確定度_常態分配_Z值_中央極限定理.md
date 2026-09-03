# Stage 03｜常態分配、Z 值與中央極限定理

> 對應講義：**(1-03) 常態分配與經驗法則**

## Normal distribution

$$
X\sim N(\mu,\sigma^2)
$$

$\mu$ 決定中心，$\sigma$ 決定寬度。常態分配對稱、單峰，平均數、中位數與眾數相同。

經驗法則：

$$
P(|X-\mu|<\sigma)\approx68.27\%
$$

$$
P(|X-\mu|<2\sigma)\approx95.45\%
$$

$$
P(|X-\mu|<3\sigma)\approx99.73\%
$$

因此若 output 近似 normal，$u_c(y)$ 是一倍標準差尺度，$2u_c(y)$ 約對應 $95\%$ coverage。

## Standardization 與 Z value

$$
\boxed{Z=\frac{X-\mu}{\sigma}}
$$

標準化後：

$$
Z\sim N(0,1)
$$

$Z$ 的意思就是「$X$ 距離 mean 幾個 standard deviations」。例如 $Z=1.25$ 表示在 mean 右側 $1.25\sigma$。

教材的 Z-table 列出從 $0$ 到 $z$ 的面積。例如：

$$
P(0<Z<1.96)=0.475
$$

利用左右對稱：

$$
P(-1.96<Z<1.96)=0.95
$$

所以 normal distribution 的中央精確 $95\%$ 約為 $\pm1.96\sigma$；$\pm2\sigma$ 是常用近似，兩者不要說成完全相同。

## Central Limit Theorem

若 $X_1,\ldots,X_n$ independent、具有有限 variance，且沒有單一 contribution 支配總和，則 $n$ 夠大時，sum 或 sample mean 的 standardized distribution 會趨近 normal。

$$
\bar X=\frac1n\sum_{i=1}^{n}X_i
$$

$$
E[\bar X]=\mu,qquad
\operatorname{SD}(\bar X)=\frac{\sigma}{\sqrt n}
$$

CLT 不代表所有 random variables 都服從 normal，也不能自動處理強相關、漂移、極小樣本或單一 component 支配的情況。

## 為什麼還需要 Student's $t$？

若母體 $\sigma$ 未知，只能以有限樣本的 $s$ 估計，則：

$$
\frac{\bar X-\mu}{s/\sqrt n}
$$

服從自由度 $\nu=n-1$ 的 Student's $t$ distribution。自由度小時 tails 較厚，相同 coverage 所需 factor 通常大於 normal factor；$\nu\to\infty$ 時才趨近 standard normal。

## 最小記憶包

$$
\boxed{Z=(X-\mu)/\sigma}
$$

$$
\boxed{\pm1\sigma\approx68\%,\quad\pm2\sigma\approx95.45\%,\quad\pm3\sigma\approx99.73\%}
$$

$$
\boxed{\operatorname{SD}(\bar X)=\sigma/\sqrt n}
$$

小樣本且 $\sigma$ 未知時，用 $t$ 而不是直接用 Z。
