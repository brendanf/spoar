// Generated by using Rcpp::compileAttributes() -> do not edit by hand
// Generator token: 10BE3573-1514-4C36-9D1C-5A225CD40393

#include <Rcpp.h>

using namespace Rcpp;

// spoa_consensus_character
String spoa_consensus_character(CharacterVector seq);
RcppExport SEXP _spoar_spoa_consensus_character(SEXP seqSEXP) {
BEGIN_RCPP
    Rcpp::RObject rcpp_result_gen;
    Rcpp::RNGScope rcpp_rngScope_gen;
    Rcpp::traits::input_parameter< CharacterVector >::type seq(seqSEXP);
    rcpp_result_gen = Rcpp::wrap(spoa_consensus_character(seq));
    return rcpp_result_gen;
END_RCPP
}
// spoa_align_character
CharacterVector spoa_align_character(CharacterVector seq);
RcppExport SEXP _spoar_spoa_align_character(SEXP seqSEXP) {
BEGIN_RCPP
    Rcpp::RObject rcpp_result_gen;
    Rcpp::RNGScope rcpp_rngScope_gen;
    Rcpp::traits::input_parameter< CharacterVector >::type seq(seqSEXP);
    rcpp_result_gen = Rcpp::wrap(spoa_align_character(seq));
    return rcpp_result_gen;
END_RCPP
}
// spoa_consensus_xstringset
S4 spoa_consensus_xstringset(S4 seq);
RcppExport SEXP _spoar_spoa_consensus_xstringset(SEXP seqSEXP) {
BEGIN_RCPP
    Rcpp::RObject rcpp_result_gen;
    Rcpp::RNGScope rcpp_rngScope_gen;
    Rcpp::traits::input_parameter< S4 >::type seq(seqSEXP);
    rcpp_result_gen = Rcpp::wrap(spoa_consensus_xstringset(seq));
    return rcpp_result_gen;
END_RCPP
}

static const R_CallMethodDef CallEntries[] = {
    {"_spoar_spoa_consensus_character", (DL_FUNC) &_spoar_spoa_consensus_character, 1},
    {"_spoar_spoa_align_character", (DL_FUNC) &_spoar_spoa_align_character, 1},
    {"_spoar_spoa_consensus_xstringset", (DL_FUNC) &_spoar_spoa_consensus_xstringset, 1},
    {NULL, NULL, 0}
};

RcppExport void R_init_spoar(DllInfo *dll) {
    R_registerRoutines(dll, NULL, CallEntries, NULL, NULL);
    R_useDynamicSymbols(dll, FALSE);
}
