CREATE TABLE IF NOT EXISTS language.tag
(
    created TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    id SERIAL NOT NULL,
    language SERIAL NOT NULL,
    name CITEXT NOT NULL,
    tag CITEXT NOT NULL,
    PRIMARY KEY(id),
    FOREIGN KEY (language)
        REFERENCES language.language (id) MATCH SIMPLE
        ON DELETE CASCADE,
    UNIQUE (name),
    UNIQUE (tag),
    CHECK (CHAR_LENGTH(name) <= 20),
    CHECK (CHAR_LENGTH(tag) = 5)
);

ALTER TABLE language.tag OWNER TO postgres;
