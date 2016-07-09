# YelpAPI
An `R` package to search for businesses at a location.

You will need to obtain free credentials from [Yelp](https://www.yelp.com/developers) to use this package.

## Installation
```r
if (!require(devtools)) install.packages("devtools")
devtools::install_github("walshc/YelpAPI")
```

## Usage
```r
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
```

## Output
```r
                      id          name
1 dutch-freds-new-york-2   Dutch Freds
2   barn-joo-35-new-york   Barn Joo 35
3 tanner-smiths-new-york Tanner Smiths
                                         categories longitude latitude       address
1 Cocktail Bars, Tapas/Small Plates, American (New) -73.98785 40.76082 307 W 47th St
2                  Korean, Gastropubs, Asian Fusion -73.98582 40.74964  34 W 35th St
3 Cocktail Bars, American (New), Breakfast & Brunch -73.98171 40.76428   204 W 55 St
      city     neighborhood postal_code state_code country_code display_address_1
1 New York Theater District       10036         NY           US     307 W 47th St
2 New York     Midtown West       10001         NY           US      34 W 35th St
3 New York     Midtown West       10019         NY           US       204 W 55 St
  display_address_2  display_address_3      phone geo_accuracy rating review_count
1  Theater District New York, NY 10036 6469186923            8    5.0           93
2      Midtown West New York, NY 10001 2125644430            8    4.5           92
3      Midtown West New York, NY 10019 6465902034            8    4.5          325
  is_claimed is_closed
1       TRUE     FALSE
2       TRUE     FALSE
3       TRUE     FALSE
```
