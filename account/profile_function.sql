DROP FUNCTION IF EXISTS
    account.profile_insert;

CREATE FUNCTION account.profile_insert (profile_name CITEXT)
RETURNS SETOF account.profile
LANGUAGE plpgsql AS
$$
BEGIN
RETURN QUERY
WITH A AS (
    INSERT INTO account.profile (name, time_created, time_edited)
    VALUES (profile_name, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP)
    RETURNING *
), 
B AS (
    INSERT INTO account.address (name, profile_id)
    SELECT name, id FROM A
),
C AS (
    INSERT INTO account.information (profile_id) 
    SELECT id FROM A
),
D AS (
    INSERT INTO account.preference (profile_id)
    SELECT id FROM A
)
TABLE A;
END
$$;
