-- Cross-Exchange Comparison: Avg Settle Price
SELECT
    e.exchange_code,
    i.underlying,
    AVG(t.settle_pr) AS avg_settle_price
FROM trades t
JOIN instruments i ON t.instrument_id = i.instrument_id
JOIN exchanges e ON i.exchange_id = e.exchange_id
WHERE 
    (i.underlying = 'GOLD' AND e.exchange_code = 'MCX')
    OR
    (i.instrument_type = 'FUT' AND e.exchange_code = 'NSE')
GROUP BY e.exchange_code, i.underlying;
