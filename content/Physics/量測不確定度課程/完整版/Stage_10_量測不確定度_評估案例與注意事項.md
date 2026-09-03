# Stage 10｜不確定度評估案例與注意事項

> 對應講義：**(2-07) 不確定度評估案例與注意事項**  
> 本 Stage 以數位卡尺量測白板筆直徑，將前面各 Stage 串成一份完整 uncertainty budget。

---

## 1. 案例範圍

本案例適用於一般使用者的簡化評估。若精準度要求較高，還要依實際 procedure 考慮歸零、刻度誤差、阿貝誤差、溫度、接觸力、工件幾何等 effects。

核心八步驟是：

```text
1. 建立 measurement model
2. 決定 input estimates
3. 評估各 u(x_i)
4. 評估 covariance
5. 計算 y 與 sensitivity coefficients
6. 計算 u_c(y) 與 ν_eff
7. 選 k 並計算 U
8. 報告 y ± U
```

## 2. Step 1：建立 measurement model

受測量 $Y$ 是白板筆直徑；$R$ 是卡尺 reading；$e$ 是校正報告定義的卡尺器差：

$$
e=\text{器示值}-\text{標準值}
$$

因此 correction 應取 $-e$，measurement model 為：

$$
\boxed{Y=R-e}
$$

器差的正負號必須先由 certificate 定義確認，不能看到數字就一律相加。

## 3. Step 2：列出 inputs 與 uncertainty sources

教材把卡尺 reading 的 uncertainty 再拆成兩項：

- $R_1$：重複性；
- $R_2$：digital resolution。

另一個 input 是：

- $e$：卡尺器差及其 calibration uncertainty。

本 worked example 使用教材後段的一組資料：

$$
10.50, 10.54, 10.52, 10.49, 10.51, 10.55\ \mathrm{mm}
$$

並已知：

$$
d=0.01\ \mathrm{mm}
$$

$$
e=-0.02\ \mathrm{mm}
$$

$$
U(e)=0.03\ \mathrm{mm},\qquad k=2.00
$$

## 4. Step 3：評估 standard uncertainties

### $R_1$：重複性，Type A

六次平均值與樣本標準差為：

$$
\bar{R}=10.5183\ \mathrm{mm}
$$

$$
s(R_1)=0.02317\ \mathrm{mm}
$$

量測結果使用六次平均，因此：

$$
u(R_1)=\frac{s(R_1)}{\sqrt6}=0.00946\ \mathrm{mm}
$$

$$
\nu(R_1)=6-1=5
$$

### $R_2$：解析度，Type B

Round-off 範圍為 $\pm d/2$，採 rectangular distribution：

$$
u(R_2)=\frac{d}{\sqrt{12}}
=\frac{0.01}{\sqrt{12}}
=0.00289\ \mathrm{mm}
$$

若完全採信 resolution definition，教材的作法取：

$$
\nu(R_2)=\infty
$$

### $e$：校正報告，Type B

$$
u(e)=\frac{U(e)}{k}
=\frac{0.03}{2.00}
=0.0150\ \mathrm{mm}
$$

教材以 $k=2.00$ 對應的 $t$ table 資訊取：

$$
\nu(e)=60
$$

## 5. Step 4：評估 covariance

本例只有重複性 component 由實際 observation series 評估，resolution 與 certificate value 視為固定資訊，且沒有共同資料或共同 effect 的證據，因此依教材簡化假設：

$$
r(R_1,R_2)=r(R_1,e)=r(R_2,e)=0
$$

這是本案例的 assumption，不是「Type A 與 Type B 必然無相關」。若 inputs 共用 reference standard、environment 或 data，仍須評估 covariance。

## 6. Step 5：計算 estimate 與 sensitivity coefficients

由：

$$
Y=R-e
$$

得到：

$$
y=10.5183-(-0.02)=10.5383\ \mathrm{mm}
$$

Sensitivity coefficients：

$$
c_R=\frac{\partial Y}{\partial R}=1
$$

$$
c_e=\frac{\partial Y}{\partial e}=-1
$$

所以三個 contribution magnitudes 都等於各自的 standard uncertainty。

## 7. Step 6：計算 $u_c(y)$ 與 $\nu_{\mathrm{eff}}$

Inputs 視為 uncorrelated：

$$
u_c(y)=
\sqrt{u^2(R_1)+u^2(R_2)+u^2(e)}
$$

$$
u_c(y)=
\sqrt{0.00946^2+0.00289^2+0.0150^2}
=0.01797\ \mathrm{mm}
$$

Welch–Satterthwaite formula：

$$
\nu_{\mathrm{eff}}=
\frac{u_c^4(y)}{
u^4(R_1)/5+u^4(R_2)/\infty+u^4(e)/60}
$$

$$
\nu_{\mathrm{eff}}=42.63
$$

依教材向下取整：

$$
\boxed{\nu_{\mathrm{eff}}=42}
$$

## 8. Step 7：選擇 $k$ 並計算 $U$

中央約 $95\%$ coverage、$\nu_{\mathrm{eff}}=42$ 時：

$$
k\approx2.02
$$

所以：

$$
U=ku_c(y)
$$

