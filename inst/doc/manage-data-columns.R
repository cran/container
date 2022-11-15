## ----knitr-setup, include = FALSE-----------------------------------------------------------------
require(container)
require(dplyr)
library(microbenchmark)
library(ggplot2)
library(data.table)
library(tibble)


knitr::opts_chunk$set(
  comment = "#",
  prompt = F,
  tidy = FALSE,
  cache = FALSE,
  collapse = T,
  fig.width = 7
)

old <- options(width = 100L)

## -------------------------------------------------------------------------------------------------
library(container)
library(dplyr)

data <- dict.table(x = c(0.2, 0.5), y = letters[1:2])
data

## -------------------------------------------------------------------------------------------------
data %>%
    mutate(ID = 1:2, z = 1)

## -------------------------------------------------------------------------------------------------
data %>%
    add(ID = 1:2, z = 1)

## -------------------------------------------------------------------------------------------------
data %>%
    mutate(y = 1)

## ---- error=TRUE----------------------------------------------------------------------------------
if ("y" %in% colnames(data)) {
    stop("column y already exists")
} else {
    data %>%
        mutate(y = 1)
}

## ---- error=TRUE----------------------------------------------------------------------------------
data %>%
    add(y = 1)

## -------------------------------------------------------------------------------------------------
data %>%
    replace_at(y = 1)

# or programmatically
data %>%
    replace_at("y", 1)

## ---- error=TRUE----------------------------------------------------------------------------------
if ("ID" %in% colnames(data)) {
    data %>%
        mutate(ID = 1:2)
} else {
    stop("column ID not in data.frame")
}

## ---- error=TRUE----------------------------------------------------------------------------------
data %>%
    replace_at(ID = 1:2)

## -------------------------------------------------------------------------------------------------
data %>%
    replace_at(ID = 1:2, .add = TRUE)

## -------------------------------------------------------------------------------------------------
data %>%
  select(-"y")

data %>%
    delete_at("y")

## ---- error=TRUE----------------------------------------------------------------------------------
data %>%
    select(-"ID")

data %>%
    delete_at("ID")

## -------------------------------------------------------------------------------------------------
if ("ID" %in% colnames(data)) {
    data %>%
        select(-"ID")
}

## -------------------------------------------------------------------------------------------------
data %>%
    discard_at("ID")

## -------------------------------------------------------------------------------------------------
library(microbenchmark)
library(ggplot2)
library(data.table)
library(tibble)

data = cars
head(cars)

## ----benchmark1, warning = FALSE, message = FALSE, cache=TRUE-------------------------------------
bm <- microbenchmark(control = list(order="inorder"), times = 100,

    dict.table =
        as.dict.table(data) %>%
        add(time = .[["dist"]] / .[["speed"]]) %>%
        replace_at(dist = 0) %>%
        delete_at("speed"),

    `data.table[` =
        as.data.table(data)[
        ][, time := dist / speed
        ][, dist := 0
        ][, speed := NULL],

    dplyr =
        as_tibble(data) %>%
        mutate(time = dist / speed) %>%
        mutate(dist = 0) %>%
        select(-speed)
)
autoplot(bm) + theme_bw()

## ----benchmark2, warning = FALSE, message = FALSE, cache=TRUE-------------------------------------
data = cars
bm <- microbenchmark(control = list(order="inorder"), times = 100,

    dit <- as.dict.table(data),
    dit <- add(dit, time = dit[["dist"]] / dit[["speed"]]),
    dit <- replace_at(dit, dist = 0),
    dit <- delete_at(dit, "speed"),

    dat <-  as.data.table(data),
    dat[, time := dist / speed],
    dat[, dist := 0],
    dat[, speed := NULL],

    tbl <- as_tibble(data),
    tbl <- mutate(tbl, time = dist / speed),
    tbl <- mutate(tbl, dist = 0),
    tbl <- select(tbl, -speed)
)
autoplot(bm) + theme_bw()

## ----benchmark3, warning = FALSE, message = FALSE, cache=TRUE-------------------------------------
data = cars
bm <- microbenchmark(control = list(order="inorder"), times = 100,

    dict.table =
        as.dict.table(data) %>%
        add(time = dit[["dist"]] / dit[["speed"]]) %>%
        replace_at(dist = 0) %>%
        delete_at("speed"),

    ref_dict.table =
        as.dict.table(data) %>%
        ref_add(time = .[["dist"]] / .[["speed"]]) %>%
        ref_replace_at(dist = 0) %>%
        ref_delete_at("speed"),


    `data.table[` =
        as.data.table(data)[
        ][, time := dist / speed
        ][, dist := 0
        ][, speed := NULL],

    set_data.table =
        as.data.table(data) %>%
        set(j = "ID", value = .[["dist"]] / .[["speed"]]) %>%
        set(j = "dist", value = 0) %>%
        set(j = "speed", value = NULL)
)

autoplot(bm) + theme_bw()

## -------------------------------------------------------------------------------------------------
res = data %>%
    as.dict.table %>%
    .[, time := dist / speed] %>%   # data.table
    replace_at(dist = 0) %>%        # container
    select(-speed)                  # dplyr

## ---- include = FALSE---------------------------------------------------------
options(old)

