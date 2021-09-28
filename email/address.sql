CREATE TABLE IF NOT EXISTS email.address
(
    address CITEXT NOT NULL,
    domain CITEXT NOT NULL,
    is_verified BOOL
        DEFAULT FALSE,
    profile_id INT NOT NULL,
    time_created TIMESTAMPTZ NOT NULL
        DEFAULT CURRENT_TIMESTAMP,
    time_edited TIMESTAMPTZ NOT NULL
        DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (profile_id),
    FOREIGN KEY (profile_id)
        REFERENCES account.profile (id)
        MATCH SIMPLE
        ON DELETE CASCADE,
    CHECK (address ~* '^[a-zA-Z0-9.!#$%&''*+/=?^_`{|}~-]{64}'),
    CHECK (domain ~* '^[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$'),
    UNIQUE (address, domain)
);

ALTER TABLE email.address
    OWNER TO postgres;
