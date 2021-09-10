WITH
promise_category AS (
	INSERT INTO promise.category (name, profile) VALUES ('all', $1)
	RETURNING id, profile
),
promise_task AS (
	INSERT INTO promise.task (category, name, profile)
    VALUES ((SELECT id FROM promise_category), $2, (SELECT profile FROM promise_category))
	RETURNING *
)
SELECT ROW_TO_JSON(T.*) FROM promise_task AS T;
