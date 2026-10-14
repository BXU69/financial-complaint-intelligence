CREATE OR REPLACE VIEW credit_card_raw AS
SELECT *
FROM complaints_raw
WHERE TRIM("Product") = 'Credit card'
