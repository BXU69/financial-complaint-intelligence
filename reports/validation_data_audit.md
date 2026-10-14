# Validation Data Audit

## Source and integrity

- Source: March–April 2025 CFPB Consumer Complaint Narratives Archive.
- Received-date range: 2025-03-01 through 2025-04-30.
- Source rows: 803,073.
- Column names and order match the training source.
- Complaint IDs are unique and non-missing.
- Received dates are valid and non-missing.
- Complaint ID overlap with all four training sources: 0.
- Credit card complaints: 13,152.
- Credit card complaints with narratives: 5,957.
- Missing issue labels in the text subset: 0.

## Text quality

- Distinct normalized texts: 5,746.
- Repeated text groups: 29.
- Rows in repeated groups: 240.
- Conflicting-label groups: 1.
- Rows in conflicting-label groups: 3.
- Rows with labels absent from baseline training: 0.

## Evaluation populations

The full validation population retains all 5,957 credit card narratives,
including repeated texts and conflicting labels.

There are 121 rows with exact normalized text overlap with the baseline
training sample and 164 with the complete training-period text dataset.

A fixed secondary evaluation population contains 5,793 rows without exact
normalized text overlap with any training-period narrative. This same
population will be used when comparing training sample policies.

Normalization trims outer whitespace, converts text to lowercase, and
collapses consecutive whitespace. Punctuation, numbers, and redactions
are retained. Near duplicates and shared templates may still remain.

## Modeling rules and limitations

- Use narrative as the model input and issue as the target.
- Fit learned preprocessing on training data only.
- Retain original validation labels and quality flags.
- Keep calibration fitting separate from threshold evaluation.
- Do not use final-test outcomes for model selection.
- Rare validation classes have small sample counts; interpret their metrics
  alongside support counts.
- Complaint receipt dates do not establish historical public availability.
- This audit prepares evaluation data and does not report model performance.
