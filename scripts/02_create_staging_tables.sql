USE tn_election_analysis;

-- =========================================
-- STAGING TABLE : 2026 DETAILED RESULTS
-- =========================================

CREATE TABLE stg_tn_2026_results (
    s_no INT,
    constituency_number INT,
    constituency_name VARCHAR(255),
    total_electors BIGINT,
    candidate_name VARCHAR(255),
    gender VARCHAR(20),
    age INT,
    category VARCHAR(50),
    party VARCHAR(255),
    symbol VARCHAR(255),
    general_votes BIGINT,
    postal_votes BIGINT,
    total_votes BIGINT,
    percent_valid_votes DECIMAL(10,2),
    percent_total_electors DECIMAL(10,2)
);

-- =========================================
-- STAGING TABLE : 2021 DETAILED RESULTS
-- =========================================

CREATE TABLE stg_tn_2021_results (
    state_name VARCHAR(100),
    constituency_number INT,
    constituency_name VARCHAR(255),
    candidate_name VARCHAR(255),
    gender VARCHAR(20),
    age INT,
    category VARCHAR(50),
    party VARCHAR(255),
    symbol VARCHAR(255),
    general_votes BIGINT,
    postal_votes BIGINT,
    total_votes BIGINT,
    percent_votes_polled DECIMAL(10,2),
    total_electors BIGINT
);

-- =========================================
-- STAGING TABLE : PARTY SUMMARY
-- =========================================

CREATE TABLE stg_party_summary (
    party VARCHAR(255),
    candidates_contested INT,
    candidates_won INT,
    candidates_fd INT,
    votes_polled BIGINT,
    valid_votes BIGINT,
    valid_votes_nota BIGINT,
    inseats_contested INT
);

-- =========================================
-- STAGING TABLE : ECI RESULTS
-- =========================================

CREATE TABLE stg_eci_results (
    party VARCHAR(255),
    won INT,
    leading INT,
    total INT
);

-- =========================================
-- STAGING TABLE : INDIA VOTES
-- =========================================

CREATE TABLE stg_india_votes (
    party VARCHAR(255),
    seats INT,
    vote_share_percent DECIMAL(10,2)
);

-- =========================================
-- STAGING TABLE : WOMEN CANDIDATES
-- =========================================

CREATE TABLE stg_women_candidates (
    ac_no INT,
    ac_name VARCHAR(255),
    candidate_name VARCHAR(255),
    party VARCHAR(255),
    party_type VARCHAR(100),
    votes_secured BIGINT,
    status VARCHAR(50),
    total_votes_polled BIGINT,
    valid_votes BIGINT,
    percent_votes_total_electors DECIMAL(10,2),
    percent_votes_total_polled DECIMAL(10,2),
    percent_votes_valid DECIMAL(10,2)
);