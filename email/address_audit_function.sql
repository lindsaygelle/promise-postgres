CREATE OR REPLACE FUNCTION
    email.address_audit()
RETURNS TRIGGER
    AS $trigger$
BEGIN
    INSERT INTO email.address_audit (
        address,
        address_id,
        domain,
        is_verified,
        postgres_action,
        postgres_user)
    SELECT
        address,
        id,
        domain,
        is_verified,
        TG_OP,
        USER
    FROM NEW;
    RETURN NULL;
END;
$trigger$ LANGUAGE plpgsql;
