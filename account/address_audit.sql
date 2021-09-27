DROP TABLE IF EXISTS account.address_audit;
CREATE TABLE account.address_audit
(
    id SERIAL NOT NULL,
    name CITEXT NOT NULL,
    postgres_action CITEXT NOT NULL,
    postgres_user CITEXT NOT NULL,
    profile_id INTEGER NOT NULL,
    time_created TIMESTAMPTZ NOT NULL
        DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id),
    FOREIGN KEY (profile_id)
        REFERENCES account.profile (id) MATCH FULL
        ON DELETE CASCADE
        ON UPDATE CASCADE
        NOT VALID
);

ALTER TABLE account.address_audit
    OWNER TO postgres;
