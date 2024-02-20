INSERT INTO MY_TABLE(SCRIPT) VALUES ('SET DB_CLOSE_DELAY -1;');
INSERT INTO MY_TABLE(SCRIPT) VALUES ('CREATE USER IF NOT EXISTS "MANAGER" SALT ''10360060bacc55a3'' HASH ''e0dcbd0f0fd049f70b39d1ff86ac7fada8feea9c2860181f2a83d5b664b8776e'' ADMIN;');
INSERT INTO MY_TABLE(SCRIPT) VALUES ('CREATE SEQUENCE "PUBLIC"."CUSTOMER_SEQ" START WITH 1 RESTART WITH 3201 INCREMENT BY 50;');
INSERT INTO MY_TABLE(SCRIPT) VALUES ('CREATE CACHED TABLE "PUBLIC"."EMPLOYEE"(
    "ID" BIGINT GENERATED ALWAYS AS IDENTITY(START WITH 1 RESTART WITH 194) NOT NULL,
    "NAME" CHARACTER VARYING(30) NOT NULL,
    "SURNAME" CHARACTER VARYING(30) NOT NULL,
    "PIN" BIGINT NOT NULL,
    "BIRTHDATE" DATE NOT NULL,
    "DEPARTMENT_NAME" CHARACTER VARYING(30) DEFAULT ''not set'' NOT NULL,
    "POSITION" CHARACTER VARYING(30) NOT NULL,
    "RANK" CHARACTER VARYING(30) NOT NULL,
    "SALARY" DOUBLE PRECISION NOT NULL,
    "BONUS" DOUBLE PRECISION DEFAULT 0.0 NOT NULL,
    "BONUS_REVIEWED" BOOLEAN DEFAULT FALSE NOT NULL,
    "EXPERIENCE" SMALLINT NOT NULL,
    "PERFORMANCE" DOUBLE PRECISION DEFAULT 0.0 NOT NULL,
    "PERFORMANCE_REVIEWED" BOOLEAN DEFAULT FALSE NOT NULL
);');
INSERT INTO MY_TABLE(SCRIPT) VALUES ('ALTER TABLE "PUBLIC"."EMPLOYEE" ADD CONSTRAINT "PUBLIC"."CONSTRAINT_7" PRIMARY KEY("ID");');
INSERT INTO MY_TABLE(SCRIPT) VALUES ('-- 6 +/- SELECT COUNT(*) FROM PUBLIC.EMPLOYEE;');
INSERT INTO MY_TABLE(SCRIPT) VALUES ('CREATE CACHED TABLE "PUBLIC"."INVENTORY"(
    "ID" BIGINT GENERATED ALWAYS AS IDENTITY(START WITH 1 RESTART WITH 129) NOT NULL,
    "NAME" CHARACTER VARYING(30) NOT NULL,
    "CATEGORY" CHARACTER VARYING(30) NOT NULL,
    "QUANTITY" DOUBLE PRECISION NOT NULL,
    "PRICE_PER_ITEM" DOUBLE PRECISION NOT NULL,
    "BEST_BEFORE" SMALLINT DEFAULT 0 NOT NULL,
    "PURCHASE_DATE" DATE NOT NULL,
    "EXPIRY_DATE" DATE DEFAULT ''2023-01-01'' NOT NULL
);');
INSERT INTO MY_TABLE(SCRIPT) VALUES ('ALTER TABLE "PUBLIC"."INVENTORY" ADD CONSTRAINT "PUBLIC"."CONSTRAINT_2" PRIMARY KEY("ID");');
INSERT INTO MY_TABLE(SCRIPT) VALUES ('-- 29 +/- SELECT COUNT(*) FROM PUBLIC.INVENTORY;');
INSERT INTO MY_TABLE(SCRIPT) VALUES ('CREATE CACHED TABLE "PUBLIC"."CUSTOMER"(
    "ID" BIGINT GENERATED ALWAYS AS IDENTITY(START WITH 1 RESTART WITH 65) NOT NULL,
    "NAME" CHARACTER VARYING(30) NOT NULL,
    "SURNAME" CHARACTER VARYING(30) NOT NULL,
    "EMAIL" CHARACTER VARYING(30) NOT NULL,
    "REGULAR" BOOLEAN DEFAULT FALSE NOT NULL,
    "VIP" BOOLEAN DEFAULT FALSE NOT NULL
);');
INSERT INTO MY_TABLE(SCRIPT) VALUES ('ALTER TABLE "PUBLIC"."CUSTOMER" ADD CONSTRAINT "PUBLIC"."CONSTRAINT_5" PRIMARY KEY("ID");');
INSERT INTO MY_TABLE(SCRIPT) VALUES ('-- 5 +/- SELECT COUNT(*) FROM PUBLIC.CUSTOMER;');
INSERT INTO MY_TABLE(SCRIPT) VALUES ('CREATE CACHED TABLE "PUBLIC"."PERFORMANCE_REVIEW"(
    "ID" BIGINT GENERATED ALWAYS AS IDENTITY(START WITH 1 RESTART WITH 97) NOT NULL,
    "EMPLOYEE_ID" BIGINT NOT NULL,
    "MANAGER_ID" BIGINT NOT NULL,
    "ATTENDANCE" CHARACTER VARYING(30) NOT NULL,
    "QUALITY" CHARACTER VARYING(30) NOT NULL,
    "ACHIEVEMENTS" CHARACTER VARYING(30) NOT NULL,
    "REVIEW_DATE" DATE NOT NULL,
    "TIME_OF_CHANGE" TIMESTAMP NOT NULL
);');
INSERT INTO MY_TABLE(SCRIPT) VALUES ('ALTER TABLE "PUBLIC"."PERFORMANCE_REVIEW" ADD CONSTRAINT "PUBLIC"."CONSTRAINT_A" PRIMARY KEY("ID");');
INSERT INTO MY_TABLE(SCRIPT) VALUES ('-- 3 +/- SELECT COUNT(*) FROM PUBLIC.PERFORMANCE_REVIEW;');
INSERT INTO MY_TABLE(SCRIPT) VALUES ('CREATE CACHED TABLE "PUBLIC"."RESERVATION"(
    "ID" BIGINT GENERATED ALWAYS AS IDENTITY(START WITH 1 RESTART WITH 65) NOT NULL,
    "CUSTOMER_ID" BIGINT NOT NULL,
    "RESERVATION_TYPE" CHARACTER VARYING(30) NOT NULL,
    "GUESTS" SMALLINT NOT NULL,
    "DATE_TIME" TIMESTAMP NOT NULL
);');
INSERT INTO MY_TABLE(SCRIPT) VALUES ('ALTER TABLE "PUBLIC"."RESERVATION" ADD CONSTRAINT "PUBLIC"."CONSTRAINT_23" PRIMARY KEY("ID");');
INSERT INTO MY_TABLE(SCRIPT) VALUES ('-- 5 +/- SELECT COUNT(*) FROM PUBLIC.RESERVATION;');
INSERT INTO MY_TABLE(SCRIPT) VALUES ('ALTER TABLE "PUBLIC"."RESERVATION" ADD CONSTRAINT "PUBLIC"."CONSTRAINT_232" FOREIGN KEY("CUSTOMER_ID") REFERENCES "PUBLIC"."CUSTOMER"("ID") ON DELETE CASCADE NOCHECK;');
INSERT INTO MY_TABLE(SCRIPT) VALUES ('ALTER TABLE "PUBLIC"."PERFORMANCE_REVIEW" ADD CONSTRAINT "PUBLIC"."CONSTRAINT_A3" FOREIGN KEY("EMPLOYEE_ID") REFERENCES "PUBLIC"."EMPLOYEE"("ID") NOCHECK;');
INSERT INTO MY_TABLE(SCRIPT) VALUES ('ALTER TABLE "PUBLIC"."PERFORMANCE_REVIEW" ADD CONSTRAINT "PUBLIC"."CONSTRAINT_A34" FOREIGN KEY("MANAGER_ID") REFERENCES "PUBLIC"."EMPLOYEE"("ID") NOCHECK;');
