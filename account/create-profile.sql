WITH
email_address AS (
	INSERT INTO email.address (address, domain) VALUES ($1, $2)
	RETURNING id
),
email_verification AS
(
	INSERT INTO email.verification (address)
	SELECT id FROM email_address
    RETURNING address
),
account_profile AS 
(
	INSERT INTO account.profile (email)
	SELECT id FROM email_address
	RETURNING *
),
account_preference AS
(
    INSERT INTO account.preference (profile)
    SELECT id FROM account_profile
),
account_setting AS (
	INSERT INTO account.setting (profile)
	SELECT id FROM account_profile
)
SELECT ROW_TO_JSON(T.*) FROM account_profile AS T;