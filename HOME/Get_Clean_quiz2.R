library(httpuv)
library(httr)
# 1. Find OAuth settings for github:
# http://developer.github.com/v3/oauth/
oauth_endpoints("github")
# 2. Register an application at https://github.com/settings/applications;
# Use any URL you would like for the homepage URL (http://github.com is fine)
# and http://localhost:1410 as the callback url
#
# Insert your client ID and secret below - if secret is omitted, it will
# look it up in the GITHUB_CONSUMER_SECRET environmental variable.
myapp <- oauth_app("github", "534684ee344756cb7f19",secret="43f1f4de6db56f4de76829f57f154608d773c2b6")
# 3. Get OAuth credentials
github_token <- oauth2.0_token(oauth_endpoints("github"), myapp)
# 4. Use API
gtoken <- config(token = github_token)
req <- GET("https://api.github.com/users/jtleek/repos", gtoken)

mydata <- content(req)
mydata
stop_for_status(req)
set.seed(13435)
X <- data.frame("var1"=sample(1:5),"var2"=sample(6:10),"var3"=sample(11:15))
X

X <-X[sample(1:5),]; X$var2[c(1,3)] = NA
X
