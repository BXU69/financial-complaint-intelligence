WITH normalized AS (
    SELECT
        NULLIF(TRIM("Complaint ID"), '') AS complaint_id
    FROM training_raw
)
SELECT
    COUNT(*) AS total_rows,
    COUNT(DISTINCT complaint_id) AS distinct_complaint_ids,
    COUNT(*) FILTER (
        WHERE complaint_id IS NULL
    ) AS missing_complaint_ids,
    COUNT(complaint_id)
        - COUNT(DISTINCT complaint_id) AS duplicate_id_rows
FROM normalized
