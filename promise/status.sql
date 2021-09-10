CREATE TABLE IF NOT EXISTS
promise.status
(
    created_at TIMESTAMPTZ NOT NULL
        DEFAULT CURRENT_TIMESTAMP,
    id SERIAL NOT NULL,
    name CITEXT,
    PRIMARY KEY (id),
    UNIQUE (name),
    CHECK (CHAR_LENGTH(name) <= 30)
);

ALTER TABLE promise.status
    OWNER TO postgres;
