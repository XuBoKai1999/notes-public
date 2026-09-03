# Stage 00｜量測不確定度全局地圖

> 目標：先看懂整門課的主線；細節留給後續 Stage。

## 最終要報告什麼？

量測值不能單獨表達我們對結果的認識，通常需報告：

$$
\boxed{Y=y\pm U}
$$

並說明 coverage factor $k$ 與約略 coverage probability，例如：

$$
U=ku_c(y),\qquad k=2,\qquad P\approx95\%
$$

## 唯一主線

```text
定義 measurand
→ 建立 Y=f(X_1,...,X_N)
→ 找出 uncertainty sources
→ 評估每個 u(x_i)
→ 計算 c_i u(x_i)
→ 合成 u_c(y)
→ 決定 k
→ 得到 U
→ 報告 y ± U
```

## 必要概念

### Measurand 與 measurement model

$Y$ 是真正想量的量；必須先明確定義條件，再建立：

$$
\boxed{Y=f(X_1,X_2,\ldots,X_N)}
$$

$X_i$ 是會決定 $Y$ 的 input quantities。

### Standard uncertainty

每個 input estimate $x_i$ 都以一倍標準差尺度表示其 uncertainty：

$$
u(x_i)
$$

- Type A：由 observation series 的統計分析評估。
- Type B：由證書、解析度、規格、經驗等資訊評估。

A/B 是評估方法，不是 random/systematic 的分類。

### Sensitivity coefficient

$$
\boxed{c_i=\frac{\partial f}{\partial X_i}}
$$

Output contribution 的大小為：

$$
\boxed{|c_i|u(x_i)}
$$

### Combination

Inputs uncorrelated 時：

$$
\boxed{u_c(y)=\sqrt{\sum_i c_i^2u^2(x_i)}}
$$

若 inputs correlated，還要加入 covariance terms。

### Expansion

$$
\boxed{U=ku_c(y)}
$$

$k\approx2$ 常對應約 $95\%$ coverage，但自由度有限時應由 Student's $t$ distribution 決定。

## 最小 uncertainty budget

| Input | 評估方法 | $u(x_i)$ | $c_i$ | $|c_i|u(x_i)$ |
|---|---|---:|---:|---:|
| 重複性 | A | $s/\sqrt n$ | 依 model | 依計算 |
| 校正 | B | $U_{cal}/k$ | 依 model | 依計算 |
| 解析度 $d$ | B | $d/\sqrt{12}$ | 依 model | 依計算 |

## Stage 地圖

| Stage | 主題 |
|---:|---|
| 01–03 | 必要統計、機率分配與常態分配 |
| 04 | 不確定度核心概念 |
| 05 | Measurement model |
| 06–07 | Type A / Type B evaluation |
| 08 | Propagation、combination、effective degrees of freedom |
| 09 | Expanded uncertainty 與結果表示 |
| 10 | 完整案例 |

只要記住：

$$
\boxed{Y=f(X_i)\rightarrow u(x_i)\rightarrow c_i u(x_i)\rightarrow u_c\rightarrow U\rightarrow y\pm U}
$$
