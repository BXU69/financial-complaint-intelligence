# Training Sample Policy

## Scope

These rules apply to text classification.
All complaint events remain available for aggregate business analysis.

## Labels

Retain the 15 observed issue categories initially.
Do not merge categories solely because they are rare.
Check category support again after sample filtering.
Do not revise the label scheme using final test outcomes.

## Planned Baseline Training Sample

Exclude training text groups with conflicting issue labels.
For consistent-label exact duplicate groups, retain the earliest record.
Break same-date ties deterministically using complaint ID.

This reduces repeated-text weighting without changing original records.
Construct a separate derived sample and record every exclusion.

Also plan a sensitivity comparison using all labeled training records,
so the effect of the filtering policy can be assessed.

## Near-Duplicate Text

Investigate near-duplicates using training data.
Document normalization, matching criteria, and reviewed examples.
Do not automatically delete records solely because texts are similar.
Finalize handling before fitting the baseline.

## Evaluation

Do not remove validation or test records based on their label conflicts.
Identify text overlap with training using documented text-based rules.
Report full-period performance and a separate unseen-text evaluation.
Report the coverage and class support of each evaluation population.

## Short Text

Retain substantive short narratives.
Do not apply an arbitrary minimum length filter.

## Status

This is the planned policy.
No baseline sample has been constructed yet.
