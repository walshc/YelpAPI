YelpByLocation <- function(lon, lat, term, auth, limit) {
  url <- paste0("http://api.yelp.com/v2/search/?limit=", limit,
                "&ll=", lat, ",", lon, "&term=", gsub("\\s+", "%20", term))
  data <- httr::content(httr::GET(url, auth))
  d <- data$businesses
  l <- lapply(data$businesses, function(x) x[["location"]])

  # Put all categories of a business together separated by commas:
  categories <- sapply(d, function(x)
      paste(sapply(x[["categories"]], function(x) x[[1]]), collapse = ", "))

  # Sometimes elements are not available so return NA in those cases:
  getVar <- function(x) ifelse(length(x) == 0, NA, x)

  # Get each variable from the search results into a data.frame:
  data.frame(
    id           = sapply(d, function(x) getVar(x[["id"]])),
    name         = sapply(d, function(x) getVar(x[["name"]])),
    categories   = categories,
    longitude    = sapply(l, function(x) getVar(x[["coordinate"]]$longitude)),
    latitude     = sapply(l, function(x) getVar(x[["coordinate"]]$latitude)),
    address      = sapply(l, function(x) getVar(x[["address"]][[1]])),
    city         = sapply(d, function(x) getVar(x[["location"]][["city"]])),
    neighborhood = sapply(l, function(x) getVar(x[["neighborhoods"]][[1]])),
    postal_code  = sapply(l, function(x) getVar(x[["postal_code"]])),
    state_code   = sapply(l, function(x) getVar(x[["state_code"]])),
    country_code = sapply(l, function(x) getVar(x[["country_code"]])),
    phone        = sapply(d, function(x) getVar(x[["phone"]])),
    geo_accuracy = sapply(l, function(x) getVar(x[["geo_accuracy"]])),
    rating       = sapply(d, function(x) getVar(x[["rating"]])),
    review_count = sapply(d, function(x) getVar(x[["review_count"]])),
    is_claimed   = sapply(d, function(x) getVar(x[["is_claimed"]])),
    is_closed    = sapply(d, function(x) getVar(x[["is_closed"]])))
}
