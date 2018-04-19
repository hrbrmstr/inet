#' Lookup WHOIS IP information via the ARIN REST API
#'
#' @md
#' @param x a vector of IPv4 addresses
#' @param ... unused
#' @return a (usually) large, heavily-nested list structure classed as "arin_whois"
#' @references [ARIN Whois-RWS API Documentation](https://www.arin.net/resources/whoisrws/whois_api.html);
#'     [Whois-RWS Info and FAQ](https://www.arin.net/resources/whoisrws/index.html)
#' @export
#' @examples
#' whois_arin(iptools::ip_random(10))
whois_arin <- function(x, ...) {
  UseMethod("whois_arin")
}

#' @rdname whois_arin
#' @export
whois_arin.ipv4 <- function(x, ...) {

  stopifnot(all(is_ipv4(x)))

  whois_arin.character(x, ...)

}

#' @rdname whois_arin
#' @export
whois_arin.character <- function(x, ...) {

  urls <- sprintf("http://whois.arin.net/rest/ip/%s", x)
  x <- lapply(urls, jsonlite::fromJSON)
  class(x) <- "ripe_arin"
  x

}

#' ARIN WHOIS object print method
#' @param x ARIN WHOIS object
#' @param .. unused
#' @noRd
#' @export
print.arin_whois <- function(x, ...) {
  print(str(x))
}