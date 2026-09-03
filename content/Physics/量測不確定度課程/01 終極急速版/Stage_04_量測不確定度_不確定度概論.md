# Stage 04｜不確定度概論・考前急速版

## 名詞一眼分清

| 概念 | 核心意思 |
|---|---|
| Measurand | 真正想量的 quantity，條件要定義清楚 |
| Estimate $y$ | 對 measurand value 的最佳估計，不是真值宣告 |
| Error $e=y-Y_{true}$ | 結果與 true value 的差；通常未知 |
| Correction $C$ | 對已知 systematic effect 的修正 |
| Uncertainty $u$ | 可合理歸給 measurand 的值之離散程度；非負 |

## Correction 與 uncertainty

已知 bias 應修正：

$$
y=x+C
$$

但 correction 仍可能不精確：

$$
u(C)>0
$$

所以「已 correction」不等於「該 effect 不再有 uncertainty」。

## Type A / B

| Type | 評估依據 |
|---|---|
| A | Observation series 的 statistical analysis |
| B | Certificate、specification、resolution、past data、engineering judgment |

兩者最後都成為 $u(x_i)$；不是 random / systematic 的同義詞。

## 常見 sources

| 類別 | 例 |
|---|---|
| Definition / sampling | Measurand 條件不完整、樣品不具代表性 |
| Instrument | Calibration、resolution、drift、zero |
| Environment | Temperature、humidity、vibration |
| Procedure / model | Operator、alignment、approximation |
| Data | Repeatability |

Instrument specification 只是 component，不是整個 uncertainty。

## 三種 uncertainty

| 名稱 | 符號 |
|---|---|
| Standard uncertainty | $u(x_i)$ |
| Combined standard uncertainty | $u_c(y)$ |
| Expanded uncertainty | $U=ku_c(y)$ |

底線：先定義 measurand，再建立 $Y=f(X_1,\ldots,X_N)$。
