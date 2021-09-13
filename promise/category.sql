CREATE TABLE IF NOT EXISTS
promise.category
(
    created_at TIMESTAMPTZ NOT NULL
        DEFAULT CURRENT_TIMESTAMP,
	description VARCHAR(160),
    id SERIAL NOT NULL,
    name CITEXT NOT NULL,
    profile SERIAL NOT NULL,
    PRIMARY KEY(id),
    FOREIGN KEY (profile)
        REFERENCES account.profile (id)
        MATCH SIMPLE
        ON DELETE CASCADE
        ON UPDATE NO ACTION
        NOT VALID,
    UNIQUE (name, profile),
    CHECK (CHAR_LENGTH(name) <= 60)
);

ALTER TABLE promise.category
    OWNER TO postgres;
