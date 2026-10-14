WITH text_groups AS (
    SELECT
        text_key,
        COUNT(*) AS group_size,
        COUNT(DISTINCT issue) AS distinct_issue_labels
    FROM credit_card_text
    GROUP BY text_key
)
SELECT
    COUNT(*) AS distinct_text_keys,
    COUNT(*) FILTER (
        WHERE group_size > 1
    ) AS repeated_text_groups,
    COALESCE(
        SUM(group_size) FILTER (WHERE group_size > 1),
        0
    ) AS rows_in_repeated_groups,
    COALESCE(
        SUM(group_size - 1),
        0
    ) AS excess_repeated_rows,
    COUNT(*) FILTER (
        WHERE group_size > 1
          AND distinct_issue_labels > 1
    ) AS repeated_groups_with_label_conflicts
FROM text_groups
