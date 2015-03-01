library(httr)
library(httpuv)
library(XML)
# 1. Find OAuth settings for github:
#    http://developer.github.com/v3/oauth/
oauth_endpoints("github")

# 2. Register an application at https://github.com/settings/applications;
#    Use any URL you would like for the homepage URL (http://github.com is fine)
#    and http://localhost:1410 as the callback url
#
#    Insert your client ID and secret below - if secret is omitted, it will
#    look it up in the GITHUB_CONSUMER_SECRET environmental variable.
myapp <- oauth_app("github", "534684ee344756cb7f19", secret="43f1f4de6db56f4de76829f57f154608d773c2b6")

# 3. Get OAuth credentials
github_token <- oauth2.0_token(oauth_endpoints("github"), myapp)

# 4. Use API
gtoken <- config(token = github_token)
#req <- GET("https://www.github.com/williamsja0314", gtoken)
#req2 <- GET("https://api.github.com/users/jtleek/repos", gtoken) 
#req3 <-  htmlTreeParsee(req2,useInternal=TRUE)
#req2 <- GET("https://api.github.com/users/jtleek/repos", gtoken) 
#how to parse and get normal HTML values????? Must be XML???
req3 <-  htmlTreeParse(GET("https://api.github.com/users/jtleek/repos", gtoken),useInternal=TRUE)
req3

rootNode <- xmlRoot(req3)
#stop_for_status(req)
mydata <- content(req2)
acs <- read.csv("data/getdata_data_ss06pid.csv")

                