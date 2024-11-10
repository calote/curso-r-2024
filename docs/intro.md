# Introducción a R


## Vectorización en R

``` r
# Ejemplo de vectorización vs bucles
x <- 1:1000
system.time(for(i in 1:length(x)) x[i]^2)
```

       user  system elapsed 
      0.001   0.000   0.001 

``` r
system.time(x^2)
```

       user  system elapsed 
          0       0       0 
