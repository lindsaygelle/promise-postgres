CREATE TABLE IF NOT EXISTS promise.promise_tag
(
    promise SERIAL NOT NULL,
    tag SERIAL NOT NULL,
    PRIMARY KEY (promise, tag),
    FOREIGN KEY (promise)
        REFERENCES promise.promise (id),
    FOREIGN KEY (tag)
        REFERENCES promise.tag (id)
        ON DELETE CASCADE
);

ALTER TABLE promise.promise_tag
    OWNER TO postgres;
