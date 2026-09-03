# Stage 3｜常態分配、Z 值與中央極限定理

> 對應講義：**(1-03) 常態分配與經驗法則**  
> 本 Stage 的目的是把 Normal distribution、standardization、Z-table、coverage probability 與 Central Limit Theorem 串起來，並銜接後續 expanded uncertainty。

---

## 1. 本 Stage 的核心

本 Stage 的主線是：

```text
Normal distribution
        ↓
Standardization
        ↓
Z value
        ↓
Coverage probability
        ↓
Expanded uncertainty 的統計直覺
```

另外還要正式釐清：

> Central Limit Theorem（CLT）到底保證了什麼，以及它為什麼不要求所有 random variable 都是 normal distribution。

---

# 2. Normal distribution

Normal distribution 可寫成：

$$
X\sim N(\mu,\sigma^2)
$$

其中：

- $\mu$：distribution 的中心；
- $\sigma$：distribution 的 standard deviation。

Probability density 為：

$$
p(x)
=
\frac{1}{\sqrt{2\pi}\sigma}
\exp
\left[
-\frac{(x-\mu)^2}{2\sigma^2}
\right]
$$

目前不需要背這個 PDF。

真正需要知道的是：

$$
E[X]=\mu
$$

以及：

$$
\operatorname{Var}(X)=\sigma^2
$$

因此 standard deviation 為：

$$
\boxed{
\sigma
}
$$

$\sigma$ 越大，distribution 越寬。

---

# 3. $\sigma$ 不只是「寬度」，也對應 coverage probability

Normal distribution 最重要的特性之一，是 standard deviation 與涵蓋機率直接對應。

中央一個 standard deviation：

$$
P(\mu-\sigma<X<\mu+\sigma)
\approx0.6827
$$

因此：

$$
\boxed{
\mu\pm1\sigma\approx68.27\%
}
$$

中央兩個 standard deviations：

$$
\boxed{
\mu\pm2\sigma\approx95.45\%
}
$$

中央三個 standard deviations：

$$
\boxed{
\mu\pm3\sigma\approx99.73\%
}
$$

這就是著名的：

$$
\boxed{
68\%-95\%-99.7\%\text{ rule}
}
$$

---

# 4. 為什麼這對 measurement uncertainty 很重要？

Standard uncertainty 本身就是 standard-deviation scale。

如果某個 output quantity 可以合理近似 normal distribution，而且其 combined standard uncertainty 為：

$$
u_c
$$

那麼區間：

$$
y\pm u_c
$$

大約只涵蓋：

$$
68.27\%
$$

如果使用：

$$
y\pm2u_c
$$

則約涵蓋：

$$
95.45\%
$$

這就是後面 expanded uncertainty：

$$
U=ku_c
$$

以及常見：

$$
k\approx2
$$

的統計來源之一。

---

# 5. Standard normal distribution

不同 normal distributions 可以有不同的 $\mu$ 與 $\sigma$。

例如：

$$
X\sim N(100,5^2)
$$

以及：

$$
Y\sim N(0.02,0.003^2)
$$

如果每一個 distribution 都建立一套 probability table 會很麻煩。

因此我們進行 standardization：

$$
\boxed{
Z=\frac{X-\mu}{\sigma}
}
$$

標準化之後：

$$
\boxed{
Z\sim N(0,1)
}
$$

這就是 standard normal distribution。

---

# 6. Z value 到底代表什麼？

公式：

$$
Z=\frac{X-\mu}{\sigma}
$$

本質上是在問：

> $X$ 距離 mean 幾個 standard deviations？

例如：

$$
X=\mu+\sigma
$$

則：

$$
Z=1
$$

表示 $X$ 在 mean 右邊一個 standard deviation。

如果：

$$
X=\mu-1.5\sigma
$$

則：

$$
Z=-1.5
$$

表示 $X$ 在 mean 左邊 $1.5$ 個 standard deviations。

所以可以直接記成：

$$
\boxed{
Z=\text{距離 mean 幾個 }\sigma
}
$$

