WITH normalized AS (
    SELECT
        NULLIF(TRIM("Complaint ID"), '') AS complaint_id,
        NULLIF(TRIM("Date received"), '') AS received_raw,
        NULLIF(
            TRIM("Consumer complaint narrative"), ''
        ) AS narrative
    FROM complaints_raw
),
parsed AS (
    SELECT
        *,
        CAST(
            TRY_STRPTIME(
                received_raw,
                ['%Y-%m-%d', '%m/%d/%Y']
            ) AS DATE
        ) AS received_date
    FROM normalized
)
SELECT
    COUNT(*) AS total_rows,
    COUNT(DISTINCT complaint_id) AS distinct_complaint_ids,
    COUNT(*) FILTER (
        WHERE complaint_id IS NULL
    ) AS missing_complaint_ids,
    MIN(received_date) AS earliest_received_date,
    MAX(received_date) AS latest_received_date,
    COUNT(*) FILTER (
        WHERE received_raw IS NULL
    ) AS missing_received_dates,
    COUNT(*) FILTER (
        WHERE received_raw IS NOT NULL
          AND received_date IS NULL
    ) AS unparsed_received_dates,
    COUNT(narrative) AS rows_with_narrative,
    ROUND(
        100.0 * COUNT(narrative) / NULLIF(COUNT(*), 0),
        2
    ) AS narrative_coverage_pct
FROM parsed
