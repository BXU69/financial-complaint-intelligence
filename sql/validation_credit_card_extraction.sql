SELECT
    NULLIF(TRIM("Complaint ID"), '') AS complaint_id,
    CAST(
        TRY_STRPTIME(
            TRIM("Date received"),
            ['%Y-%m-%d', '%m/%d/%Y']
        ) AS DATE
    ) AS received_date,
    TRIM("Product") AS product,
    NULLIF(TRIM("Sub-product"), '') AS sub_product,
    NULLIF(TRIM("Issue"), '') AS issue,
    NULLIF(TRIM("Sub-issue"), '') AS sub_issue,
    NULLIF(TRIM("Consumer complaint narrative"), '') AS narrative,
    NULLIF(TRIM("Company"), '') AS company,
    NULLIF(TRIM("Submitted via"), '') AS submitted_via
FROM complaints_raw
WHERE TRIM("Product") = 'Credit card'
ORDER BY received_date, complaint_id
