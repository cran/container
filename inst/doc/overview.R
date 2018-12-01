## ----knitr-setup, include = FALSE----------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----out.width = '40%', echo = FALSE, fig.cap="Class diagram with basic class hierarchy."----
knitr::include_graphics("class-diagram-bare.png")

## ----lib-setup-----------------------------------------------------------
library(container)

## ------------------------------------------------------------------------
collection <- Container$new()
collection$empty()

## ------------------------------------------------------------------------
collection$add(1)
collection$add("A")
collection$add(data.frame(B=1, C=2))
collection$type()

## ------------------------------------------------------------------------
collection$values()

## ------------------------------------------------------------------------
collection$print()

## ------------------------------------------------------------------------
ints <- Container$new(integer())
ints$type()

## ------------------------------------------------------------------------
ints$add(1)$add(2)$add(3.7)$print()

## ------------------------------------------------------------------------
ints <- Container$new(1:10)$print()

ints$values()

ints$size()

## ------------------------------------------------------------------------
ints$has(11)

ints$has(7)

ints$discard(7)$has(7)

ints$remove(8)$values()

## ---- error=TRUE---------------------------------------------------------
ints$remove(8)

## ------------------------------------------------------------------------
ints$discard(8) # ok

## ------------------------------------------------------------------------
ints$add(1:3)$values()

ints$discard(1)$values()

ints$discard(2, right=TRUE)$values()

## ------------------------------------------------------------------------
unlist(ints$apply(f = function(x) x^2))

ints$clear()$empty()

## ------------------------------------------------------------------------
members <- Container$new(c("Lisa", "Bob", "Joe"))$print()

remove_Joe <- function(cont) cont$discard("Joe")
remove_Joe(members)
members

## ------------------------------------------------------------------------
it <- members$iter()
print(it)

while(it$has_next()) {
    print(it$get_next())
    print(it)
}

## ---- error=TRUE---------------------------------------------------------
it$get_next()

## ------------------------------------------------------------------------
d <- Deque$new(0L)
d$type()
d

## ------------------------------------------------------------------------
d$add(1)$add(2)$addleft(1)$addleft(2)$values()

d$count(0)  # count number of 0s

d$count(1)  # count number of 1s

## ------------------------------------------------------------------------
d$peek()

d$pop()

d$pop()

d$values()

## ------------------------------------------------------------------------
d$peekleft()

d$popleft()

d$values()

d$count(2)

## ---- error=TRUE---------------------------------------------------------
Deque$new()$peek()

Deque$new()$pop()

## ------------------------------------------------------------------------
d$add(rep(0, 3))$values()

d$rotate()$values()    # rotate 1 to the right

d$rotate(2)$values()   # rotate 2 to the right

d$rotate(-3)$values()  # rotate 3 to the left

d$addleft(4:2)$values()

d$reverse()$values()

## ------------------------------------------------------------------------
reverse_ps <- function(x)
{
    it <- Iterator$new(seq_along(x))
    d <- Deque$new(integer())
    
    while(it$has_next()) {
        it$.next()
        d$add(it$get())
        if (it$has_next()) d$addleft(it$get_next())
    }
    x[d$values()]
}

(zz <- rep(c(0, 1), 10))

reverse_ps(zz)

## ------------------------------------------------------------------------
s1 <- Set$new(1:3)$print()

s1$add(1)  # does not change the set 
s1

## ------------------------------------------------------------------------
s1 <- Set$new(c(1, 2,    4, 5))
s2 <- Set$new(c(   2, 3,    5, 6))

s1$union(s2)$print()

s1$intersect(s2)$print()

s1$diff(s2)$print()

s1$is.subset(s2)
s1$is.subset(s1$union(s2))
s1$intersect(s2)$is.subset(s1)

s1$is.equal(s2)
s1$is.equal(s1)

s1$is.superset(s2)
s1$union(s2)$is.superset(s2)

## ------------------------------------------------------------------------
ages <- Dict$new(c(Peter=24, Lisa=23, Bob=32))$print()

ages$keys()

ages$peek("Lisa")

ages$peek("Anna")

## ---- error=TRUE---------------------------------------------------------
ages$add("Albert", 139)$values()

ages$add("Bob", 40)

ages$has("Peter")

ages$discard("Albert")$values()

# Trying to discard a non-existing key has no effect
ages$discard("Albert")$values()

# Trying to remove a non-existing key throws an error
ages$remove("Albert")

## ---- error=TRUE---------------------------------------------------------
ages$set("Anna", 23)

ages$set("Anna", 23, add=TRUE)  # alternatively ages$add("Anna", 23)
ages

## ------------------------------------------------------------------------
ages$set("Lisa", 11)$values()

## ---- error=TRUE---------------------------------------------------------
ages$pop("Lisa")

ages$values()

ages$pop("Lisa")

ages$get("Lisa")

ages$peek("Lisa")

## ------------------------------------------------------------------------
set.seed(123)
while(!ages$empty()) print(ages$popitem())

## ------------------------------------------------------------------------
shoplist <- Dict$new(list(eggs=10, potatoes=10, bananas=5, apples=4))

shoplist2 <- Dict$new(list(eggs=6, broccoli=4))

shoplist$update(shoplist2)$values()

