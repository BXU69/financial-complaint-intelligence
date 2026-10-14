WITH credit_card AS (
    SELECT
        CAST(
            TRY_STRPTIME(
                TRIM("Date received"),
                ['%Y-%m-%d', '%m/%d/%Y']
            ) AS DATE
        ) AS received_date,
        NULLIF(
            TRIM("Consumer complaint narrative"), ''
        ) AS narrative
    FROM training_raw
    WHERE TRIM("Product") = 'Credit card'
)
SELECT
    STRFTIME(received_date, '%Y-%m') AS month,
    COUNT(*) AS total_rows,
    COUNT(narrative) AS rows_with_narrative,
    ROUND(
        100.0 * COUNT(narrative) / COUNT(*),
        2
    ) AS narrative_coverage_pct
FROM credit_card
GROUP BY month
ORDER BY month
