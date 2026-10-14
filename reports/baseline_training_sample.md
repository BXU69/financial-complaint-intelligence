# Baseline Training Sample

## Construction

Training receipt dates cover April 2024 through February 2025.

- Input labeled text records: 33,117
- Excluded conflicting-label records: 992
- Excluded additional consistent-label exact duplicates: 1,945
- Retained baseline records: 30,180
- Retained issue categories: 15

For consistent-label exact duplicate groups, the earliest record is retained.
Same-date ties are resolved by complaint ID.
Near-duplicate candidates and substantive short texts are retained.

## Distribution Effects

Filtering affects categories unevenly.
The company-investigation category retains 41.95% of its text records.
The incorrect-credit-report-information category retains 68.06%.
The smallest retained category contains 18 records.

Filtering is not assumed to improve predictive performance.
Compare this sample with all labeled training records on the same validation set.

## Artifacts and Scope

The baseline sample and row-level selection decisions remain local.
Configuration, fingerprints, and aggregate reports are version controlled.

Model input is narrative; target is issue.
Original complaint events remain available for business analysis.
No classifier has been fitted or evaluated in this notebook.
