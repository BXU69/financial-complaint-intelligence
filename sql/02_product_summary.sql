WITH normalized AS (
    SELECT
        NULLIF(TRIM("Product"), '') AS product,
        NULLIF(
            TRIM("Consumer complaint narrative"), ''
        ) AS narrative
    FROM complaints_raw
)
SELECT
    product,
    COUNT(*) AS total_rows,
    COUNT(narrative) AS rows_with_narrative,
    ROUND(
        100.0 * COUNT(narrative) / COUNT(*),
        2
    ) AS narrative_coverage_pct
FROM normalized
GROUP BY product
ORDER BY total_rows DESC
