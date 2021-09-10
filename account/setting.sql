CREATE TABLE IF NOT EXISTS
account.setting
(
    profile SERIAL NOT NULL,
    PRIMARY KEY (profile),
    FOREIGN KEY (profile)
        REFERENCES account.profile (id)
        MATCH SIMPLE
        ON DELETE CASCADE
        ON UPDATE NO ACTION
        NOT VALID
);

ALTER TABLE account.setting
    OWNER TO postgres;
