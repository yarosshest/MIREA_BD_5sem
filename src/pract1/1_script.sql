CREATE database beer;

use beer;

CREATE TABLE Client (
    id_client int PRIMARY KEY AUTO_INCREMENT,
    FIO VARCHAR(40) NOT NULL,
    INN VARCHAR(40),
    phone VARCHAR(40) NOT NULL
);

CREATE TABLE Lawyer(
    id_lawyer int PRIMARY KEY AUTO_INCREMENT,
    FIO VARCHAR(40) NOT NULL,
    salary VARCHAR(40)
);

CREATE TABLE Payment_status (
    id_payment_status int PRIMARY KEY AUTO_INCREMENT,
    status VARCHAR(40) NOT NULL
);

CREATE TABLE Payment(
    id_payment int PRIMARY KEY AUTO_INCREMENT,
    amount VARCHAR(40) NOT NULL,
    id_payment_status int,
    FOREIGN KEY (id_payment_status) REFERENCES Payment_status (id_payment_status)
);

CREATE TABLE Contract_status (
    id_contract_status int PRIMARY KEY AUTO_INCREMENT,
    status VARCHAR(40) NOT NULL
);

CREATE TABLE Contract(
    id_contract int PRIMARY KEY AUTO_INCREMENT,
    link TEXT,
    id_contract_status int,
    FOREIGN KEY (id_contract_status) REFERENCES Contract_status (id_contract_status)
);


CREATE TABLE Request_status (
    id_request_status int PRIMARY KEY AUTO_INCREMENT,
    status VARCHAR(40) NOT NULL
);

CREATE TABLE Request(
    id_request int PRIMARY KEY AUTO_INCREMENT,
    id_request_status int,
    id_contract int,
    id_payment int,
    id_client int,
    id_lawyer int,
    FOREIGN KEY (id_request_status) REFERENCES Request_status (id_request_status),
    FOREIGN KEY (id_contract) REFERENCES Contract (id_contract),
    FOREIGN KEY (id_payment) REFERENCES Payment (id_payment),
    FOREIGN KEY (id_client) REFERENCES Client (id_client),
    FOREIGN KEY (id_lawyer) REFERENCES Lawyer (id_lawyer)
);


CREATE TABLE Production_status (
    id_production_status int PRIMARY KEY AUTO_INCREMENT,
    status VARCHAR(40) NOT NULL
);

CREATE TABLE Production_sheet (
    id_production_sheet int PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(40) NOT NULL,
    id_request int,
    id_production_status int,
    FOREIGN KEY (id_request) REFERENCES Request (id_request),
    FOREIGN KEY (id_production_status) REFERENCES Production_status (id_production_status)
);

CREATE TABLE Competence(
    id_competence int PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(40) NOT NULL
);

CREATE TABLE Brewer(
   id_brewer int PRIMARY KEY AUTO_INCREMENT,
   FIO VARCHAR(40) NOT NULL,
   salary VARCHAR(40),
   id_competence int,
   FOREIGN KEY (id_competence) REFERENCES Competence (id_competence)
);

CREATE TABLE Parameter(
    id_parameter int PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(40) NOT NULL
);

CREATE TABLE Equipment(
    id_equipment int PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(40) NOT NULL,
    resource VARCHAR(40)
);


CREATE TABLE Equipment_parameters(
    id_equipment_parameters int PRIMARY KEY AUTO_INCREMENT,
    val VARCHAR(40) NOT NULL,
    data_time  VARCHAR(40) NOT NULL,
    id_equipment int NOT NULL,
    id_parameter int NOT NULL,
    FOREIGN KEY (id_equipment) REFERENCES Equipment (id_equipment),
    FOREIGN KEY (id_parameter) REFERENCES Parameter (id_parameter)
);



CREATE TABLE Production_step (
    id_production_step int PRIMARY KEY AUTO_INCREMENT,
    data_time  VARCHAR(40) NOT NULL,
    log TEXT,
    id_equipment int NOT NULL,
    id_brewer int NOT NULL,
    FOREIGN KEY (id_equipment) REFERENCES Equipment (id_equipment),
    FOREIGN KEY (id_brewer) REFERENCES Brewer (id_brewer)
);


CREATE TABLE Production_steps_in_sheet(
    id_production_steps_in_sheet int PRIMARY KEY AUTO_INCREMENT,
    id_production_sheet int NOT NULL,
    id_production_step int NOT NULL,
    FOREIGN KEY (id_production_sheet) REFERENCES Production_sheet (id_production_sheet),
    FOREIGN KEY (id_production_step) REFERENCES Production_step (id_production_step)
);

CREATE TABLE Spoilage(
    id_spoilage int PRIMARY KEY AUTO_INCREMENT,
    amount VARCHAR(40) NOT NULL,
    item  VARCHAR(40) NOT NULL,
    id_production_step int NOT NULL,
    FOREIGN KEY (id_production_step) REFERENCES Production_step (id_production_step)
);
