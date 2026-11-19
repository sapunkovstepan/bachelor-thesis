library(urca)
library(tseries)
library(vars)

df <- read.csv('/Users/stepansapunkov/Documents/ВКР/Scripts/Structure_models/CG_BA.csv')
head(df)

df <- df[, c("Date", "Z_spread", "CDS_sigma_60", "CDS_IV")]
df$Date <- as.Date(df$Date)
matplot(df$Date, df[-1], type = "l")

# тесты на стац
lapply(df[-1], kpss.test, null = "Level")
lapply(df[-1], \(x) summary(ur.df(x, type = "drift", selectlags = "AIC")))

# тк все ряды нестац то проверю на коинетграцию

CG <- names(df)[3:4]
lags <- sapply(CG, \(x) VARselect(df[, c("Z_spread", x)], lag.max = 100, type = "const")$selection)

K <- setNames(pmax(2, lags["SC(n)", ]), CG)
johansen <- lapply(CG, \(x)
                   summary(ca.jo(df[, c("Z_spread", x)],
                                 type = "trace", ecdet = "const",
                                 K = as.integer(K[x]))))
names(johansen) <- CG
johansen

# Везде есть коинтеграция на 1 уз, далее оценка VECM 
jo <- ca.jo(df[, c("Z_spread", "CDS_IV")], type = "trace", ecdet = "const", K = 12)
vecm <- cajorls(jo, r = 1)
summary(vecm$rlm)

v <- vec2var(jo, r = 1)
# + тест на автокорреляцию остатков (кажется, она есть, что не очень хорошо)
serial.test(v, lags.pt = 40, type = "PT.adjusted")
res <- residuals(v)
acf(res[, 1], main = "resids of CDS_IV")
acf(res[, 2], main = "resids of Z")

plot(irf(v, impulse = "Z_spread", response = "CDS_IV", n.ahead = 150, boot = TRUE, runs = 1000))
plot(irf(v, impulse = "CDS_IV", response = "Z_spread", n.ahead = 150, boot = TRUE, runs = 1000))

# тк разложение по Холецкому проверю другой порядок (ни в стат значимости коэффоф, ни в IRF сильной разницы нет, что хорошо)

jo2 <- ca.jo(df[, c("CDS_IV", "Z_spread")],
             type = "trace", ecdet = "const", K = 12)
vecm2 <- cajorls(jo2, r = 1)
summary(vecm2$rlm)

v2 <- vec2var(jo2, r = 1)

serial.test(v2, lags.pt = 40, type = "PT.adjusted")

plot(irf(v2, impulse = "Z_spread", response = "CDS_IV", n.ahead = 150, boot = TRUE, runs = 1000))
plot(irf(v2, impulse = "CDS_IV", response = "Z_spread", n.ahead = 150, boot = TRUE, runs = 1000))
