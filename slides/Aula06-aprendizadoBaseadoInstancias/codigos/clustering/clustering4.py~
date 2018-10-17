from nltk.token import *
from nltk.tokenizer import WhitespaceTokenizer
from nltk.clusterer import * 

tokens = [Token(FEATURES=numarray.array([3, 3])),
             Token(FEATURES=numarray.array([1, 2])),
             Token(FEATURES=numarray.array([4, 2])),
             Token(FEATURES=numarray.array([4, 0]))]

clusterer = KMeansClusterer(3, euclidean_distance)
clusterer.cluster(tokens, True)

token = Token(FEATURES=numarray.array([3, 3]))
clusterer.classify(token)
print token

token = Token(FEATURES=numarray.array([1, 2]))
clusterer.classify(token)
print token

token = Token(FEATURES=numarray.array([4, 2]))
clusterer.classify(token)
print token

token = Token(FEATURES=numarray.array([4, 0]))
clusterer.classify(token)
print token


clusterer2 = GroupAverageAgglomerativeClusterer(1,True,None)
clusterer2.cluster(tokens,True)

clusterer2.dendogram().show()
