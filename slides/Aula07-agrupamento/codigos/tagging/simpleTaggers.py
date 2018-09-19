from nltk.tokenizer import *
from nltk.tagger import *
# incorporando o corpus chamado Brown
from nltk.corpus import brown

text_token = Token(TEXT="John saw 3 polar bears .")

#
# identifica os atomos de uma frase
# e imprime
#

WhitespaceTokenizer().tokenize(text_token)
print text_token

#
# cria um tagger padrão onde todos os atomos
# sao substantivos (noun) identificados como nn 
#

my_tagger = DefaultTagger('nn')
my_tagger.tag(text_token)
print text_token

#
# taggers padrão são uteis quando associadas a
# outras taggers. Isto aumenta o desempenho dos
# algoritmos 
#

#
# uso de expressões regulares em taggers
#
# nesta tagger todos os numeros sao identificados como
# cardinais (cd) e o restante como (nn)
#

NN_CD_tagger = RegexpTagger([(r'[0-9]+(.[0-9]+)?$', 'cd'), (r'.*', 'nn')])
NN_CD_tagger.tag(text_token)
print text_token

#
# Este metodo pode ser generalizado para determinar a correta tag 
# para palavras. Tudo isto baseado em certos prefixos e sufixos.
# Por exemplo, palavras em Inglês que comecam com "un" geralmente
# sao adjetivos
#
