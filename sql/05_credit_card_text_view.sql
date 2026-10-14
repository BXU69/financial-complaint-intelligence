CREATE OR REPLACE VIEW credit_card_text AS
WITH normalized AS (
    SELECT
        NULLIF(TRIM("Complaint ID"), '') AS complaint_id,
        NULLIF(TRIM("Issue"), '') AS issue,
        "Date received" AS received_raw,
        NULLIF(
            TRIM("Consumer complaint narrative"), ''
        ) AS narrative
    FROM credit_card_raw
)
SELECT
    *,
    LOWER(
        REGEXP_REPLACE(narrative, '\s+', ' ', 'g')
    ) AS text_key
FROM normalized
WHERE narrative IS NOT NULL
