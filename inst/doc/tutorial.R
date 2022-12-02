## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

load("my_appsflyer_data.RData")

## ----setup--------------------------------------------------------------------
library(appsflyeR)

library(dplyr)
library(ggplot2)

## ---- eval = FALSE------------------------------------------------------------
#  
#  my_appsflyer_data <-
#    fetch_appsflyer(api_key = "your api key",
#             date_from = Sys.Date()-100,
#             date_to = Sys.Date(),
#             fields = c("campaign", "clicks",
#                        "spend", "impressions", "date"))

## -----------------------------------------------------------------------------
str(my_appsflyer_data)

## -----------------------------------------------------------------------------
ggplot(my_appsflyer_data, aes(y = clicks, fill = campaign)) + geom_boxplot()

## -----------------------------------------------------------------------------
lmod <- glm(clicks ~ campaign, data = my_appsflyer_data, family = "poisson")
summary(lmod)

