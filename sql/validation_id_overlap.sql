WITH training_ids AS (
    SELECT DISTINCT
        NULLIF(TRIM("Complaint ID"), '') AS complaint_id
    FROM training_sources_raw
),
validation_ids AS (
    SELECT DISTINCT
        NULLIF(TRIM("Complaint ID"), '') AS complaint_id
    FROM complaints_raw
)
SELECT
    COUNT(*) AS overlapping_complaint_ids
FROM validation_ids AS v
JOIN training_ids AS t
    ON v.complaint_id = t.complaint_id
