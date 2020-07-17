### Problem Statement
To be able to understand drivers of employee ratings on their employers recently, and whether these drivers differ across industries in Singapore.

### Insights
Results from the exploratory phase reveals that the key overall review drivers in Singapore using LDA can be grouped into 3 clusters as seen below.

Overall (Management, Career prospects/Benefits, Team/Environment):

![k3 LDA](https://user-images.githubusercontent.com/55055667/87762849-58b8e680-c846-11ea-954f-07c40cb1e8ab.png)

Breaking it down into industries of larger representation (e-commerce, banks, etc.) reveals that the review drivers are pretty consistent.

E-commerce:

![k3 LDA - ecommerce](https://user-images.githubusercontent.com/55055667/87763352-3ecbd380-c847-11ea-8188-51715f2f4bb7.png)


### Flow of project

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
