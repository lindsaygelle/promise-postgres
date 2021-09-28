CREATE TABLE IF NOT EXISTS email.verification
(
    address_id INT NOT NULL,
    code UUID NOT NULL
        DEFAULT gen_random_uuid(),
    time_created TIMESTAMP NOT NULL
        DEFAULT CURRENT_TIMESTAMP,
    time_due TIMESTAMP NOT NULL
        DEFAULT CURRENT_TIMESTAMP + INTERVAL '1' DAY,
    PRIMARY KEY (address_id),
    FOREIGN KEY (address_id) 
        REFERENCES email.address (id)
        MATCH SIMPLE
        ON DELETE CASCADE
        ON UPDATE NO ACTION
);

ALTER TABLE email.verification
    OWNER TO postgres;
