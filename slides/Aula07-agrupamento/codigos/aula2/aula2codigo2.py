from nltk.token import *
from nltk.tokenizer import WhitespaceTokenizer
from nltk.probability import FreqDist
from nltk.draw.plot import Plot

# Qual é a distribuição do tamanho das palavras no corpus?
freq_dist = FreqDist()
for token in corpus['SUBTOKENS']:
	freq_dist.inc(len(token['TEXT']))

# Desenha os resultados
wordlens = freq_dist.samples()

# Ordena a lista
wordlens.sort()

# cria uma tupla com um numero de frequencia e a sua
# respectiva distribuicao
# para visualizar execute o comanto print points
points = [(l, freq_dist.freq(l)) for l in wordlens]
Plot(points)
print points

# Qual é a distribuição do tamanho das palavras que terminal com
# vogais?
VOWELS = ('a','e','i','o','u')

freq_dist = FreqDist()
for token in corpus['SUBTOKENS']:
	if token['TEXT'][-1].lower() in VOWELS:
		freq_dist.inc(len(token['TEXT']))

# Desenha os resultados
wordlens = freq_dist.samples()
wordlens.sort()
points = [(l,freq_dist.freq(l)) for l in wordlens]
Plot(points)	
