sequences <- c(
    "CATAAAAGAACGTAGGTCGCCCGTCCGTAACCTGTCGGATCACCGGAAAGGACCCGTAAAGTGATAATGAT",
    "ATAAAGGCAGTCGCTCTGTAAGCTGTCGATTCACCGGAAAGATGGCGTTACCACGTAAAGTGATAATGATTAT",
    "ATCAAAGAACGTGTAGCCTGTCCGTAATCTAGCGCATTTCACACGAGACCCGCGTAATGGG",
    "CGTAAATAGGTAATGATTATCATTACATATCACAACTAGGGCCGTATTAATCATGATATCATCA",
    "GTCGCTAGAGGCATCGTGAGTCGCTTCCGTACCGCAAGGATGACGAGTCACTTAAAGTGATAAT",
    "CCGTAACCTTCATCGGATCACCGGAAAGGACCCGTAAATAGACCTGATTATCATCTACAT"
)

test_that("spoa_consensus does not regress", {
    expect_snapshot_value(
        spoa_consensus(sequences, 3, -5, -3, algorithm = "global"),
        cran = TRUE
    )
    expect_snapshot_value(
        spoa_consensus(sequences, 3, -5, -3, algorithm = "local"),
        cran = TRUE
    )
    expect_snapshot_value(
        spoa_consensus(sequences, 3, -5, -3, algorithm = "semi.global"),
        cran = TRUE
    )
    expect_snapshot_value(
        spoa_consensus(sequences, 3, -5, -3, 0,
            algorithm = "global",
            gap_algorithm = "affine"
        ),
        cran = TRUE
    )
    expect_snapshot_value(
        spoa_consensus(sequences, 3, -5, -3, 0,
            algorithm = "local",
            gap_algorithm = "affine"
        ),
        cran = TRUE
    )
    expect_snapshot_value(
        spoa_consensus(sequences, 3, -5, -3, 0,
            algorithm = "semi.global",
            gap_algorithm = "affine"
        ),
        cran = TRUE
    )
    expect_snapshot_value(
        spoa_consensus(sequences, 3, -5, -3, 0, -1, -1,
            algorithm = "global",
            gap_algorithm = "convex"
        ),
        cran = TRUE
    )
    expect_snapshot_value(
        spoa_consensus(sequences, 3, -5, -3, 0, -1, -1,
            algorithm = "local",
            gap_algorithm = "convex"
        ),
        cran = TRUE
    )
    expect_snapshot_value(
        spoa_consensus(sequences, 3, -5, -3, 0, -1, -1,
            algorithm = "semi",
            gap_algorithm = "convex"
        ),
        cran = TRUE
    )
})

sequences <- c(
    "CATAAAAGAACGTAGGTCGCCCGTCCGTAACCTGTCGGATCACCGGAAAGGACCCGTAAAGTGATAATGAT",
    "ATAAAGGCAGTCGCTCTGTAAGCTGTCGATTCACCGGAAAGATGGCGTTACCACGTAAAGTGATAATGATTAT",
    "ATCAAAGAACGTGTAGCCTGTCCGTAATCTAGCGCATTTCACACGAGACCCGCGTAATGGG",
    "CGTAAATAGGTAATGATTATCATTACATATCACAACTAGGGCCGTATTAATCATGATATCATCA",
    "GTCGCTAGAGGCATCGTGAGTCGCTTCCGTACCGCAAGGATGACGAGTCACTTAAAGTGATAAT",
    "CCGTAACCTTCATCGGATCACCGGAAAGGACCCGTAAATAGACCTGATTATCATCTACAT"
)
test_that("spoa_align does not regress", {
    expect_snapshot_value(
        spoa_align(sequences, 3, -5, -3, algorithm = "global"),
        style = "json2", cran = TRUE
    )
    expect_snapshot_value(
        spoa_align(sequences, 3, -5, -3, algorithm = "local"),
        style = "json2", cran = TRUE
    )
    expect_snapshot_value(
        spoa_align(sequences, 3, -5, -3, algorithm = "semi"),
        style = "json2", cran = TRUE
    )
    expect_snapshot_value(
        spoa_align(sequences, 3, -5, -3, 0,
            algorithm = "global",
            gap_algorithm = "affine"
        ),
        style = "json2", cran = TRUE
    )
    expect_snapshot_value(
        spoa_align(sequences, 3, -5, -3, 0,
            algorithm = "local",
            gap_algorithm = "affine"
        ),
        style = "json2", cran = TRUE
    )
    expect_snapshot_value(
        spoa_align(sequences, 3, -5, -3, 0,
            algorithm = "semi",
            gap_algorithm = "affine"
        ),
        style = "json2", cran = TRUE
    )
    expect_snapshot_value(
        spoa_align(sequences, 3, -5, -3, 0, -1, -1,
            algorithm = "global",
            gap_algorithm = "convex"
        ),
        style = "json2", cran = TRUE
    )
    expect_snapshot_value(
        spoa_align(sequences, 3, -5, -3, 0, -1, -1,
            algorithm = "local",
            gap_algorithm = "convex"
        ),
        style = "json2", cran = TRUE
    )
    expect_snapshot_value(
        spoa_align(sequences, 3, -5, -3, 0, -1, -1,
            algorithm = "semi",
            gap_algorithm = "convex"
        ),
        style = "json2", cran = TRUE
    )
})
