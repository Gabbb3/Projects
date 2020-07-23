### Summary

## Objective
Using publicly available data on a specific warrant (underlying share price, underlying share price implied vol, warrant price) listed on the HKEX, construct a real-time, step-by-step self-financing portfolio delta hedging strategy (i.e. minimise tracking error).

## 
A simple tree-based delta hedging model visualization has been constructed in python to easily showcase the portfolio strategy at different time stamps.

This makes it very efficient to quickly rebalance my portfolio at each time stamp.

## Key Results
Over the period of 8 time-stamps, I achieved a consistent tracking error of <1% with minimal rebalancing work.
