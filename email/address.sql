CREATE TABLE IF NOT EXISTS email.address
(
    address CITEXT NOT NULL,
    domain CITEXT NOT NULL,
    id SERIAL NOT NULL,
    is_primary BOOL
        DEFAULT TRUE,
    is_verified BOOL
        DEFAULT FALSE,
    profile_id INT NOT NULL,
    time_created TIMESTAMPTZ NOT NULL
        DEFAULT CURRENT_TIMESTAMP,
    time_edited TIMESTAMPTZ NOT NULL
        DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id),
    FOREIGN KEY (domain)
        REFERENCES email.domain (name)
        MATCH SIMPLE
        ON DELETE NO ACTION,
    FOREIGN KEY (profile_id)
        REFERENCES account.profile (id)
        MATCH SIMPLE
        ON DELETE CASCADE,
    CHECK (address ~* '^[a-zA-Z0-9.!#$%&''*+/=?^_`{|}~-]{64}')
);

ALTER TABLE email.domain
    OWNER TO postgres;
