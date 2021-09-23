CREATE TABLE IF NOT EXISTS account.profile
(
    id SERIAL NOT NULL,
    is_verified BOOL NOT NULL
        DEFAULT FALSE,
    name CITEXT NOT NULL,
    time_created TIMESTAMP NOT NULL
        DEFAULT CURRENT_TIMESTAMP,
    time_edited TIMESTAMP NOT NULL
        DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id),
    UNIQUE (name),
    CHECK (name *~ '^[a-zA-Z0-9]([\w -]*[a-zA-Z0-9])?${60}')
);

ALTER TABLE account.profile
    OWNER TO postgres;
