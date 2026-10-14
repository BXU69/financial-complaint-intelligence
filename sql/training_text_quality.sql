CREATE OR REPLACE VIEW training_text_quality AS
WITH normalized AS (
    SELECT
        *,
        LOWER(
            REGEXP_REPLACE(narrative, '\s+', ' ', 'g')
        ) AS text_key
    FROM training_cc_text
),
group_stats AS (
    SELECT
        text_key,
        COUNT(*) AS text_group_size,
        COUNT(DISTINCT issue) AS distinct_issue_labels,
        COUNT(DISTINCT source_file) AS distinct_source_files,
        COUNT(
            DISTINCT DATE_TRUNC('month', received_date)
        ) AS distinct_months
    FROM normalized
    GROUP BY text_key
)
SELECT
    t.complaint_id,
    t.issue,
    t.received_date,
    MD5(t.text_key) AS text_group_id,
    LENGTH(t.narrative) AS narrative_chars,
    g.text_group_size,
    g.distinct_issue_labels,
    g.distinct_source_files,
    g.distinct_months,
    g.text_group_size > 1 AS is_repeated_text,
    g.distinct_issue_labels > 1 AS has_label_conflict
FROM normalized AS t
JOIN group_stats AS g
    ON t.text_key = g.text_key
