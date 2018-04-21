#' Perform 6-to-4 and 4-to-6 addressing
#'
#' @md
#' @param x a character vector of IPv4 (`ipv4_to_ipv6()`) or IPv6 addresses (`ipv6_to_ipv4()`)
#' @return a character vector of converted address with `NA` for any that were not able to be
#'         converted.
#' @references <https://tools.ietf.org/html/rfc3056>
#' @export
#' @examples
#' set.seed(19216811)
#' src <- iptools::ip_random(10)
#' to6 <- ipv4_to_ipv6(src)
#' to4 <- ipv6_to_ipv4(to6)
#' all(src == to4)
ipv4_to_ipv6 <- function(x) {
  sapply(x, function(res) {
    res <- strsplit(res, ".", fixed=TRUE)[[1]]
    res <- sprintf("%02x", as.numeric(res))
    res <- sprintf("%s%s:%s%s", res[1], res[2], res[3], res[4])
    sprintf("2002:%s::%s", res, res)
  }, USE.NAMES = FALSE)
}

#' @rdname ipv4_to_ipv6
#' @export
ipv6_to_ipv4 <- function(x) {
  x <- iptools::expand_ipv6(x) # NOTE: github version
  sapply(x, function(res) {
    if (!grepl("^2002", res)) return(NA_character_) # not a valid IPv6 string for 6-to-4
    res <- strsplit(res, ":", fixed=TRUE)[[1]]
    res <- tail(res, 2)
    res <- c(substr(res[1], 1, 2), substr(res[1], 3, 4), substr(res[2], 1, 2), substr(res[2], 3, 4))
    res <- as.integer(as.hexmode(res))
    res <- paste0(res, collapse=".")
  }, USE.NAMES = FALSE)
}

