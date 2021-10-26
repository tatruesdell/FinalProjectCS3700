DROP TABLE booking CASCADE CONSTRAINTS;
-- Drop booking table and constraints 

DROP TABLE operator CASCADE CONSTRAINTS;
-- Drop operator table and constraints 

DROP TABLE passenger CASCADE CONSTRAINTS;
-- Drop passenger table and constraints 

DROP TABLE route CASCADE CONSTRAINTS;
-- Drop route table and constraints 

DROP TABLE schedule CASCADE CONSTRAINTS;
-- Drop schedule table and constraints 

DROP TABLE station CASCADE CONSTRAINTS;
-- Drop station table and constraints 

DROP TABLE timing CASCADE CONSTRAINTS;
-- Drop timing table and constraints 

DROP TABLE subscription CASCADE CONSTRAINTS;
-- Drop subscription table and constraints 

DROP TABLE train CASCADE CONSTRAINTS;
-- Drop train table and constraints 
-- Drop tables to prevent duplicates 

CREATE SEQUENCE booking_uid_seq START WITH 0 INCREMENT BY 1 MAXVALUE 9999999999 MINVALUE 0 NOCACHE;
-- Create sequence for booking IDs

CREATE SEQUENCE operator_uid_seq START WITH 0 INCREMENT BY 1 MAXVALUE 9999999999 MINVALUE 0 NOCACHE;
-- Create sequence for operator IDs

CREATE SEQUENCE passenger_uid_seq START WITH 0 INCREMENT BY 1 MAXVALUE 9999999999 MINVALUE 0 NOCACHE;
-- Create sequence for passenger IDs

CREATE SEQUENCE route_uid_seq START WITH 0 INCREMENT BY 1 MAXVALUE 9999999999 MINVALUE 0 NOCACHE;
-- Create sequence for route IDs

CREATE SEQUENCE schedule_uid_seq START WITH 0 INCREMENT BY 1 MAXVALUE 9999999999 MINVALUE 0 NOCACHE;
-- Create sequence for schedule IDs

CREATE SEQUENCE station_uid_seq START WITH 0 INCREMENT BY 1 MAXVALUE 9999999999 MINVALUE 0 NOCACHE;
-- Create sequence for station IDs

CREATE SEQUENCE subscription_uid_seq START WITH 0 INCREMENT BY 1 MAXVALUE 9999999999 MINVALUE 0 NOCACHE;
-- Create sequence for subscription IDs

CREATE SEQUENCE timing_uid_seq START WITH 0 INCREMENT BY 1 MAXVALUE 9999999999 MINVALUE 0 NOCACHE;
-- Create sequence for timing IDs

CREATE SEQUENCE train_uid_seq START WITH 0 INCREMENT BY 1 MAXVALUE 9999999999 MINVALUE 0 NOCACHE;
-- Create sequence for train IDs
-- Sequences start at seq = 0 and increment by 1 to a maximum value of 9999999999, NOCACHE indicates values in sequence are not preallocated


-- Create train table 
-- PRIMARY KEY CONSTRAINT is an integrity constraint defining the 
    -- unique identifier for each record in the table
-- NOT NULL constraints require data for arguments upon record insertion
CREATE TABLE train (
    trainid        NUMBER(10)
        CONSTRAINT train_pk PRIMARY KEY,
    trainname      VARCHAR2(20 CHAR)
        CONSTRAINT train_name_nn NOT NULL,
    trainmodel     VARCHAR2(10 CHAR)
        CONSTRAINT train_model_nn NOT NULL,
    trainnoofseats NUMBER(2)
        CONSTRAINT train_seats_nn NOT NULL
);

-- Create station table 
-- PRIMARY KEY CONSTRAINT is an integrity constraint defining the 
    -- unique identifier for each record in the table
-- NOT NULL constraints require data for arguments upon record insertion
CREATE TABLE station (
    stationid          NUMBER(10)
        CONSTRAINT station_pk PRIMARY KEY,
    stationname        VARCHAR2(20 CHAR)
        CONSTRAINT station_name_nn NOT NULL,
    stationcity        VARCHAR2(10 CHAR)
        CONSTRAINT station_city_nn NOT NULL,
    stationstate       CHAR(2 CHAR)
        CONSTRAINT station_state_nn NOT NULL,
    stationstreet      VARCHAR2(25 CHAR)
        CONSTRAINT station_street_nn NOT NULL,
    stationphonenumber NUMBER(10)
        CONSTRAINT station_phone_nn NOT NULL
);

-- Create operator table 
-- NOT NULL constraints require data for arguments upon record insertion
-- PRIMARY KEY CONSTRAINT is an integrity constraint defining the 
    -- unique identifier for each record in the table
CREATE TABLE operator (
    operatorid          NUMBER(10)
        CONSTRAINT operator_pk PRIMARY KEY,
    operatorfirstname   VARCHAR2(15 CHAR)
        CONSTRAINT operator_first_name_nn NOT NULL,
    operatorlastname    VARCHAR2(15 CHAR)
        CONSTRAINT operator_last_name_nn NOT NULL,
    operatordob         DATE
        CONSTRAINT operator_dob_nn NOT NULL,
    operatoremail       VARCHAR2(20 CHAR)
        CONSTRAINT operator_email_nn NOT NULL,
    operatorphonenumber NUMBER(10)
        CONSTRAINT operator_phone_number_nn NOT NULL
);

-- Create subscription table 
-- PRIMARY KEY CONSTRAINT is an integrity constraint defining the 
    -- unique identifier for each record in the table
