DROP TABLE IF EXISTS account.profile CASCADE;
CREATE TABLE account.profile
(
    id SERIAL NOT NULL,
    name CITEXT NOT NULL,
    time_created TIMESTAMPTZ NOT NULL,
    time_edited TIMESTAMPTZ NOT NULL
        DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id),
    CHECK (time_edited >= time_created),
    CHECK (((CHAR_LENGTH(name) > 0) AND (CHAR_LENGTH(name) <= 60)) AND (name ~* '^[a-zA-Z0-9]([\w\s-]*[a-zA-Z0-9])$')),
    UNIQUE (name)
);

ALTER TABLE account.profile
    OWNER TO postgres;
