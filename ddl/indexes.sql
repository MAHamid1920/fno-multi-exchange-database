CREATE INDEX idx_trades_timestamp ON trades USING BRIN(timestamp);
CREATE INDEX idx_trades_instrument ON trades(instrument_id);
CREATE INDEX idx_instruments_exchange ON instruments(exchange_id);
CREATE INDEX idx_trades_instrument_date ON trades(instrument_id, trade_date);
