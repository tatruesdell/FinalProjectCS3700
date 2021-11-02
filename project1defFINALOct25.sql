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

DROP SEQUENCE booking_uid_seq;
-- DROP sequence for booking IDs

DROP SEQUENCE operator_uid_seq;
-- DROP sequence for operator IDs

DROP SEQUENCE passenger_uid_seq;
-- DROP sequence for passenger IDs

DROP SEQUENCE route_uid_seq;
-- DROP sequence for route IDs

DROP SEQUENCE schedule_uid_seq;
-- DROP sequence for schedule IDs

DROP SEQUENCE station_uid_seq;
-- DROP sequence for station IDs

DROP SEQUENCE subscription_uid_seq;
-- DROP sequence for subscription IDs

DROP SEQUENCE timing_uid_seq;
-- DROP sequence for timing IDs

DROP SEQUENCE train_uid_seq;
-- DROP sequence for train IDs
-- Drop sequences to prevent duplicates 

CREATE SEQUENCE booking_uid_seq START WITH 1 INCREMENT BY 1 MAXVALUE 9999999999 MINVALUE 1 NOCACHE;
-- Create sequence for booking IDs

CREATE SEQUENCE operator_uid_seq START WITH 1 INCREMENT BY 1 MAXVALUE 9999999999 MINVALUE 1 NOCACHE;
-- Create sequence for operator IDs

CREATE SEQUENCE passenger_uid_seq START WITH 1 INCREMENT BY 1 MAXVALUE 9999999999 MINVALUE 1 NOCACHE;
-- Create sequence for passenger IDs

CREATE SEQUENCE route_uid_seq START WITH 1 INCREMENT BY 1 MAXVALUE 9999999999 MINVALUE 1 NOCACHE;
-- Create sequence for route IDs

CREATE SEQUENCE schedule_uid_seq START WITH 1 INCREMENT BY 1 MAXVALUE 9999999999 MINVALUE 1 NOCACHE;
-- Create sequence for schedule IDs

CREATE SEQUENCE station_uid_seq START WITH 1 INCREMENT BY 1 MAXVALUE 9999999999 MINVALUE 1 NOCACHE;
-- Create sequence for station IDs

CREATE SEQUENCE subscription_uid_seq START WITH 1 INCREMENT BY 1 MAXVALUE 9999999999 MINVALUE 1 NOCACHE;
-- Create sequence for subscription IDs

CREATE SEQUENCE timing_uid_seq START WITH 1 INCREMENT BY 1 MAXVALUE 9999999999 MINVALUE 1 NOCACHE;
-- Create sequence for timing IDs

CREATE SEQUENCE train_uid_seq START WITH 1 INCREMENT BY 1 MAXVALUE 9999999999 MINVALUE 1 NOCACHE;
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
    trainmodel     VARCHAR2(50 CHAR)
        CONSTRAINT train_model_nn NOT NULL,
    trainnoofseats NUMBER(3)
        CONSTRAINT train_seats_nn NOT NULL
);

-- Create station table 
-- PRIMARY KEY CONSTRAINT is an integrity constraint defining the 
    -- unique identifier for each record in the table
