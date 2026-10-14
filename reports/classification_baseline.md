# Complaint Classification Baseline

## Design

- Training period: April 2024 through February 2025.
- Validation period: March through April 2025.
- Input: complaint narrative only.
- Target: 15 issue categories.
- Cleaned training sample: 30,180 records.
- Full training-period text sample: 33,117 records.
- Full validation population: 5,957 records.
- Fixed secondary population: 5,793 records without exact normalized
  text overlap with any training-period narrative.
- Vocabulary and IDF weights are fitted on each experiment's training data.
- Final-test data has not been evaluated.

## Experiments

1. Majority-class reference fitted on the cleaned training sample.
2. TF-IDF logistic regression fitted on the cleaned sample.
3. The same model with balanced class weights.
4. Unweighted TF-IDF logistic regression fitted on all training-period text.

TF-IDF uses word unigrams and bigrams with up to 50,000 features.
Logistic regression uses L2 regularization, C=1.0, and the lbfgs solver.

## Validation results

The following results are in CSV format:

    model,population,rows,accuracy,macro_f1,weighted_f1
    majority_class,full_validation,5957,0.2694,0.0283,0.1144
    majority_class,no_training_exact_overlap,5793,0.2771,0.0289,0.1202
    tfidf_logistic,full_validation,5957,0.6703,0.4417,0.6591
    tfidf_logistic,no_training_exact_overlap,5793,0.6613,0.4278,0.6485
    tfidf_logistic_balanced,full_validation,5957,0.6515,0.4480,0.6577
    tfidf_logistic_balanced,no_training_exact_overlap,5793,0.6420,0.4339,0.6469
    tfidf_logistic_all_training_text,full_validation,5957,0.6706,0.4422,0.6590
    tfidf_logistic_all_training_text,no_training_exact_overlap,5793,0.6617,0.4288,0.6486

## Findings

- Text models substantially outperform the majority-class reference.
- Balanced weighting raises macro-F1 slightly while reducing accuracy.
  Improvements vary by class; it is not uniformly better.
- The three rarest validation classes have no correct predictions under
  either cleaned-sample weighting setting.
- Cleaned and full-text unweighted models have very similar validation
  results. This experiment does not demonstrate a performance improvement
  from cleaning.
- Cleaning reduces the training sample by approximately 8.9%.
- The sample-policy comparison evaluates conflict exclusion and exact
  deduplication together, not their separate effects.
- Differences between cleaning policies have not been tested for
  statistical significance.

## Limitations and next steps

- These are development results used for model comparison.
- Rare classes have limited validation support.
- Original complaint labels may be ambiguous or inconsistent.
- The secondary population excludes exact overlap; near duplicates and
  shared templates may remain.
- Recorded timings are local batch measurements, not serving benchmarks.
- Classification probabilities have not been assessed for calibration.
- No final model or automatic-routing threshold has been selected.
- Further work includes error review, calibration, and decision-rule
  evaluation before a frozen final-test assessment.
