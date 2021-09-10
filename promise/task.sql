CREATE TABLE IF NOT EXISTS
promise.task
(
    category SERIAL,
    created_at TIMESTAMPTZ NOT NULL
        DEFAULT CURRENT_TIMESTAMP,
    description VARCHAR(160),
    id SERIAL NOT NULL,
    name CITEXT NOT NULL,
    profile SERIAL NOT NULL,
    PRIMARY KEY(id),
    FOREIGN KEY (category)
        REFERENCES promise.category (id)
        MATCH SIMPLE
        ON DELETE NO ACTION
        ON UPDATE NO ACTION
        NOT VALID,
    FOREIGN KEY (profile)
        REFERENCES account.profile (id)
        MATCH SIMPLE
        ON DELETE CASCADE
        ON UPDATE NO ACTION
        NOT VALID,
    UNIQUE (name, profile),
    CHECK (CHAR_LENGTH(name) <= 60)
);

ALTER TABLE promise.task 
    OWNER TO postgres;
