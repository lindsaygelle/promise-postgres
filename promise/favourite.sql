CREATE TABLE IF NOT EXISTS promise.favourite
(
    account SERIAL NOT NULL,
    created TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    id SERIAL NOT NULL,
    promise SERIAL NOT NULL,
    PRIMARY KEY(id),
    FOREIGN KEY (account)
        REFERENCES account.account MATCH SIMPLE
        ON DELETE CASCADE,
    FOREIGN KEY (promise)
        REFERENCES promise.promise MATCH SIMPLE
        ON DELETE CASCADE
);

ALTER TABLE promise.favourite
    OWNER TO postgres;
