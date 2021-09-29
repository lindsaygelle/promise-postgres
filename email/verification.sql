CREATE TABLE IF NOT EXISTS email.verification
(
    code UUID NOT NULL
        DEFAULT gen_random_uuid(),
    profile_id INT NOT NULL,
    time_created TIMESTAMP NOT NULL
        DEFAULT CURRENT_TIMESTAMP,
    time_due TIMESTAMP NOT NULL
        DEFAULT CURRENT_TIMESTAMP + INTERVAL '1' DAY,
    PRIMARY KEY (profile_id),
    FOREIGN KEY (profile_id) 
        REFERENCES email.address (profile_id) MATCH FULL
        ON DELETE CASCADE
        ON UPDATE NO ACTION
        NOT VALID
);

ALTER TABLE email.verification
    OWNER TO postgres;
