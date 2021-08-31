CREATE TABLE IF NOT EXISTS account.settings
(
    account SERIAL NOT NULL,
    biography VARCHAR(160),
    country SERIAL NOT NULL,
    edited TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (account)
        REFERENCES account.account (id) MATCH SIMPLE
        ON DELETE CASCADE,
    FOREIGN KEY (country)
        REFERENCES location.country (id) MATCH SIMPLE
);

ALTER TABLE account.settings
    OWNER TO postgres;
