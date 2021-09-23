CREATE TABLE IF NOT EXISTS location.address
(
    city_id INT,
    country_id INT,
    id SERIAL NOT NULL,
    profile_id INT NOT NULL,
    time_created TIMESTAMPTZ NOT NULL,
        DEFAULT CURRENT_TIMESTAMP,
    time_edited TIMESTAMPTZ NOT NULL
        DEFAULT CURRENT_TIMESTAMP
    PRIMARY KEY (id),
    FOREIGN KEY (city_id)
        REFERENCES location.city (id)
        MATCH SIMPLE
        ON DELETE NO ACTION
    FOREIGN KEY (country_id)
        REFERENCES location.country (id)
        MATCH SIMPLE
        ON DELETE NO ACTION,
    FOREIGN KEY (profile_id)
        REFERENCES account.profile (id)
        MATCH SIMPLE
        ON DELETE CASCADE
);

ALTER TABLE location.address
    OWNER TO postgres;
