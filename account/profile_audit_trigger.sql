DROP TRIGGER IF EXISTS profile_audit_insert
    ON account.profile;

CREATE TRIGGER profile_audit_insert
    AFTER INSERT ON 
        account.profile
    REFERENCING NEW TABLE AS NEW
    FOR EACH STATEMENT EXECUTE FUNCTION 
        account.profile_audit();

DROP TRIGGER IF EXISTS profile_audit_update
    ON account.profile;

CREATE TRIGGER profile_audit_update
    AFTER UPDATE ON 
        account.profile
    REFERENCING NEW TABLE AS NEW
    FOR EACH STATEMENT EXECUTE FUNCTION 
        account.profile_audit();
