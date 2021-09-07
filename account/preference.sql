CREATE TABLE IF NOT EXISTS 
account.preference
(
	profile SERIAL NOT NULL,
	PRIMARY KEY (profile),
	FOREIGN KEY (profile) 
        REFERENCES account.profile (id)
        MATCH SIMPLE
        ON DELETE CASCADE
);

ALTER TABLE account.preference
    OWNER TO postgres;