-- NOT NULL constraints require data for arguments upon record insertion
CREATE TABLE station (
    stationid          NUMBER(10)
        CONSTRAINT station_pk PRIMARY KEY,
    stationname        VARCHAR2(35 CHAR)
        CONSTRAINT station_name_nn NOT NULL,
    stationcity        VARCHAR2(20 CHAR)
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
    operatoremail       VARCHAR2(30 CHAR)
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
    subscriptionpointsfree     NUMBER(5)
        CONSTRAINT subscription_points_free_nn NOT NULL
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
    CONSTRAINT route_arrival_departure_uk UNIQUE(arrivalstationid, departurestationid),
    CONSTRAINT route_arrival_depature_cc CHECK(arrivalstationid <> departurestationid)
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
		CONSTRAINT schedule_timing_id_nn NOT NULL,
    ticketprice       NUMBER(4, 2)
		CONSTRAINT schedule_ticket_price_nn NOT NULL,
    CONSTRAINT operator_timing_date_uk UNIQUE(operatorid, timingid, schedulestartdate),
    CONSTRAINT train_timing_date_uk UNIQUE(trainid, timingid, schedulestartdate)
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
		CONSTRAINT booking_schedule_id NOT NULL,
    pointsused CHAR(1) CONSTRAINT points_used_cc  CHECK (pointsused IN ('T', 'F'))
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

INSERT INTO timing VALUES (
    TIMING_UID_SEQ.nextval,
    TO_DATE('09:30:00 AM','HH:MI:SS AM'),
    TO_DATE('12:30:00 PM','HH:MI:SS PM')
);

INSERT INTO timing VALUES (
    TIMING_UID_SEQ.nextval,
    TO_DATE('12:30:00 PM','HH:MI:SS PM'),
    TO_DATE('2:15:00 PM','HH:MI:SS PM')
);

INSERT INTO timing VALUES (
    TIMING_UID_SEQ.nextval,
    TO_DATE('10:30:00 AM','HH:MI:SS AM'),
    TO_DATE('3:30:00 PM','HH:MI:SS PM')
);

INSERT INTO timing VALUES (
    TIMING_UID_SEQ.nextval,
    TO_DATE('02:30:00 PM','HH:MI:SS PM'),
    TO_DATE('06:30:00 PM','HH:MI:SS PM')
);

INSERT INTO timing VALUES (
    TIMING_UID_SEQ.nextval,
    TO_DATE('08:15:00 PM','HH:MI:SS PM'),
    TO_DATE('10:30:00 PM','HH:MI:SS PM')
);


INSERT INTO subscription VALUES (
    SUBSCRIPTION_UID_SEQ.nextval,
    'Base Level Membership: at least 5 trips required',
    'Standard',
    10.00,
    10000
);

INSERT INTO subscription VALUES (
    SUBSCRIPTION_UID_SEQ.nextval,
    'Level 1 Membership: at least 10 trips required',
    'Bronze',
    20.00,
    8000
);

INSERT INTO subscription VALUES (
    SUBSCRIPTION_UID_SEQ.nextval,
    'Level 2 Membership: at least 20 trips required',
    'Silver',
    30.00,
    5000
);

INSERT INTO subscription VALUES (
    SUBSCRIPTION_UID_SEQ.nextval,
    'Level 3 Membership: at least 30 trips required',
    'Gold',
    40.00,
    3000
);

INSERT INTO subscription VALUES (
    SUBSCRIPTION_UID_SEQ.nextval,
    'Level 4 Membership: at least 35 trips required',
    'Diamond',
    45.00,
    2000
);


INSERT INTO train VALUES(
    TRAIN_UID_SEQ.nextval,
    'Golden Arrow',
    'Pullman',
    100
);

INSERT INTO train VALUES(
    TRAIN_UID_SEQ.nextval,
    'Flying Scotsman',
    'Pacific steam locomotive',
    50
);

INSERT INTO train VALUES(
    TRAIN_UID_SEQ.nextval,
    'Orient Express',
    'Long-distance passenger',
    350
);

INSERT INTO train VALUES(
    TRAIN_UID_SEQ.nextval,
    'JR Yamanote',
    'Maglev',
    350
);

INSERT INTO train VALUES(
    TRAIN_UID_SEQ.nextval,
    'TGV',
    'High-Speed Rail',
    485
);


INSERT INTO station VALUES(
    STATION_UID_SEQ.nextval,
    'Tulsa station',
    'Tulsa',
    'OK',
    'S. Detroit Ave',
    '9185844428'
);

INSERT INTO station VALUES(
    STATION_UID_SEQ.nextval,
    'Grand Central Terminal',
    'New York City',
    'NY',
    'E. 42nd St.',
    '2123402583'
);

INSERT INTO station
VALUES(
    STATION_UID_SEQ.nextval,
    'Caltrain station',
    'San Francisco',
    'CA',
    '4th St.',
    '8006604287'
);

INSERT INTO station VALUES(
    STATION_UID_SEQ.nextval,
    'Columbus Union Station',
    'Columbus',
    'OH',
    'N. High St.',
    '6142629056'
);

INSERT INTO station VALUES(
    STATION_UID_SEQ.nextval,
    'Peachtree Station',
    'Atlanta',
    'GA',
    'Peachtree Rd. NW',
    '8008727245'
);


INSERT INTO operator VALUES(
    OPERATOR_UID_SEQ.nextval,
    'Trevor',
    'Potter',
    TO_DATE('1/1/1985', 'MM/DD/YY'),
    'tpotter85@gmail.com',
    '9035101352'
);

INSERT INTO operator VALUES(
    OPERATOR_UID_SEQ.nextval,
    'Noah',
    'Brady',
    TO_DATE('2/4/1995', 'MM/DD/YY'),
    'bradynoah95@outlook.com',
    '5174179638'
);

INSERT INTO operator VALUES(
    OPERATOR_UID_SEQ.nextval,
    'Stephen',
    'Long',
    TO_DATE('4/8/2003', 'MM/DD/YY'),
    'long003@yahoo.com',
    '7243799580'
);

INSERT INTO operator VALUES(
    OPERATOR_UID_SEQ.nextval,
    'John',
    'Harris',
    TO_DATE('10/31/1974', 'MM/DD/YY'),
    'jharris74@gmail.com',
    '3022243085'
);

INSERT INTO operator VALUES(
    OPERATOR_UID_SEQ.nextval,
    'Stewart',
    'Connor',
    TO_DATE('12/15/1980', 'MM/DD/YY'),
    'stewconnor1980@yahoo.com',
    '2603766308'
);


INSERT INTO passenger VALUES (
    PASSENGER_UID_SEQ.nextval,
    'Joe',
    'Biden',
    '9379998888',
    'biden.joe@whitehouse.gov',
    460,
    5
);


INSERT INTO passenger VALUES (
    PASSENGER_UID_SEQ.nextval,
    'Seymore',
    'Sayless',
    '3602562452',
    'moreorless@outlook.com',
    895,
    3
);


INSERT INTO passenger VALUES (
    PASSENGER_UID_SEQ.nextval,
    'Tracy',
    'Vann',
    '5131138979',
    'tracecar@yahoo.com',
    2000,
    2
);


INSERT INTO passenger VALUES (
    PASSENGER_UID_SEQ.nextval,
    'Bill',
    'Boebert',
    '2162299888',
    'bobill@gmail.com',
    230,
    3
);


INSERT INTO passenger VALUES (
    PASSENGER_UID_SEQ.nextval,
    'Joey',
    'Slumber',
    '9378885555',
    'joeslumber@wright.edu',
    0,
    NULL
);


INSERT INTO route VALUES (
    ROUTE_UID_SEQ.nextval,
    4,
    2
);


INSERT INTO route VALUES (
    ROUTE_UID_SEQ.nextval,
    2,
    4
);


INSERT INTO route VALUES (
    ROUTE_UID_SEQ.nextval,
    3,
    5
);

INSERT INTO route VALUES (
    ROUTE_UID_SEQ.nextval,
    5,
    3
);

INSERT INTO route VALUES (
    ROUTE_UID_SEQ.nextval,
    5,
    4
);


INSERT INTO schedule VALUES (
    SCHEDULE_UID_SEQ.nextval,
    TO_DATE('08/10/2022', 'MM/DD/YYYY'),
    2,
    5,
    2,
    1,
    25.75
);


INSERT INTO schedule VALUES (
    SCHEDULE_UID_SEQ.nextval,
    TO_DATE('08/12/2022', 'MM/DD/YYYY'),
    4,
    2,
    1,
    3,
    55.00
);


INSERT INTO schedule VALUES (
    SCHEDULE_UID_SEQ.nextval,
    TO_DATE('08/11/2022', 'MM/DD/YYYY'),
    3,
    3,
    2,
    1,
    75.50
);


INSERT INTO schedule VALUES (
    SCHEDULE_UID_SEQ.nextval,
    TO_DATE('08/16/2022', 'MM/DD/YYYY'),
    5,
    5,
    5,
    5,
    45.25
);


INSERT INTO schedule VALUES (
    SCHEDULE_UID_SEQ.nextval,
    TO_DATE('09/15/2022', 'MM/DD/YYYY'),
    2,
    4,
    4,
    2,
    68.50
);


INSERT INTO booking VALUES(
	BOOKING_UID_SEQ.nextval,
	1,
	4,
    	'T'
);

INSERT INTO booking VALUES(
	BOOKING_UID_SEQ.nextval,
	1,
	4,
    	'F'
);

INSERT INTO booking VALUES(
	BOOKING_UID_SEQ.nextval,
	3,
	5,
    	'F'
);

INSERT INTO booking VALUES(
	BOOKING_UID_SEQ.nextval,
	2,
	4,
    	'F'
);

INSERT INTO booking VALUES(
	BOOKING_UID_SEQ.nextval,
	2,
	3,
    	'T'
);

COMMIT;
