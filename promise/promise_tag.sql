CREATE TABLE IF NOT EXISTS promise_tag
(
    id SERIAL NOT NULL,
    promise SERIAL NOT NULL,
    tag SERIAL NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (promise)
        REFERENCES promise.promise (id),
    FOREIGN KEY (tag)
        REFERENCES promise.tag (id)
        ON DELETE CASCADE
)

ALTER TABLE promise_tag
    OWNER TO postgres;
