# Stage 10｜不確定度評估案例與注意事項

> 對應講義：**(2-07) 不確定度評估案例與注意事項**  
> 簡化案例：以 digital caliper 量測白板筆直徑。

## 1. Model 與資料

令 $R$ 為 caliper reading，$e$ 為 certificate 定義的器差：

$$
e=\text{器示值}-\text{標準值}
$$

所以：

$$
\boxed{Y=R-e}
$$

教材資料：

$$
10.50, 10.54, 10.52, 10.49, 10.51, 10.55\ \mathrm{mm}
$$

$$
d=0.01\ \mathrm{mm},qquad
e=-0.02\ \mathrm{mm}
$$

$$
U(e)=0.03\ \mathrm{mm},qquad k=2.00
$$

Uncertainty sources 為 repeatability $R_1$、resolution $R_2$ 與 calibration uncertainty of $e$。

## 2. Standard uncertainties

### Repeatability：Type A

$$
\bar R=10.5183\ \mathrm{mm},qquad
s(R_1)=0.02317\ \mathrm{mm}
$$

$$
u(R_1)=\frac{s(R_1)}{\sqrt6}=0.00946\ \mathrm{mm},qquad
\nu(R_1)=5
$$

### Resolution：Type B / rectangular

$$
u(R_2)=\frac{d}{\sqrt{12}}=0.00289\ \mathrm{mm},qquad
\nu(R_2)=\infty
$$

### Certificate：Type B

$$
u(e)=\frac{U(e)}{k}=\frac{0.03}{2.00}=0.0150\ \mathrm{mm}
$$

依教材的 $t$ table 對應：

$$
\nu(e)=60
$$

## 3. Covariance、estimate 與 sensitivity

本簡化案例沒有共同 data 或共同 effect 的證據，因此假設 inputs uncorrelated。這不是 Type A 與 Type B 必然無相關。

$$
y=\bar R-e=10.5183-(-0.02)=10.5383\ \mathrm{mm}
$$

$$
c_R=1,qquad c_e=-1
$$

## 4. Combination 與 effective degrees of freedom

$$
u_c(y)=\sqrt{u^2(R_1)+u^2(R_2)+u^2(e)}
$$

$$
u_c(y)=\sqrt{0.00946^2+0.00289^2+0.0150^2}
=0.01797\ \mathrm{mm}
$$

$$
\nu_{eff}=
\frac{u_c^4(y)}{
u^4(R_1)/5+u^4(R_2)/\infty+u^4(e)/60}
=42.63
$$

向下取整：

$$
\boxed{\nu_{eff}=42}
$$

## 5. Expansion 與報告

中央約 $95\%$ coverage：

$$
k\approx2.02
$$

$$
U=ku_c(y)=(2.02)(0.01797)=0.0363\ \mathrm{mm}
$$

向上化整到兩位有效數字，並對齊 estimate：

$$
\boxed{Y=(10.538\pm0.037)\ \mathrm{mm}}
$$

所報 $U$ 為 $u_c(y)$ 乘以 $k=2.02$；$k$ 由 $\nu_{eff}=42$ 的 $t$ distribution 取得，相對應約 $95\%$ coverage。

## 6. Uncertainty budget

| Source | Type / distribution | $u(x_i)$ / mm | $c_i$ | Contribution / mm | $\nu_i$ |
|---|---|---:|---:|---:|---:|
| Repeatability $R_1$ | A | $0.00946$ | $1$ | $0.00946$ | $5$ |
| Resolution $R_2$ | B / rectangular | $0.00289$ | $1$ | $0.00289$ | $\infty$ |
| 器差 $e$ | B / certificate | $0.0150$ | $-1$ | $0.0150$ | $60$ |

## 7. 最少但重要的注意事項

- 器差定義決定 correction sign。
- $u(x)$ 與 $U$ 必為非負值。
- Full width、half-width 與 resolution 不可混用。
- Outlier 先找原因，不為縮小 $u$ 而直接刪除。
- 先乘 sensitivity coefficient，再組合 contributions。
- $\nu_{eff}$ 向下取整後才查 $t$ table。
- $U$ 只在 $y\pm U$ 中加一次 $\pm$。
- 重複讀值相同而得到 $s=0$，不代表 resolution、calibration 等 components 為零。
- $u_c$ 異常小時，先檢查是否漏掉重要 source。

本案例只適合一般使用。精度要求提高時，可將 model 擴成：

$$
d=L_R-L_S-E
$$

再依實際 procedure 納入歸零、刻度、Abbe error、reference traceability、期間差異與 temperature effects。

## 全課主線

$$
\boxed{
Y=f(X_i)
\rightarrow u(x_i)
\rightarrow c_i u(x_i)
\rightarrow u_c(y)
\rightarrow \nu_{eff}
\rightarrow k
\rightarrow U
\rightarrow y\pm U
}
$$