---

# 7. 標準化範例

假設：

$$
X\sim N(100,4^2)
$$

現在觀察到：

$$
X=108
$$

則：

$$
Z
=
\frac{108-100}{4}
=
2
$$

也就是：

$$
108=\mu+2\sigma
$$

若：

$$
X=96
$$

則：

$$
Z
=
\frac{96-100}{4}
=
-1
$$

也就是：

$$
96=\mu-\sigma
$$

Standardization 的作用，就是把不同單位、不同中心、不同寬度的 normal distributions 全部轉換成同一個 standard normal distribution。

---

# 8. Z-table 到底在查什麼？

Z-table 本質上是在查 standard normal curve 下的 area。

但不同教材可能採不同定義，因此使用前必須先看表格標題。

最常見的一種是 cumulative distribution：

$$
\Phi(z)
=
P(Z\leq z)
$$

也就是：

> 從 $-\infty$ 到 $z$ 的累積 probability。

例如：

$$
\Phi(1.96)\approx0.975
$$

表示：

$$
P(Z<1.96)\approx0.975
$$

---

# 9. 為什麼從 0 到 1.96 的 probability 是 0.475？

Standard normal distribution 左右對稱，因此：

$$
P(Z<0)=0.5
$$

又因為：

$$
P(Z<1.96)=0.975
$$

所以：

$$
P(0<Z<1.96)
=
0.975-0.5
$$

因此：

$$
\boxed{
P(0<Z<1.96)=0.475
}
$$

所以如果某張 Z-table 顯示：

$$
0.9750
$$

而老師說：

$$
0\text{ 到 }1.96\text{ 的 probability 是 }0.475
$$

兩者並不衝突。

只是那張表列的是：

$$
P(Z<z)
$$

而老師講的是：

$$
P(0<Z<z)
$$

---

# 10. 為什麼 normal distribution 的中央 95% 是 $\pm1.96\sigma$？

如果希望中央 interval 涵蓋：

$$
95\%
$$

那左右兩邊剩下：

$$
5\%
$$

因為 normal distribution 對稱，所以左右 tails 各占：

$$
2.5\%
$$

因此右側 cutoff $z$ 滿足：

$$
P(Z<z)=0.975
$$

查 standard normal table 得到：

$$
z\approx1.96
$$

所以 exact central 95% interval 為：

$$
\boxed{
\mu\pm1.96\sigma
}
$$

---

# 11. 那為什麼常常看到 $k=2$？

因為：

$$
P(|Z|<2)\approx0.9545
$$

也就是：

$$
95.45\%
$$

這和 95% 非常接近。

因此在合適條件下，measurement uncertainty 實務常使用：

$$
\boxed{
k\approx2
}
$$

作為 approximately 95% coverage 的 coverage factor。

但應區分：

$$
\boxed{
1.96=\text{normal distribution 精確中央 95%}
}
$$

與：

$$
\boxed{
2=\text{常用近似，對應約 }95.45\%
}
$$

不能把兩者說成數學上完全相同。

---

# 12. 68–95–99.7 rule 與 Z value 其實是同一件事

因為：

$$
Z=\frac{X-\mu}{\sigma}
$$

所以：

$$
\mu-\sigma<X<\mu+\sigma
$$

等價於：

$$
-1<Z<1
$$

因此：

$$
P(|Z|<1)\approx0.6827
$$

同樣：

$$
P(|Z|<2)\approx0.9545
$$

以及：

$$
P(|Z|<3)\approx0.9973
$$

所以：

> 「距離 mean 幾個 sigma」與「Z value 是多少」其實只是同一件事情的兩種說法。

---

# 13. Central Limit Theorem 到底說了什麼？

Central Limit Theorem 並不是：

$$
\boxed{
\text{所有 random variable 都會變成 normal}
}
$$

它處理的是 sums 或 averages。

例如：

$$
Y=X_1+X_2+\cdots+X_n
$$

