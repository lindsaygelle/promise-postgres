CREATE TABLE IF NOT EXISTS account.setting
(
    profile_id INT NOT NULL,
    PRIMARY KEY (profile_id),
    FOREIGN KEY (profile_id)
        REFERENCES account.profile
        MATCH SIMPLE
        ON DELETE CASCADE
);

ALTER TABLE account.setting
    OWNER TO postgres;
