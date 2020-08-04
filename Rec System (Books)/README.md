## Summary

### Objective

Using the popular BX data (http://www2.informatik.uni-freiburg.de/~cziegler/BX/), create a recommender system using item-based collaborative filtering.
Due to the sparse dataset in such datasets, I will be using matrix factorization to find out the latent factors which will be used in ratings prediction.

Matrix Factorization:

![MF](https://user-images.githubusercontent.com/55055667/89267138-66090a00-d669-11ea-8db8-4ebb6464818e.png)


### Key Results

While the dataset was reduced to USA/Canada due to computational limitations, it was still interesting to see some books recommended to readers of a certain book.

The system at first glance seems accurate - With LOTR (Fellowship of the Ring) as the base, the top 4 books recommended was of the same LOTR franchise too.

![Results](https://user-images.githubusercontent.com/55055667/89266590-ad42cb00-d668-11ea-9985-999c9e66e505.png)

### Next Steps

It will be interesting to look into scalable recommender systems via SparkML.
