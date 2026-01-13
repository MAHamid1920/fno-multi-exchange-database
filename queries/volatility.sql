-- 7-Day Rolling Volatility for NIFTY Options
SELECT
    t.trade_date,
    i.symbol,
    ex.option_typ,
    STDDEV(t.close_pr) OVER (
        PARTITION BY i.symbol, ex.option_typ
        ORDER BY t.trade_date
        ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
    ) AS volatility_7d
FROM trades t
JOIN instruments i ON t.instrument_id = i.instrument_id
JOIN expiries ex ON t.expiry_id = ex.expiry_id
WHERE i.symbol = 'NIFTY'
  AND i.instrument_type = 'OPT';
