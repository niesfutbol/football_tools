prediction <- read_csv("/workdir/tests/data/predictions_from_presition.csv", show_col_types = FALSE)

describe("summary", {
  it("presition", {
    obtained <- summary_from_prediction(prediction)
    expected <- tibble::tibble()
    expect_equal(obtained, expected)
  })
})
