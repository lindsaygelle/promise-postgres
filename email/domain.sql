CREATE TABLE IF NOT EXISTS
email.domain (
    id CITEXT NOT NULL,
    PRIMARY KEY (id),
    CHECK (CHAR_LENGTH(id) <= 100)
);

ALTER TABLE email.domain
    OWNER TO postgres;
