
library(quantmod)
library(forecast)
library(fpp)

# Loading Google stock data using NASDAQ (GOOG)
from.dat <- as.Date("04/01/14", format = "%m/%d/%y")
to.dat <- as.Date("10/30/17", format = "%m/%d/%y")
getSymbols("GOOG", src = "yahoo", from = from.dat, to = to.dat)
head(GOOG)

# Converting to monthly stocks
mGoog <- to.monthly(GOOG)
head(mGoog)

googOpen <- Op(mGoog)
googOpen

# Creating timeseries
ts1 <- ts(googOpen, frequency = 12)
ts1

# plot time series
plot(ts1, xlab = "Year+1", ylab = "GOOG")

# Decompose the time series
plot(decompose(ts1), xlab = "Years+1")

# Training and Testing Data

ts1Train<-window(ts1,start=1,end=3.5)
plot(ts1Train)

ts1Test<-window(ts1,start=3.5,end=4.5)
plot(ts1Test)

# Forcasting using simple moving average
# For univariate time series
# ETS(A,A,N)
plot(ts1)

goog_ma<-ma(ts1Train, order = 3)
goog_ma_forecast<-forecast(goog_ma)
lines(goog_ma_forecast$fitted, col="red")
lines(goog_ma_forecast$mean, col="blue")

goog_ma<-ma(ts1Train, order = 4)
goog_ma_forecast<-forecast(goog_ma)
lines(goog_ma_forecast$fitted, col="blue")
lines(goog_ma_forecast$mean, col="yellow")

goog_ma<-ma(ts1Train, order = 10)
goog_ma_forecast<-forecast(goog_ma)
lines(goog_ma_forecast$fitted, col="green")
lines(goog_ma_forecast$mean, col="orange")

plot(goog_ma_forecast)
lines(ts1Test)

# Simple exponential smoothing model for short term foecasting
fit<-ses(ts1Train, h=10, alpha = 0.9)
plot(fit)
lines(ts1Test, col="red")
summary(fit)

# Double exponentil smoothing model
# Holt local trend method (Level and Trend)
fit<-holt(ts1Train, h=10)
plot(fit)
lines(ts1Test, col = "red")



fit<-holt(ts1Train, h=10, alpha = 0.9, beta = 0.9)
plot(fit)

ets1<-ets(ts1Train, model = "AAN") # fit model
fcast<-forecast(ets1) #forcast on ets
plot(fcast)
lines(ts1Test, col="red")
fcast

accuracy(fcast, ts1Test)
