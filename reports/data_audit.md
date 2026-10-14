# Initial CFPB Data Audit

## Scope

This pilot audit uses the official CFPB archive labeled
January 2025 through February 2025.

The observed complaint receipt dates range from 2025-01-01
through 2025-02-28. This verifies receipt-date coverage,
not historical public availability.

## Dataset Overview

- Total records: 811,019
- Unique complaint IDs: 811,019
- Missing complaint IDs: 0
- Missing or unparsed receipt dates: 0
- Records with non-empty narratives: 265,405 (32.72%)

## Credit Card Subset

The exact product value used for filtering is `Credit card`.

- Total credit card complaints: 15,286
- Complaints with non-empty narratives: 6,958 (45.52%)
- Observed issue categories: 15
- Missing issue labels among text records: 0

Category counts are imbalanced. Narrative availability also
varies across categories. The text subset should not be
treated as representative of all credit card complaints.

## Text Quality

- Median narrative length: 777.5 characters
- Maximum narrative length: 31,657 characters
- Narratives with at most 50 characters: 4
- Distinct normalized text keys: 6,480
- Repeated text groups: 74
- Records in repeated groups: 552
- Excess repeated records: 478
- Groups with conflicting issue labels: 6
- Records in conflicting-label groups: 112

Text matching lowercases narratives and collapses whitespace.
It retains numbers, punctuation, and redaction placeholders.

## Manual Review and Current Decisions

The four short narratives contain substantive complaint information.
They are retained.

Some conflicting-label groups use generic wording or describe
overlapping issues. Original labels are retained and conflicts
are flagged rather than automatically corrected.

Two reviewed groups have similar wording but different text keys.
Exact normalized matching therefore does not capture all near-duplicates.

Repeated complaint text does not establish that the underlying
complaint events are duplicates. No records have been deleted.

Consumer allegations are not treated as independently verified facts.

## Next Steps

- Expand the historical date range.
- Repeat integrity and label checks across all source files.
- Investigate cross-file exact and near-duplicate text.
- Define chronological splits and duplicate-group handling before modeling.
- Reassess rare categories using the expanded data.
- Evaluate model-token lengths before choosing truncation settings.

## Reproduction

Run `notebooks/01_data_audit.ipynb` from top to bottom.
The source archive metadata is recorded in
`data/manifests/cfpb_2025_jan_feb.json`.

Raw data and row-level derived files remain local.
Aggregate results are saved in `reports/`, and SQL queries in `sql/`.

No classifier has been trained and no business impact has been measured.
