### Summary

The project details has been fully masked, but the rough process of which is shown below.


The project's aim is to create a self-serving tool leveraging on a table of metrics which is tracked on a certain time basis, decomposing the delta into three components:
- Change due to holiday effect
- Change due to actual metric change
- Change due to shifts in dimension proportions

The project has been done through R (shiny and flexdashboard), with some of the features integrated into Tableau dashboards for easier access.

I then use feature importance algorithmns to get a sense of how the specific metric has been trending, how it correlates to other metrics as well as whether or not other metrics are driving some of these changes.


Summarized, the flow of the project is shown below:

![flow](https://user-images.githubusercontent.com/55055667/88377399-af3b9d00-cdd1-11ea-9d45-85f688423532.png)


## Snippets of how the shiny dashboard looks

![dimension](https://user-images.githubusercontent.com/55055667/88377541-fa55b000-cdd1-11ea-95cc-d388c82514f4.png)

![importance](https://user-images.githubusercontent.com/55055667/88377533-f75abf80-cdd1-11ea-8d58-3ed81f2082b8.png)

![MLR](https://user-images.githubusercontent.com/55055667/88377536-f9248300-cdd1-11ea-9e0e-08aaede427fe.png)

![trends](https://user-images.githubusercontent.com/55055667/88377540-f9bd1980-cdd1-11ea-8f63-762eade5c655.png)


