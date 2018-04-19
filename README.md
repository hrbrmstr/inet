
# inet

Higher-order Internet Protocol (‘IP’) Address Methods

## Description

A collection of tools and methods that expand upon the functionality of
the ‘iptools’ package. Only ‘IPv4’ addresses are currently supported.

## What’s Inside The Tin

  - `as.ipv4`: Convert a character vector of IP(v4) addresses into an
    ‘ipv4’ object
  - `as.numeric`: Convert an IPv4 object to an numeric vector
  - `enrich`: Enrich a collection of IP addresses with country and AS
    information
  - `in_addr_arpa`: Convert IPv4 addresses into in-addr.arpa format
  - `octets`: Turn an IPv4 object or a character vector of IPv4
    addresses into a data frame of octets

The following functions are implemented:

## Installation

``` r
devtools::install_github("hrbrmstr/inet")
```

## Usage

``` r
library(inet)
library(tidyverse)

# current verison
packageVersion("inet")
```

    ## [1] '0.1.0'

``` r
set.seed(19216811)

x <- iptools::ip_random(20)
x <- as.ipv4(x)

as.numeric(x)
```

    ##  [1]  846802342   37819282  562139280 1904334552 2073464298 1462786920  656164479  365973582  620436750  367748943
    ## [11] 1650756740 1655960074 1520558330  881223455 1505657270 1093506443 2076844006 1439477261 1930941526 1922773769

``` r
enrich(x)
```

    ## # A tibble: 20 x 5
    ##    ip                     ip_n   asn aso                                      country_name     
    ##  * <chr>                 <dbl> <int> <chr>                                    <chr>            
    ##  1 50.121.45.166    846802342.  5650 Frontier Communications of America, Inc. United States    
    ##  2 2.65.19.146       37819282. 44034 Hi3G Access AB                           Sweden           
    ##  3 33.129.144.144   562139280.    NA <NA>                                     United States    
    ##  4 113.129.214.216 1904334552.  4134 No.31,Jin-rong Street                    China            
    ##  5 123.150.141.234 2073464298. 17638 ASN for TIANJIN Provincial Net of CT     China            
    ##  6 87.48.91.104    1462786920.  3292 Tele Danmark                             Denmark          
    ##  7 39.28.70.127     656164479.    NA <NA>                                     Republic of Korea
    ##  8 21.208.80.78     365973582.    NA <NA>                                     United States    
    ##  9 36.251.29.14     620436750.  4837 CNCGROUP China169 Backbone               China            
    ## 10 21.235.103.79    367748943.    NA <NA>                                     United States    
    ## 11 98.100.140.132  1650756740. 10796 Time Warner Cable Internet LLC           United States    
    ## 12 98.179.242.10   1655960074. 22773 Cox Communications Inc.                  United States    
    ## 13 90.161.224.250  1520558330. 12479 Orange Espagne SA                        Spain            
    ## 14 52.134.103.31    881223455.    NA <NA>                                     United States    
    ## 15 89.190.129.182  1505657270.    NA <NA>                                     <NA>             
    ## 16 65.45.149.139   1093506443.  2828 XO Communications                        United States    
    ## 17 123.202.31.230  2076844006.  9269 Hong Kong Broadband Network Ltd.         Hong Kong        
    ## 18 85.204.174.13   1439477261. 48095 Xt Global Networks Ltd.                  India            
    ## 19 115.23.212.86   1930941526.  4766 Korea Telecom                            Republic of Korea
    ## 20 114.155.51.9    1922773769.  4713 NTT Communications Corporation           Japan

``` r
octets(x)
```

    ## # A tibble: 20 x 4
    ##       o1    o2    o3    o4
    ##    <int> <int> <int> <int>
    ##  1    50   121    45   166
    ##  2     2    65    19   146
    ##  3    33   129   144   144
    ##  4   113   129   214   216
    ##  5   123   150   141   234
    ##  6    87    48    91   104
    ##  7    39    28    70   127
    ##  8    21   208    80    78
    ##  9    36   251    29    14
    ## 10    21   235   103    79
    ## 11    98   100   140   132
    ## 12    98   179   242    10
    ## 13    90   161   224   250
    ## 14    52   134   103    31
    ## 15    89   190   129   182
    ## 16    65    45   149   139
    ## 17   123   202    31   230
    ## 18    85   204   174    13
    ## 19   115    23   212    86
    ## 20   114   155    51     9

``` r
in_addr_arpa(x)
```

    ##  [1] "166.45.121.50.in-addr.arpa"   "146.19.65.2.in-addr.arpa"     "144.144.129.33.in-addr.arpa" 
    ##  [4] "216.214.129.113.in-addr.arpa" "234.141.150.123.in-addr.arpa" "104.91.48.87.in-addr.arpa"   
    ##  [7] "127.70.28.39.in-addr.arpa"    "78.80.208.21.in-addr.arpa"    "14.29.251.36.in-addr.arpa"   
    ## [10] "79.103.235.21.in-addr.arpa"   "132.140.100.98.in-addr.arpa"  "10.242.179.98.in-addr.arpa"  
    ## [13] "250.224.161.90.in-addr.arpa"  "31.103.134.52.in-addr.arpa"   "182.129.190.89.in-addr.arpa" 
    ## [16] "139.149.45.65.in-addr.arpa"   "230.31.202.123.in-addr.arpa"  "13.174.204.85.in-addr.arpa"  
    ## [19] "86.212.23.115.in-addr.arpa"   "9.51.155.114.in-addr.arpa"
