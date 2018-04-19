#' S3 print method for IPv4 objects
#'
#' @noRd
#' @export
#' @examples
#' x <- iptools::ip_random(10)
#' x <- as.ipv4(x)
#' x
print.ipv4 <- function(x, ...) {

  stopifnot(all(is_ipv4(x)))

  print(enrich(x), ...)

  invisible(x)

}
