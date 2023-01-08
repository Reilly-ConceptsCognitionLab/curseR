#' Curse combinations
#'
#' replicates 'curse_grab' helper script specifying number of curse words to output
#'
#' @name curse
#' @param x integer specifying number of curse words to return, default is 3
#' @export curse

curse<- function(x=3) {
  x <- as.integer(x)
  cursing <- replicate(x, curse_grab1())
  print(cursing, quote=F)
}