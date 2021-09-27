DROP TABLE IF EXISTS account.address CASCADE;
CREATE TABLE IF NOT EXISTS account.address
(
    name citext NOT NULL,
    profile_id INTEGER NOT NULL,
    PRIMARY KEY (name),
    FOREIGN KEY (name)
        REFERENCES account.profile (name) MATCH FULL
        ON UPDATE CASCADE
        ON DELETE CASCADE
        NOT VALID,
    FOREIGN KEY (profile_id)
        REFERENCES account.profile (id) MATCH FULL
        ON UPDATE CASCADE
        ON DELETE CASCADE
        NOT VALID
);

ALTER TABLE account.address
    OWNER to postgres;
