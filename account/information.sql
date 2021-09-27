DROP TABLE IF EXISTS account.information CASCADE;
CREATE TABLE account.information
(
    profile_id INTEGER NOT NULL,
    PRIMARY KEY (profile_id),
    FOREIGN KEY (profile_id)
        REFERENCES account.profile (id) MATCH FULL
        ON DELETE CASCADE
        ON UPDATE CASCADE
        NOT VALID
);

ALTER TABLE account.information
    OWNER TO postgres;