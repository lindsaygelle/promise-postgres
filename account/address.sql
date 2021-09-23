CREATE TABLE IF NOT EXISTS account.address
(
    name CITEXT NOT NULL,
    profile_id INT NOT NULL,
    time_created TIMESTAMPTZ NOT NULL,
        DEFAULT CURRENT_TIMESTAMP,
    time_edited TIMESTAMPTZ NOT NULL
        DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (name),
    FOREIGN KEY (profile_id)
        REFERENCES account.profile (id)
        MATCH SIMPLE
        ON DELETE CASCADE
);

ALTER TABLE account.account
    OWNER TO postgres;
