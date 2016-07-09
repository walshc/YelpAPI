\name{YelpByLocation}
\alias{YelpByLocation}
\title{Yelp's search API}
\description{Use Yelp's search API to search for a term by location.}
\usage{
YelpByLocation(lon, lat, term, auth, limit)
}
\arguments{
\item{lon}{Longitude to search from (can be text or numeric).}
\item{lat}{Latitude to search from (can be text or number).}
\item{term}{What to search for (e.g. restaurants, bars, etc).}
\item{auth}{Authorization from \code{httr}'s \code{sign_oauth1.0} (see
  examples).}
\item{limit}{Maximum number of search results.}
}
\value{
  Returns a \code{data.frame} with the search results.}
\examples{\dontrun{
# Your credentials:
consumer.key <- "YOUR CONSUMER KEY"
consumer.secret <- "YOUR CONSUMER SECRET"
token <- "YOUR TOKEN"
token.secret <- "YOUR TOKEN SECRET"

app <- httr::oauth_app("YELP", key = consumer.key, secret = consumer.secret)
auth <- httr::sign_oauth1.0(app, token = token, token_secret = token.secret)

# Search for restaurants near Time Square, NYC:
YelpByLocation(lon = -73.9873197, lat = 40.758895, term = "Restaurants",
               auth = auth, limit = 3)
}}
