# Stage 04｜量測不確定度概論

> 對應講義：**(2-01) 不確定度概論**

## Measurement result 與 measurand

Measurand 是真正想量的 quantity，定義必須包含必要條件，例如「工件在 $20\ ^\circ\mathrm C$ 下的長度」。

Measurement result 是 measurand value 的 estimate，不是真值宣告：

$$
\boxed{\text{result}=\text{estimate }y+\text{其 uncertainty 資訊}}
$$

## Measurement uncertainty

Measurement uncertainty 是基於可用資訊，表徵合理歸給 measurand 的值之離散程度的非負參數。

若：

$$
y=10.000\ \mathrm V,qquad u(y)=0.002\ \mathrm V
$$

$0.002\ \mathrm V$ 不是「已知量錯多少」，而是目前知識的一倍標準差尺度。

## Error 不等於 uncertainty

$$
\boxed{e=y-Y_{true}}
$$

True value 通常未知，所以真正 error 通常也未知。Uncertainty 大不代表實際 error 必然大；評估出的 uncertainty 小，也不保證沒有遺漏 systematic effect。

## Correction 的角色

已辨識且可估計的 systematic effect 應進行 correction，不能用放大 uncertainty 取代修正。

若儀器 reading 為 $25.0\ ^\circ\mathrm C$，已知偏高 $0.5\ ^\circ\mathrm C$：

$$
y=25.0-0.5=24.5\ ^\circ\mathrm C
$$

但 correction 本身仍可能有 uncertainty：

$$
C=-0.50\ ^\circ\mathrm C,qquad u(C)=0.05\ ^\circ\mathrm C
$$

因此 correction 進入 estimate，$u(C)$ 進入 uncertainty budget。

## Uncertainty sources

至少檢查：

- measurand definition 與 sampling；
- reference standard 與 calibration；
- instrument resolution、drift、zero setting；
- environment；
- operator 與 procedure；
- model approximation 與 constants；
- repeated-observation variation。

Instrument specification 只是可能的 component，不等於整個 measurement uncertainty。

## GUM 的核心做法

$$
\boxed{Y=f(X_1,X_2,\ldots,X_N)}
$$

先建立 model，再為每個 input estimate $x_i$ 評估 $u(x_i)$，最後 propagation 到 output。

Type A 與 Type B 只區分 evaluation method：

- Type A：observation series 的 statistical analysis；
- Type B：certificate、specification、resolution、經驗等其他資訊。

兩者最後都成為 standard uncertainty $u(x_i)$。

## 三種 uncertainty 名稱

| 名稱 | 符號 | 意義 |
|---|---|---|
| Standard uncertainty | $u(x_i)$ | 單一 quantity 的一倍標準差尺度 |
| Combined standard uncertainty | $u_c(y)$ | Components propagation 後的 output uncertainty |
| Expanded uncertainty | $U=ku_c(y)$ | 較高 coverage 的 interval half-width |

最小結論：

$$
\boxed{\text{先定義 measurand，再建 model；error、correction 與 uncertainty 不可混用。}}
$$
