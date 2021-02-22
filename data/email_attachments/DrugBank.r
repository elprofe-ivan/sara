#Packages
install.packages("dbparser")
install.packages('XML')

library(dbparser)
library(dplyr)
library(ggplot2)
library(XML)

read_drugbank_xml_db("C:/Users/Admin/Desktop/full database.xml")



## load drugs data - BASE DE DADOS COMPLETA
drugs <- drugs()

## load drug groups data
drug_groups <- drug_groups()

## load drug targets actions data
drug_targets_actions <- targets_actions()




## view proportions of the different drug types for each drug group
#drugs %>% 
#  full_join(drug_groups, by = c('primary_key' = 'drugbank_id')) %>% 
#  select(type, group) %>% 
#  ggplot(aes(x = group, fill = type)) + 
#  geom_bar() + 
#  theme(legend.position = 'bottom') + 
#  labs(x = 'Drug Group', 
#       y = 'Quantity', 
#       title = "Drug Type Distribution per Drug Group", 
#       caption = "created by ggplot") + 
#  coord_flip()




## get counts of the different target actions in the data
#targetActionCounts <- 
#  drug_targets_actions %>% 
#  group_by(action) %>% 
#  summarise(count = n()) %>% 
#  arrange(desc(count))


## get bar chart of the 10 most occurring target actions in the data
#p <- 
#  ggplot(targetActionCounts[1:10,], 
#         aes(x = reorder(action,count), y = count, fill = letters[1:10])) + 
#  geom_bar(stat = 'identity') +
#  labs(fill = 'action', 
#       x = 'Target Action', 
#       y = 'Quantity', 
#       title = 'Target Actions Distribution', 
#       subtitle = 'Distribution of Target Actions in the Data',
#       caption = 'created by ggplot') + 
#  guides(fill = FALSE) +    ## removes legend for the bar colors
#  coord_flip()              ## switches the X and Y axes

## display plot
#p


drug_info <- drug_general_information()drug_interac <- drug_interactions()

snp_effects <- drug_snp_effects()
pdb_entries <- drug_pdb_entries()
