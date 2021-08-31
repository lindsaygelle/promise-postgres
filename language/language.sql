CREATE TABLE IF NOT EXISTS language.language
(
    created TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    id SERIAL NOT NULL,
    name CITEXT NOT NULL,
    PRIMARY KEY(id),
    UNIQUE (name)
);

ALTER TABLE language.language OWNER TO postgres;
