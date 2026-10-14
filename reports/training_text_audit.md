# Training Text Audit

## Scope

The training period covers April 2024 through February 2025.

- All credit card complaints: 74,957
- Complaints with non-empty narratives: 33,117
- Missing issue labels: 0
- Issue categories: 15

## Class Distribution

The largest category contains 7,791 text records.
The smallest category contains 18.

Class imbalance remains substantial after expanding the date range.
Narrative availability also differs across categories.

## Exact Normalized Text Repetition

Matching lowercases text and collapses whitespace.

- Distinct text keys: 30,257
- Repeated text groups: 468
- Records in repeated groups: 3,328
- Excess repeated records: 2,860
- Conflicting-label groups: 77
- Records in conflicting-label groups: 992
- Repeated groups spanning source files: 26
- Repeated groups spanning months: 108

These checks do not identify all near-duplicate narratives.
Repeated text does not establish duplicate underlying complaint events.

## Current Status

Original labels and records are retained.
Row-level quality flags are stored locally.
No classifier has been trained.

The next step is near-duplicate investigation before constructing
the baseline training sample.
