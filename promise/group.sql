CREATE TABLE IF NOT EXISTS
promise.group
(
    created_at TIMESTAMPTZ NOT NULL
        DEFAULT CURRENT_TIMESTAMP,
    id SERIAL NOT NULL,
    name CITEXT NOT NULL,
    profile SERIAL NOT NULL,
    PRIMARY KEY(id),
    FOREIGN KEY (profile)
        REFERENCES account.profile (id)
        MATCH SIMPLE
        ON DELETE CASCADE,
    UNIQUE (name, profile),
    CHECK (CHAR_LENGTH(name) <= 60)
);

ALTER TABLE promise.group
    OWNER TO postgres;
