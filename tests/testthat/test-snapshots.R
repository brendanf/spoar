sequences <- c(
    "CATAAAAGAACGTAGGTCGCCCGTCCGTAACCTGTCGGATCACCGGAAAGGACCCGTAAAGTGATAATGAT",
    "ATAAAGGCAGTCGCTCTGTAAGCTGTCGATTCACCGGAAAGATGGCGTTACCACGTAAAGTGATAATGATTAT",
    "ATCAAAGAACGTGTAGCCTGTCCGTAATCTAGCGCATTTCACACGAGACCCGCGTAATGGG",
    "CGTAAATAGGTAATGATTATCATTACATATCACAACTAGGGCCGTATTAATCATGATATCATCA",
    "GTCGCTAGAGGCATCGTGAGTCGCTTCCGTACCGCAAGGATGACGAGTCACTTAAAGTGATAAT",
    "CCGTAACCTTCATCGGATCACCGGAAAGGACCCGTAAATAGACCTGATTATCATCTACAT"
)

test_that("spoaConsensus does not regress", {
    expect_snapshot_value(
        spoaConsensus(sequences, spoaAlgo("global", 3, -5, -3)),
        cran = TRUE
    )
    expect_snapshot_value(
        spoaConsensus(sequences, spoaAlgo("local", 3, -5, -3)),
        cran = TRUE
    )
    expect_snapshot_value(
        spoaConsensus(sequences, spoaAlgo("semi.global", 3, -5, -3)),
        cran = TRUE
    )
    expect_snapshot_value(
        spoaConsensus(sequences, spoaAlgo("global", 3, -5, -3, 0)),
        cran = TRUE
    )
    expect_snapshot_value(
        spoaConsensus(sequences, spoaAlgo("local", 3, -5, -3, 0)),
        cran = TRUE
    )
    expect_snapshot_value(
        spoaConsensus(sequences, spoaAlgo("semi.global", 3, -5, -3, 0)),
        cran = TRUE
    )
    expect_snapshot_value(
        spoaConsensus(sequences, spoaAlgo("global", 3, -5, -3, 0, -1, -1)),
        cran = TRUE
    )
    expect_snapshot_value(
        spoaConsensus(sequences, spoaAlgo("local", 3, -5, -3, 0, -1, -1)),
        cran = TRUE
    )
    expect_snapshot_value(
        spoaConsensus(sequences, spoaAlgo("semi", 3, -5, -3, 0, -1, -1)),
        cran = TRUE
    )
})

test_that("spoaAlign does not regress", {
    expect_snapshot_value(
        spoaAlign(sequences, spoaAlgo("global", 3, -5, -3)),
        style = "json2", cran = TRUE
    )
    expect_snapshot_value(
        spoaAlign(sequences, spoaAlgo("local", 3, -5, -3)),
        style = "json2", cran = TRUE
    )
    expect_snapshot_value(
        spoaAlign(sequences, spoaAlgo("semi", 3, -5, -3)),
        style = "json2", cran = TRUE
    )
    expect_snapshot_value(
        spoaAlign(sequences, spoaAlgo("global", 3, -5, -3, 0)),
        style = "json2", cran = TRUE
    )
    expect_snapshot_value(
        spoaAlign(sequences, spoaAlgo("local", 3, -5, -3, 0)),
        style = "json2", cran = TRUE
    )
    expect_snapshot_value(
        spoaAlign(sequences, spoaAlgo("semi", 3, -5, -3, 0)),
        style = "json2", cran = TRUE
    )
    expect_snapshot_value(
        spoaAlign(sequences, spoaAlgo("global", 3, -5, -3, 0, -1, -1)),
        style = "json2", cran = TRUE
    )
    expect_snapshot_value(
        spoaAlign(sequences, spoaAlgo("local", 3, -5, -3, 0, -1, -1)),
        style = "json2", cran = TRUE
    )
    expect_snapshot_value(
        spoaAlign(sequences, spoaAlgo("semi", 3, -5, -3, 0, -1, -1)),
        style = "json2", cran = TRUE
    )
})

w <- seq(1, 21, 4)

test_that("weighted spoaConsensus does not regress", {
    expect_snapshot_value(
        spoaConsensus(sequences, spoaAlgo("global", 3, -5, -3), w = w),
        cran = TRUE
    )
    expect_snapshot_value(
        spoaConsensus(sequences, spoaAlgo("local", 3, -5, -3), w = w),
        cran = TRUE
    )
    expect_snapshot_value(
        spoaConsensus(sequences, spoaAlgo("semi.global", 3, -5, -3), w = w),
        cran = TRUE
    )
    expect_snapshot_value(
        spoaConsensus(sequences, spoaAlgo("global", 3, -5, -3, 0), w = w),
        cran = TRUE
    )
    expect_snapshot_value(
        spoaConsensus(sequences, spoaAlgo("local", 3, -5, -3, 0), w = w),
        cran = TRUE
    )
    expect_snapshot_value(
        spoaConsensus(sequences, spoaAlgo("semi.global", 3, -5, -3, 0), w = w),
        cran = TRUE
    )
    expect_snapshot_value(
        spoaConsensus(sequences, spoaAlgo("global", 3, -5, -3, 0, -1, -1), w = w),
        cran = TRUE
    )
    expect_snapshot_value(
        spoaConsensus(sequences, spoaAlgo("local", 3, -5, -3, 0, -1, -1), w = w),
        cran = TRUE
    )
    expect_snapshot_value(
        spoaConsensus(sequences, spoaAlgo("semi", 3, -5, -3, 0, -1, -1), w = w),
        cran = TRUE
    )
})

test_that("weighted spoaAlign does not regress", {
    expect_snapshot_value(
        spoaAlign(sequences, spoaAlgo("global", 3, -5, -3), w = w),
        style = "json2", cran = TRUE
    )
    expect_snapshot_value(
        spoaAlign(sequences, spoaAlgo("local", 3, -5, -3), w = w),
        style = "json2", cran = TRUE
    )
    expect_snapshot_value(
        spoaAlign(sequences, spoaAlgo("semi.global", 3, -5, -3), w = w),
        style = "json2", cran = TRUE
    )
    expect_snapshot_value(
        spoaAlign(sequences, spoaAlgo("global", 3, -5, -3, 0), w = w),
        style = "json2", cran = TRUE
    )
    expect_snapshot_value(
        spoaAlign(sequences, spoaAlgo("local", 3, -5, -3, 0), w = w),
        style = "json2", cran = TRUE
    )
    expect_snapshot_value(
        spoaAlign(sequences, spoaAlgo("semi.global", 3, -5, -3, 0), w = w),
        style = "json2", cran = TRUE
    )
    expect_snapshot_value(
        spoaAlign(sequences, spoaAlgo("global", 3, -5, -3, 0, -1, -1), w = w),
        style = "json2", cran = TRUE
    )
    expect_snapshot_value(
        spoaAlign(sequences, spoaAlgo("local", 3, -5, -3, 0, -1, -1), w = w),
        style = "json2", cran = TRUE
    )
    expect_snapshot_value(
        spoaAlign(sequences, spoaAlgo("semi", 3, -5, -3, 0, -1, -1), w = w),
        style = "json2", cran = TRUE
    )
})
