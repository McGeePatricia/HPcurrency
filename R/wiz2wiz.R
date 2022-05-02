#' wiz2wiz Function
#'
#' This function converts HP currency rates between themselves: Galleon, Sickle, Knut.
#' - Harry Potter money conversions
#' - Gold Galleons – 1 Galleon = 5 British Pounds
#' - Silver Sickles – 17 Sickles = 1 Galleon
#' - Knuts – 29 Knuts = 1 Sickle

#' @param hpitems Data frame to use for function.
#' @param Cost Argument for the cost column.
#' @param CurrencyType Argument for the current currency type type column. Must enter as (dataset)$(ColumnName), example is hpitems$CurrencyType
#' @param NewType Argument for the currency type you wish to convert to. Choices are Galleon, Sickle, or Knut.
#' @return A data frame of items with the newly converted currency denominations.

wiz2wiz <- function(hpitems,Cost,CurrencyType,NewType = c("Galleon","Sickle","Knut")){
  NewCost <- vector(mode = "numeric", length = length(hpitems)) # create empty vector for new cost to be saved
  NewCurrency <- vector(mode = "character", length = length(hpitems)) #create empty vector for new currency to be saved
    for (i in 1:nrow(hpitems)) {
      if (CurrencyType[i] == NewType) {
        NewCost[i] <- Cost[i]
      } else if(CurrencyType[i] == "Galleon" && NewType == "Sickle"){
        NewCost[i] <- Cost[i]*17
      } else if(CurrencyType[i] == "Galleon" && NewType == "Knut"){
        NewCost[i] <- (Cost[i]*17)*29
      } else if(CurrencyType[i] == "Sickle" && NewType == "Galleon"){
        NewCost[i] <- Cost[i]/17
      } else if(CurrencyType[i] == "Sickle" && NewType == "Knut"){
        NewCost[i] <- Cost[i]*29
      } else if(CurrencyType[i] == "Knut" && NewType == "Galleon"){
        NewCost[i] <- (Cost[i]/29)/17
      } else if(CurrencyType[i] == "Knut" && NewType == "Sickle"){
        NewCost[i] <- Cost[i]/29
      }
      NewCurrency[i] <- NewType
    } # end of the for loop
  converted <- cbind(hpitems,NewCost,NewCurrency)
  return(converted)
  }

