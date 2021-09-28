DROP TRIGGER IF EXISTS address_audit_insert
    ON email.address;

CREATE TRIGGER address_audit_insert
    AFTER INSERT ON 
        email.address
    REFERENCING NEW TABLE AS NEW
    FOR EACH STATEMENT EXECUTE FUNCTION 
        email.address_audit();

DROP TRIGGER IF EXISTS address_audit_update
    ON email.address;

CREATE TRIGGER address_audit_update
    AFTER UPDATE ON 
        email.address
    REFERENCING NEW TABLE AS NEW
    FOR EACH STATEMENT EXECUTE FUNCTION 
        email.address_audit();
