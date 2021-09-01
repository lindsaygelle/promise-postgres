CREATE TABLE IF NOT EXISTS promise.tag
(
    created TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    id SERIAL NOT NULL,
    maker SERIAL NOT NULL,
    value CITEXT,
    PRIMARY KEY(id),
    FOREIGN KEY (maker) 
        REFERENCES account.account (id) MATCH SIMPLE,
    UNIQUE (value),
    CHECK (CHAR_LENGTH(value) <= 30)
);

ALTER TABLE promise.tag 
    OWNER TO postgres;
