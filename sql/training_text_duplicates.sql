WITH normalized AS (
    SELECT
        *,
        LOWER(
            REGEXP_REPLACE(narrative, '\s+', ' ', 'g')
        ) AS text_key
    FROM training_cc_text
),
text_groups AS (
    SELECT
        text_key,
        COUNT(*) AS group_size,
        COUNT(DISTINCT issue) AS distinct_issue_labels,
        COUNT(DISTINCT source_file) AS distinct_source_files,
        COUNT(
            DISTINCT DATE_TRUNC('month', received_date)
        ) AS distinct_months
    FROM normalized
    GROUP BY text_key
)
SELECT
    SUM(group_size) AS total_text_rows,
    COUNT(*) AS distinct_text_keys,
    COUNT(*) FILTER (
        WHERE group_size > 1
    ) AS repeated_text_groups,
    COALESCE(
        SUM(group_size) FILTER (WHERE group_size > 1),
        0
    ) AS rows_in_repeated_groups,
    SUM(group_size - 1) AS excess_repeated_rows,
    COUNT(*) FILTER (
        WHERE distinct_issue_labels > 1
    ) AS label_conflict_groups,
    COALESCE(
        SUM(group_size) FILTER (WHERE distinct_issue_labels > 1),
        0
    ) AS label_conflict_rows,
    COUNT(*) FILTER (
        WHERE distinct_source_files > 1
    ) AS repeated_groups_across_files,
    COUNT(*) FILTER (
        WHERE distinct_months > 1
    ) AS repeated_groups_across_months
FROM text_groups
