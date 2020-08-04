## Summary
### Problem Statement
To be able to understand drivers of employee ratings on their employers recently, and whether these drivers are positively impacting employer ratings in Singapore.

### Insights
Results from the exploratory phase reveals that the key overall review drivers in Singapore using LDA can be grouped into 3 clusters as seen below. Breaking it down into industries of larger representation (e-commerce, banks, etc.) reveals that the review drivers are pretty consistent.

Company reviews by Singapore employees revolve around three broad issues. Namely, 1) Management - How well the team/company is being led by the Management, Benefits/Renumeration and 3) Culture/Team - Whether the team fosters a learning environment for professional growth. 

This is inline with an economic research done by Glassdoor themselves (https://www.glassdoor.com/research/employee-satisfaction-drivers/#:~:text=There%20are%20three%20main%20drivers,is%20the%20third%20strongest%20predictor%2C), revealing that the top 3 drivers are 1) Culture/Values, 2) Quality of Senior Leadership, 3) Career Opportunities)

Overall (Management, Benefits/Renumeration, Culture/Team):

![k3 LDA](https://user-images.githubusercontent.com/55055667/87762849-58b8e680-c846-11ea-954f-07c40cb1e8ab.png)


I also had a quick look as key topics when aggregated by some of the key players (by count) in specific industries.
E-commerce (Amazon/Shopee/Lazada):

![k3 LDA - ecommerce](https://user-images.githubusercontent.com/55055667/87763352-3ecbd380-c847-11ea-8188-51715f2f4bb7.png)


Banks (DBS, Citibank, JPM):

![k3 LDA - banks](https://user-images.githubusercontent.com/55055667/87916704-653b7a00-caa6-11ea-9a4e-e0f30d6b7542.png)


### Next we look towards sentiment analysis (using supervised training) to take a look at the relative performance of these drivers, with emphasis on key topics presented earlier.
We first simplify the problem from 5-class (ratings 1-5) to a 3-class (Negative[1-2], Neutral[3], Positive[4-5]).

Next we do a train-test split of (80/20), perform a fitting tfidf vectorization of the train inputs, and apply it on the test inputs as well.
We then used SVC (linear kernel) to train the supervised model to predict sentiment category (Negative/Neutral/Positive), based on their actual ratings given.

Evaluating the model results on the test set reveals relatively good performance of MCC of 0.924 as seen below.

![svm_overall_classreport](https://user-images.githubusercontent.com/55055667/87911567-6ff21100-ca9e-11ea-8f5a-b189c28b7a24.png)

We then take a look at the classification reports when cut by the topics predicted. It also reveals good performance of similar MCC.

![svm_topics_classreport](https://user-images.githubusercontent.com/55055667/87913619-f6f4b880-caa1-11ea-903f-4302ccc56267.png)

Next, we took a look at net sentiment scores (Negative: -1, Neutral: 0, Positive: +1) by the respective topics as well.

![svm_topics_net_sentiment](https://user-images.githubusercontent.com/55055667/87915954-65874580-caa5-11ea-8452-fc6312d77697.png)

The class prediction was relatively accurate, with actual and predicted net sentiment scores differing by at most 0.2 on the test data set.


### Key Taekeaways
The results of this reveals that those whose ratings were driven by Management were generally more satisfied about their jobs compared to Benefits/Renumeration as well as Team/Culture. 

Nonetheless it is important to note that these three topics identified have gotten positive net sentiment scores and were all important to driving higher ratings.
This analysis helps cement the fact that job satisfaction has been less about just purely renumeration and benefits, but employees themselves are looking towards meeting the higher levels of needs with respect to Maslow's hierarchy - Esteem and Self-actualization. While many more detailed research has been done to substantiate this claim, it is interesting to note that a simple text analysis on glassdoor on the Singapore employment landscape has strongly backed up the hypothesis as well.


### Others / Future steps and improvements
On a side note, We also looked into using prebuilt models such as VADER, TextBlob, CoreNLP and Flair along with methods like Naive Bayes (Unigram to 5-gram).
Codes of which is saved in the codes folder. It is also interesting to note the performance of such models.


As future steps and with a better GPU, I could efficiently look into a more detailed performance evaluation across the entire data-set using the variety of trained and pre-trained as mentioned previously (SVM, Vader, Textblob, NB etc.) and improve the performance of prediction.


Also, after ascertaining the importance of the top three drivers, we could perform a simple word cloud analysis to better understand deeper what drives sentiment scores within the specific topics themselves. E.g. Which parts of benefits/renumeration led to higher/lower ratings? Was it more annual leave, flexible work from home options or higher pay?


We could also expand this project on a more granular scale by zooming top/worst performing companies in Singapore and understand what is driving this performance. Techniques could be similar.


## Flow of project

Preprocessing
  - Scrapping reviews off of Glassdoor
  - Merging columns needed
  - Remove punctuation, stopwords, tokenizer, lemmatizer (NLTK)
  
Topic Modelling (Overall as well as across industries)
  - using Genism, build LSI and LDA models
  - Visualize split using pyLDAvis

Sentiment Analysis
  - SVM
    - TFIDF Vectorizer

Analysis
  - Net sentiment scores
  - How to interpret the results?
  - Key takeaways
