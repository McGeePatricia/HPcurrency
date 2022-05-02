#' hpitems Dataset
#'
#' A data frame containing a list of common items in the Harry Potter world with estimated pricing data.
#'
#' @format A data frame containing 21 rows and 3 variables:
#' \describe{
#'   \item{Item}{names of common items in HP world}
#'   \item{Cost}{price of the item}
#'   \item{CurrencyType}{Currency denomination the item cost is in:
#'         Galleon, Sickle, or Knut.
#'         1 Galleon = 5 Pounds (British Sterling)
#'         1 Galleon = 17 Sickles
#'         1 Sickle = 29 Knuts}
#' }
#' @source Dataset created based on values from \url{https://www.hp-lexicon.org/currency/exchange/?action=general&muggle=5&currency=GBP&target=WZG&date=2022-03-24}
"hpitems"
