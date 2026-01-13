CREATE TABLE exchanges (
    exchange_id SERIAL PRIMARY KEY,
    exchange_code VARCHAR(10) UNIQUE NOT NULL,
    exchange_name VARCHAR(50)
);

CREATE TABLE instruments (
    instrument_id BIGSERIAL PRIMARY KEY,
    symbol VARCHAR(30) NOT NULL,
    instrument_type VARCHAR(20),
    underlying VARCHAR(30),
    exchange_id INT REFERENCES exchanges(exchange_id)
);

CREATE TABLE expiries (
    expiry_id BIGSERIAL PRIMARY KEY,
    expiry_dt DATE NOT NULL,
    strike_pr NUMERIC(10,2),
    option_typ CHAR(2)
);

CREATE TABLE trades (
    trade_id BIGSERIAL,
    instrument_id BIGINT REFERENCES instruments(instrument_id),
    expiry_id BIGINT REFERENCES expiries(expiry_id),
    trade_date DATE,
    timestamp TIMESTAMP,
    open_pr NUMERIC(10,2),
    high_pr NUMERIC(10,2),
    low_pr NUMERIC(10,2),
    close_pr NUMERIC(10,2),
    settle_pr NUMERIC(10,2),
    volume BIGINT,
    open_int BIGINT
) PARTITION BY RANGE (trade_date);

