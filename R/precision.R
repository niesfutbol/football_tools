summary_from_prediction <- function(predictions) {
  summary <- predictions %>%
    filter(pred_won != 0) %>%
    group_by(pred_won) %>%
    summarize(
      correct = mean(pred),
      N = n()
    )
  return(summary)
}
