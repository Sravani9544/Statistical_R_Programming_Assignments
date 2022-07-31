# Project name : transgender data visualization

# Project purpose : Cleaning and creating a table with transgender data 

# Code author name : Mahankali Sravani

# Date last edited : 2/18/2022

# Location of data used : St.Louis, MO

#######################################################################

## reading transgender data

library(readr)
transgender.hc <- read.csv("transgender_hc_ch2.csv")

## printing the summary 

summary(object = transgender.hc)

## observing the variables in TRNSGNDR variable

table(transgender.hc$TRNSGNDR)

## loading the Tidyverse package

library(package = "tidyverse")

## selecting items less than 4 in TRNSGNDR in the data

transgender.hc.trans <- transgender.hc%>%
  filter(TRNSGNDR < 4)

## Selecting the necessary Variables 

transgender.hc.trans <- transgender.hc.trans%>%
  select(TRNSGNDR, PHYSHLTH, 
         X_INCOMG, X_EDUCAG, X_AGEG5YR, X_AGE80, X_RACE)

## converting the Variables to factors and numeric 

transgender.hc.cleaned <- transgender.hc.trans%>%
  mutate(TRNSGNDR = as.factor(TRNSGNDR))%>%
  mutate(X_INCOMG = as.factor(X_INCOMG))%>%
  mutate(X_EDUCAG = as.factor(X_EDUCAG))%>%
  mutate(X_AGEG5YR = as.factor(X_AGEG5YR))%>%
  mutate(X_RACE = as.factor(X_RACE))%>%
  mutate(PHYSHLTH = as.numeric(PHYSHLTH))%>%
  mutate(X_AGE80 = as.numeric(X_AGE80))

## Recoding the variables to their names

transgender.hc.cleaned <- transgender.hc.cleaned%>%
  mutate(TRNSGNDR = recode_factor(.x =TRNSGNDR,
                                  `1` = "Transgender male-to-female", 
                                  `2` = "Transgender female-to-male", 
                                  `3` = "Transgender gender nonconforming"))%>%
  
## converting 77 and 99 to na values 
  
  mutate(PHYSHLTH = na_if(x = PHYSHLTH, y = 77))%>%
  mutate(PHYSHLTH = na_if(x = PHYSHLTH, y = 99))%>%
  mutate(PHYSHLTH = as.numeric(recode(.x = PHYSHLTH, `88` = 0L))) %>%
  mutate(X_INCOMG = recode_factor(.x =X_INCOMG,
                                  `1` = "Less than $15,000", 
                                  `2` = "$15,000 to less than $25,000", 
                                  `3` = "$25,000 to less than $35,000", 
                                  `4` = "$35,000 to less than $50,000", 
                                  `5` = "$50,000 or more", 
                                  `9` = NA_character_)) %>%
  mutate(X_EDUCAG = recode_factor(.x =X_EDUCAG,
                                  `1` = "Did not graduate High School", 
                                  `2` = "Graduated High School", 
                                  `3` = "Attended College or Technical School", 
                                  `4` = "Graduated from College or Technical School", 
                                  `9` = NA_character_)) %>%
  mutate(X_AGEG5YR = recode_factor(.x =X_AGEG5YR,
                                  `1` = "Age 18 to 24", 
                                  `2` = "Age 25 to 29", 
                                  `3` = "Age 30 to 34", 
                                  `4` = "Age 35 to 39", 
                                  `5` = "Age 40 to 44", 
                                  `6` = "Age 45 to 49", 
                                  `7` = "Age 50 to 54", 
                                  `8` = "Age 55 to 59", 
                                  `9` = "Age 60 to 64", 
                                  `10` = "Age 65 to 69", 
                                  `11` = "Age 70 to 74", 
                                  `12` = "Age 75 to 79", 
                                  `13` = "Age 80 or older", 
                                  `14` = NA_character_)) %>%
  mutate(X_RACE = recode_factor(.x =X_RACE,
                                `1` = "White only, non-Hispanic", 
                                `2` = "Black only, non-Hispanic", 
                                `3` = "American Indian or Alaskan Native only, Non-Hispanic", 
                                `4` = "Asian only, non-Hispanic", 
                                `5` = "Native Hawaiian or other Pacific Islander only, Non-Hispanic", 
                                `6` = "Other race only, non-Hispanic", 
                                `7` = "Multiracial, non-Hispanic", 
                                `8` = "Hispanic", 
                                `9` = NA_character_))


## Creating the table with tableone package

library(package = "tableone")
# create a basic table
trans.hc.table <- CreateTableOne(data = transgender.hc.cleaned)
# use print to show table with labels
print(x = trans.hc.table, varLabels = TRUE, nonnormal = 'PHYSHLTH')

## Creating a table with KableExtra

table.data <- data.frame()
# write the for loop
for (i in 1:(ncol(transgender.hc.cleaned) - 1)) {
  # first, get the table
  table.each <-
    data.frame(round(x = prop.table(x = table(transgender.hc.cleaned[, i])) *
                       100, 1))
  # store the column name of that iteration for labels
  c.name <- colnames(transgender.hc.cleaned[i])
  # make a new data frame that just contains the labels
  label.names <- data.frame(Variable = rep(c.name, times =
                                             nrow(table.each)))
  # combine the label.names data frame and table.each data frame via
  
  table.each.labelled <- cbind(label.names, table.each)
  # combine this with the table.data via rbind
  table.data <- rbind(table.data, table.each.labelled)
}
table.data <- table.data[c(1:34), c(2:3)]
colnames(table.data) <- c("Survey participant demographics (n = 290)",
                          "Percent")
# print the new data frame
table.data

library(package = "knitr")
library(package = "kableExtra")

table.data %>%
  kable(format = "html",
        caption = "Transgender Survey Participant Demographics",
        row.names = FALSE) %>%
  kableExtra::group_rows(group_label = "Transition status",
                         start_row = 1, end_row = 3) %>%
  kableExtra::group_rows(group_label = "Income Category",
                         start_row = 4, end_row = 9) %>%
  kableExtra::group_rows(group_label = "Education Category",
                         start_row = 10, end_row = 13) %>%
  kableExtra::group_rows(group_label = "Age category",
                         start_row = 14, end_row = 26)
  kableExtra::group_rows(group_label = "Race",
                         start_row = 27, end_row = 34)
####################################################################

### SUMMARIZAITON: There are 52.5(highest) percent people who converted to female from
###                male. 31.6 percent people earned $50,000 or more money. Only 12.8 
###                percent did not graduate high school. People in between 50 - 64 years
###                Most transgender people are White and non-Hispanic i.e., 72.1.

  




  
  
                    
  
  
  
  
