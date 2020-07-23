## Summary
### Objective
Aim to get a sense of what is causing users of an inhouse service to churn away (opt out) of using it.

Unfortunately, time dedicated to this project is relatively short and specific details have been omitted due to compliance requirements.

However, a simplified structure will be showcased instead.

### Context
The company has recently launched an inhouse technology and other than receiving direct verbatim feedback from users, the company also wants to use internal data collected to see when and what is causing users of this service to churn away (opt out).

The data extracted comprises of the last 10 transaction details of each user, along with the current classification of the user themselves (whether they are classified as Churned or Engaged)

### Flow of the project
- Dataset extraction, data cleaning and feature engineering has been masked.

- To simplify the project into binary classification, we first only filter down to Churned and Engaged users. This removes <10% of the data set.

- These two groups are also the polar opposites of each other, and other classes which are removed fall between these two.

- We then use expand_grid and rejoin back the data, as not all users of have had at least 10 transactions using the inhouse service.

- Next, we do a train-test split and perform min-max scaling to scale the data as the data is relatively fairly distributed.

- Lastly, we reshape the input data into its required dimensions and run a 10-step LSTM model, with validation on test-set
  - (X users, 10 steps, 14 features)
  - Sequential model (keras)
  - 2 relu LSTM layers
  - Initially tested with a dropout layer and other combinations
  - Sigmoid output layer

- Training results
![epochs](https://user-images.githubusercontent.com/55055667/88266354-b09d9480-cd01-11ea-8daa-0d3dafc55bb8.png)


### Conclusion and next steps
Validation accuracy: 69%

Definitely, the validation results show that much needed improvement is required in the fine-tuning of the LSTM architecture.
However, running further analysis using the SHAP feature importance shows that two features are important which also coincide with domain knowledge and intuition.
It will be interesting to see if these two features still hold as important as the model goes through improvement.

Zooming down to these two features has given the team a sense of direction on which features to give greater focus on to further test and improve upon in order to increase retention of the inhouse service.
