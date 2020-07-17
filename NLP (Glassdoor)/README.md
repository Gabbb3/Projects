## Summary
### Problem Statement
To be able to understand drivers of employee ratings on their employers recently, and whether these drivers differ across industries in Singapore.

### Insights
Results from the exploratory phase reveals that the key overall review drivers in Singapore using LDA can be grouped into 3 clusters as seen below. Breaking it down into industries of larger representation (e-commerce, banks, etc.) reveals that the review drivers are pretty consistent.

Company reviews by Singapore employees revolve around three broad issues. Namely, 1) Management - How well the team/company is being led by the management team, 2) Company benefits/Renumeration and 3) Team/Environment - Whether the team fosters a learning environment for professional growth. 

This is inline with an economic research done by Glassdoor themselves (https://www.glassdoor.com/research/employee-satisfaction-drivers/#:~:text=There%20are%20three%20main%20drivers,is%20the%20third%20strongest%20predictor%2C), revealing that the top 3 drivers are 1) Culture/Values, 2) Quality of Senior Leadership, 3) Career Opportunities)

Overall (Management, Career prospects/Benefits, Team/Environment):

![k3 LDA](https://user-images.githubusercontent.com/55055667/87762849-58b8e680-c846-11ea-954f-07c40cb1e8ab.png)


E-commerce:

![k3 LDA - ecommerce](https://user-images.githubusercontent.com/55055667/87763352-3ecbd380-c847-11ea-8188-51715f2f4bb7.png)


### Next we look towards sentiment analysis to see relative performance of these drivers, with emphasis on key topics presented earlier as well as key industries such as IT, Business services and Manufacturing.
Due to the limitations of data available, we approached it from a more global approach, including countries such as India and London.




### We also looked into using prebuilt models such as VADER, TextBlob, CoreNLP and Flair along with methods like Naive Bayes (Unigram to 5-gram).
Codes of which is saved in the codes folder.

As future steps and with a better GPU, I could efficiently look into a more detailed performance evaluation across the entire data-set using the variety of trained and pre-trained as mentioned previously (SVM, Vader, Textblob, NB etc.)


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
