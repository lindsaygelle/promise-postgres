CREATE OR REPLACE FUNCTION
	account.address_audit()
RETURNS TRIGGER
	AS $trigger$
BEGIN
    INSERT INTO account.address_audit (
        name,
        postgres_action,
        postgres_user,
        profile_id)
    SELECT
        name,
        TG_OP,
        USER,
        profile_id
    FROM NEW;
	RETURN NULL;
END;
$trigger$ LANGUAGE plpgsql;
