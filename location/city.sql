CREATE TABLE IF NOT EXISTS location.city
(
    country_id INT NOT NULL,
    id SERIAL NOT NULL,
    name CITEXT NOT NULL,
    time_created TIMESTAMPTZ NOT NULL
        DEFAULT CURRENT_TIMESTAMP,
    time_edited TIMESTAMPTZ NOT NULL
        DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id),
    FOREIGN KEY (country_id)
        REFERENCES location.country (id)
        MATCH SIMPLE
        ON DELETE CASCADE,
    CHECK (CHAR_LENGTH(name) > 0),
    UNIQUE (name, country_id)
);

ALTER TABLE location.city
    OWNER TO postgres;
