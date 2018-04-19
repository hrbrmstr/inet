#' Turn an IPv4 object or a character vector of IPv4 addresses into a data frame of octets
#'
#' @md
#' @param x a character vector of IPv4 addresses
#' @export
#' @examples
#' octets(iptools::ip_random(10))
octets <- function(x) {

  stopifnot(all(is_ipv4(x)))

  saf <- getOption("stringsAsFactors", default = FALSE)
  options("stringsAsFactors" = FALSE)
  on.exit(options("stringsAsFactors" = saf))

  x <- strsplit(x, ".", fixed = TRUE)
  x <- lapply(x, as.integer)
  x <- do.call(rbind.data.frame, x)
  x <- stats::setNames(x, c("o1", "o2", "o3", "o4"))

  class(x) <- c("tbl_df", "tbl", "data.frame")

  x

}
