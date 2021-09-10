CREATE TABLE IF NOT EXISTS
email.verification
(
	address SERIAL NOT NULL,
	code UUID NOT NULL
        DEFAULT gen_random_uuid(),
    expires_at TIMESTAMPTZ NOT NULL
        DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY (address),
	FOREIGN KEY (address)
        REFERENCES email.address (id)
        MATCH SIMPLE
        ON DELETE CASCADE
        ON UPDATE NO ACTION
        NOT VALID
);

ALTER TABLE email.verification
    OWNER TO postgres;
