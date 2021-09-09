CREATE TABLE IF NOT EXISTS
promise.step
(
    completed_at TIMESTAMPTZ,
    created_at TIMESTAMPTZ NOT NULL
        DEFAULT CURRENT_TIMESTAMP,
    id SERIAL NOT NULL,
    name CITEXT NOT NULL,
    order INT8 NOT NULL,
    task SERIAL NOT NULL,
    PRIMARY KEY(id),
    FOREIGN KEY (task)
        REFERENCES promise.task (id)
        MATCH SIMPLE
        ON DELETE CASCADE,
    UNIQUE (id, task),
    UNIQUE (name, task)
);

ALTER TABLE promise.step 
    OWNER TO postgres;
