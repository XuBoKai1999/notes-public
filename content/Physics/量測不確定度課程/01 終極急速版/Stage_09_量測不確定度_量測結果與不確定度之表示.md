# Stage 09｜結果表示・考前急速版

## 四種 uncertainty

| Quantity | 公式／單位 |
|---|---|
| Combined standard | $u_c(y)$，與 $y$ 同單位 |
| Expanded | $U=ku_c(y)$，與 $y$ 同單位 |
| Relative combined | $u_c(y)/|y|$，無因次 |
| Relative expanded | $U/|y|$，無因次 |

## 正確報告

$$
\boxed{Y=y\pm U}
$$

必須附：

| 項目 | 內容 |
|---|---|
| $U$ | 明說是 expanded uncertainty |
| $k$ | Coverage factor |
| Coverage | 約略 probability，例如 $95\%$ |
| 必要資訊 | $\nu_{eff}$、distribution、method / model |

$U$ 本身非負，不寫成 $y\pm(\pm U)$。

## 自由度與 factor

$$
k=t_{0.975,\nu_{eff}}
$$

$\nu_{eff}$ 先向下取整再查表。規範允許時可用 $k=2$；自由度小時不可無條件使用。

## 位數順序

1. 計算途中保留多位。
2. 最後將 uncertainty 化整到至多兩位有效數字，通常向上。
3. 再將 $y$ 四捨五入到與 $U$ 相同小數位。

例：

$$
y=10.05762\ \Omega,quad U=0.02644\ \Omega
$$

$$
\boxed{Y=(10.058\pm0.027)\ \Omega}
$$

## SI 快查

| 規則 | 正確例 |
|---|---|
| 數字與 unit 間空格 | `15 mm` |
| Prefix 與 unit 相連 | `17 km` |
| Unit symbol 無複數 | `75 cm` |
| 大小寫不可換 | $\mathrm m\neq\mathrm M$ |
