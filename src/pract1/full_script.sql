INSERT Client(FIO, phone, INN)
VALUES
  ("Melyssa Murphy","(454) 775-1844","6767742332286431"),
  ("Gwendolyn Sweeney","(734) 636-1070","553 63583 64396 923"),
  ("Merrill Vance","(632) 312-0081","453236 5775235829"),
  ("Jesse Dorsey","(630) 869-3940","653 34638 66629 887"),
  ("Brynn Luna","(250) 296-8828","633445 6491365720");

INSERT INTO Lawyer (FIO, salary)
VALUES
    ("Figueroa, Olga K.",633776),
    ("Graves, Chaim B.",300345),
    ("Singleton, Keaton Y.",597507),
    ("Reed, Anika H.",51655),
    ("Mendoza, Thane E.",69604);

INSERT INTO Payment_status (status)
VALUES
    ("Оплачен"),
    ("Ожидает оплаты"),
    ("Отменен");

INSERT INTO Payment (amount, id_payment_status)
VALUES
    ("633776000",1),
    ("300345000",2),
    ("597507000",1),
    ("69604000",3),
    ("51655000",2);

INSERT INTO Contract_status (status)
VALUES
    ("Подписан"),
    ("Ожидает подписания"),
    ("Отменен");

INSERT INTO Contract (link, id_contract_status)
VALUES
  ("https://whatsapp.com?q=0",2),
  ("https://whatsapp.com?ad=115",2),
  ("http://netflix.com?p=8",1),
  ("https://yahoo.com?gi=100",3),
  ("http://wikipedia.org?ab=441&aad=2",2);

INSERT INTO Request_status (status)
 VALUES
     ("Закрыт"),
     ("На производстве"),
     ("Подписывается контракт"),
     ("Ожидаеться оплата"),
     ("На обработке");

INSERT INTO Request (id_request_status, id_contract, id_payment, id_client, id_lawyer)
 VALUES
     (1,1,1,1,1),
     (2,2,1,2,3),
     (2,2,1,3,4);

INSERT INTO Production_status (status)
 VALUES
     ("Не начат"),
     ("Планируется"),
     ("В работе"),
     ("Закончен");

INSERT INTO Production_sheet (name, id_request, id_production_status)
 VALUES
     ("Пациент бензин", 1, 1),
     ("Волк", 2, 2),
     ("Германт из Сирии", 3, 1);

INSERT INTO Competence (name)
 VALUES
     ("Стажер"),
     ("Старший пивовар"),
     ("Специалист");


INSERT INTO Brewer (FIO, salary, id_competence)
VALUES
  ("Morales, Brenden Q.",97067,2),
  ("Robbins, Palmer H.",77670,3),
  ("Petersen, Teagan T.",86441,3),
  ("Norris, Anjolie X.",70656,1),
  ("Maxwell, Darius R.",66709,2);

INSERT INTO Parameter (name)
VALUES
  ("Коофицент изменения"),
  ("Максимальная температура"),
  ("Минимальная температура"),
  ("Время");

INSERT INTO Equipment (name, resource)
VALUES
  ("6u8hp3/257", "97067"),
  ("j73qafck-1", "77670"),
  ("y6i6jzpt90", "70656"),
  ("9hx19faw9t", "66709");

INSERT INTO Equipment_parameters (val, data_time, id_equipment, id_parameter)
VALUES
  ("23", "15:40:30 24.12.2002", 1, 2),
  ("0.4", "16:30:10 23.02.2012", 3, 3),
  ("5", "12:55:14 13.04.2018", 4, 2),
  ("44", "01:33:46 1.08.2023", 3, 2);

INSERT INTO Production_step (data_time, log, id_equipment, id_brewer)
VALUES
  ("15:40:30 24.12.2002", "log 1", 1, 1),
  ("16:30:10 23.02.2012", "log 2", 3, 4),
  ("12:55:14 13.04.2018", "log 4", 4, 2),
  ("01:33:46 01.08.2023", "log 5", 3, 3);

INSERT INTO Production_steps_in_sheet (id_production_sheet, id_production_step)
VALUES
  (1, 1),
  (2, 2),
  (3, 3),
  (1, 4);

INSERT INTO Spoilage (amount, item, id_production_step)
VALUES
  ("44л", "вода", 1),
  ("4Шт", "бочек", 2),
  ("23л", "сусла", 2),
  ("78л", "Конечного продукта", 2);


SELECT Parameter.name, Equipment.name, Equipment_parameters.val
FROM Parameter, Equipment, Equipment_parameters
WHERE Equipment_parameters.id_equipment = Equipment.id_equipment AND
 Equipment_parameters.id_parameter = Parameter.id_parameter
ORDER BY Equipment_parameters.val DESC;