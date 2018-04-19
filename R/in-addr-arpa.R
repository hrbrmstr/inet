#' Convert IPv4 addresses into in-addr.arpa format
#'
#' @md
#' @param x a vector of IPv4 addresses
#' @param ... unused
#' @references [RFC 2317](https://tools.ietf.org/html/rfc2317)
#' @export
#' @examples
#' in_addr_arpa(iptools::ip_random(10))
in_addr_arpa <- function(x, ...) {
  UseMethod("in_addr_arpa")
}

#' @rdname in_addr_arpa
#' @export
in_addr_arpa.ipv4 <- function(x, ...) {

  stopifnot(all(is_ipv4(x)))

  in_addr_arpa.character(x, ...)

}

#' @rdname in_addr_arpa
#' @export
in_addr_arpa.character <- function(x, ...) {

  x <- strsplit(x, ".", fixed = TRUE)
  x <- lapply(x, rev)
  x <- sapply(x, paste0, collapse = ".")
  x <- sprintf("%s.in-addr.arpa", x)

  x

}