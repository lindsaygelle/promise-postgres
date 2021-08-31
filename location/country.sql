CREATE TABLE IF NOT EXISTS location.country
(
    alpha_2 CITEXT NOT NULL,
    alpha_3 CITEXT NOT NULL,
    created TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    id SERIAL NOT NULL,
    name CITEXT NOT NULL,
    numeric SMALLINT NOT NULL,
    PRIMARY KEY (id),
    UNIQUE (alpha_2),
    UNIQUE (alpha_3),
    UNIQUE (name),
    UNIQUE (numeric),
    CHECK (CHAR_LENGTH(alpha_2) <= 2),
    CHECK (CHAR_LENGTH(alpha_3) <= 3),
    CHECK (CHAR_LENGTH(name) <= 60)
);

ALTER TABLE location.country
    OWNER to postgres;