$$
U=(2.02)(0.01797)=0.0363\ \mathrm{mm}
$$

依教材原則向上化整到兩位有效數字：

$$
\boxed{U=0.037\ \mathrm{mm}}
$$

## 9. Step 8：結果與 uncertainty budget

將 estimate 修整到與 $U$ 相同的小數位：

$$
\boxed{Y=(10.538\pm0.037)\ \mathrm{mm}}
$$

並附註：所報 expanded uncertainty 為 combined standard uncertainty 乘以 $k=2.02$；$k$ 由有效自由度 $42$ 的 $t$ distribution 取得，相對應約 $95\%$ coverage。

| Uncertainty source | Type / distribution | $u(x_i)$ / mm | $c_i$ | $|c_i|u(x_i)$ / mm | $\nu_i$ |
|---|---|---:|---:|---:|---:|
| 重複性 $R_1$ | A / observations | $0.00946$ | $1$ | $0.00946$ | $5$ |
| 解析度 $R_2$ | B / rectangular | $0.00289$ | $1$ | $0.00289$ | $\infty$ |
| 卡尺器差 $e$ | B / certificate | $0.0150$ | $-1$ | $0.0150$ | $60$ |

彙整結果：

$$
y=10.5383\ \mathrm{mm},\quad
u_c(y)=0.01797\ \mathrm{mm},\quad
\nu_{\mathrm{eff}}=42,
$$

$$
k=2.02,\qquad U=0.037\ \mathrm{mm}
$$

## 10. 讀值完全相同時

教材另有三次讀值都為 $20.01\ \mathrm{mm}$ 的練習。此時由該三筆資料算得：

$$
s=0
$$

只能說這組資料沒有觀察到 repeatability scatter，不能說整個 measurement uncertainty 為零。Resolution、calibration uncertainty 等 Type B components 仍存在；若有適用的歷史 repeatability data，也比把短小樣本的零標準差當成長期能力更可靠。

## 11. 高精度卡尺校正 model

教材後段將卡尺校正寫成：

$$
d=L_R-L_S-E
$$

其中：

- $d$：卡尺器差；
- $L_R$：換算至 $20\ ^\circ\mathrm C$ 的卡尺 reading；
- $L_S$：換算至 $20\ ^\circ\mathrm C$ 的標準件長度；
- $E$：temperature 綜合影響。

此時 uncertainty sources 可再包含 $L_R$ 的 repeatability、resolution、zero setting、scale error、Abbe error，以及 $L_S$ 的 traceability、period-to-period difference 與 temperature effect。這說明 model 依 measurement purpose 與 accuracy requirement 而定，沒有唯一的固定清單。

## 12. 教材整理的常見錯誤

| 錯誤 | 正確處理 |
|---|---|
| 只寫 $Y=f(x_1,\ldots,x_n)$ | 寫出可推導 sensitivity coefficients 的實際 equation |
| 得到負的 $u(x)$ | Standard uncertainty 必為非負值 |
| 發現 outlier 就直接刪除 | 先以 box plot 等方法辨識，再找物理或程序原因 |
| 混淆 full width 與 half-width | 先確認規格定義；$\pm a$ 中的 $a$ 才是 half-width |
| $R\%=80\%$ 仍硬算 B 類自由度 | 重新檢查 estimate；教材建議 $R\%\leq50\%$ |
| 算了 $\nu_{\mathrm{eff}}$ 卻固定用 $k=2$ | 向下取整後查 $t$ table |
| 忽略 $c_i$，直接組合所有 $u(x_i)$ | 先換成 output contributions $|c_i|u(x_i)$ |
| $U$ 寫成 $\pm U$ 再放入 $y\pm U$ | $U$ 是非負 half-width，只在結果中寫一次 $\pm$ |
| $y$ 與 $U$ 位數不同 | 最後化整 $U$，再把 $y$ 對齊相同小數位 |
| $u_c$ 小就認為系統一定穩定 | 檢查是否遺漏重要 uncertainty source |

## 13. Stage 10 最小記憶包

完整主線只有：

$$
\boxed{
Y=f(X_i)
\rightarrow
u(x_i)
\rightarrow
c_i u(x_i)
\rightarrow
u_c(y)
\rightarrow
\nu_{\mathrm{eff}}
\rightarrow
k
\rightarrow
U
\rightarrow
y\pm U
}
$$

案例中最關鍵的三個判斷是：

1. 器差定義決定 correction sign；
2. resolution $d$ 對應 $d/\sqrt{12}$；
3. 有限自由度時不能無條件令 $k=2$。

## Stage 10 完成條件

完成本 Stage 後，應能：

1. 從 measurand 建立可計算的 measurement model；
2. 建立 uncertainty budget 並標示 Type、distribution、$u(x_i)$、$c_i$ 與 $\nu_i$；
3. 判斷是否需納入 covariance；
4. 計算 $y$、$u_c(y)$、$\nu_{\mathrm{eff}}$、$k$ 與 $U$；
5. 正確化整並報告 $Y=y\pm U$；
6. 知道簡化案例的適用範圍，精度要求提高時回到 model 增加有實質影響的 sources。
