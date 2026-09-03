# Stage 10｜完整案例・考前急速版

> Digital caliper 量白板筆直徑；數字可當計算題模板。

## 已知與 model

| 已知 | 數值 |
|---|---:|
| Readings / mm | $10.50,10.54,10.52,10.49,10.51,10.55$ |
| Resolution $d$ | $0.01\ \mathrm{mm}$ |
| 器差 $e$ | $-0.02\ \mathrm{mm}$ |
| Certificate | $U(e)=0.03\ \mathrm{mm},\ k=2.00$ |

器差定義為「器示值－標準值」，故：

$$
\boxed{Y=R-e}
$$

## 1. 各 components

| Source | 算法 | $u(x_i)$ / mm | $\nu_i$ |
|---|---|---:|---:|
| Repeatability $R_1$ | $s/\sqrt6$ | $0.00946$ | $5$ |
| Resolution $R_2$ | $d/\sqrt{12}$ | $0.00289$ | $\infty$ |
| Certificate $e$ | $U(e)/k$ | $0.0150$ | $60$ |

後續計算使用未化整的中間值；表中數字只為速查顯示。

其中：

$$
\bar R=10.5183\ \mathrm{mm},\qquad s=0.02317\ \mathrm{mm}
$$

本簡化例假設 inputs uncorrelated。

## 2. Estimate 與 sensitivity

$$
y=\bar R-e=10.5183-(-0.02)=10.5383\ \mathrm{mm}
$$

$$
c_R=1,qquad c_e=-1
$$

## 3. Combine

$$
u_c=\sqrt{0.00946^2+0.00289^2+0.0150^2}
=0.01797\ \mathrm{mm}
$$

## 4. Effective degrees of freedom

$$
\nu_{eff}=
\frac{u_c^4}{0.00946^4/5+0.00289^4/\infty+0.0150^4/60}
=42.63
$$

向下取整：

$$
\boxed{\nu_{eff}=42}
$$

## 5. Expand 與 report

$$
k\approx2.02
$$

$$
U=ku_c=(2.02)(0.01797)=0.0363\ \mathrm{mm}
$$

向上化整 $U$，再對齊 $y$：

$$
\boxed{Y=(10.538\pm0.037)\ \mathrm{mm}}
$$

$k=2.02$ 由 $\nu_{eff}=42$ 的 $t$ distribution 取得，約為 $95\%$ coverage。

## 一張防錯表

| 易錯 | 正確 |
|---|---|
| 器差一律加 | 先看器差定義；本例是 $Y=R-e$ |
| Resolution 用 $d/\sqrt3$ | Rounding half-width 是 $d/2$，故 $d/\sqrt{12}$ |
| 直接 RSS 所有 $u(x_i)$ | 先乘 $|c_i|$ 並檢查 covariance |
| $\nu_{eff}=42.63$ 直接查 | 向下取整為 $42$ |
| 永遠取 $k=2$ | 自由度有限時查 $t$ table |
| $U=\pm0.037$ | $U$ 非負；結果才寫 $y\pm U$ |
| 三次讀值相同，故 uncertainty 為零 | 只表示該組 $s=0$；B 類 components 仍存在 |
| Outlier 直接刪 | 先找物理或程序原因 |

## 八步驟口訣

```text
Model → inputs → u(x_i) → covariance → y,c_i
→ u_c,ν_eff → k,U → y ± U
```
