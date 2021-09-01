CREATE TABLE IF NOT EXISTS promise.promise
(
    created TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    edited TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    id SERIAL NOT NULL,
    locked BOOLEAN NOT NULL,
    maker SERIAL NOT NULL,
    owner SERIAL NOT NULL,
    PRIMARY KEY(id),
    FOREIGN KEY (maker)
        REFERENCES account.account MATCH SIMPLE,
    FOREIGN KEY (owner)
        REFERENCES account.account MATCH SIMPLE
);

ALTER TABLE promise.promise
    OWNER TO postgres;
