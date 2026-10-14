# Classification Data Split Plan

## Date Boundaries

Splits use the complaint receipt date.

| Split | Start date | End date |
|---|---|---|
| Training and exploration | 2024-04-01 | 2025-02-28 |
| Validation | 2025-03-01 | 2025-04-30 |
| Final test | 2025-05-01 | 2025-06-30 |

The January-February 2025 pilot data has already been inspected.
It belongs to training and exploration, not the final test.

## Evaluation Rules

- Use training data for fitting models and learning preprocessing.
- Use validation data for model selection and decision rules.
- Separate calibration fitting from threshold evaluation within development data.
- Freeze modeling decisions before final test evaluation.
- Do not use final test labels, examples, or scores to tune the system.
- Define exact and near-duplicate handling using development data.
- Do not move later-period records into earlier training periods.
- Record exclusions and changes to the evaluation population.
- Keep original labels and quality flags.
- Treat unseen test categories as a documented limitation, not a reason
  to revise the task after inspecting test performance.

## Scope and Limitations

This plan applies to complaint classification.
Retrieval and generation use a separate manually reviewed benchmark.

Receipt dates do not establish historical public availability.
The experiment measures retrospective temporal generalization,
not a verified real-time deployment simulation.

Any necessary change to the plan must be documented with its reason
and whether final test outcomes had already been inspected.
