#' Convert a character vector of IP(v4) addresses into an `ipv4` object
#'
#' @md
#' @param x a character vector of IPv4 addresses
#' @export
as.ipv4 <- function(x) {

  stopifnot(all(is_ipv4(x)))

  class(x) <- c("ipv4", "ip", "inet")

  x

}
