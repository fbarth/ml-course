from nltk.tokenizer import *
from nltk.tagger import *
text_token = Token(TEXT="John saw 3 polar bears .")
WhitespaceTokenizer().tokenize(text_token)

% definicao de uma tagger default
% simplesmente define todos os atomos como noun (nn)

my_tagger = DefaultTagger('nn')
print text_token
my_tagger.tag(text_token)
print text_token

% quando usada em conjunto com outros taggers, uma
% tagger default eh muito util para aumentar o 
% desempenho do algoritmo.

%
% usando expressoes regulares como tagger
% 

NN_CD_tagger = RegexpTagger([r'0-9]+(.[0-9+)?$', 'cd'), (r'.*', 'nn')])

% este tagger atribui para numeros cardinais cd e para qualquer outra 
% coisa nn

NN_CD_tagger.tag(text_token)
print text_token

