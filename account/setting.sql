CREATE TABLE IF NOT EXISTS account.setting
(
    account SERIAL NOT NULL,
    biography VARCHAR(160),
    country SERIAL NOT NULL,
    edited TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    language SERIAL NOT NULL,
    FOREIGN KEY (account)
        REFERENCES account.account (id) MATCH SIMPLE
        ON DELETE CASCADE,
    FOREIGN KEY (country)
        REFERENCES location.country (id) MATCH SIMPLE,
    FOREIGN KEY (language)
        REFERENCES language.language (id) MATCH SIMPLE
);

ALTER TABLE account.setting
    OWNER TO postgres;
