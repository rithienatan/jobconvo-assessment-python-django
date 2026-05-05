/*---------- CREATE SCHEMA ----------*/
CREATE SCHEMA "Entities";
CREATE SCHEMA "JOBS";


/*---------- CREATE ENTITY TABLES ----------*/
CREATE TABLE "Entities".enterprises (
    id SERIAL PRIMARY KEY,
    name VARCHAR(127) NOT NULL,
    email VARCHAR(127) NOT NULL UNIQUE,
    password VARCHAR(127) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE "Entities".candidates (
    id SERIAL PRIMARY KEY,
    name VARCHAR(127) NOT NULL,
    email VARCHAR(127) NOT NULL UNIQUE,
    password VARCHAR(127) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


/*---------- CREATE JOBS TABLES ----------*/
CREATE TABLE "JOBS".jobs_status (
    id SMALLSERIAL PRIMARY KEY,
    status_name VARCHAR(15) NOT NULL
);

CREATE TABLE "JOBS".salary_ranges (
    id SMALLSERIAL PRIMARY KEY,
    salary_expetation VARCHAR(31) NOT NULL
);

CREATE TABLE "JOBS".minimum_education (
    id SMALLSERIAL PRIMARY KEY,
    education_level VARCHAR(31) NOT NULL
);

CREATE TABLE "JOBS".jobs_offers (
    id SERIAL PRIMARY KEY,
    enterprise_id INT NOT NULL,
    status_id SMALLINT NOT NULL,
    title VARCHAR(127) NOT NULL,
    description TEXT NOT NULL,
    salaray_range_id SMALLINT NOT NULL,
    minimal_education_id SMALLINT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (enterprise_id) REFERENCES "Entities".enterprises(id),
    FOREIGN KEY (status_id) REFERENCES "JOBS".jobs_status(id),
    FOREIGN KEY (salaray_range_id) REFERENCES "JOBS".salary_ranges(id),
    FOREIGN KEY (minimal_education_id) REFERENCES "JOBS".minimum_education(id)
);

CREATE TABLE "JOBS".cadidates_applications (
    candidate_id INT NOT NULL,
    job_offer_id INT NOT NULL,
    salary_range_id SMALLINT NOT NULL,
    experiences TEXT NOT NULL,
    education_level_id SMALLINT NOT NULL,
    application_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (candidate_id) REFERENCES "Entities".candidates(id),
    FOREIGN KEY (job_offer_id) REFERENCES "JOBS".jobs_offers(id),
    FOREIGN KEY (salary_range_id) REFERENCES "JOBS".salary_ranges(id),
    FOREIGN KEY (education_level_id) REFERENCES "JOBS".minimum_education(id)
);


/*---------- DEFAULT VALUES ----------*/
INSERT INTO "JOBS".jobs_status (status_name) VALUES
    ('Ativa'),
    ('Encerrada');


INSERT INTO "JOBS".salary_ranges (salary_expetation) VALUES
    ('Até 1.000'),
    ('De 1.000 a 2.000'),
    ('De 2.000 a 3.000'),
    ('Acima de 3.000');

INSERT INTO "JOBS".minimum_education (education_level) VALUES
    ('Ensino fundamental'),
    ('Ensino médio'),
    ('Tecnólogo'),
    ('Ensino Superior'),
    ('Pós / MBA / Mestrado'),
    ('Doutorado');