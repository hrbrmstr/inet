#' Convert an IPv4 object to an numeric vector
#'
#' @param x IPv4 vector
#' @param ... unused
#' @export
#' @examples
#' as.numeric(as.ipv4(iptools::ip_random(10)))
as.double.ipv4 <- function(x, ...) {

  stopifnot(all(is_ipv4(x)))

  iptools::ip_to_numeric(x)

}
