CREATE TABLE Fact_Election_Raw AS

SELECT
    election_year,
    state_name,
    constituency_number,
    constituency_name,
    cleaned_candidate_name AS candidate_name,
    gender,
    age,
    category,
    party,
    symbol,
    general_votes,
    postal_votes,
    total_votes,
    total_electors
FROM Stg_tn_2021_clean

UNION ALL

SELECT
    election_year,
    state_name,
    constituency_number,
    constituency_name,
    candidate_name,
    gender,
    age,
    category,
    party,
    symbol,
    general_votes,
    postal_votes,
    total_votes,
    total_electors
FROM Stg_tn_2026_clean;