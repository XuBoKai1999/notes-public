# Stage 09｜量測結果與不確定度之表示

> 對應講義：**(2-06) 量測結果與不確定度之表示**

## 四個量

| Quantity | 定義 |
|---|---|
| Combined standard uncertainty | $u_c(y)$ |
| Expanded uncertainty | $U=ku_c(y)$ |
| Relative combined uncertainty | $u_c(y)/|y|$ |
| Relative expanded uncertainty | $U/|y|$ |

$u_c$ 與 $U$ 都是非負值；absolute uncertainty 與 $y$ 使用相容單位。

## Coverage factor

中央約 $95\%$ coverage 且有效自由度有限時：

$$
\boxed{k=t_{0.975,\nu_{eff}}}
$$

若 $\nu_{eff}=10.25$，教材要求先向下取整為 $10$ 再查表。自由度小時，$k$ 可明顯大於 $2$。

測試領域有時依規範採 $k=2$；校正領域通常依 $\nu_{eff}$ 查表。不能算了自由度後仍無條件令 $k=2$。

## 結果表示

$$
\boxed{Y=y\pm U}
$$

或寫成：

$$
[y-U,\ y+U]
$$

報告至少說明：

- measurand 與 estimate $y$；
- expanded uncertainty $U$ 與 unit；
- coverage factor $k$；
- 約略 coverage probability；
- 必要時說明 distribution、$\nu_{eff}$ 與評估方法。

$U$ 本身不寫成 $\pm U$；$\pm$ 只在 $y\pm U$ 出現一次。

## 有效位數

教材原則：

1. 計算途中保留較多位數；
2. 最後才將 uncertainty 化整到至多兩位有效數字；
3. 通常向上化整，避免低估；
4. 再將 $y$ 四捨五入到與 $U$ 相同的小數位。

例如：

$$
y=10.05762\ \Omega,qquad U=0.02644\ \Omega
$$

先將 $U$ 向上化整：

$$
U=0.027\ \Omega
$$

再對齊 $y$：

$$
\boxed{Y=(10.058\pm0.027)\ \Omega}
$$

實際報告應依實驗室程序或適用規範一致化整。

## SI 書寫

- 數字與 unit symbol 間留空格：$15\ \mathrm{mm}$。
- Prefix 與 unit 相連：$17\ \mathrm{km}$。
- Unit symbol 不加複數：`75 cm`，不是 `75 cms`。
- 大小寫不可互換：$\mathrm m$ 是 metre，$\mathrm M$ 是 mega。

最小結論：

$$
\boxed{U=ku_c(y),\qquad Y=y\pm U}
$$

並交代 unit、$k$、coverage probability，讓 $y$ 與 $U$ 的小數位一致。
