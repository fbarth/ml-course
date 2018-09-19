# Um exemplo da lei de Zipf

from nltk.token import *
from nltk.tokenizer import WhitespaceTokenizer
from nltk.probability import FreqDist
from nltk.draw.plot import Plot
freq_dist = FreqDist()

corpus = Token(TEXT=open('dados/may2001_pdf.torto').read())
WhitespaceTokenizer().tokenize(corpus)

for token in corpus['SUBTOKENS']:
	freq_dist.inc(token['TEXT'])

wordcount = freq_dist.samples()
#points = [(freq_dist.freq(l),l) for l in wordcount]
#points.sort()

x = 0
points = list(wordcount)
for l in wordcount:
	points[x] = (freq_dist.count(l),x)
	x = x + 1
points.sort()


print points
Plot(points)