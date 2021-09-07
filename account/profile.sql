CREATE TABLE IF NOT EXISTS
account.profile
(
	created_at TIMESTAMPTZ NOT NULL 
        DEFAULT CURRENT_TIMESTAMP,
	id SERIAL NOT NULL,
	email SERIAL NOT NULL,
	PRIMARY KEY(id),
	FOREIGN KEY (email)
        REFERENCES email.address (id)
        MATCH SIMPLE
        ON DELETE CASCADE
);

ALTER TABLE account.profile
    OWNER TO postgres;
