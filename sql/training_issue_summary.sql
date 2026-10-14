SELECT
    issue,
    COUNT(*) AS total_rows,
    COUNT(narrative) AS rows_with_narrative,
    ROUND(
        100.0 * COUNT(narrative) / COUNT(*),
        2
    ) AS narrative_coverage_pct,
    ROUND(
        100.0 * COUNT(narrative)
        / NULLIF(SUM(COUNT(narrative)) OVER (), 0),
        2
    ) AS share_of_available_text_pct
FROM training_cc_all
GROUP BY issue
ORDER BY rows_with_narrative DESC, issue
