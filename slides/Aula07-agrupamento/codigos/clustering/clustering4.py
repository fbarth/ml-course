from nltk.token import *
from nltk.tokenizer import WhitespaceTokenizer
from nltk.clusterer import * 

tokens=[Token(FEATURES=['x', 'y', 'z']),
        Token(FEATURES=['x', 'y', 'z']),
	Token(FEATURES=['x', 'y', 'z']),
	Token(FEATURES=['x', 'y', 'z'])]

clusterer2 = GroupAverageAgglomerativeClusterer(1,True,None)
clusterer2.cluster(tokens,True)

clusterer2.dendogram().show()
