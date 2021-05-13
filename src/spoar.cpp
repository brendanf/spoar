#include <Rcpp.h>
#include "spoa/include/spoa/spoa.hpp"
using namespace Rcpp;
//

spoa::AlignmentType get_alignment_type(std::string s) {
    if (s == "local") {
        return spoa::AlignmentType::kSW;
    } else if (s == "global") {
        return spoa::AlignmentType::kNW;
    } else if (s == "semi.global") {
        return spoa::AlignmentType::kOV;
    }
    stop("Error: invalid alignment algorithm '%s'", s);
}

std::unique_ptr<spoa::AlignmentEngine> get_alignment_engine(
        std::string type,
        std::int8_t m,
        std::int8_t n,
        std::int8_t g,
        std::int8_t e,
        std::int8_t q,
        std::int8_t c
        ) {
    spoa::AlignmentType aligntype = get_alignment_type(type);
    return spoa::AlignmentEngine::Create(aligntype, m, n, g, e, q, c);
}

// [[Rcpp::export]]
String spoa_consensus(
        std::vector<std::string> seq,
        std::string algorithm,
        int m,
        int n,
        int g,
        int e,
        int q,
        int c,
        std::vector<std::uint32_t> w
    ) {
    auto alignment_engine = get_alignment_engine(algorithm, m, n, g, e, q, c);
    spoa::Graph graph{};
    for (unsigned i = 0; i < seq.size(); i++) {
        auto alignment = alignment_engine->Align(seq[i], graph);
        graph.AddAlignment(alignment, seq[i], w[i]);
    }
    auto consensus = graph.GenerateConsensus();
    return consensus;
}

// [[Rcpp::export]]
std::vector<std::string> spoa_align(
        std::vector<std::string> seq,
        std::string algorithm,
        int m,
        int n,
        int g,
        int e,
        int q,
        int c,
        std::vector<std::uint32_t> w
    ) {
    auto alignment_engine = get_alignment_engine(algorithm, m, n, g, e, q, c);
    spoa::Graph graph{};
    for (unsigned i = 0; i < seq.size(); i++) {
        auto alignment = alignment_engine->Align(seq[i], graph);
        graph.AddAlignment(alignment, seq[i], w[i]);
    }

    std::vector<std::string> msa = graph.GenerateMultipleSequenceAlignment();
    return msa;
}
