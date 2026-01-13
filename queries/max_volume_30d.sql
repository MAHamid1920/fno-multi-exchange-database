SELECT
    i.symbol,
    MAX(t.volume) AS max_volume_30d
FROM trades t
JOIN instruments i ON t.instrument_id = i.instrument_id
WHERE t.trade_date >= CURRENT_DATE - INTERVAL '30 days'
GROUP BY i.symbol
ORDER BY max_volume_30d DESC;
