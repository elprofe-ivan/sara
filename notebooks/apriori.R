library(arules)
library(arulesViz)
library(dplyr)

data <- read.csv("C:\\Users\\ivanc\\PycharmProjects\\sara\\data\\email_attachments\\06_02\\descrição_doenças_drugs_complete.csv")
df <- tibble::as_tibble(data) %>% distinct()
df <- tibble::as_tibble(select(df, Disease, Drug)) %>% distinct()

df_s <- split(df[,"Drug"], df[,"Disease"])
df_s <- lapply(df_s, pull) %>% unname

dfT <- as(df_s, Class = "transactions")

sizes <- size(dfT)
summary(sizes)

item_dfT <- itemInfo(dfT)
head(item_dfT)

rules <- apriori(dfT)

summary(rules)
inspect(rules)

dev.new()
plot(rules)

plot(rules, method = "graph")
plot(rules, method = "graph", control = list(type = "itemsets"))
plot(rules, method = "grouped")

