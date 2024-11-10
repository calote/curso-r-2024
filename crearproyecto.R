# https://github.com/calote/curso-r-2024/
#usethis::create_project("curso-r-2024")
usethis::use_git()
usethis::use_github()

# Crear estructura
dir.create("docs")
dir.create("scripts")

# Crear primer documento
writeLines(
  '---
title: "Introducción a R"
format:
  html: default
  gfm: default
execute:
  echo: true
---

## Vectorización en R

```{r}
# Ejemplo de vectorización vs bucles
x <- 1:1000
system.time(for(i in 1:length(x)) x[i]^2)
system.time(x^2)
```
', "docs/intro.qmd")