在適當條件下，當很多 random variables 共同貢獻時，經適當標準化後，$Y$ 的 distribution 會趨近 normal distribution。

典型條件包括：

- 各項 independent 或至少沒有過強的 dependency；
- individual variables 有有限 variance；
- 沒有單一 component 完全支配總 variance；
- contributions 數量足夠多，使 normal approximation 合理。

所以 CLT 的核心不是：

> 「東西多了就一定常態。」

而是：

> 很多相對獨立的小 contribution 相加時，在適當條件下，總和的 distribution 往往會接近 normal。

---

# 14. 為什麼 sums 會逐漸接近 normal？

假設：

$$
Y=X_1+X_2
$$

則 $Y$ 的 probability density 與 $X_1$、$X_2$ 的 distributions 有 convolution 關係。

再加入：

$$
X_3
$$

相當於再 convolution 一次。

概念上：

$$
p_Y
=
p_1*p_2*p_3*\cdots
$$

很多 independent distributions 反覆 convolution 後，在適當條件下，其 standardized shape 會逐漸趨近 Gaussian。

因此 normal distribution 常自然出現在：

- 很多 measurement noise sources 的總和；
- thermal fluctuations；
- 許多小誤差疊加；
- sample mean；
- uncertainty propagation 的最終 output。

---

# 15. U-shaped distribution 為什麼不違反 CLT？

上一 Stage 曾看到：

$$
X=A\sin\theta
$$

若：

$$
\theta\sim U(0,2\pi)
$$

則 $X$ 可形成 U-shaped distribution。

這完全不違反 CLT，因為：

$$
X=A\sin\theta
$$

並不是「很多 independent random variables 的 sum」。

它是一個 random variable 經 nonlinear transformation 得到的 observable。

所以：

$$
\boxed{
\text{單一 component 可以完全不是 normal。}
}
$$

真正可能因 CLT 接近 normal 的，是很多不同 contributions 的 sum。

---

# 16. 「很多個」也不是充分條件

不能把 CLT 簡化成：

> 超過某個固定 sample size 就一定 normal。

例如：

$$
u_1^2=100
$$

而其他 components：

$$
u_2^2=u_3^2=\cdots=0.01
$$

即使有很多小 components，第一個 component 仍然幾乎支配總 variance。

如果 $X_1$ 的 distribution 強烈 non-normal，那 output distribution 也可能保留其 non-normal 特徵。

因此更重要的是：

$$
\boxed{
\text{是否有很多彼此相對獨立、且沒有單一項支配的 contributions}
}
$$

而不是單純數 contribution 數量。

---

# 17. Sample mean 與 CLT

假設：

$$
X_1,X_2,\ldots,X_n
$$

彼此 independent，且：

$$
E[X_i]=\mu
$$

以及：

$$
\operatorname{Var}(X_i)=\sigma^2
$$

Sample mean 為：

$$
\bar X
=
\frac1n
\sum_{i=1}^n X_i
$$

因為 $\bar X$ 本身就是很多 random variables 的 linear combination，所以在 CLT 適用時，當 $n$ 足夠大：

$$
\bar X
$$

的 distribution 會趨近 normal。

而：

$$
E[\bar X]=\mu
$$

variance：

$$
\operatorname{Var}(\bar X)
=
\frac{\sigma^2}{n}
$$

所以 standard deviation：

$$
\boxed{
\sigma_{\bar X}
=
\frac{\sigma}{\sqrt n}
}
$$

這正好銜接 Stage 1。

---

# 18. 單次 observation 與 sample mean 是兩個不同 random variables

這點非常重要。

單次 measurement：

$$
X
$$

如果：

$$
E[X]=\mu
$$

以及：

$$
\operatorname{SD}(X)=\sigma
$$

那單次 observation 的散布尺度是：

$$
\sigma
$$

但 sample mean：

$$
\bar X
=
\frac1n\sum_{i=1}^{n}X_i
$$

有：

$$
E[\bar X]=\mu
$$

以及：

