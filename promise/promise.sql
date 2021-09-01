CREATE TABLE IF NOT EXISTS promise.promise
(
    completed TIMESTAMPTZ NULL,
    created TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    description VARCHAR(255) NULL,
    edited TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    id SERIAL NOT NULL,
    locked BOOLEAN NOT NULL DEFAULT false,
    maker SERIAL NOT NULL,
    name VARCHAR(80) NOT NULL,
    owner SERIAL NOT NULL,
    PRIMARY KEY(id),
    FOREIGN KEY (maker)
        REFERENCES account.account MATCH SIMPLE,
    FOREIGN KEY (owner)
        REFERENCES account.account MATCH SIMPLE
);

ALTER TABLE promise.promise
    OWNER TO postgres;
