#' wiz2pound Function
#'
#' This function converts HP currency rates to pounds (British Sterling)
#' - Harry Potter money conversions
#' - Gold Galleons – 1 Galleon = 5 British Pounds
#' - Silver Sickles – 17 Sickles = 1 Galleon
#' - Knuts – 29 Knuts = 1 Sickle

#' @param hpitems Data frame to use for function.
#' @param Cost Argument for the cost column.
#' @param CurrencyType Argument for the current currency type type column. Must enter as (dataset)$(ColumnName), example is hpitems$CurrencyType
#' @return A data frame of items with the newly converted currency denominations.

wiz2pound <- function(hpitems,Cost,CurrencyType){
  NewCost <- vector(mode = "numeric", length = length(hpitems)) # create empty vector for new cost to be saved
  NewCurrency <- vector(mode = "character", length = length(hpitems)) #create empty vector for new currency to be saved
  for (i in 1:nrow(hpitems)) {
    if (CurrencyType[i] == "Galleon") {
      NewCost[i] <- Cost[i]*5
    } else if(CurrencyType[i] == "Sickle"){
      NewCost[i] <- (Cost[i]/17)*5
    } else if(CurrencyType[i] == "Knut"){
      NewCost[i] <- ((Cost[i]/29)/17)*5
    }
    NewCurrency[i] <- "Pound"
  } # end of the for loop
  converted <- cbind(hpitems,NewCost,NewCurrency)
  return(converted)
}

