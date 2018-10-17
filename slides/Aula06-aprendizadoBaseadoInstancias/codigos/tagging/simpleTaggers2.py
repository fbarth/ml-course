#
# The Unigram Tagger
#
# Neste exemplo eh utilizado um corpus para treinamento da classe
# UnigramTagger. A classe UnigramTagger implementa um algoritmo
# estatístico de tagging: para cada token, o algoritmo atribui uma
# tag que eh mais frequente para o texto do token. Por exemplo a 
# palavra frequent é muito mais utilizada como adjetivo (a frequent
# word) do que como verbo (I frequent this cafe)
#

train_tokens = []
for item in brown.items()[:10]:
    train_tokens.append(brown.read(item))

# inicializando o conjunto de exemplos para o
# treinamento do algoritmo

mytagger = UnigramTagger(SUBTOKENS='WORDS')
for tok in train_tokens: mytagger.train(tok)

# UnigramTaggers eh treinado usando o metodo train()

#
# Uma vez realizado o treinamento, o metodo tag() pode
# ser utilizado para determinar a tag do novo texto
#

text_token = Token(TEXT="John saw the book on the table")
WhitespaceTokenizer(SUBTOKENS='WORDS').tokenize(text_token)
mytagger.tag(text_token)
print text_token

#
# Para todos os atomos nao encontrados eh atribuido a tag "None"
#
