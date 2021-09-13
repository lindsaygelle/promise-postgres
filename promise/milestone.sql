CREATE TABLE IF NOT EXISTS
promise.milestone
(
    created_at TIMESTAMPTZ NOT NULL
        DEFAULT CURRENT_TIMESTAMP,
    id SERIAL NOT NULL,
    step INT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (step)
        REFERENCES promise.step (id)
        MATCH SIMPLE
        ON DELETE CASCADE
        ON UPDATE NO ACTION
        NOT VALID
);

ALTER TABLE promise.milestone
    OWNER TO postgres;
