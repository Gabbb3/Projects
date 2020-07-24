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

ACF:


