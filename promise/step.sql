CREATE TABLE IF NOT EXISTS
promise.step
(
    completed_at TIMESTAMPTZ,
    created_at TIMESTAMPTZ NOT NULL
        DEFAULT CURRENT_TIMESTAMP,
    description VARCHAR(160),
    id SERIAL NOT NULL,
    name CITEXT NOT NULL,
    rank INT8 NOT NULL
        DEFAULT 1,
    status INT NOT NULL,
    task INT NOT NULL,
    PRIMARY KEY(id),
    CONSTRAINT FOREIGN KEY (status)
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
    UNIQUE (rank, task),
    CHECK (completed_at > created_at),
    CHECK (CHAR_LENGTH(name) <= 30),
    CHECK (rank > 0)
);

ALTER TABLE promise.step 
    OWNER TO postgres;
