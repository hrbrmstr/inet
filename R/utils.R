hex_to_ip <- function(x, obfuscated = FALSE) {

  res <- sub(":", "", x)
  if (obfuscated) res <- toString(!as.hexmode(res))
  res <- c(substr(res, 1, 4), substr(res, 5, 8))
  res <- c(substr(res[1], 1, 2), substr(res[1], 3, 4), substr(res[2], 1, 2), substr(res[2], 3, 4))
  res <- as.integer(as.raw(sprintf("0x%s", res)))
  res <- paste0(res, collapse=".")

  res

}

is_valid_toredo <- function(x) grepl("^2001:", x)