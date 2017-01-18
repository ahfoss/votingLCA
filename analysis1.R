# Read this table:
# https://www.uschamber.com/report/how-they-voted-2015-senate
# Scraped from this website:
# https://www.uschamber.com/report/how-they-voted
dd=read.table('chamber_votes.tsv',header=T)
# Note 0 = disagree with chamber of commerce
# 1 = agree with CC
# 2 = no vote record

require(poLCA)

res=poLCA(cbind(
  v1=v1+1, v2=v2+1, v3=v3+1, v4=v4+1, v5=v5+1, v6=v6+1, v7=v7+1,
  v8=v8+1, v9=v9+1, v10=v10+1, v11=v11+1, v12=v12+1, v13=v13+1, v14=v14+1) ~ 1, nclass=3, data=dd)

table(res$predclass, dd$Party)
data.frame(res$predclass, dd$Name, dd$Party, dd$State, dd$yearpct)

tapply(as.numeric(substr(dd$yearpct, start=1, stop=2)), FUN=mean, INDEX=res$predclass)
tapply(as.numeric(substr(dd$yearpct, start=1, stop=2)), FUN=mean, INDEX=dd$Party)
