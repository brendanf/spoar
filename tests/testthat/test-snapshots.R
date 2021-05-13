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
        spoaConsensus(sequences, 3, -5, -3, algorithm = "global"),
        cran = TRUE
    )
    expect_snapshot_value(
        spoaConsensus(sequences, 3, -5, -3, algorithm = "local"),
        cran = TRUE
    )
    expect_snapshot_value(
        spoaConsensus(sequences, 3, -5, -3, algorithm = "semi.global"),
        cran = TRUE
    )
    expect_snapshot_value(
        spoaConsensus(sequences, 3, -5, -3, 0, algorithm = "global"),
        cran = TRUE
    )
    expect_snapshot_value(
        spoaConsensus(sequences, 3, -5, -3, 0, algorithm = "local"),
        cran = TRUE
    )
    expect_snapshot_value(
        spoaConsensus(sequences, 3, -5, -3, 0, algorithm = "semi.global"),
        cran = TRUE
    )
    expect_snapshot_value(
        spoaConsensus(sequences, 3, -5, -3, 0, -1, -1, algorithm = "global"),
        cran = TRUE
    )
    expect_snapshot_value(
        spoaConsensus(sequences, 3, -5, -3, 0, -1, -1, algorithm = "local"),
        cran = TRUE
    )
    expect_snapshot_value(
        spoaConsensus(sequences, 3, -5, -3, 0, -1, -1, algorithm = "semi"),
        cran = TRUE
    )
})

test_that("spoaAlign does not regress", {
    expect_snapshot_value(
        spoaAlign(sequences, 3, -5, -3, algorithm = "global"),
        style = "json2", cran = TRUE
    )
    expect_snapshot_value(
        spoaAlign(sequences, 3, -5, -3, algorithm = "local"),
        style = "json2", cran = TRUE
    )
    expect_snapshot_value(
        spoaAlign(sequences, 3, -5, -3, algorithm = "semi"),
        style = "json2", cran = TRUE
    )
    expect_snapshot_value(
        spoaAlign(sequences, 3, -5, -3, 0, algorithm = "global"),
        style = "json2", cran = TRUE
    )
    expect_snapshot_value(
        spoaAlign(sequences, 3, -5, -3, 0, algorithm = "local"),
        style = "json2", cran = TRUE
    )
    expect_snapshot_value(
        spoaAlign(sequences, 3, -5, -3, 0, algorithm = "semi"),
        style = "json2", cran = TRUE
    )
    expect_snapshot_value(
        spoaAlign(sequences, 3, -5, -3, 0, -1, -1, algorithm = "global"),
        style = "json2", cran = TRUE
    )
    expect_snapshot_value(
        spoaAlign(sequences, 3, -5, -3, 0, -1, -1, algorithm = "local"),
        style = "json2", cran = TRUE
    )
    expect_snapshot_value(
        spoaAlign(sequences, 3, -5, -3, 0, -1, -1, algorithm = "semi"),
        style = "json2", cran = TRUE
    )
})

w <- seq(1, 21, 4)

test_that("weighted spoaConsensus does not regress", {
    expect_snapshot_value(
        spoaConsensus(sequences, 3, -5, -3, algo = "global", w = w),
        cran = TRUE
    )
    expect_snapshot_value(
        spoaConsensus(sequences, 3, -5, -3, algo = "local", w = w),
        cran = TRUE
    )
    expect_snapshot_value(
        spoaConsensus(sequences, 3, -5, -3, algo = "semi.global", w = w),
        cran = TRUE
    )
    expect_snapshot_value(
        spoaConsensus(sequences, 3, -5, -3, 0, algo = "global", w = w),
        cran = TRUE
    )
    expect_snapshot_value(
        spoaConsensus(sequences, 3, -5, -3, 0, algo = "local", w = w),
        cran = TRUE
    )
    expect_snapshot_value(
        spoaConsensus(sequences, 3, -5, -3, 0, algo = "semi.global", w = w),
        cran = TRUE
    )
    expect_snapshot_value(
        spoaConsensus(sequences, 3, -5, -3, 0, -1, -1, algo = "global", w = w),
        cran = TRUE
    )
    expect_snapshot_value(
        spoaConsensus(sequences, 3, -5, -3, 0, -1, -1, algo = "local", w = w),
        cran = TRUE
    )
    expect_snapshot_value(
        spoaConsensus(sequences, 3, -5, -3, 0, -1, -1, algo = "semi", w = w),
        cran = TRUE
    )
})

test_that("weighted spoaAlign does not regress", {
    expect_snapshot_value(
        spoaAlign(sequences, 3, -5, -3, algo = "global", w = w),
        style = "json2", cran = TRUE
    )
    expect_snapshot_value(
        spoaAlign(sequences, 3, -5, -3, algo = "local", w = w),
        style = "json2", cran = TRUE
    )
    expect_snapshot_value(
        spoaAlign(sequences, 3, -5, -3, algo = "semi.global", w = w),
        style = "json2", cran = TRUE
    )
    expect_snapshot_value(
        spoaAlign(sequences, 3, -5, -3, 0, algo = "global", w = w),
        style = "json2", cran = TRUE
    )
    expect_snapshot_value(
        spoaAlign(sequences, 3, -5, -3, 0, algo = "local", w = w),
        style = "json2", cran = TRUE
    )
    expect_snapshot_value(
        spoaAlign(sequences, 3, -5, -3, 0, algo = "semi.global", w = w),
        style = "json2", cran = TRUE
    )
    expect_snapshot_value(
        spoaAlign(sequences, 3, -5, -3, 0, -1, -1, algo = "global", w = w),
        style = "json2", cran = TRUE
    )
    expect_snapshot_value(
        spoaAlign(sequences, 3, -5, -3, 0, -1, -1, algo = "local", w = w),
        style = "json2", cran = TRUE
    )
    expect_snapshot_value(
        spoaAlign(sequences, 3, -5, -3, 0, -1, -1, algo = "semi", w = w),
        style = "json2", cran = TRUE
    )
})
