summary_from_prediction <- function(prediction) {
  predictions %>%
  filter(pred_won != 0) %>%
  group_by(won) %>%
  summarize(
    correct = mean(pred),
    N = n()
  )
}
