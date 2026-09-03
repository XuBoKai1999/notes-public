# Stage 08｜標準不確定度組合・考前急速版

## 計算鏈

$$
c_i=\frac{\partial f}{\partial X_i}
\quad\Rightarrow\quad
\boxed{u_i(y)=|c_i|u(x_i)}
$$

## Uncorrelated inputs

$$
\boxed{u_c(y)=\sqrt{\sum_i c_i^2u^2(x_i)}=\sqrt{\sum_i u_i^2(y)}}
$$

## Correlated inputs

$$
r_{ij}=\frac{u(x_i,x_j)}{u(x_i)u(x_j)}
$$

$$
\boxed{u_c^2(y)=\sum_i c_i^2u^2(x_i)+2\sum_{i<j}c_ic_j u(x_i)u(x_j)r_{ij}}
$$

| $r$ | 意義 |
|---:|---|
| $+1$ | 完全正相關 |
| $0$ | 無線性相關 |
| $-1$ | 完全負相關 |

共用 reference、environment 或 data 時要檢查相關性。Correlated case 不可先丟掉 $c_i$ 的 sign。

## Effective degrees of freedom

$$
\boxed{\nu_{eff}=\frac{u_c^4(y)}{\sum_i u_i^4(y)/\nu_i}}
$$

- $\nu_i=\infty$：該項在分母為 $0$，但仍計入 $u_c$。
- $\nu_{eff}$ 有小數：依教材向下取整後查表。

中央約 $95\%$ coverage：

$$
\boxed{k=t_{0.975,\nu_{eff}}},\qquad
\boxed{U=ku_c(y)}
$$

自由度小，$k$ 大；不能永遠取 $k=2$。

## 考試順序

```text
列 u(x_i) → 求 c_i → 算 u_i(y) → 檢查 covariance
→ 算 u_c → 算並下取整 ν_eff → 查 k → 算 U
```
