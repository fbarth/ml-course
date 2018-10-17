# Resolucao da questao 2.9

from math import *
from nltk.token import *
from nltk.tokenizer import WhitespaceTokenizer
from nltk.probability import FreqDist

def calculaEntropia (documento):
	freq_dist = FreqDist()
	corpus = Token(TEXT=open(documento).read())
	WhitespaceTokenizer().tokenize(corpus)
	for token in corpus['SUBTOKENS']:
		freq_dist.inc(token['TEXT'])
	entropia = 0
	for i in freq_dist.samples():
		entropia = entropia + (freq_dist.freq(i) * log(freq_dist.freq(i),2))
	return - entropia

#def KL(documentoP, documentoQ):
	


# Imprime a entropia do documento dados/may2001_pdf.torto
print calculaEntropia('dados/may2001_pdf.torto')

