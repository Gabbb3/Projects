### Problem Statement
To be able to understand drivers of employee ratings on their employers recently, and whether these drivers differ across industries in Singapore.

### Insights [INSERT PICTURES]
During the exploratory phase, topic modelling across different countries showed very similar drivers (Management, Culture, Worklife Balance, Benefits).
Zooming into Singapore, the key overall drivers using LDA can be grouped into 3 clusters as seen below 
(Management, Career prospects/Benefits, Team/Environment):
![k3 LDA](https://user-images.githubusercontent.com/55055667/87762849-58b8e680-c846-11ea-954f-07c40cb1e8ab.png)


I did an industry breakdown across those with larger representation - IT, Business services and Manufacturing.


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
