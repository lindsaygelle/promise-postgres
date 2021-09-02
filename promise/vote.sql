CREATE TABLE IF NOT EXISTS promise.vote
(
    account SERIAL NOT NULL,
    created TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    promise SERIAL NOT NULL,
    value BOOLEAN NOT NULL,
    PRIMARY KEY(account, promise),
    FOREIGN KEY (account)
        REFERENCES account.account MATCH SIMPLE
        ON DELETE CASCADE,
    FOREIGN KEY (promise)
        REFERENCES promise.promise MATCH SIMPLE
        ON DELETE CASCADE
);

ALTER TABLE promise.vote 
    OWNER TO postgres;
