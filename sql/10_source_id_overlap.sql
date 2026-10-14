WITH ids_2024 AS (
    SELECT DISTINCT
        NULLIF(TRIM("Complaint ID"), '') AS complaint_id
    FROM source_2024_nov_dec
),
ids_2025 AS (
    SELECT DISTINCT
        NULLIF(TRIM("Complaint ID"), '') AS complaint_id
    FROM source_2025_jan_feb
)
SELECT
    COUNT(*) AS overlapping_complaint_ids
FROM ids_2024
INNER JOIN ids_2025 USING (complaint_id)
