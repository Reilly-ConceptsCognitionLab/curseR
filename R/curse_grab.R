#' Curse combinations
#'
#' Probability samples and combines curse words w/ common nouns
#'
#' @name curse_grab
#' @importFrom here here
#' @importFrom magrittr %>%
#' @importFrom dplyr select
#' @export curse_grab

curse_grab <- function(){
  curse <- curse_db
  common <- common_db
  jobs <- professions_db
  suffixes <- suffixes_db
  taboo <- read.csv(here("data", "curse_db.csv"))
  taboo <- taboo %>% select(Word) %>% data.frame()
  common <- read.csv(here("data", "common_db.csv"))
  common <- common %>% select(Word) %>% data.frame()
  profession <- read.csv(here("data", "professions_db.csv"))
  profession <- profession %>% select(Word) %>% data.frame()
  suffix <- read.csv(here("data", "suffixes_db.csv"))
  suffix <- suffix %>% select(Word) %>% data.frame()
    #Start sampling the number of repeated samples is specified by the fn argument x (default=1)
  taboo_it <- taboo[sample(nrow(taboo), 1), ]  #sample and return 1 random row of curse words
  common_it <- common[sample(nrow(common), 1), ]  #sample and return 1 random row of commmon nouns
  suffix_it <- suffix[sample(nrow(suffix), 1), ] #sample and return 1 random row of suffixes
  profession_it <- profession[sample(nrow(profession), 1), ] #sample and return 1 random row of     professions
  a <- paste0(taboo_it,common_it) #concatenate curse + common e.g.,dickrat
  b <- paste0(common_it, taboo_it) #concatenate common  curse e.g.,ratdick
  c <- paste0(taboo_it,common_it, suffix_it)
  d <- paste0(common_it, taboo_it, suffix_it)
  e <- paste0(taboo_it, profession_it)
  mycurse <- sample(c(a,b,c,d,e),1, prob=c(0.3,0.3, 0.1, 0.1, 0.2))
  return(mycurse)
}
