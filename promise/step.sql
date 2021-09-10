CREATE TABLE IF NOT EXISTS
promise.step
(
    created_at TIMESTAMPTZ NOT NULL
        DEFAULT CURRENT_TIMESTAMP,
    description VARCHAR(160),
    id SERIAL NOT NULL,
    name CITEXT NOT NULL,
    rank INT8 NOT NULL
        DEFAULT 1,
    status SERIAL NOT NULL,
    task SERIAL NOT NULL,
    PRIMARY KEY(id),
    FOREIGN KEY (status)
        REFERENCES promise.status (id)
        MATCH SIMPLE
        ON DELETE NO ACTION
        ON UPDATE NO ACTION
        NOT VALID,
    FOREIGN KEY (task)
        REFERENCES promise.task (id)
        MATCH SIMPLE
        ON DELETE CASCADE
        ON UPDATE NO ACTION
        NOT VALID,
    UNIQUE (id, task),
    UNIQUE (name, task),
    CHECK (CHAR_LENGTH(name) <= 30),
    CHECK (rank > 0)
);

ALTER TABLE promise.step 
    OWNER TO postgres;
