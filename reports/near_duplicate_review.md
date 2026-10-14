# Near-Duplicate Candidate Review

## Method

The search uses 30,257 representatives of exact normalized text groups
from training-period credit card narratives.

Word unigram and bigram TF-IDF uses at most 50,000 features.
Each text retrieves up to five non-self cosine nearest neighbors.
Pairs with similarity at least 0.90 are retained and made unordered.

The search produced 2,942 candidate pairs involving 1,704 text groups.
Full search time was 45.29 seconds in the development environment.

## Review Design

Thirty candidate pairs were sampled: ten from each similarity band.
The random seed was 42.

Annotations were produced through a single human-guided,
assistant-assisted review process, not independent double annotation.

The shared_template category includes extensive shared wording with
material factual differences or unresolved entity/scope equivalence.
It does not establish a common author or a specific template source.

## Results

| Similarity band | Near duplicate | Shared template | Reviewed |
|---|---:|---:|---:|
| 0.90-0.95 | 3 | 7 | 10 |
| 0.95-0.99 | 1 | 9 | 10 |
| 0.99-1.00 | 7 | 3 | 10 |

Examples of important differences included institutions, balances,
application scope, and additional incident descriptions.

## Decision

Do not automatically delete or merge near-duplicate candidates.
Do not form transitive duplicate clusters solely from similarity scores.
Retain these records for the planned baseline, subject to the separate
exact-duplicate and training-label-conflict rules.

## Limitations

Similarity is a lexical feature-space measurement, not a probability.
Vocabulary filtering and redaction can conceal meaningful differences.
Top-five retrieval is not exhaustive.
Reviewed pairs may share text groups and are not independent observations.
The small stratified sample does not establish overall duplicate prevalence.
Recall cannot be estimated from reviewing retrieved candidates alone.
Text similarity does not establish identical underlying complaint events.

## Reproduction

Run notebooks/04_near_duplicate_review.ipynb from top to bottom.
Search settings are saved in configs/near_duplicate_vectorizer.json.
Reviewed pair metadata and notes are saved in
evaluation/near_duplicate_review.csv.
