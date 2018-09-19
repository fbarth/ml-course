#
# Anteriormente, nos tentamos inferir a tag de um atomo
# baseado apenas no texto do atomo.
# Agora vamos usar informacoes sobre o contexto de um atomo
# (palavras que estao ao seu entorno) para inferir a sua tag.
#

#
# Bigram Taggers: utiliza sempre a palavra mais proxima do atomo
# Geralmente, a anterior 
#
# N-gram Taggers: utiliza sempre a n palavra mais proxima do atomo
# Geralmente, a n-palavra anterior.
#


from nltk.tokenizer import *
from nltk.tagger import *
from nltk.corpus import brown

tagger = NthOrderTagger(3, SUBTOKENS='WORDS') # 3rd order tagger
for item in brown.items()[:10]:
	tok = brown.read(item)
	tagger.train(tok)


# utilizacao

text_token = Token(TEXT="John saw the book on the table")
WhitespaceTokenizer(SUBTOKENS='WORDS').tokenize(text_token)
tagger.tag(text_token)
print text_token






