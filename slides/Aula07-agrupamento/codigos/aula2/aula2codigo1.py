from nltk.token import *
from nltk.tokenizer import WhitespaceTokenizer
from nltk.probability import FreqDist
from nltk.draw.plot import Plot

freq_dist = FreqDist()
corpus = Token(TEXT=open('dados/may2001_pdf.torto').read())
print corpus
WhitespaceTokenizer().tokenize(corpus)
print corpus

for token in corpus['SUBTOKENS']:
	freq_dist.inc(token['TEXT'])

# Quantas vezes a palavra form aparece no corpus?
freq_dist.count('form')
# Qual é a freqüência da palavra form?
freq_dist.freq('form')
# Quantas palavras foram contadas?
freq_dist.N()
# Quais foram os tipos de palavras encontradas?
freq_dist.samples()
# Qual é a palavra mais comum?
freq_dist.max()
