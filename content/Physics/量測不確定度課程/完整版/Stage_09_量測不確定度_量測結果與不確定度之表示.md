# Stage 9｜量測結果與不確定度之表示

> 對應講義：**(2-06) 量測結果與不確定度之表示**  
> 本 Stage 將 $u_c(y)$ 轉成適當的 expanded uncertainty，並以正確位數、單位與說明報告量測結果。

---

## 1. 三種表示量先分清楚

### Combined standard uncertainty

$$
u_c(y)
$$

它是一倍標準差尺度，應與 estimate $y$ 具有相同單位。

### Expanded uncertainty

$$
\boxed{U=ku_c(y)}
$$

它用來形成具有較高 coverage probability 的區間。

### Relative uncertainty

$$
u_{c,r}(y)=\frac{u_c(y)}{|y|},\qquad
U_r=\frac{U}{|y|}
$$

Relative uncertainty 是無因次的非負值，可用百分比或適當比值單位表示。

## 2. Standard uncertainty 與 expanded uncertainty 的用途

教材指出，基礎計量研究、基本物理常數量測與國際單位制複現比對，常直接使用 $u_c$。一般校正或測試報告則常用 expanded uncertainty $U$，方便使用者理解較高 coverage 的區間。

當量測範圍跨越多個數量級，或受測量本身是比值特性時，relative expanded uncertainty $U_r$ 往往比固定 absolute uncertainty 更容易比較。

## 3. Coverage factor 不是永遠等於 2

若 effective degrees of freedom 已求得，中央約 $95\%$ coverage 的 factor 由 $t$ distribution 取得：

$$
k=t_{0.975,\nu_{\mathrm{eff}}}
$$

教材的實務區分是：

- 測試領域常依規範簡化使用 $k=2$；
- 校正領域常依 $\nu_{\mathrm{eff}}$ 查 $t$ table；
- $\nu_{\mathrm{eff}}$ 小時，$k$ 可能明顯大於 $2$。

若計算得到：

$$
\nu_{\mathrm{eff}}=10.25
$$

應先無條件捨去：

$$
\nu_{\mathrm{eff}}=10
$$

再查表，而不是已算自由度卻仍直接指定 $k=2$。

## 4. 報告 combined standard uncertainty

若報告 $u_c(y)$，至少應提供：

- measurand 與 estimate $y$；
- combined standard uncertainty $u_c(y)$；
- 單位；
- effective degrees of freedom $\nu_{\mathrm{eff}}$；
- measurement model、評估方法或可追溯到其完整說明的文件。

例如：

$$
y=10.058\ \Omega,\qquad u_c(y)=0.027\ \Omega
$$

## 5. 報告 expanded uncertainty

常用形式為：

$$
\boxed{Y=y\pm U}
$$

或等價區間：

$$
[y-U,\ y+U]
$$

同時必須說明：

- $U$ 是 expanded uncertainty；
- coverage factor $k$；
- coverage probability 或 confidence level 的近似值；
- 必要時說明 $k$ 是由哪個 distribution 與自由度取得。

例如：

> 量測結果為 $Y=(10.058\pm0.027)\ \Omega$。所報 expanded uncertainty 為 combined standard uncertainty 乘以 coverage factor $k=2.00$，相對應約 $95\%$ 的 coverage probability。

不要寫成：

$$
Y=y\pm(\pm U)
$$

$U$ 本身是非負的 interval half-width，不另加 $\pm$。

## 6. 不確定度的有效位數

教材規則是：

- 不確定度通常至多保留兩位有效數字；
- 計算途中保留較多位，最後才化整；
- 通常向上化整，以避免低估；
- 教材也列出依適用規則例外採一般化整的情況。

例如：

$$
u_c(y)=26.44\ \mathrm{m\Omega}
\quad\Rightarrow\quad
27\ \mathrm{m\Omega}
$$

教材列出的例外為：

$$
u_c(y)=28.05\ \mathrm{kHz}
\quad\Rightarrow\quad
28\ \mathrm{kHz}
$$

實際出具報告時，應依實驗室既定程序或適用規範一致處理，不能在不同結果間任意改變規則。

## 7. Estimate 與 uncertainty 的小數位要對齊

量測值 $y$ 使用一般四捨五入，並修整到與最後 $U$ 相同的小數位。

若：

$$
y=10.05762\ \Omega
$$

$$
U=27\ \mathrm{m\Omega}=0.027\ \Omega
$$

則：

$$
y=10.058\ \Omega
$$

報告為：

$$
\boxed{Y=(10.058\pm0.027)\ \Omega}
$$

不是讓 $y$ 保留很多位而 $U$ 只有少數位，也不是先把所有中間 quantities 過早化整。

## 8. Absolute 與 relative uncertainty

假設：

$$
y=1.000053\ \mathrm V
$$

$$
U_r=65\ \mathrm{\mu V/V}
$$

則 absolute expanded uncertainty 為：

$$
U=|y|U_r
$$

計算 relative quantity 時要先統一 prefix；$65\ \mathrm{\mu V/V}=65\times10^{-6}$。

## 9. SI 單位書寫

教材提醒：

- 數字與 unit symbol 之間留一個空格，例如 $15\ \mathrm{mm}$；
- prefix 與 unit symbol 相連，例如 $17\ \mathrm{km}$；
- unit symbol 不加複數，例如 $75\ \mathrm{cm}$，不是 `75 cms`；
- 大小寫有意義，例如 $\mathrm m$ 是 metre，$\mathrm M$ 是 mega；
- $y$ 與 absolute uncertainty 必須使用相容單位。

## 10. 報告前的最小檢查

| 檢查項目 | 問題 |
|---|---|
| Measurand | 量的是什麼、在什麼條件下？ |
| Estimate | $y$ 是否包含必要 correction？ |
| Uncertainty | 報的是 $u_c$ 還是 $U$？ |
| Coverage | 是否交代 $k$ 與約略 coverage probability？ |
| Degrees of freedom | 有計算時是否先向下取整再查表？ |
| Digits | $U$ 是否至多兩位有效數字，$y$ 是否對齊小數位？ |
| Units | 數值、prefix 與 unit symbol 是否一致？ |

## 11. Stage 9 最小記憶包

$$
\boxed{U=ku_c(y)}
$$

$$
\boxed{Y=y\pm U}
$$

完整報告至少要說：

$$
\boxed{y,\ U,\ \text{unit},\ k,\ \text{coverage probability}}
$$

位數原則：

> **最後才化整 uncertainty；$y$ 再修整到與 $U$ 相同的小數位。**

## Stage 9 完成條件

完成本 Stage 後，應能：

1. 區分 $u_c$、$U$、$u_{c,r}$ 與 $U_r$；
2. 說明何時不能直接令 $k=2$；
3. 正確寫出 $Y=y\pm U$；
4. 同時報告 $k$ 與 coverage probability；
5. 將 uncertainty 化整到至多兩位有效數字；
6. 將 $y$ 的小數位與 $U$ 對齊；
7. 正確使用 SI unit symbols 與 prefixes。

---

下一 Stage：**Stage 10｜不確定度評估案例與注意事項**。將用卡尺量測案例走完八大步驟，並整理常見錯誤。
