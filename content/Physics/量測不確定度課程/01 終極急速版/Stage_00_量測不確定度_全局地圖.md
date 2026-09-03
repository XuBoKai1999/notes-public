# Stage 00｜全局地圖・考前急速版

## 一條主線

$$
\boxed{Y=f(X_i)\rightarrow u(x_i)\rightarrow c_i u(x_i)\rightarrow u_c(y)\rightarrow U=ku_c(y)\rightarrow Y=y\pm U}
$$

| 步驟 | 只問這件事 |
|---:|---|
| 1 | Measurand $Y$ 到底是什麼？ |
| 2 | 哪些 inputs $X_i$ 決定 $Y$？ |
| 3 | 每個 input 的 standard uncertainty $u(x_i)$？ |
| 4 | $c_i=\partial f/\partial X_i$ 把 input 影響換到 output |
| 5 | 合成 combined standard uncertainty $u_c(y)$ |
| 6 | 取 coverage factor $k$，得 $U=ku_c(y)$ |
| 7 | 報告 $Y=y\pm U$，註明 $k$ 與 coverage |

## 必背

| 情況 | 公式 |
|---|---|
| Type A，結果取 $n$ 次平均 | $u_A=s/\sqrt n$ |
| Rectangular half-width $a$ | $u=a/\sqrt3$ |
| Digital resolution $d$ | $u=d/\sqrt{12}$ |
| Input contribution | $u_i(y)=|c_i|u(x_i)$ |
| Inputs uncorrelated | $u_c=\sqrt{\sum_i c_i^2u^2(x_i)}$ |
| Expanded uncertainty | $U=ku_c$ |

## 三個底線

1. Type A / B 是評估方法，不是 random / systematic。
2. Estimate 為零，不代表 uncertainty 為零。
3. $k\approx2$ 常約為 $95\%$ coverage，但自由度小時要查 $t$ table。
