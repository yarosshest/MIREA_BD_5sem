SELECT * FROM Client;

SELECT id_client FROM Request WHERE id_request_status=2;

SELECT id_payment_status FROM Payment WHERE amount>=597507000;

SELECT id_lawyer FROM Request WHERE id_contract IS NOT NULL;

SELECT * FROM production_step WHERE id_brewer BETWEEN 1 AND 3;

SELECT * FROM production_step WHERE id_brewer BETWEEN 1 AND 3;

SELECT * FROM production_steps_in_sheet WHERE id_production_sheet IN (1, 3);

SELECT * FROM Spoilage WHERE item LIKE "бо%";

ALTER TABLE Client ADD COLUMN status varchar(20);
SELECT * FROM Request;
UPDATE Client, Request SET Client.status ='1'
    WHERE  Request.id_request_status = 1 AND Request.id_client = Client.id_client;
SELECT * FROM Client;
ALTER TABLE Client DROP COLUMN status;

