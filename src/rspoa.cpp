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
        std::string subtype,
        std::int8_t m,
        std::int8_t n,
        std::int8_t g,
        std::int8_t e,
        std::int8_t q,
        std::int8_t c
        ) {
    spoa::AlignmentType aligntype = get_alignment_type(type);
    if (subtype == "linear") {
        return spoa::AlignmentEngine::Create(aligntype, m, n, g);
    } else if (subtype == "affine") {
        return spoa::AlignmentEngine::Create(aligntype, m, n, g, e);
    } else if (subtype == "convex") {
        return spoa::AlignmentEngine::Create(aligntype, m, n, g, e, q, c);
    }
    stop("Error: invalid gap algorithm '%s'", subtype);
}

// [[Rcpp::export]]
String spoa_consensus_character(
        std::vector<std::string> seq,
        std::string algorithm,
        std::string gap_algorithm,
        int match,
        int mismatch,
        int gap_open,
        int gap_extend,
        int gap_open2,
        int gap_extend2) {
    auto alignment_engine = get_alignment_engine(
        algorithm, gap_algorithm, match, mismatch, gap_open, gap_extend, gap_open2,
        gap_extend2);
    spoa::Graph graph{};
    for (const std::string& s : seq) {
        auto alignment = alignment_engine->Align(s, graph);
        graph.AddAlignment(alignment, s);
    }
    auto consensus = graph.GenerateConsensus();
    return consensus;
}

// [[Rcpp::export]]
std::vector<std::string> spoa_align_character(
        std::vector<std::string> seq,
        std::string algorithm,
        std::string gap_algorithm,
        int match,
        int mismatch,
        int gap_open,
        int gap_extend,
        int gap_open2,
        int gap_extend2) {
    auto alignment_engine = get_alignment_engine(
        algorithm, gap_algorithm, match, mismatch, gap_open, gap_extend, gap_open2,
        gap_extend2);
    spoa::Graph graph{};
    for (const std::string& s : seq) {
        auto alignment = alignment_engine->Align(s, graph);
        graph.AddAlignment(alignment, s);
    }

    std::vector<std::string> msa = graph.GenerateMultipleSequenceAlignment();
    return msa;
}