$$
\operatorname{SD}(\bar X)
=
\frac{\sigma}{\sqrt n}
$$

因此：

$$
X
$$

與：

$$
\bar X
$$

不是同一個 random variable。

它們可以有相同中心：

$$
E[X]=E[\bar X]=\mu
$$

但 distribution widths 不同：

$$
\sigma_X=\sigma
$$

$$
\sigma_{\bar X}=\frac{\sigma}{\sqrt n}
$$

這就是 Stage 1 最重要的區別：

$$
\boxed{
s\text{ 描述單次 observation 的散布；}
\frac{s}{\sqrt n}
\text{ 描述 sample mean 的 uncertainty scale。}
}
$$

---

# 19. 如果原始 distribution 根本不是 normal 呢？

這正是 CLT 的重要性。

假設單次 observation 的 $X$ 是 rectangular distribution。

那：

$$
X\not\sim N
$$

但是如果：

$$
\bar X
=
\frac1n
\sum_{i=1}^{n}X_i
$$

而 observations independent 且條件適當，當 $n$ 增加時，$\bar X$ 的 distribution 仍可逐漸接近 normal。

所以：

$$
\boxed{
X\not\sim N
\not\Rightarrow
\bar X\not\approx N
}
$$

這也是 measurement uncertainty 中 final output distribution 常能使用 normal approximation 的原因之一。

---

# 20. 但 CLT 不會自動解決所有問題

以下情況不能只用一句「CLT，所以 normal」帶過：

- observations 強烈 correlated；
- distribution 沒有有限 variance；
- sample size 太小；
- 某一 component 完全支配總 uncertainty；
- 存在 deterministic drift；
- 存在 state switching；
- nonlinear transformation 太強；
- output distribution 明顯 asymmetric 或 multimodal。

尤其 Stage 1 中：

$$
u_A(\bar x)=\frac{s}{\sqrt n}
$$

這個簡單形式也有條件。

如果 repeated observations 具有明顯 autocorrelation，effective independent sample size 可能小於 $n$，此時簡單的：

$$
1/\sqrt n
$$

scaling 可能低估 uncertainty。

這會留到後續 Type A evaluation 再詳細處理。

---

# 21. Normal distribution 如何銜接 measurement uncertainty？

假設 measurand estimate 為：

$$
y
$$

combined standard uncertainty 為：

$$
u_c(y)
$$

如果 output distribution 可以合理近似 normal：

$$
y\pm u_c(y)
$$

大約涵蓋：

$$
68.27\%
$$

而：

$$
y\pm2u_c(y)
$$

大約涵蓋：

$$
95.45\%
$$

因此 expanded uncertainty 定義為：

$$
U=ku_c
$$

如果：

$$
k=2
$$

便常用於取得 approximately 95% coverage。

這是後續 expanded uncertainty 的重要統計基礎。

---

# 22. 為什麼小 sample 時不能永遠直接使用 Z？

如果真正的 population standard deviation：

$$
\sigma
$$

已知，那麼可以直接使用 normal distribution 與 Z value。

但現實 measurement 中，通常不知道 $\sigma$，只能從有限 sample 估計：

$$
s
$$

因此：

$$
\frac{\bar X-\mu}{s/\sqrt n}
$$

並不服從 standard normal distribution，而是服從 Student's $t$ distribution。

其 degrees of freedom 為：

$$
\nu=n-1
$$

當 $\nu$ 較小時，$t$ distribution tails 比 normal 更厚。

因此在相同 coverage probability 下，需要的 multiplier 通常比：

$$
1.96
$$

更大。

當：

$$
\nu\rightarrow\infty
$$

才有：

$$
t_\nu\rightarrow N(0,1)
$$

這會在後續 coverage factor 與 effective degrees of freedom 再深入處理。

---

# 23. 完整數值例子

假設單次 observations 服從：

$$
X\sim N(100.0,2.0^2)
$$

## 23.1 $X=104$ 是幾個 standard deviations？

$$
Z
=
\frac{104-100}{2}
=
2
$$

所以：

