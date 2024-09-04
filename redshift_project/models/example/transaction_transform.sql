-- models/transaction_transform.sql

WITH recent_transactions AS (
    SELECT 
        transaction_id,
        account_id,
        transaction_amount,
        transaction_date
    FROM 
        {{ ref('raw_transactions') }}  -- Referencing the seeded raw_transactions table
    WHERE
        transaction_date >= '2024-01-01'
)

SELECT 
    account_id,
    SUM(transaction_amount) AS total_transaction,
    COUNT(transaction_id) AS transaction_count
FROM 
    recent_transactions
GROUP BY 
    account_id
