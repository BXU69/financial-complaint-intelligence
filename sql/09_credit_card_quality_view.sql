CREATE OR REPLACE VIEW credit_card_quality AS
WITH group_stats AS (
    SELECT
        text_key,
        COUNT(*) AS text_group_size,
        COUNT(DISTINCT issue) AS distinct_issue_labels
    FROM credit_card_text
    GROUP BY text_key
)
SELECT
    t.complaint_id,
    t.issue,
    t.received_raw,
    t.narrative,
    MD5(t.text_key) AS text_group_id,
    LENGTH(t.narrative) AS narrative_chars,
    g.text_group_size,
    g.distinct_issue_labels,
    LENGTH(t.narrative) <= 50 AS is_short_text,
    g.text_group_size > 1 AS is_repeated_text,
    g.distinct_issue_labels > 1 AS has_label_conflict
FROM credit_card_text AS t
JOIN group_stats AS g
    ON t.text_key = g.text_key
