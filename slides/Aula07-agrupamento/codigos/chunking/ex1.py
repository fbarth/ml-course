from nltk.tokenreader.tagged import ChunkedTaggedTokenReader
chunked_string = "[ the/DT little/JJ cat/NN ] sat/VBD on/IN [ the/DT mat/NN ]"
reader = ChunkedTaggedTokenReader(chunk_node='NP', SUBTOKENS='WORDS')
sent_token = reader.read_token(chunked_string)
print sent_token['TREE']