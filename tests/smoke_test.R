# Minimal startup check; does not exercise biological or prediction validity.
stopifnot(file.exists("app.R"))
stopifnot(file.exists("www/logo_wildroot.png"))
parse("app.R")
stopifnot(requireNamespace("shiny", quietly = TRUE))
stopifnot(requireNamespace("ggplot2", quietly = TRUE))
app <- source("app.R", local = new.env(parent = globalenv()))$value
stopifnot(inherits(app, "shiny.appobj"))
cat("PASS: WILDROOT AI R Shiny parses and constructs a Shiny app object.\n")
cat("Note: model validity, user interactions and graphics require separate review.\n")
