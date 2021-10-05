DROP TABLE IF EXISTS location.country CASCADE;
CREATE TABLE IF NOT EXISTS location.country
(
    id SERIAL NOT NULL,
    name CITEXT NOT NULL,
    time_created TIMESTAMPTZ NOT NULL
        DEFAULT CURRENT_TIMESTAMP,
    time_edited TIMESTAMPTZ NOT NULL
        DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id),
    CHECK (CHAR_LENGTH(name) >= 4 AND CHAR_LENGTH(name) <= 40),
    UNIQUE (name)  
);

ALTER TABLE location.country
    OWNER TO postgres;
