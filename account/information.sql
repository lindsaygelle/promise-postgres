CREATE TABLE IF NOT EXISTS account.information
(
    profile_id INT NOT NULL
    time_created TIMESTAMPTZ NOT NULL
        DEFAULT CURRENT_TIMESTAMP,
    time_edited TIMESTAMPTZ NOT NULL
        DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (profile_id),
    FOREIGN KEY (profile_id)
        REFERENCES address.profile (id)
        MATCH SIMPLE
        ON DELETE CASCADE
);

ALTER TABLE account.information
    OWNER TO postgres;
