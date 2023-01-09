#' Curse combinations
#'
#' replicates 'curse_grab' helper script specifying number of curse words to output
#'
#' @name curse
#' @param x integer specifying number of curse words to return, default is 3
#' @importFrom magrittr %>%
#' @importFrom dplyr select
#' @importFrom dplyr %>%
#' @export curse

curse<- function(x=3) {
  x <- as.integer(x)
  cursing <- replicate(x, curseR:::curse_grab()) #call internal helper function
  print(cursing, quote=F)
}