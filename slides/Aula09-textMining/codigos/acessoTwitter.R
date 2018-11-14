library(twitteR)
cred <- OAuthFactory$new(
             consumerKey="XXXX", 
             consumerSecret="XXXX", 
             requestURL="https://api.twitter.com/oauth/request_token", 
             accessURL="https://api.twitter.com/oauth/access_token", 
             authURL="http://api.twitter.com/oauth/authorize")

cred$handshake()
registerTwitterOAuth(cred)

dados <- searchTwitter('economist brasil', n=250)
df <- twListToDF(dados)
save(df, file="../data/20140424_economist_brasil.rda")
