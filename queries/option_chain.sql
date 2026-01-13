-- Option Chain Summary: Implied Volume by Strike and Expiry
SELECT
    ex.expiry_dt,
    ex.strike_pr,
    ex.option_typ,
    SUM(t.volume) AS implied_volume
FROM trades t
JOIN expiries ex ON t.expiry_id = ex.expiry_id
GROUP BY
    ex.expiry_dt,
    ex.strike_pr,
    ex.option_typ
ORDER BY
    ex.expiry_dt,
    ex.strike_pr,
    ex.option_typ;
