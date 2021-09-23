CREATE TABLE IF NOT EXISTS account.address
(
    name CITEXT NOT NULL,
    profile_id INT NOT NULL,
    PRIMARY KEY (name),
    FOREIGN KEY (name)
        REFERENCES account.profile (name)
        MATCH SIMPLE
        ON DELETE CASCADE,
    FOREIGN KEY (profile_id)
        REFERENCES account.profile (id)
        MATCH SIMPLE
        ON DELETE CASCADE
);

ALTER TABLE account.account
    OWNER TO postgres;
