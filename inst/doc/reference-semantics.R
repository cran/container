## ----knitr-setup, include = FALSE-----------------------------------------------------------------
require(container)
knitr::opts_chunk$set(
  comment = "#",
  prompt = F,
  tidy = FALSE,
  cache = FALSE,
  collapse = T
)

options(width = 100L)

## -------------------------------------------------------------------------------------------------
co = container()

ref_add(co, a = 1)
ref_add(co, b = 2)

co

## ---- eval = FALSE--------------------------------------------------------------------------------
#  co = container() |>
#      add(a = 1)   |>
#      add(b = 2)

## -------------------------------------------------------------------------------------------------
odds = container()
evens = container()
isOdd = function(x) {x %% 2 == 1}

res = sapply(1:10, function(i) 
    if(isOdd(i)) ref_add(odds, i) else ref_add(evens, i)
)

odds
evens

