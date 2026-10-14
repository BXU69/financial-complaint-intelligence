SELECT
    COUNT(*) AS text_rows,
    COUNT(*) FILTER (
        WHERE issue IS NULL
    ) AS missing_issue_rows,
    MIN(LENGTH(narrative)) AS min_chars,
    ROUND(AVG(LENGTH(narrative)), 1) AS mean_chars,
    QUANTILE_CONT(LENGTH(narrative), 0.50) AS median_chars,
    QUANTILE_CONT(LENGTH(narrative), 0.90) AS p90_chars,
    QUANTILE_CONT(LENGTH(narrative), 0.99) AS p99_chars,
    MAX(LENGTH(narrative)) AS max_chars,
    COUNT(*) FILTER (
        WHERE LENGTH(narrative) <= 50
    ) AS rows_at_most_50_chars
FROM credit_card_text
