DROP TABLE IF EXISTS email.address_audit CASCADE;
CREATE TABLE email.address_audit 
(
    address CITEXT NOT NULL,
    address_id INTEGER NOT NULL,
    domain CITEXT NOT NULL,
    id SERIAL NOT NULL,
    is_verified BOOL NOT NULL,
    postgres_action CITEXT NOT NULL,
    postgres_user CITEXT NOT NULL,
    time_created TIMESTAMPTZ NOT NULL
        DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id),
    FOREIGN KEY (address_id)
        REFERENCES email.address (id) MATCH FULL
        ON DELETE CASCADE
        ON UPDATE CASCADE
        NOT VALID
);

ALTER TABLE email.address_audit 
    OWNER TO postgres;
