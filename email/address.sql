CREATE TABLE IF NOT EXISTS
email.address (
	address CITEXT NOT NULL,
	domain CITEXT NOT NULL,
	id SERIAL NOT NULL,
	verified BOOL NOT NULL 
        DEFAULT FALSE,
	PRIMARY KEY(id),
	FOREIGN KEY (domain)
        REFERENCES email.domain (id)
        MATCH SIMPLE,
	UNIQUE (address, domain),
    CHECK (CHAR_LENGTH(address) > 0 AND CHAR_LENGTH(address) <= 100)
);

ALTER TABLE email.address
    OWNER TO postgres;
