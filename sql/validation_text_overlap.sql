WITH validation_normalized AS (
    SELECT
        *,
        LOWER(
            REGEXP_REPLACE(TRIM(narrative), '\s+', ' ', 'g')
        ) AS text_key
    FROM validation_text_input
),
baseline_keys AS (
    SELECT DISTINCT
        LOWER(
            REGEXP_REPLACE(TRIM(narrative), '\s+', ' ', 'g')
        ) AS text_key
    FROM baseline_training_reference
),
all_training_keys AS (
    SELECT DISTINCT
        LOWER(
            REGEXP_REPLACE(TRIM(narrative), '\s+', ' ', 'g')
        ) AS text_key
    FROM all_training_text_reference
)
SELECT
    v.*,
    MD5(v.text_key) AS text_group_id,
    b.text_key IS NOT NULL AS exact_overlap_with_baseline,
    t.text_key IS NOT NULL AS exact_overlap_with_training_period
FROM validation_normalized AS v
LEFT JOIN baseline_keys AS b
    ON v.text_key = b.text_key
LEFT JOIN all_training_keys AS t
    ON v.text_key = t.text_key
ORDER BY v.received_date, v.complaint_id