$$
104=\mu+2\sigma
$$

---

## 23.2 單次 observation 落在 96 到 104 的 probability

因為：

$$
96=\mu-2\sigma
$$

以及：

$$
104=\mu+2\sigma
$$

所以：

$$
P(96<X<104)
=
P(-2<Z<2)
$$

因此：

$$
\boxed{
P(96<X<104)\approx0.9545
}
$$

---

## 23.3 如果取 $n=25$ 次平均

單次 observation 的 standard deviation：

$$
\sigma=2
$$

Sample mean 的 standard deviation：

$$
\sigma_{\bar X}
=
\frac{2}{\sqrt{25}}
=
0.4
$$

如果母體本身就是 normal，則 sample mean 也是 exact normal：

$$
\bar X
\sim
N(100,0.4^2)
$$

中央約 95.45% 的 sample means 落在：

$$
100\pm2(0.4)
$$

所以：

$$
\boxed{
99.2<\bar X<100.8
}
$$

注意這句話的主詞是：

> 25 次 observations 的 sample mean。

不是：

> 單次 measurement reading。

---

# 24. 本 Stage 最容易混淆的概念

| 概念 | 正確理解 |
|---|---|
| $p(x)$ | probability density，不是 probability 本身 |
| $\sigma$ | 某 distribution 的 standard deviation |
| $Z$ | 距離 mean 幾個 standard deviations |
| $\pm1\sigma$ | normal distribution 約 68.27% coverage |
| $\pm1.96\sigma$ | normal distribution 精確中央約 95% |
| $\pm2\sigma$ | 約 95.45% coverage |
| CLT | sums / averages 在適當條件下趨近 normal |
| $X$ 與 $\bar X$ | 不同 random variables，width 不同 |

---

# 25. Stage 3 最小記憶包

Standardization：

$$
\boxed{
Z=\frac{X-\mu}{\sigma}
}
$$

Empirical rule：

$$
\boxed{
\pm1\sigma\approx68.27\%
}
$$

$$
\boxed{
\pm2\sigma\approx95.45\%
}
$$

$$
\boxed{
\pm3\sigma\approx99.73\%
}
$$

Exact central 95% normal interval：

$$
\boxed{
\pm1.96\sigma
}
$$

Sample mean standard deviation：

$$
\boxed{
\sigma_{\bar X}
=
\frac{\sigma}{\sqrt n}
}
$$

CLT 的一句話版本：

$$
\boxed{
\text{很多相對獨立、具有有限 variance、沒有單一項支配的 contributions 相加時，}
}
$$

$$
\boxed{
\text{其 standardized sum 在適當條件下會趨近 normal distribution。}
}
$$

最重要的是不要誤解成：

$$
\boxed{
\text{所有 random variables 最後都會變成 normal。}
}
$$

---

## Stage 3 完成條件

完成本 Stage 後，應能：

1. 說明 normal distribution 中 $\mu$ 與 $\sigma$ 的意義；
2. 使用 $Z=(X-\mu)/\sigma$ 進行 standardization；
3. 解釋 Z value 是「距離 mean 幾個 standard deviations」；
4. 理解不同 Z-tables 可能列 $P(Z<z)$ 或 $P(0<Z<z)$；
5. 解釋為什麼 $0$ 到 $1.96$ 的 probability 是 $0.475$；
6. 記住 68.27%、95.45%、99.73%；
7. 區分 $\pm1.96\sigma$ 與 $\pm2\sigma$；
8. 說明 CLT 適用於 sums / averages，而不是所有 random variables；
9. 區分單次 observation $X$ 與 sample mean $\bar X$；
10. 理解為什麼 $\sigma_{\bar X}=\sigma/\sqrt n$；
11. 知道小 sample 且 $\sigma$ 未知時，Student's $t$ distribution 會取代 simple Z treatment。

---

下一 Stage：**Stage 4｜不確定度概論**。  
從這裡開始正式離開統計先修，進入 GUM 的 measurement uncertainty 主線。
