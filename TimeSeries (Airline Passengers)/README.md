## Time Series Forecast of International Airline Passengers
### Context
This project will be focusing on analyzing the time series from [International Airline Passengers: Monthly Totals in Thousands (Jan’49 - Dec’60)]. 
This dataset was originally used by Box and Jenkins in their work in 1976. 
It was collected as part of TimeSeries Dataset Library (TSDL) along with various other time series datasets by Professor Rob Hyndman at Monash University, Australia. 
Later, the TSDL was moved to DataMarket.


### Objective
Aim: We will be demonstrating our understanding of how to fit appropriate ARIMA models to applicable real-life data sets. 
The resultant models may be used to forecast the following months’ total passengers based on the data as well as smoothing of the original series.


### Choice of initial model
Visually, the original data seems to be on an upward trend with a seasonal component.

![initial_plot](https://user-images.githubusercontent.com/55055667/88371949-9a5a0c00-cdc7-11ea-8147-4e9938fc09fc.png)


Decomposition of the data, using a multiplicative approach, shows the same. 
A multiplicative approach is used as the plot above shows that the seasonal amplitude or variance of Y (monthly totals of airline passengers) increases over time.

![initial_decomp](https://user-images.githubusercontent.com/55055667/88372064-d2614f00-cdc7-11ea-8611-2a383e863f75.png)


Following which, we then proceeded to remove the seasonal component so as to better understand the underlying data. 
Below was the result after removing seasonal effects after using log-transformation. 
We can see that the variation has been significantly reduced, which would allow a more meaningful basis for prediction.

![plot_remove_seasonality](https://user-images.githubusercontent.com/55055667/88372197-02105700-cdc8-11ea-9906-2503cf76e277.png)


We then continued to assess the stationarity of this, leveraging on ACF and PACF methodologies.

ACF - The ACF plot shows that ACF dies down slowly; ACF does not cut off at a certain point. This shows that the data is not stationary
![initial_ACF](https://user-images.githubusercontent.com/55055667/88372405-6c28fc00-cdc8-11ea-959e-cebccbbbe7ac.png)

PACF
![initial_PACF](https://user-images.githubusercontent.com/55055667/88372411-6f23ec80-cdc8-11ea-8e73-fba62840cb63.png)

![stationarity](https://user-images.githubusercontent.com/55055667/88372556-b7dba580-cdc8-11ea-8795-b7beff0368a2.png)


### Differencing
Next we proceed to find out the order of differencing on both the seasonal data and regular data needed to make the time series stationary. 
For this we utilize the forecast package, specifically the nsdiff and ndiff functions.

Results for nsdiff and ndiff show that 1st order differencing is needed for both instances.
We achieve the below plot of the post-adjusted data after performing first order differencing, as well as the ACF and PACF results.

![diff_plot](https://user-images.githubusercontent.com/55055667/88372663-f2454280-cdc8-11ea-8da0-b80eea69b022.png)

ACF:
![diff_ACF](https://user-images.githubusercontent.com/55055667/88372666-f40f0600-cdc8-11ea-993f-09e720e07bb1.png)

PACF:
![diff_PACF](https://user-images.githubusercontent.com/55055667/88372673-f6716000-cdc8-11ea-86e3-de53653a62e6.png)


Our ACF results show a cutoff at month 12, suggesting MA(12) model, whereas our PACF model shows a cutoff at month 8, suggesting a AR(8) model.


#### Model 1 - AR(8)
Fitting the data onto a AR(8) model produces the following results.

![AR8_1](https://user-images.githubusercontent.com/55055667/88372790-2de00c80-cdc9-11ea-9600-a1f0812d362f.png)

![AR8_2](https://user-images.githubusercontent.com/55055667/88372784-2c164900-cdc9-11ea-82ba-9f5d7dd1c4ce.png)

![AR8_3](https://user-images.githubusercontent.com/55055667/88372789-2d477600-cdc9-11ea-85b9-ae47b9ceee42.png)

Whilst all residuals in the PACF plot lie within the boundaries, ACF plot shows a cut off at lag 12, implying that an ARIMA (8,1,12) could be a possible improvement.


#### Model 2 - MA(12)
Fitting the data onto an MA(12) model produces the following results.

![MA12_1](https://user-images.githubusercontent.com/55055667/88372885-5f58d800-cdc9-11ea-8064-5b5195598b3a.png)

![MA12_2](https://user-images.githubusercontent.com/55055667/88372880-5d8f1480-cdc9-11ea-85f8-ef874fc36d66.png)

![MA12_3](https://user-images.githubusercontent.com/55055667/88372883-5ec04180-cdc9-11ea-947f-243304a17a43.png)

For our second model (MA(12)), residuals from both ACF and PACF lie within the boundaries.

## Improving Model 1 - Adding MA(12) to ARIMA(8,1,0)

Following the results from Model 1 (ARIMA(8,1,0)), we further implement MA(12) and obtain the following results.

![ARIMA_8112_1](https://user-images.githubusercontent.com/55055667/88373100-c8d8e680-cdc9-11ea-81b3-6b0ef77e7ff4.png)

![ARIMA_8112_2](https://user-images.githubusercontent.com/55055667/88373095-c7a7b980-cdc9-11ea-9d46-7c1eac41fae2.png)

![ARIMA_8112_3](https://user-images.githubusercontent.com/55055667/88373098-c8d8e680-cdc9-11ea-9071-12409a5bd623.png)

Results from our ARIMA(8,1,12) model show that the residuals from both ACF and PACF lie within the boundaries.

In the next section, we will be comparing diagnostic checks on three selected models - 1. ARIMA(8,1,12), 2. ARIMA(0,1,12) as well as a third model using the auto.arima function.


## Model Comparison (AIC)

Diagnostic checks

To perform our diagnostic checking, we will be using the Ljung-Box statistic, which is a test that examines autocorrelations of the residuals. The test determines whether or not errors are White Noise (i.e. the errors are independent and identically distributed). If the autocorrelations of the residuals are very small, we say that the model does not show ‘significant lack of fit’.

The null hypothesis of the Ljung-Box statistic, H0, is that our model does not show lack of fit. The alternate hypothesis, Ha, is that the model does show a lack of fit.

A significant p-value rejects the null hypothesis that the time series is not autocorrelated. In the same vein, a p-value higher than the significance level would mean that we fail to reject the null hypothesis and implies that the fitted model can describe the dependence structure of a time series adequately. The test will be done at a significance level α of 0.05.

### Model 1 - ARIMA(8,1,12)

![diag_ARIMA8112](https://user-images.githubusercontent.com/55055667/88373370-50265a00-cdca-11ea-977b-77b0d942c859.png)

Based on the plot of Standardized Residuals, we observe that it is patternless, and they behave like white noise. The ACF curve also lies very comfortably within the boundaries indicated by the blue lines. Given that the p-values are > 0.05, we fail to reject the null hypothesis. The model is thus adequate.


### Model 2 - ARIMA(0,1,12)

![diag_ARIMA0112](https://user-images.githubusercontent.com/55055667/88373376-51f01d80-cdca-11ea-8856-5da122261c32.png)

Similarly to Model 1, the standardized residuals fluctuate around zero without any specific pattern, indicating that it is White Noise. The chart of the ACF is within the blue boundaries, and the p-values for the Ljung-Box statistic is also much higher than 0.05. We do not reject the null hypothesis, and the model is adequate.


### Model 3 - Auto ARIMA

![diag_autoARIMA](https://user-images.githubusercontent.com/55055667/88373374-51578700-cdca-11ea-8cac-a33b8b2f7380.png)

For Model 3, we also see that the standardized residuals do not exhibit any pattern, and can be considered as White Noise. The ACF curve lies within the boundaries, and p-values for the Ljung-Box statistic is > 0.05, hence indicating that the model is also adequate.


As such, for all 3 models above, we can conclude that they pass the diagnostic checking and we can proceed to model selection.


## Model Selection
Given all 3 models passed the diagnostic checking, we will select the final model that minimizes the Akaike’s Information Criterion (AIC) statistic, a criterion which allows us to compare the fit of different models.


Output of Model 1 - ARIMA(8,1,12)
![AIC_ARIMA8112](https://user-images.githubusercontent.com/55055667/88373607-b612e180-cdca-11ea-80f9-e8c04f216e86.png)


Output of Model 2 - ARIMA(0,1,12)
![AIC_ARIMA0112](https://user-images.githubusercontent.com/55055667/88373612-b7dca500-cdca-11ea-9821-60c576522696.png)


Output of Model 3 - auto.arima function
![AIC_autoARIMA](https://user-images.githubusercontent.com/55055667/88373609-b7440e80-cdca-11ea-927c-e81911c7b3d2.png)


Comparing the AIC values between all 3 models, we conclude that Model 3 gives us the best fit as it has the lowest AIC value of 1010.56. Hence, Model 3 is chosen.


## Forecast
![Forecast](https://user-images.githubusercontent.com/55055667/88373811-1a35a580-cdcb-11ea-9656-3a5245802aec.png)

Model 3 was then used to generate predictions and the predicted values are plotted against observations as shown in the plot above. Overall, the model fits generally well to the observations. The mean absolute error is calculated to be 9.17 passengers.


![Forecast_2](https://user-images.githubusercontent.com/55055667/88373813-1bff6900-cdcb-11ea-92d4-2ec53ce101b0.png)

Passengers forecasted for the next 3 years from year 1961 to 1964 are plotted as shown above. The relatively narrow 95% confidence interval enables more precise population estimates.
