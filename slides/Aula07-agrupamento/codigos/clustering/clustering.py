from nltk.token import *
from nltk.tokenizer import WhitespaceTokenizer
from nltk.clusterer import * 

corpus = Token(TEXT=open('dados/may2001_pdf.torto').read())
WhitespaceTokenizer().tokenize(corpus)
print corpus
a = []
for token in corpus['SUBTOKENS']:
	a.append(token['TEXT'])
print a

clusterer = KMeansClusterer(2, euclidean_distance)
clusterer.cluster(corpus, True)

demo()
