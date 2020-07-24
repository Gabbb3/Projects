library(ggfortify)
library(tseries)
library(forecast)

#Load data into time series object
data<-ts(read.delim("C:/Gabriel/MSc Analytics/MH8141 - Time Series Analysis/Proj/airpassenger.dat",sep=" "),frequency = 12)

frequency(data)

#Plot Data
ts.plot(data)
ts.plot(log(data))
summary(data)

#Decompose data to find components
decomposed_data<-decompose(data,"multiplicative")
autoplot(decomposed_data)#trend and seasonal components are present

#Transform data to remove seasonal component (Use log to remove as multiplicative decomp was done)
data_noseason<-exp(log(data)-log(decomposed_data$seasonal))
ts.plot(data_noseason)

#Plot ACF
acf(data) #If ACF does not cut off, data is not stationary
acf(data_noseason) #ACF does indeed not cut off

#Plot PACF
pacf(data)
pacf(data_noseason)

adf.test(data_noseason[,1])# p-value= 0.4079 >0.05, accept null hypothesis. Time series is not stationary even after removing seasonality

############################################################################################################################
#Building Initial Model

#Find the order of seasonal differencing needed to make series stationary
nsdiffs(data)#seasonal component can be modelled by (0,1,0)

#Find the order of regular differencing needed to make series stationary
ndiffs(data)# 1st order regular differencing is needed

#Perform 1st order differencing
diff1<-diff(data_noseason[,1])
diff_data_noseason<-cbind(data_noseason[,1],diff1)
#diff_data_noseason
ts.plot(diff_data_noseason)
acf(diff1) #Cuts off at lag 4 months, suggest MA(4)
pacf(diff1)#Cuts off at lag 8 months, suggest AR(8)

# Model 1: AR(8) with 1st order diff and 1st order seasonal diff
fit1=arima(data[,1],order=c(8,1,0),seasonal = list(order = c(0,1,0), period = 12),method="ML")
fit1
fit1$residuals
acf(fit1$residuals)#Cuts off at lag 12, can improve by using ARIMA(8,1,12)
pacf(fit1$residuals)#all residuals lie inside the boundaries

# Model 2: MA(12) with 1st order diff
fit2=arima(data[,1],order=c(0,1,12),seasonal = list(order = c(0,1,0), period = 12),method="ML")
fit2
fit2$residuals
acf(fit2$residuals)#all residuals lie inside the boundaries
pacf(fit2$residuals)#all residuals lie inside the boundaries


###########################################################################################################################
#Improving Model 1
#ACF and PACF for ARIMA(8,1,12)
fit1b=arima(data[,1],order=c(8,1,12),seasonal = list(order = c(0,1,0), period = 12),method="ML")
fit1b
fit1b$residuals
acf(fit1b$residuals)#all residuals lie inside the boundaries
pacf(fit1b$residuals)#all residuals lie inside the boundaries

###############################################################################################################
# Selection of Final Model

# Model 1: ARIMA(8,1,12)
# Diagnostic check for Improved Model 1
tsdiag(fit1b)
fit1b
#Standardized residuals fluctuate around 0, indicating it is white noise
#ACF of residuals lie between boundaries
#All p values are above 0.05, accept null hypothesis, model is adequate
#aic = 1018.52

# Model 2: ARIMA(0,1,12)
# Diagnostic check for Model 2
tsdiag(fit2)
fit2
#Standardized residuals fluctuate around 0, indicating it is white noise
#ACF of residuals lie between boundaries
#All p values are above 0.05, accept null hypothesis, model is adequate
#1011.93

# Model 3: Use auto.arima to find optimal model to fit original data
fit3=auto.arima(data, d=NA, D=NA, max.p=20, max.q=20,)
tsdiag(fit3)
fit3
#auto.arima suggested model ARIMA(2,1,1)(0,1,0)[12] 
#AIC=1010.56

# AIC for Model 3 is the lowest. ARIMA(2,1,1)(0,1,0)[12]  is selected as the final model.

#################################################################################################################
plot(1:143,data[,1])
lines(1:143, data[,1], type="l" )
lines(1:143, data[,1]-fit1b$residuals, type="l", col="red")

forecast=predict(fit3,n.ahead = 36) # 36 months reflect 3 years
lines(144:179, forecast$pred, type="o", col="red")
lines(144:179, forecast$pred-1.96*forecast$se, col="blue")
lines(144:179, forecast$pred+1.96*forecast$se, col="blue")
