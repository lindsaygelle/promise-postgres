CREATE OR REPLACE FUNCTION
	account.profile_audit()
RETURNS TRIGGER
	AS $trigger$
BEGIN
	INSERT INTO account.profile_audit (
		postgres_action,
		postgres_user,
		profile_id)
	SELECT
		TG_OP,
		USER,
		ID
	FROM
		NEW;
	RETURN NULL;
END;
$trigger$ LANGUAGE plpgsql;