-- NOT NULL constraints require data for arguments upon record insertion
CREATE TABLE subscription (
    subscriptionid             NUMBER(10)
        CONSTRAINT subscription_pk PRIMARY KEY,
    subscriptiondescription    VARCHAR2(100 CHAR)
        CONSTRAINT subscription_description_nn NOT NULL,
    subscriptionmembershiprank VARCHAR2(8 CHAR)
        CONSTRAINT subscription_rank_nn NOT NULL,
    subscriptionfees           NUMBER(4, 2)
        CONSTRAINT subscription_fees_nn NOT NULL,
    subscriptionpointsfree     NUMBER(3)
        CONSTRAINT subscription_points_booking_nn NOT NULL
);

-- Create timing table 
-- NOT NULL constraints require data for arguments upon record insertion
-- PRIMARY KEY CONSTRAINT is an integrity constraint defining the 
    -- unique identifier for each record in the table
CREATE TABLE timing (
    timingid  NUMBER(10)
        CONSTRAINT timing_pk PRIMARY KEY,
    starttime DATE
        CONSTRAINT start_time_nn NOT NULL,
    endtime   DATE
        CONSTRAINT end_time_nn NOT NULL
);

-- Create passenger table 
-- PRIMARY KEY CONSTRAINT is an integrity constraint defining the 
    -- unique identifier for each record in the table
CREATE TABLE passenger (
    passengerid          NUMBER(10)
        CONSTRAINT passenger_pk PRIMARY KEY,
    passengerfirstname   VARCHAR2(15 CHAR)
        CONSTRAINT passenger_first_name_nn NOT NULL,
    passengerlastname    VARCHAR2(15 CHAR)
        CONSTRAINT passenger_last_name_nn NOT NULL,
    passengerphonenumber NUMBER(10),
    passengeremail       VARCHAR2(30 CHAR)
        CONSTRAINT passenger_email_nn NOT NULL, 
    subscriptionpoints   NUMBER(4),
    subscriptionid       NUMBER(10)
);

-- Create route table 
-- PRIMARY KEY CONSTRAINT is an integrity constraint defining the 
    -- unique identifier for each record in the table
-- NOT NULL constraints require data for arguments upon record insertion
CREATE TABLE route (
    routeid            NUMBER(10)
        CONSTRAINT route_pk PRIMARY KEY,
    arrivalstationid   NUMBER(10) 
		CONSTRAINT arrival_station_id_nn NOT NULL,
    departurestationid NUMBER(10) 
		CONSTRAINT departure_station_id_nn NOT NULL,
    CONSTRAINT route_arrival_departure_unique UNIQUE(arrivalstationid, departurestationid)
);

-- Create schedule table 
-- PRIMARY KEY CONSTRAINT is an integrity constraint defining the 
    -- unique identifier for each record in the table
-- NOT NULL constraints require data for arguments upon record insertion
CREATE TABLE schedule (
    scheduleid        NUMBER(10)
        CONSTRAINT schedule_pk PRIMARY KEY,
    schedulestartdate DATE
        CONSTRAINT schedule_start_date_nn NOT NULL,
    operatorid        NUMBER(10) 
		CONSTRAINT schedule_operator_id_nn NOT NULL,
    trainid           NUMBER(10) 
		CONSTRAINT schedule_train_id_nn NOT NULL,
    routeid           NUMBER(10) 
		CONSTRAINT schedule_route_id_nn NOT NULL,
    timingid          NUMBER(10) 
		CONSTRAINT schedule_timing_id_nn NOT NULL
);

-- Create booking table 
-- PRIMARY KEY CONSTRAINT is an integrity constraint defining the 
    -- unique identifier for each record in the table
-- NOT NULL constraints require data for arguments upon record insertion
CREATE TABLE booking (
    bookingnumber NUMBER(10)
        CONSTRAINT booking_pk PRIMARY KEY,
    passengerid   NUMBER(10) 
		CONSTRAINT booking_passenger_id NOT NULL,
    scheduleid    NUMBER(10) 
		CONSTRAINT booking_schedule_id NOT NULL
);

-- Reference constraints indicate foreign key relations
ALTER TABLE booking ADD CONSTRAINT booking_passenger_fk FOREIGN KEY (passengerid) REFERENCES passenger(passengerid);
ALTER TABLE booking ADD CONSTRAINT booking_schedule_fk FOREIGN KEY (scheduleid) REFERENCES schedule(scheduleid);
ALTER TABLE schedule ADD CONSTRAINT schedule_timing_fk FOREIGN KEY (timingid) REFERENCES timing(timingid);
ALTER TABLE schedule ADD CONSTRAINT schedule_route_fk FOREIGN KEY (routeid) REFERENCES route(routeid);
ALTER TABLE schedule ADD CONSTRAINT schedule_train_fk FOREIGN KEY (trainid) REFERENCES train(trainid);
ALTER TABLE schedule ADD CONSTRAINT schedule_operator_fk FOREIGN KEY (operatorid) REFERENCES operator(operatorid);
ALTER TABLE route ADD CONSTRAINT route_station_fkv2 FOREIGN KEY (departurestationid) REFERENCES station(stationid);
ALTER TABLE route ADD CONSTRAINT route_station_fk FOREIGN KEY (arrivalstationid) REFERENCES station(stationid);
ALTER TABLE passenger ADD CONSTRAINT passenger_subscription_fk FOREIGN KEY (subscriptionid) REFERENCES subscription(subscriptionid);
