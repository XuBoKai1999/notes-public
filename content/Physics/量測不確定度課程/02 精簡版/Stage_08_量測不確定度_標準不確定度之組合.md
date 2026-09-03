# Stage 08｜標準不確定度之組合

> 對應講義：**(2-05) 標準不確定度之組合**

## Output contributions

對：

$$
Y=f(X_1,\ldots,X_N)
$$

$$
c_i=\frac{\partial f}{\partial X_i},\qquad
\boxed{u_i(y)=|c_i|u(x_i)}
$$

每個 $u_i(y)$ 的單位都應與 output $y$ 相同。

## Uncorrelated inputs

$$
\boxed{u_c(y)=\sqrt{\sum_{i=1}^{N}c_i^2u^2(x_i)}
=\sqrt{\sum_{i=1}^{N}u_i^2(y)}}
$$

這是 RSS，不是直接相加 standard uncertainties。

## Correlated inputs

$$
r(x_i,x_j)=\frac{u(x_i,x_j)}{u(x_i)u(x_j)},qquad -1\leq r\leq1
$$

一般的一階 propagation law：

$$
\boxed{
u_c^2(y)=
\sum_i c_i^2u^2(x_i)
+2\sum_{i<j}c_ic_j u(x_i)u(x_j)r(x_i,x_j)
}
$$

Inputs 共用 reference、environment 或 observation data 時，可能相關。Covariance term 可正可負，因此 correlated case 不能丟掉 $c_i$ 的 sign。

## Relative combined uncertainty

$$
\boxed{u_{c,r}(y)=\frac{u_c(y)}{|y|}}
$$

例如 $K=V_s/V_m$ 且兩 inputs uncorrelated：

$$
\left[\frac{u_c(K)}{|K|}\right]^2
=
\left[\frac{u(V_s)}{|V_s|}\right]^2
+
\left[\frac{u(V_m)}{|V_m|}\right]^2
$$

此簡式只適用於相應的乘除 model；一般情況仍由 derivatives 推導。

## Effective degrees of freedom

$$
\boxed{
\nu_{eff}=
\frac{u_c^4(y)}{
\displaystyle\sum_{i=1}^{N}\frac{u_i^4(y)}{\nu_i}}
}
$$

若 $\nu_i=\infty$，該項在分母為零，但仍要進入 $u_c(y)$。

依教材，$\nu_{eff}$ 有小數時先無條件捨去，再查中央約 $95\%$ coverage 的 Student's $t$ factor：

$$
k=t_{0.975,\nu_{eff}}
$$

最後：

$$
\boxed{U=ku_c(y)}
$$

自由度小時 $k$ 可明顯大於 $2$。

## 最小主線

```text
u(x_i) → c_i u(x_i) → covariance check → u_c(y) → ν_eff → k → U
```
