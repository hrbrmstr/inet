#' Enrich a collection of IP addresses with country and AS information
#'
#' Takes a character vector of classed IP addresses and minimally converts them
#' to their numeric representation. If Maxmind datases are available, country
#' and autonomous system (AS) inforamtion will be added as well.
#'
#' @md
#' @param x a character vector of IPv4 addresses
#' @param ... passed to other methods
#' @param mmm_asn_db,mm_city_db paths to the Maxmind GeoLite ASN and City databases
#' @export
#' @examples
#' x <- iptools::ip_random(10)
#' enrich(x)
#' enrich(as.ipv4(x))
enrich <- function(x, ..., mm_asn_db = Sys.getenv("MAXMIND_ASN_DB_PATH"),
                   mm_city_db = Sys.getenv("MAXMIND_CITY_DB_PATH")) {
  UseMethod("enrich", x)
}


#' enrich method for IPv4 addresses
#'
#' @rdname enrich
#' @export
enrich.ipv4 <- function(x, mm_asn_db = Sys.getenv("MAXMIND_ASN_DB_PATH"),
                        mm_city_db = Sys.getenv("MAXMIND_CITY_DB_PATH")) {

  stopifnot(all(is_ipv4(x)))

  saf <- getOption("stringsAsFactors", default = FALSE)
  options("stringsAsFactors" = FALSE)
  on.exit(options("stringsAsFactors" = saf))

  data.frame(
    ip = as.character(x),
    ip_n = iptools::ip_to_numeric(x)
  ) -> y

  if (mm_asn_db != "") {
    cbind.data.frame(
      y, rgeolocate::maxmind(x, mm_asn_db, c("asn", "aso"))
    ) -> y
  }

  if (mm_asn_db != "") {
    cbind.data.frame(
      y, rgeolocate::maxmind(x, mm_city_db, "country_name")
    ) -> y
  }

  class(y) <- c("tbl_df", "tbl", "data.frame")

  y

}

#' enrich method for plain character vector
#' @rdname enrich
#' @export
enrich.character<- function(x, mm_asn_db = Sys.getenv("MAXMIND_ASN_DB_PATH"),
                            mm_city_db = Sys.getenv("MAXMIND_CITY_DB_PATH")) {

  saf <- getOption("stringsAsFactors", default = FALSE)
  options("stringsAsFactors" = FALSE)
  on.exit(options("stringsAsFactors" = saf))

  data.frame(
    ip = as.character(x),
    ip_n = iptools::ip_to_numeric(x)
  ) -> y

  if (mm_asn_db != "") {
    cbind.data.frame(
      y, rgeolocate::maxmind(x, mm_asn_db, c("asn", "aso"))
    ) -> y
  }

  if (mm_asn_db != "") {
    cbind.data.frame(
      y, rgeolocate::maxmind(x, mm_city_db, "country_name")
    ) -> y
  }

  class(y) <- c("tbl_df", "tbl", "data.frame")

  y

}
