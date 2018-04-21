#' Decode Toredo IPv6 strings into components
#'
#' @md
#' @note only valid IPv6 decoded information is retured.
#' @param x a character vector of Toredo IPv6 addresses
#' @return a data frame of decoded addresses
#' @references <https://tools.ietf.org/html/rfc4380>
#' @export
#' @examples
#' decode_toredo("2001:0000:4136:e378:8000:63bf:3fff:fdd2")
decode_toredo <- function(x) {

  x <- iptools::expand_ipv6(x)

  x <- Filter(is_valid_toredo, x)

  saf <- getOption("stringsAsFactors", FALSE)
  on.exit(options("stringsAsFactors" = saf))
  options(stringsAsFactors = FALSE)

  lapply(x, function(res) {
    if (!(grepl("^2001:", x))) return(NULL)
    list(
      orig = res,
      prefix = substr(res, 1, 9),
      teredo_server_ipv4 = hex_to_ip(substr(res, 11, 19)),
      flags = substr(res, 21, 24),
      udp_port = as.integer(as.hexmode(substr(toString(!as.hexmode(sprintf("%s0000", substr(res, 26, 29)))), 1, 4))),
      client_ipv4 = hex_to_ip(substr(res, 31, 39), TRUE)
    )
  }) -> rows

  rows <- do.call(rbind.data.frame, rows)

  class(rows) <- c("tbl_df", "tbl", "data.frame")

  rows

}



