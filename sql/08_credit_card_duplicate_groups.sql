SELECT
    MD5(text_key) AS text_group_id,
    COUNT(*) AS group_size,
    COUNT(DISTINCT issue) AS distinct_issue_labels,
    STRING_AGG(
        DISTINCT issue,
        ' | ' ORDER BY issue
    ) AS issue_labels,
    MIN(LENGTH(narrative)) AS min_chars,
    MAX(LENGTH(narrative)) AS max_chars
FROM credit_card_text
GROUP BY text_key
HAVING COUNT(*) > 1
ORDER BY group_size DESC, text_group_id
