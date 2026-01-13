# F&O Multi-Exchange Trading Database (3NF)

## Overview
This project designs and implements a normalized relational database to store and analyze
high-volume Futures & Options (F&O) data across multiple Indian exchanges including
NSE, BSE, and MCX.

The schema is optimized for time-series analytics, derivatives research, and scalable
ingestion of millions of trading records.

---

## Design Rationale

### Normalization (3NF)
- Exchanges, Instruments, Expiries, and Trades are separated to eliminate redundancy
- Expiry and strike data are stored in a dedicated table to avoid duplication across trades
- Ensures data integrity and efficient updates

### Why Star Schema Was Avoided
- F&O data is highly time-variant and strike-heavy
- Star schema causes dimension explosion for expiry/strike combinations
- 3NF performs better for frequent ingestion and updates

---

## Scalability
- Designed to scale beyond 10M+ rows
- Range partitioning on trade_date
- BRIN indexes for timestamp-based queries
- Optimized for HFT-style append-only ingestion

---

## Technologies Used
- PostgreSQL / DuckDB
- SQL (Window functions, partitioning, indexing)
- dbdiagram.io for ER modeling
- Kaggle NSE F&O dataset (3M)

---

## Repository Contents
- ER Diagram (PNG)
- SQL DDL scripts
- Optimized analytical queries
- Jupyter notebook for data ingestion
- Design reasoning document (PDF)
