DROP TRIGGER IF EXISTS address_audit_insert
    ON account.address;

CREATE TRIGGER address_audit_insert
    AFTER INSERT ON 
        account.address
    REFERENCING NEW TABLE AS NEW
    FOR EACH STATEMENT EXECUTE FUNCTION 
        account.address_audit();
    
DROP TRIGGER IF EXISTS address_audit_update
    ON account.address;

CREATE TRIGGER address_audit_update
    AFTER UPDATE ON 
        account.address
    REFERENCING NEW TABLE AS NEW
    FOR EACH STATEMENT EXECUTE FUNCTION 
        account.address_audit();
