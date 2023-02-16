summary_from_prediction <- function(predictions) {
  predictions %>%
    filter(pred_won != 0) %>%
    group_by(won) %>%
    summarize(
      correct = mean(pred),
      N = n()
    )
}
