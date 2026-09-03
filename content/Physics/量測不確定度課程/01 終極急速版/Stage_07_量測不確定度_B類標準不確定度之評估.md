# Stage 07｜B 類評估・考前急速版

## 四步驟

```text
讀懂原始資訊 → 確認 half-width / coverage → 選 distribution → 算 u 與 ν
```

## 必背換算

| 資訊 | $u(x_i)$ |
|---|---:|
| Rectangular $\pm a$ | $a/\sqrt3$ |
| Triangular $\pm a$ | $a/\sqrt6$ |
| U-shaped $\pm a$ | $a/\sqrt2$ |
| Resolution $d$ | $d/\sqrt{12}$ |
| Certificate 給 $U,k$ | $U/k$ |
| Certificate 已給 $u_c$ | 直接引用 |

| Distribution | 何時選？ |
|---|---|
| Rectangular | 只有 bounds，區間內無更多資訊 |
| Triangular | 中央較可能 |
| U-shaped | 兩端較可能 |
| Normal | 證書或資訊已給 standard deviation / coverage |

## B 類自由度

$$
R\%=\frac{\Delta u(x_i)}{u(x_i)}\times100\%
$$

$$
\boxed{\nu_i=\frac12\left(\frac{100}{R}\right)^2}
$$

| $R$ | $\nu$ |
|---:|---:|
| $0\%$ | $\infty$ |
| $5\%$ | $200$ |
| $10\%$ | $50$ |
| $20\%$ | $12.5$ |
| $50\%$ | $2$ |

$R$ 是「對所估 $u$ 有多不確定」，不是 measurand 的 relative uncertainty。Certificate 已提供自由度時優先直接引用。

## 最易錯

- $\pm a$ 中 $a$ 是 half-width；resolution $d$ 的 half-width 是 $d/2$。
- 先讀 certificate 定義，再決定除 $k$ 或直接引用。
- Type B 是非此次重複觀測的評估，不等於 systematic effect。
