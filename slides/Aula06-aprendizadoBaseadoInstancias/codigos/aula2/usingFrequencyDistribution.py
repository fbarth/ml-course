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

# How many times did "the" occur?
freq_dist.count('the')

# What was the frequency of the word "the"?
freq_dist.freq('the')

# How many word tokens were counted?
freq_dist.N()

# What word types were encountered?
freq_dist.samples()

# What was the most common word?
freq_dist.max()

# What is the distribution of word lengths in a corpus?
freq_dist = FreqDist()
for token in corpus['SUBTOKENS']:
	freq_dist.inc(len(token['TEXT']))

# Plot the results.
wordlens = freq_dist.samples()

# Ordena a lista
wordlens.sort()

# cria uma tupla com um numero de frequencia e a sua
# respectiva distribuicao
# para visualizar execute o comanto print points
points = [(l, freq_dist.freq(l)) for l in wordlens]	Plot
Plot(points)
print points

# What is the distribution of word lenths for words that
# end in vowels?
VOWELS = ('a','e','i','o','u')

freq_dist = FreqDist()
for token in corpus['SUBTOKENS']:
	if token['TEXT'][-1].lower() in VOWELS:
		freq_dist.inc(len(token['TEXT']))

#Plot the results
wordlens = freq_dist.samples()
wordlens.sort()
points = [(l,freq_dist.freq(l)) for l in wordlens]
Plot(points)	


# Conditional frequency distributions

cfdist = ConditionalFreqDist()

# Indexador que representa a condicao da distribuicao
cfdist['a']

# Armazena o tamanho das palavras que comeca com a letra a
for token in corpus['SUBTOKENS']:
	if token['TEXT'][0] in ('A','a'):
		print token['TEXT'][0]
		cfdist['a'].inc(len(token['TEXT']))

# das palavras que comecam com 'a', quantas possuem 3 caracteres?
cfdist['a'].freq(3)

# lista as condicoes existentes
cfdist.conditions()

# In this example, we use a ConditionalFreqDist to examine
# how the distribution of a word's length is affected by the word's
# initial letter.

from nltk.token import *
from nltk.tokenizer import WhitespaceTokenizer
from nltk.probability import ConditionalFreqDist
from nltk.draw.plot import Plot
corpus = Token(TEXT=open('dados/may2001_pdf.torto').read())
WhitespaceTokenizer().tokenize(corpus)
cfdist = ConditionalFreqDist()

#How does initial letter affect word length?
for token in corpus['SUBTOKENS']:
	outcome = len(token['TEXT'])
	condition = token['TEXT'][0].lower()
	cfdist[condition].inc(outcome)

#Plot the distribution of word lengths for words starting with 'a'
wordlens = cfdist['a'].samples()
wordlens.sort()
points = [(l, cfdist['a'].freq(l)) for l in wordlens]
Plot(points)

#Plot the frequency of 3-letter-words for each initial letter
conditions = cfdist.conditions()
conditions.sort()
# ord(c) =  Returns integer ASCII value of c
# cfdist[c].freq(3) = returns the frequency distribution for condition c
points = [(ord(c),cfdist[c].freq(3)) for c in conditions]
Plot(points)

#
# Prediction
#
from nltk.token import *
from nltk.tokenizer import WhitespaceTokenizer
from nltk.probability import ConditionalFreqDist
corpus = Token(TEXT=open('dados/may2001_pdf.torto').read())
WhitespaceTokenizer().tokenize(corpus)
cfdist = ConditionalFreqDist()

# We examine each token in the corpus, and increment the appropriate
# sample's count. We use the variable context to record the text of
# the preceeding word.

context = None # The text of the preceeding word
for token in corpus['SUBTOKENS']:
	outcome = token['TEXT']
	#dado a condicao context o que vem depois (outcome)
	cfdist[context].inc(outcome)
	print context , outcome
	context = token['TEXT']

# Depois de construido uma distribuicao condicional para o corpus de 
# treinamento, nos podemos usar os valores para encontrar a palavra 
# que mais se adequa ao contexto.

cfdist['prediction'].max()
cfdist['problems'].max()
cfdist['in'].max()

# we can set up a simple loop to generate text, by using the most likely
# token for each word as the context for the next word

word = 'machine'
for i in range(15)
	print word,
	word = cfdist[word].max()


#
# Probability Distributions
#

import random
def roll2():
	return (random.choice([1,2,3,4,5,6])+ random.choice([1,2,3,4,5,6]))

#
# Estimating Probabilities for an experiment
#
# The Maximum Likelihood Estimate is implemented by the 
# MLEProbDist class. The MLEProbDist construtor takes a
# frequency distribution, and creates the corresponding
# MLE probability distribution.
#

from nltk.token import *
from nltk.tokenizer import WhitespaceTokenizer
from nltk.probability import FreqDist
from nltk.probability import MLEProbDist
from nltk.draw.plot import Plot

freq_dist = FreqDist()
corpus = Token(TEXT=open('dados/may2001_pdf.torto').read())
WhitespaceTokenizer().tokenize(corpus)

for token in corpus['SUBTOKENS']:
	freq_dist.inc(token['TEXT'])

prob_dist = MLEProbDist(freq_dist)

# P(x) = freq(x)
prob_dist.prob('the')
freq_dist.freq('the')

#
# Estimating the probability distribution for roll2
#

import random
from nltk.token import *
from nltk.tokenizer import WhitespaceTokenizer
from nltk.probability import FreqDist
from nltk.probability import MLEProbDist

def roll2():
	return (random.choice([1,2,3,4,5,6])+ random.choice([1,2,3,4,5,6]))

# How often does each outcome of roll2 occur?
freq_dist = FreqDist()
for i in range(500):
	freq_dist.inc(roll2())

# Estimate the probability distribution of roll2
prob_dist = MLEProbDist(freq_dist)

# We can query the probability distribution to find 
# the probability for each outcome

for i in range(12):
	print prob_dist.prob(i)

for i in range(12):
	print freq_dist.freq(i)

#
# Outras distribuicoes de probabilidade implementadas pelo NLTK:
# - LaplaceProbDist
# - ELEProbDist
# - LidstoneProbDist
# - HeldoutProbDist
# - CrossValidation

#
# Distribuicao de probabilidade condicional
#

