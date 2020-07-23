## Summary

### Objective
Using publicly available data on a specific warrant (underlying share price, underlying share price implied vol, warrant price) listed on the HKEX, construct a real-time, step-by-step self-financing portfolio delta hedging strategy (i.e. minimise tracking error).

### Key Works
A simple tree-based delta hedging model visualization has been constructed in python to easily showcase the portfolio strategy at different time stamps.

#### Underlying Asset Price
![Asset Price](https://user-images.githubusercontent.com/55055667/88270022-9666b500-cd07-11ea-974b-3a8941ef1c53.png)

#### European Call Price
![Call Price](https://user-images.githubusercontent.com/55055667/88270062-a7172b00-cd07-11ea-9a46-cc45f3e93f5d.png)

#### Hedging Strategy
![Hedging Strategy](https://user-images.githubusercontent.com/55055667/88270091-b1392980-cd07-11ea-9ce4-66f018420fdd.png)


This made it very efficient to quickly rebalance my portfolio at each time stamp.

### Key Results
Over the period of 8 time-stamps, I achieved a consistent tracking error of <1% with minimal rebalancing work.
