### Summary

The project details has been fully masked, but the rough process of which is shown below.


The project's aim is to create a self-serving tool leveraging on a table of metrics which is tracked on a certain time basis, decomposing the delta into three components:
- Change due to holiday effect
- Change due to actual metric change
- Change due to shifts in dimension proportions

E.g. Overall change in metric from previous period : +5%
- Change due to holiday = +2%
- Change due to actual metric change = +2%
- Change due to shifts in dimension proportions = +1%


The project has been done through R (shiny and flexdashboard), with some of the features integrated into Tableau dashboards for easier access.

Summarized, the flow of the project is shown below:

![flow](https://user-images.githubusercontent.com/55055667/88377399-af3b9d00-cdd1-11ea-9d45-85f688423532.png)


I then use feature importance algorithmn (Boruta) to understand drivers of the metric of interest and how it correlates to other metrics as well.

Both simple linear regressions, multiple linear regression, trend and scatter plots are done using the top drivers identified via Boruta, to understand potential linear relationships to the metric of interest.


Using outputs from multiple linear regression, we do the same decomposition as above, tagging a value of change to each of the top drivers.

E.g. Change in target metric due to actual metric changes = +2%
- Change due to driver A = +2.5%
- Change due to driver B = +1.5%
- Change due to driver C = -2.0%


This allows the user to understand how the drivers have impacted the target metric from a linear relationship assumption standpoint.



