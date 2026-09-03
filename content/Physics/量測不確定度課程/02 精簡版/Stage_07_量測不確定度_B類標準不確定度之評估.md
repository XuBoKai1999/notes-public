# Stage 07｜B 類標準不確定度之評估

> 對應講義：**(2-04) B 類標準不確定度之評估**

## B 類評估

Input estimate 不是由此次 observation series 取得時，依 calibration certificate、specification、resolution、past data、handbook 或工程知識評估 $u(x_i)$，稱為 Type B evaluation。

```text
釐清原始資訊與範圍
→ 選合理 distribution
→ 換成一倍 standard deviation
→ 指定或估算 ν_i
```

## 常用換算

令 $a$ 為 half-width：

| 資訊 | Standard uncertainty |
|---|---:|
| Rectangular bounds $\pm a$ | $a/\sqrt3$ |
| Triangular bounds $\pm a$ | $a/\sqrt6$ |
| U-shaped bounds $\pm a$ | $a/\sqrt2$ |
| Resolution $d$，rounding 為 $\pm d/2$ | $d/\sqrt{12}$ |
| Certificate 給 $U$ 與 $k$ | $U/k$ |
| Certificate 已給 $u_c$ | 直接引用 |

只有 bounds 且區間內沒有其他資訊時，才採 rectangular。若已知中央最可能，可採 triangular；若兩端較可能，可採 U-shaped。

## Calibration certificate 例

$$
U_{cal}=0.003\ \mathrm{mm},\qquad k=2.04
$$

$$
\boxed{u_{cal}=\frac{0.003}{2.04}=0.00147\ \mathrm{mm}}
$$

若 certificate 明示此 $k$ 由 $\nu_{eff}=30$ 的 $t$ distribution 取得，便引用 $\nu=30$，不要另猜自由度。

## B 類自由度

若 standard uncertainty 本身的 relative uncertainty 為：

$$
R\%=\frac{\Delta u(x_i)}{u(x_i)}\times100\%
$$

教材依 GUM Annex G.4.2 使用：

$$
\boxed{\nu_i=\frac12\left(\frac{100}{R}\right)^2}
$$

例如 $R=10$ 時 $\nu=50$；完全採信明確資訊而取 $R=0$ 時，$\nu=\infty$。

$R$ 是「對所估 $u(x_i)$ 有多不確定」，不是 measurement quantity 本身的 relative uncertainty。

## 最小判斷

看到 $\pm a$ 時，先確認它是 full width、half-width、coverage interval 還是 expanded uncertainty。Type B 不是任意選一個除數，而是：

$$
\boxed{\text{讓 distribution 忠實表達現有資訊，再取其 standard deviation。}}
$$
