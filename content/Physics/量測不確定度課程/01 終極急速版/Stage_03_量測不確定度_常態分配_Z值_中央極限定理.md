# Stage 03｜常態分配、Z 值與 CLT・考前急速版

## Normal 與 Z

$$
X\sim N(\mu,\sigma^2),\qquad
\boxed{Z=\frac{X-\mu}{\sigma}}
$$

$Z$ 表示 $X$ 距 mean 幾個 standard deviations。

| 中央區間 | Coverage |
|---|---:|
| $\mu\pm1\sigma$ | $68.27\%$ |
| $\mu\pm1.96\sigma$ | $95.00\%$ |
| $\mu\pm2\sigma$ | $95.45\%$ |
| $\mu\pm3\sigma$ | $99.73\%$ |

教材 Z-table 從 $0$ 積到 $z$：$P(0<Z<1.96)=0.475$，故中央兩側共 $0.95$。

## Central Limit Theorem

很多 independent、有限 variance、沒有單一項支配的 contributions 相加或平均時，其 standardized distribution 趨近 normal。

$$
E[\bar X]=\mu,qquad
\operatorname{SD}(\bar X)=\frac{\sigma}{\sqrt n}
$$

## Normal 還是 $t$？

| 情況 | 使用 |
|---|---|
| 母體 $\sigma$ 已知 | Z / normal |
| $\sigma$ 未知，以有限樣本 $s$ 估計 | Student's $t$，$\nu=n-1$ |

自由度小時 $t$ tails 較厚，相同 coverage 所需 factor 較大；$\nu\to\infty$ 時才趨近 normal。

## 最易錯

CLT 不是「任何 random variable 都是 normal」，也不能自動處理強相關、漂移或單一 component 支配。
