#' Exercise widget
#'
#' Exercise callout
#'
#' @import htmlwidgets
#'
#' @export
exercisewidget <- function(task, instructions, width = NULL, height = NULL, elementId = NULL) {

  # forward options using opts
  opts = list(
    task = task,
    instructions = instructions
  )

  # create widget
  htmlwidgets::createWidget(
    name = 'exercisewidget',
    opts,
    width = width,
    height = height,
    package = 'exercisewidget',
    elementId = elementId
  )
}

#' Shiny bindings for exercisewidget
#'
#' Output and render functions for using exercisewidget within Shiny
#' applications and interactive Rmd documents.
#'
#' @param outputId output variable to read from
#' @param width,height Must be a valid CSS unit (like \code{'100\%'},
#'   \code{'400px'}, \code{'auto'}) or a number, which will be coerced to a
#'   string and have \code{'px'} appended.
#' @param expr An expression that generates a exercisewidget
#' @param env The environment in which to evaluate \code{expr}.
#' @param quoted Is \code{expr} a quoted expression (with \code{quote()})? This
#'   is useful if you want to save an expression in a variable.
#'
#' @name exercisewidget-shiny
#'
#' @export
exercisewidgetOutput <- function(outputId, width = '100%', height = '400px'){
  htmlwidgets::shinyWidgetOutput(outputId, 'exercisewidget', width, height, package = 'exercisewidget')
}

#' @rdname exercisewidget-shiny
#' @export
renderExercisewidget <- function(expr, env = parent.frame(), quoted = FALSE) {
  if (!quoted) { expr <- substitute(expr) } # force quoted
  htmlwidgets::shinyRenderWidget(expr, exercisewidgetOutput, env, quoted = TRUE)
}
