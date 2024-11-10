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
render_docs(dir = ".")
