# README.md


En RStudio hay varias formas sencillas de generar los archivos Markdown
para GitHub:

### 1. Usando el botón Render en RStudio

``` yaml
---
title: "Mi Documento"
format: 
  gfm: default
  html: default
---
```

1.  Abrir el archivo .qmd
2.  Clic en botón “Render” (o Ctrl/Cmd + Shift + K)
3.  RStudio generará tanto el HTML como el MD

### 2. Desde la consola de RStudio

``` r
# Para un solo archivo
quarto::quarto_render("documento.qmd", output_format = "gfm")

# Para varios archivos en una carpeta
archivos <- list.files(pattern = "\\.qmd$")
lapply(archivos, quarto::quarto_render, output_format = "gfm")
```

### 3. Crear un script de renderizado

``` r
# archivo: render_docs.R
render_docs <- function(dir = "docs") {
  # Listar todos los archivos .qmd
  archivos <- list.files(
    path = dir, 
    pattern = "\\.qmd$", 
    full.names = TRUE
  )
  
  # Renderizar cada archivo
  for(archivo in archivos) {
    cat("Renderizando:", archivo, "\n")
    quarto::quarto_render(archivo, output_format = "gfm")
  }
  
  cat("\nProceso completado!\n")
}

# Ejecutar
render_docs()
```

### 4. Crear un proyecto de RStudio con estructura

``` r
# Estructura recomendada para el proyecto
mi_proyecto/
├── README.md
├── _quarto.yml      # Configuración global
├── docs/
│   ├── index.qmd
│   ├── tema1.qmd
│   └── tema2.qmd
└── scripts/
    └── render_docs.R

# Archivo _quarto.yml
project:
  type: website
  output-dir: docs

format:
  html:
    theme: cosmo
    toc: true
  gfm:
    toc: true
```

### 5. Configuración Visual en RStudio

1.  Abrir el archivo .qmd
2.  En la barra superior del editor:
    - Seleccionar “Visual” para edición visual
    - Usar el menú de formato para:
      - Añadir encabezados
      - Insertar código
      - Añadir tablas
      - Insertar imágenes

### 6. Ejemplo práctico completo

```` r
# Crear nuevo proyecto con Git
usethis::create_project("curso-r-2024")
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
  gfm: default
  html: default
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

## Renderizar
quarto::quarto_render("docs/intro.qmd", output_format = "gfm")

## Commit y push
## Los archivos generados aparecerán en el panel Git de RStudio
````

### Tips para el flujo de trabajo en RStudio:

1.  **Previsualización**:
    - Split editor (Ctrl/Cmd + Alt + Shift + P)
    - Ver resultado en tiempo real
2.  **Atajos de teclado útiles**:
    - Ctrl/Cmd + Alt + I: Insertar chunk de R
    - Ctrl/Cmd + Shift + K: Render
    - Ctrl/Cmd + S: Guardar
3.  **Panel Git integrado**:
    - Stage cambios
    - Commit
    - Push
4.  **Visual Editor**:
    - Facilita la edición de tablas
    - Mejor manejo de imágenes
    - Formato WYSIWYG

### Referencias

- <a
  href="http://destio.us.es/calvo/Qtutoriales/GitGithubRRStudio/trans_lab_PasosUsoInicialGitGithubRStudio.html#/title-slide"
  target="_blank">Paso a paso: Uso Inicial de Git, GitHub con RStudio
  (transparencias). Pedro Luque</a>

- <a href="https://github.com/calote/curso-r-2024"
  target="_blank">Repositorio en GitHub de ejemplo</a>

- Otros ejemplos de repositorios:

  - <a
    href="https://github.com/BiostatOmics/HArats_multiomics/tree/main/Rscripts"
    target="_blank">MADOBIS24-01</a>

  - <a href="https://github.com/Juande-cloud/TFM-Juan-de-Dios-Marin-Manzano"
    target="_blank">MADOBIS24-02</a>

  - <a
    href="https://github.com/NicoLobato/Transcriptomics-data_Supervised-learning-models"
    target="_blank">MADOBIS24-03</a>
